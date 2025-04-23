import 'dart:developer';
import 'package:ebla/domain/models/requests/chatbot_requests/chatbot_request_model.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/send_candidate_usecase.dart';
import 'package:ebla/presentations/features/chatbot/blocs/close_stream/close_stream_bloc.dart';
import 'package:ebla/presentations/features/chatbot/blocs/drobdown_cubit.dart';
import 'package:ebla/presentations/features/chatbot/blocs/send_answer_and_candidate_bloc/send_answer_and_candidate_bloc.dart';
import 'package:ebla/presentations/features/chatbot/blocs/start_stream_bloc/start_stream_bloc.dart';
import 'package:ebla/presentations/features/chatbot/blocs/stream_id_cubit.dart/stream_id_cubit.dart';
import 'package:ebla/presentations/features/chatbot/blocs/web_rtc_cubit/web_rtc_cubit.dart';
import 'package:ebla/presentations/features/chatbot/utility/chatbot_enums.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:ebla/presentations/widgets/taost_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/usecases/chatbot_usecase/send_answer_usecase.dart';

class AiAvatarIconWidget extends StatefulWidget {
  const AiAvatarIconWidget({
    super.key,
    required this.isAvatarExpanded,
    required this.isRecordModeActive,
    required this.onWebRTCCubitCreated,
    // required this.startAvatarTimer
  });

  final ValueNotifier<bool> isRecordModeActive;
  final ValueNotifier<bool> isAvatarExpanded;
  final Function(WebRTCCubit?) onWebRTCCubitCreated;
  // final VoidCallback startAvatarTimer;

  @override
  State<AiAvatarIconWidget> createState() => _AiAvatarIconWidgetState();
}

class _AiAvatarIconWidgetState extends State<AiAvatarIconWidget> {
  final ValueNotifier<bool> isStillLoading = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropdownCubit, ChatTypeEnum>(
        bloc: BlocProvider.of<DropdownCubit>(context),
        builder: (context, selectedOption) {
          if (context.read<DropdownCubit>().state == ChatTypeEnum.authority) {
            return ValueListenableBuilder<bool>(
                valueListenable: widget.isAvatarExpanded,
                builder: (context, expanded, child) {
                  //it's important to define it here to close it when close button pressed
                  final webRTCCubit = WebRTCCubit();
                  return BlocConsumer<StartStreamBloc, StartStreamState>(
                      bloc: BlocProvider.of<StartStreamBloc>(context),
                      // bloc: widget.startStreamBloc,
                      listener: (context, avatarState) {
                        final sendAnswerAndCandidateBloc =
                            context.read<SendAnswerAndCandidateBloc>();
                        avatarState.mapOrNull(
                          error: (value) {
                            errorToast(value.message, context);
                          },
                          done: (value) async {
                            //1- save the ID in cubit to use it when i close the stream
                            BlocProvider.of<StreamIdCubit>(context).setStreamId(
                                value.startStreamResponse.data!.id);
                            log("zak1");
                            //2- make the request body for the send answer and candidate
                            await webRTCCubit.initWebRTC(
                                value.startStreamResponse.data!.webrtcData!
                                    .offer,
                                value.startStreamResponse.data!.webrtcData!
                                    .iceServers);
                            log("zak2");
                            //3- Pass cubit to parent via callback  to open the video widget
                            if (mounted) {
                              widget.onWebRTCCubitCreated(webRTCCubit);
                            }
                            log("zak3");

                            //-------- to make sure that the candidates have came before I send the candidateto back-end ------
                            // int attempts = 0;
                            // while (webRTCCubit.state.candidates.isEmpty &&
                            //     attempts < 50) {
                            //   log("⏳ Waiting for ICE candidate...");
                            //   await Future.delayed(
                            //       const Duration(milliseconds: 200));
                            //   attempts++;
                            // }
                            //4- make the requests body of SENDANSWER & SENDCANDIDATE
                            log("zak4");
                            if (webRTCCubit.state.isConnectionReady) {
                              log("zak5");
                              final MainSendAnswerRequestModelById
                                  sendAnswerRequest =
                                  MainSendAnswerRequestModelById(
                                      request: MainSendAnswerRequestModel(
                                          answer: SendAnswerRequestModel(
                                              sdp: webRTCCubit
                                                      .state.answer?.sdp ??
                                                  "",
                                              type: webRTCCubit
                                                      .state.answer?.type ??
                                                  "")),
                                      id: value.startStreamResponse.data!.id);
                              if (mounted) {
                                sendAnswerAndCandidateBloc.add(
                                    SendAnswerAndCandidateEvent.sendAnswer(
                                        sendAnswerRequest));
                              }
                              //------------------ candidate --------------------
                              log("zak4.2");

                              for (var candidate
                                  in webRTCCubit.state.candidates) {
                                final sendCandidateRequest =
                                    MainSendCandidateRequestModelById(
                                  request: MainSendCandidateRequestModel(
                                    candidate: SendCandidateRequestModel(
                                      candidate: candidate.candidate ?? "",
                                      sdpMid: candidate.sdpMid ?? "",
                                      sdpMLineIndex:
                                          candidate.sdpMLineIndex ?? 0,
                                    ),
                                  ),
                                  id: value.startStreamResponse.data!.id,
                                );

                                log('Sending ICE candidate: ${candidate.candidate}');
                                if (mounted) {
                                  sendAnswerAndCandidateBloc.add(
                                    SendAnswerAndCandidateEvent.sendCandidate(
                                        sendCandidateRequest),
                                  );
                                }
                              }
                            }
                            // if (mounted) {
                            //   //=========== 5- to show tha avatar in the UI =============
                            //   widget.isAvatarExpanded.value =
                            //       !widget.isAvatarExpanded.value;
                            //   //=========== 6- Start the timer of closing avatar =============
                            //   widget.startAvatarTimer();
                            //   //=========== 7- Start the timer under video =============
                            //   webRTCCubit.startTimer();
                            // }
                          },
                        );
                      },
                      builder: (context, avatarState) {
                        return BlocConsumer<SendAnswerAndCandidateBloc,
                                SendAnswerAndCandidateState>(
                            listener: (context, state) {
                          state.mapOrNull(
                            done: (value) {
                              if (mounted) {
                                //=========== 5- to show tha avatar in the UI with Record Mode =============
                                widget.isAvatarExpanded.value =
                                    !widget.isAvatarExpanded.value;
                                // widget.isRecordModeActive.value =
                                //     true;

                                //=========== 6- Start the timer of closing avatar =============
                                // widget.startAvatarTimer();
                                //=========== 7- Start the timer under video =============
                                webRTCCubit.startTimer();
                              }
                              //-------------- to show just one indecator for both requests ----------
                              avatarState.mapOrNull(
                                done: (value) {
                                  isStillLoading.value = false;
                                },
                              );
                            },
                          );
                        }, builder: (context, sendAnswerAndCandidateState) {
                          return ValueListenableBuilder<bool>(
                              valueListenable: isStillLoading,
                              builder: (context, isLoading, child) {
                                return isLoading
                                    ? Container(
                                        padding: EdgeInsets.all(AppSizeW.s5),
                                        width: AppSizeW.s40,
                                        height: AppSizeH.s40,
                                        child:
                                            const CircularProgressIndicator())
                                    : avatarState.maybeMap(

                                        //zak important
                                        // loading: (_) => Container(
                                        //     padding: EdgeInsets.all(AppSizeW.s5),
                                        //     width: AppSizeW.s40,
                                        //     height: AppSizeH.s40,
                                        //     child: const CircularProgressIndicator()),
                                        orElse: () =>

                                            //for sendCandidate and aswers success
                                            sendAnswerAndCandidateState
                                                .maybeMap(
                                              //zak important
                                              // loading: (_) => Container(
                                              //     padding: EdgeInsets.all(AppSizeW.s5),
                                              //     width: AppSizeW.s40,
                                              //     height: AppSizeH.s40,
                                              //     child: CircularProgressIndicator(
                                              //       color: ColorManager.primary,
                                              //     )),
                                              orElse: () => BlocConsumer<
                                                      CloseStreamBloc,
                                                      CloseStreamState>(
                                                  listener:
                                                      (context, closestate) {
                                                closestate.mapOrNull(
                                                  error: (value) {
                                                    errorToast(
                                                        value.message, context);
                                                    //NOTE: here i make the user back to defult state of chat UI when faild to close stream
                                                    //because it will faild when back-end stop the stream
                                                    if (value.message ==
                                                        "Failed to close stream") {
                                                      widget.isAvatarExpanded
                                                              .value =
                                                          !widget
                                                              .isAvatarExpanded
                                                              .value;
                                                    }
                                                  },
                                                  done: (value) async {
                                                    //when close is done
                                                    BlocProvider.of<
                                                                StreamIdCubit>(
                                                            context)
                                                        .clearStreamId();
                                                    if (widget.isAvatarExpanded
                                                        .value = true) {
                                                      widget.isAvatarExpanded
                                                              .value =
                                                          !widget
                                                              .isAvatarExpanded
                                                              .value;
                                                      widget.isRecordModeActive
                                                          .value = true;
                                                    }

                                                    //here i close the webRTCCubit after closing done success to avoid leak in memory
                                                    widget.onWebRTCCubitCreated(
                                                        null);
                                                  },
                                                );
                                              }, builder:
                                                      (context, closeState) {
                                                return closeState.maybeMap(
                                                    loading: (_) => Container(
                                                        padding: EdgeInsets.all(
                                                            AppSizeW.s5),
                                                        width: AppSizeW.s40,
                                                        height: AppSizeH.s40,
                                                        child:
                                                            const CircularProgressIndicator()),
                                                    orElse:
                                                        () => GestureDetector(
                                                              onTap: () async {
                                                                if (expanded) {
                                                                  // If the close icon is shown, I perform logic for closing the AI Avatar Here

                                                                  final String?
                                                                      streamId =
                                                                      context
                                                                          .read<
                                                                              StreamIdCubit>()
                                                                          .state
                                                                          .streamId;
                                                                  if (streamId !=
                                                                      null) {
                                                                    context
                                                                        .read<
                                                                            CloseStreamBloc>()
                                                                        .add(CloseStreamEvent.closeStream(
                                                                            //here i pass the streamID
                                                                            context.read<StreamIdCubit>().state.streamId!));
                                                                    //here i clear the state of startstream to make sure that i don't use the old sdp and data
                                                                    context
                                                                        .read<
                                                                            StartStreamBloc>()
                                                                        .add(const StartStreamEvent
                                                                            .clearState());
                                                                    isStillLoading
                                                                            .value =
                                                                        false;
                                                                  }
                                                                } else {
                                                                  isStillLoading
                                                                          .value =
                                                                      true;
                                                                  // If the avatar icon is shown, I perform logic for opening the AI Avatar Here
                                                                  context
                                                                      .read<
                                                                          StartStreamBloc>()
                                                                      .add(const StartStreamEvent
                                                                          .started());
                                                                }
                                                              },
                                                              child:
                                                                  AnimatedRotation(
                                                                turns: expanded
                                                                    ? 0.5
                                                                    : 0.0, // Rotate 180° when expanded, back when closed
                                                                duration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            300),
                                                                child:
                                                                    Container(
                                                                  width:
                                                                      AppSizeW
                                                                          .s40,
                                                                  height:
                                                                      AppSizeH
                                                                          .s40,
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          AppSizeW
                                                                              .s5),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border:
                                                                        Border(
                                                                      right: BorderSide(
                                                                          width:
                                                                              1,
                                                                          color:
                                                                              Theme.of(context).hoverColor),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      AnimatedSwitcher(
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            300),
                                                                    transitionBuilder:
                                                                        (child, animation) =>
                                                                            ScaleTransition(
                                                                      scale:
                                                                          animation,
                                                                      child:
                                                                          child,
                                                                    ),
                                                                    child: expanded ||
                                                                            (!expanded &&
                                                                                webRTCCubit.state.isMiniScreen ==
                                                                                    true)
                                                                        ? const Icon(
                                                                            Icons
                                                                                .close,
                                                                            key: ValueKey(
                                                                                "closeIcon"))
                                                                        : Image.asset(
                                                                            ImageAssets
                                                                                .chatBot,
                                                                            key:
                                                                                const ValueKey("avatarIcon")),
                                                                  ),
                                                                ),
                                                              ),
                                                            ));
                                              }),
                                            ));
                              });
                        });
                      });
                });
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
