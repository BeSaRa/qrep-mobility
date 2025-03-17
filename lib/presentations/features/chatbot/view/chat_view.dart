import 'dart:async';
import 'dart:developer';
import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/domain/models/requests/chatbot_requests/chatbot_request_model.dart';
import 'package:ebla/presentations/features/chatbot/blocs/close_stream/close_stream_bloc.dart';
import 'package:ebla/presentations/features/chatbot/blocs/drobdown_cubit.dart';
import 'package:ebla/presentations/features/chatbot/blocs/messages_history_bloc/chat_history_cubit.dart';
import 'package:ebla/presentations/features/chatbot/blocs/record_cubit/voice_cubit.dart';
import 'package:ebla/presentations/features/chatbot/blocs/send_answer_and_candidate_bloc/send_answer_and_candidate_bloc.dart';
import 'package:ebla/presentations/features/chatbot/blocs/send_feedback_bloc/send_feedback_bloc.dart';
import 'package:ebla/presentations/features/chatbot/blocs/send_message_bloc/chat_bloc.dart';
import 'package:ebla/presentations/features/chatbot/blocs/start_stream_bloc/start_stream_bloc.dart';
import 'package:ebla/presentations/features/chatbot/blocs/stream_id_cubit.dart/stream_id_cubit.dart';
import 'package:ebla/presentations/features/chatbot/blocs/web_rtc_cubit/web_rtc_cubit.dart';
import 'package:ebla/presentations/features/chatbot/blocs/web_rtc_cubit/web_rtc_state.dart';
import 'package:ebla/presentations/features/chatbot/utility/chatbot_enums.dart';
import 'package:ebla/presentations/features/chatbot/widgets/ai_avatar_icon_widget.dart';
import 'package:ebla/presentations/features/chatbot/widgets/avatar_stream_widget.dart';
import 'package:ebla/presentations/features/chatbot/widgets/chat_messages_list_widget.dart';
import 'package:ebla/presentations/features/chatbot/widgets/check_box_widget.dart';
import 'package:ebla/presentations/features/chatbot/widgets/mini_video_player_widget.dart';
import 'package:ebla/presentations/features/chatbot/widgets/rera_text_faild.dart';
import 'package:ebla/presentations/features/chatbot/widgets/send_button_widget.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:ebla/presentations/widgets/taost_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui' as ui;

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final TextEditingController _controller = TextEditingController();
  late ChatBotBloc chatBotBloc;
  late StartStreamBloc startStreamBloc;
  late CloseStreamBloc closeStreamBloc;
  late StreamIdCubit streamIdCubit;
  late SendAnswerAndCandidateBloc sendAnswerAndCandidateBloc;
  final ValueNotifier<bool> isSendEnabled = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isAvatarExpanded = ValueNotifier(false);
  bool isMessageSending = false;
  final ScrollController _scrollController = ScrollController();
/*================ timer for close stream after 2 minutes of no action ================*/
  Timer? inactivityTimer;
  final Duration inactivityDuration = const Duration(minutes: 1, seconds: 55);
  WebRTCCubit? webRTCCubit;
  // Offset miniScreenPosition = Offset(AppSizeW.s250, AppSizeH.s50);
  @override
  void initState() {
    super.initState();
    chatBotBloc = instance<ChatBotBloc>();
    startStreamBloc = instance<StartStreamBloc>();
    closeStreamBloc = instance<CloseStreamBloc>();
    streamIdCubit = instance<StreamIdCubit>();
    sendAnswerAndCandidateBloc = instance<SendAnswerAndCandidateBloc>();
    _controller.addListener(() {
      isSendEnabled.value = _controller.text.trim().isNotEmpty;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.microtask(() {
        if (mounted) {
          context.read<VoiceCubit>().initializeSpeech();
          if (_scrollController.hasClients) {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          }
        }
      });
    });
  }

  @override
  void dispose() {
    //when user pressed the back button to homepage
    closeStreamAfterTimerOrBack();
    _controller.dispose();
    isSendEnabled.dispose();
    isAvatarExpanded.dispose();
    _scrollController.dispose();
    inactivityTimer?.cancel();
    streamIdCubit.close();
    if (webRTCCubit != null) {
      webRTCCubit!.closeStreamCubit();
      webRTCCubit!.close();
    }
    super.dispose();
  }

  void startOrResetAvatarTimer() {
    inactivityTimer?.cancel();
    inactivityTimer = Timer(inactivityDuration, closeStreamAfterTimerOrBack);
  }

  void closeStreamAfterTimerOrBack() {
    final String? streamId = streamIdCubit.state.streamId;
    if (streamId != null) {
      closeStreamBloc.add(CloseStreamEvent.closeStream(streamId));
      log("Inactivity detected. Stream closed.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: costumeChatAppBar(context, _scrollController, () async {
      //   //close stream if it's working:
      //
      //   final String? streamId = streamIdCubit.state.streamId;
      //   isAvatarExpanded.value = false;
      //   if (streamId != null) {
      //     closeStreamBloc.add(CloseStreamEvent.closeStream(
      //         //here i pass the streamID
      //         streamIdCubit.state.streamId!));
      //     streamIdCubit.clearStreamId();
      //   }
      //   if (webRTCCubit != null) {
      //     //clear the webrt Cubit
      //     await webRTCCubit!.closeStreamCubit();
      //     await webRTCCubit!.close();
      //     webRTCCubit == null;
      //   }
      // }),
      body: Stack(
        children: [
          // Background Image
          Opacity(
            opacity: 0.1,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageAssets.logoPng),
                ),
              ),
            ),
          ),
          //-------------------------------AvatarAi-----------------------
          ValueListenableBuilder<bool>(
              valueListenable: isAvatarExpanded,
              builder: (context, expanded, child) {
                return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 100),
                    transitionBuilder: (child, animation) => FadeTransition(
                          opacity: animation,
                          child: SizeTransition(
                            sizeFactor: animation,
                            child: child,
                          ),
                        ),
                    child: expanded
                        // &&
                        //         BlocProvider.of<ChatHistoryCubit>(context)
                        //                 .state
                        //                 .activeChat ==
                        //             ChatTypeEnum.authority
                        ? MultiBlocProvider(providers: [
                            BlocProvider.value(
                              value: startStreamBloc,
                            ),
                            if (webRTCCubit != null)
                              BlocProvider.value(value: webRTCCubit!),
                            BlocProvider.value(
                              value: chatBotBloc,
                            ),
                            BlocProvider.value(
                              value: sendAnswerAndCandidateBloc,
                            ),
                          ], child: const AvatarStreamWidget())
                        : const SizedBox.shrink());
              }),
          ValueListenableBuilder<bool>(
              valueListenable: isAvatarExpanded,
              builder: (context, isAvatarPressed, child) {
                return Positioned(
                  bottom: !isAvatarPressed ? null : 0,
                  left: !isAvatarPressed ? null : 0,
                  right: !isAvatarPressed ? null : 0,
                  child: MultiBlocProvider(
                    providers: [
                      BlocProvider<ChatHistoryCubit>.value(
                          value: BlocProvider.of<ChatHistoryCubit>(context)),
                      BlocProvider.value(value: chatBotBloc),
                      BlocProvider.value(value: startStreamBloc),
                      BlocProvider.value(value: closeStreamBloc),
                      BlocProvider.value(
                          value: BlocProvider.of<VoiceCubit>(context)),
                      BlocProvider.value(
                          value: BlocProvider.of<DropdownCubit>(context)),
                      BlocProvider.value(value: streamIdCubit),
                      BlocProvider.value(value: sendAnswerAndCandidateBloc),
                      BlocProvider<SendFeedbackBloc>.value(
                          value: BlocProvider.of<SendFeedbackBloc>(context)),
                      // BlocProvider.value(value: webRTCCubit),
                    ],
                    child: BlocConsumer<ChatBotBloc, ChatBotState>(
                        listener: (context, sendState) {
                          sendState.map(
                              initial: (val) {},
                              loading: (val) {
                                isMessageSending = true;
                              },
                              done: (val) {
                                //----- if i'm in authority-----
                                if (val.response != null) {
                                  context.read<ChatHistoryCubit>().addMessage(
                                      MessageRequestModel(
                                          role: 'assistant',
                                          content:
                                              val.response!.message.content,
                                          //i will add the conv id for thefeedback
                                          authorityConvId: val.response!.message
                                              .conversationId));
                                }
                                //----- if i'm in platform-----
                                else {
                                  context
                                      .read<ChatHistoryCubit>()
                                      .addMessage(MessageRequestModel(
                                        role: 'assistant',
                                        content: val.platformResponse,
                                      ));
                                }
                                isMessageSending = false;
                              },
                              error: (val) {
                                if (mounted) {
                                  errorToast(
                                      AppStrings().defaultError, context);
                                }
                                isMessageSending = false;
                              });
                        },
                        bloc: chatBotBloc,
                        builder: (context, sendState) {
                          return Column(
                            children: <Widget>[
                              if (!isAvatarPressed)
                                Flexible(
                                    child: ChatMessagesListWidget(
                                  scrollController: _scrollController,
                                  isSending: isMessageSending,
                                  isAvatarPressed: isAvatarPressed,
                                )),
                              if (isAvatarPressed)
                                BlocBuilder<WebRTCCubit, WebRTCState>(
                                    bloc: webRTCCubit,
                                    builder: (context, state) {
                                      return SizedBox(
                                        height: state.isMiniScreen == false
                                            ? MediaQuery.sizeOf(context)
                                                    .height /
                                                3.5
                                            : MediaQuery.sizeOf(context)
                                                    .height /
                                                1.6,
                                        child: ChatMessagesListWidget(
                                          scrollController: _scrollController,
                                          isSending: isMessageSending,
                                          isAvatarPressed: isAvatarPressed,
                                        ),
                                      );
                                      //  Stack(
                                      //   children: [

                                      //     Container(
                                      //       height: AppSizeH.s20,
                                      //       decoration: BoxDecoration(
                                      //         borderRadius: BorderRadius.only(
                                      //             topLeft: Radius.circular(
                                      //                 AppSizeR.s50),
                                      //             topRight: Radius.circular(
                                      //                 AppSizeR.s50)),
                                      //         gradient: LinearGradient(
                                      //           begin: Alignment.bottomCenter,
                                      //           end: Alignment.topCenter,
                                      //           colors: [
                                      //             Colors
                                      //                 .transparent, // Bottom: Fully transparent
                                      //             Colors.black.withValues(
                                      //               alpha: 0.1,
                                      //             ), // Top: Black with opacity
                                      //           ],
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ],
                                      // );
                                    }),
                              Padding(
                                padding: EdgeInsets.all(AppSizeW.s8),
                                child: Row(
                                  textDirection: ui.TextDirection.ltr,
                                  children: <Widget>[
                                    /*========================For Ai Avatar========================= */

                                    AiAvatarIconWidget(
                                      startAvatarTimer: startOrResetAvatarTimer,
                                      onWebRTCCubitCreated:
                                          (WebRTCCubit? newCubit) async {
                                        //I close the avatar and dispose the camera renderer
                                        if (newCubit == null &&
                                            webRTCCubit != null) {
                                          await webRTCCubit!.closeStreamCubit();
                                          await webRTCCubit!.close();
                                          webRTCCubit == null;
                                        } else {
                                          //I Start the avatar
                                          webRTCCubit = newCubit;
                                        }
                                      },
                                      isAvatarExpanded: isAvatarExpanded,
                                    ),
                                    SizedBox(
                                      width: AppSizeW.s5,
                                    ),
                                    /*========================For record========================= */
                                    BlocBuilder<VoiceCubit, VoiceState>(
                                        bloc: BlocProvider.of<VoiceCubit>(
                                            context),
                                        builder: (context, voiceState) {
                                          return GestureDetector(
                                            onTap: () {
                                              if (voiceState.isListening) {
                                                context
                                                    .read<VoiceCubit>()
                                                    .stopListening();
                                              } else {
                                                context
                                                    .read<VoiceCubit>()
                                                    .checkAndRequestPermissionToStart();
                                                // .startListening();
                                              }
                                            },
                                            child: voiceState.isListening
                                                ? SizedBox(
                                                    height: AppSizeH.s40,
                                                    width: AppSizeH.s40,
                                                    child: Lottie.asset(ImageAssets
                                                        .chatBotRecordingIndecetor))
                                                : const Icon(Icons.mic_none),
                                          );
                                        }),
                                    SizedBox(
                                      width: AppSizeW.s5,
                                    ),
                                    /*========================TextFaild========================= */
                                    Expanded(
                                      child: BlocBuilder<VoiceCubit,
                                              VoiceState>(
                                          bloc: BlocProvider.of<VoiceCubit>(
                                              context),
                                          builder: (context, voiceState) {
                                            WidgetsBinding.instance
                                                .addPostFrameCallback((_) {
                                              if (_controller.text !=
                                                  voiceState.text) {
                                                _controller.text =
                                                    voiceState.text;
                                              }
                                            });

                                            return ReraTextFaild(
                                              onChange: (p0) {},
                                              controller: _controller,
                                              readOnly: false,
                                              enabled: true,
                                              suffixIcon: GestureDetector(
                                                  onTap: () {
                                                    //--------------
                                                    final chatState = context
                                                        .read<
                                                            ChatHistoryCubit>()
                                                        .state;
                                                    //-------------------- authority send button ------------------------
                                                    if (chatState.activeChat ==
                                                        ChatTypeEnum
                                                            .authority) {
                                                      chatState
                                                          .authorityMessages
                                                          .clear();
                                                      context
                                                          .read<
                                                              ChatHistoryCubit>()
                                                          .addMessage(
                                                              MessageRequestModel(
                                                            role: 'assistant',
                                                            content: AppStrings()
                                                                .defaultAuthorityBotMessage,
                                                          ));
                                                    }
                                                    //-------------------- Platform send button ------------------------
                                                    else {
                                                      chatState.platformMessages
                                                          .clear();
                                                      context
                                                          .read<
                                                              ChatHistoryCubit>()
                                                          .addMessage(
                                                              MessageRequestModel(
                                                            role: 'assistant',
                                                            content: AppStrings()
                                                                .defaultPlatformBotMessage,
                                                          ));
                                                    }
                                                  },
                                                  child: Icon(
                                                    Icons.refresh_rounded,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  )),
                                              hint:
                                                  AppStrings().writeUourMessage,
                                            );
                                          }),
                                    ),
                                    /*======================== Send button ========================= */
                                    BlocProvider<WebRTCCubit>.value(
                                      value: webRTCCubit ?? WebRTCCubit(),
                                      child: ValueListenableBuilder<bool>(
                                          valueListenable: isSendEnabled,
                                          builder: (context, enabled, child) {
                                            return SendButtonWidget(
                                              startAvatarTimer:
                                                  startOrResetAvatarTimer,
                                              isAvatarShown: isAvatarPressed,
                                              scrollController:
                                                  _scrollController,
                                              enabled: enabled,
                                              controller: _controller,
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: AppSizeW.s20,
                                  right: AppSizeW.s15,
                                  left: AppSizeW.s15,
                                ),
                                child: Row(
                                  children: [
                                    Text("${AppStrings().note}: ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall),
                                    Flexible(
                                      child: Text(AppStrings().aiNote,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium),
                                    ),
                                  ],
                                ),
                              ),
                              if (webRTCCubit != null && isAvatarPressed)
                                BlocBuilder<WebRTCCubit, WebRTCState>(
                                    bloc: webRTCCubit,
                                    builder: (context, state) {
                                      return state.isMiniScreen
                                          ? const SizedBox.shrink()
                                          : Container(
                                              padding: EdgeInsets.only(
                                                bottom: AppSizeW.s20,
                                                right: AppSizeW.s15,
                                                left: AppSizeW.s15,
                                              ),
                                              decoration:
                                                  BoxDecoration(boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withValues(alpha: 0.1),
                                                  spreadRadius: 0,
                                                  blurRadius: 20,
                                                  offset: const Offset(0, 20),
                                                ),
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withValues(alpha: 0.4),
                                                  spreadRadius: 0,
                                                  blurRadius: 20,
                                                  offset: const Offset(0, 10),
                                                ),
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withValues(alpha: 0.7),
                                                  spreadRadius: 20,
                                                  blurRadius: 20,
                                                  offset: const Offset(0, 0),
                                                ),
                                              ]),
                                              child: Row(
                                                children: [
                                                  //-------------------Pause- ---------
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    AppSizeR
                                                                        .s130),
                                                        color: ColorManager
                                                            .textBlack
                                                            .withValues(
                                                                alpha: .3)),
                                                    child: IconButton(
                                                      icon: Icon(
                                                        color:
                                                            ColorManager.white,
                                                        state.isPlaying
                                                            ? Icons.pause
                                                            : Icons.play_arrow,
                                                        size: AppSizeW.s25,
                                                      ),
                                                      onPressed: webRTCCubit!
                                                          .togglePlayPause,
                                                    ),
                                                  ),
                                                  //-------------------timer ----------
                                                  Container(
                                                    padding: EdgeInsets.all(
                                                        AppSizeW.s8),
                                                    child: BlocBuilder<
                                                            WebRTCCubit,
                                                            WebRTCState>(
                                                        bloc: webRTCCubit,
                                                        builder:
                                                            (context, state) {
                                                          // Convert elapsedTime into mm:ss format
                                                          String formattedTime =
                                                              _formatTime(state
                                                                  .elapsedTime);

                                                          return Text(
                                                              formattedTime,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .displaySmall);
                                                        }),
                                                  ),
                                                  //-------------------Sound ----------
                                                  const Spacer(),
                                                  IconButton(
                                                    icon: Icon(
                                                      state.isMuted
                                                          ? Icons.volume_off
                                                          : Icons.volume_up,
                                                      color: ColorManager.white,
                                                      size: AppSizeW.s25,
                                                    ),
                                                    onPressed: () {
                                                      webRTCCubit!.toggleMute();
                                                    },
                                                  ),
                                                  //------------------- Mini screen ----------

                                                  IconButton(
                                                      icon: Icon(
                                                        state.isMiniScreen
                                                            ? Icons.fullscreen
                                                            : Icons
                                                                .fit_screen_sharp,
                                                        color:
                                                            ColorManager.white,
                                                        size: AppSizeW.s25,
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          webRTCCubit!
                                                              .toggleMiniScreen();
                                                        });
                                                      }),
                                                ],
                                              ),
                                            );
                                    }),
                            ],
                          );
                        }),
                  ),
                );
              }),
          Align(
            alignment: Alignment.topLeft,
            child: Builder(builder: (context) {
              return PopupMenuButton<int>(
                icon: Icon(
                  Icons.more_vert,
                  color: ColorManager.primary,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizeR.s10),
                ),
                color: Theme.of(context).cardTheme.color,
                shadowColor: ColorManager.primary,
                itemBuilder: (context) => [
                  PopupMenuItem<int>(
                    value: 0,
                    child: MultiBlocProvider(
                      providers: [
                        BlocProvider.value(
                          value: BlocProvider.of<DropdownCubit>(context),
                        ),
                        BlocProvider.value(
                          value: BlocProvider.of<ChatHistoryCubit>(context),
                        ),
                      ],
                      child: BlocBuilder<DropdownCubit, ChatTypeEnum>(
                        builder: (context, selectedOption) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CheckBoxWidget(
                                onPlatformTapAndAvatarIsOpen: () async {
                                  //close stream if it's working:

                                  final String? streamId =
                                      streamIdCubit.state.streamId;
                                  isAvatarExpanded.value = false;
                                  if (streamId != null) {
                                    closeStreamBloc
                                        .add(CloseStreamEvent.closeStream(
                                            //here i pass the streamID
                                            streamIdCubit.state.streamId!));
                                    streamIdCubit.clearStreamId();
                                  }
                                  if (webRTCCubit != null) {
                                    //clear the webrt Cubit
                                    await webRTCCubit!.closeStreamCubit();
                                    await webRTCCubit!.close();
                                    webRTCCubit == null;
                                  }
                                },
                                scrollController: _scrollController,
                                text: AppStrings().moreTitle,
                                value: ChatTypeEnum.qatarRealEstatePlatform,
                                isChecked: selectedOption ==
                                    ChatTypeEnum.qatarRealEstatePlatform,
                              ),
                              CheckBoxWidget(
                                onPlatformTapAndAvatarIsOpen: null,
                                scrollController: _scrollController,
                                text:
                                    AppStrings().realEstateRegulatoryAuthority,
                                value: ChatTypeEnum.authority,
                                isChecked:
                                    selectedOption == ChatTypeEnum.authority,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
          // Mini-Screen Mode (Draggable Video)

          if (webRTCCubit != null)
            ValueListenableBuilder<bool>(
                valueListenable: isAvatarExpanded,
                builder: (context, expanded, child) {
                  return BlocBuilder<WebRTCCubit, WebRTCState>(
                      bloc: webRTCCubit,
                      builder: (context, state) {
                        if (state.isMiniScreen && expanded
                            // // NOTE: expanded is for hide the mini screen if user close stream and it's true.
                            ) {
                          return AnimatedPositioned(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            left: state.isMiniScreen
                                ? state.miniScreenPosition.dx
                                : AppSizeW.s0,
                            top: state.isMiniScreen
                                ? state.miniScreenPosition.dy
                                : AppSizeH.s0,
                            // left: state.isMiniScreen ? miniScreenPosition.dx : 0,
                            // top: state.isMiniScreen ? miniScreenPosition.dy : 0,
                            width: state.isMiniScreen
                                ? AppSizeW.s150
                                : MediaQuery.of(context).size.width,
                            height: state.isMiniScreen
                                ? AppSizeH.s200
                                : MediaQuery.of(context).size.height,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 300),
                              opacity:
                                  state.isMiniScreen ? 1 : 0, // Fade effect
                              child: Stack(
                                children: [
                                  Draggable(
                                    feedback:
                                        MiniVideoPlayerWidget(state: state),
                                    childWhenDragging:
                                        Container(), // Hide original while dragging
                                    onDragEnd: (details) {
                                      final screenSize =
                                          MediaQuery.of(context).size;
                                      final dx = details.offset.dx;
                                      final dy = details.offset.dy;

                                      // Calculate closest corner
                                      final topLeft =
                                          Offset(AppSizeW.s0, AppSizeH.s0);
                                      final topRight = Offset(
                                          screenSize.width - AppSizeW.s150,
                                          AppSizeH.s0);
                                      final bottomLeft = Offset(
                                          AppSizeW.s0,
                                          screenSize.height -
                                              screenSize.height * 0.4);
                                      final bottomRight = Offset(
                                          screenSize.width - AppSizeW.s150,
                                          screenSize.height -
                                              screenSize.height * 0.4);

                                      List<Offset> corners = [
                                        topLeft,
                                        topRight,
                                        bottomLeft,
                                        bottomRight
                                      ];

                                      // Find the closest corner
                                      Offset nearestCorner = corners.reduce(
                                          (a, b) => (dx - a.dx).abs() +
                                                      (dy - a.dy).abs() <
                                                  (dx - b.dx).abs() +
                                                      (dy - b.dy).abs()
                                              ? a
                                              : b);

                                      // Animate position update
                                      webRTCCubit!.updateMiniScreenPosition(
                                          nearestCorner);
                                      // miniScreenPosition = nearestCorner;
                                    },

                                    child: MiniVideoPlayerWidget(state: state),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    top: 0,
                                    right: 0,
                                    left: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        if (webRTCCubit != null) {
                                          webRTCCubit!.toggleMiniScreen();
                                        }
                                      },
                                      child: Icon(
                                        state.isMiniScreen
                                            ? Icons.fullscreen
                                            : Icons.fit_screen_sharp,
                                        color: Colors.white,
                                        size: AppSizeW.s35,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      });
                }),
        ],
      ),
    );
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  Size get preferredSize => Size.fromHeight(AppSizeH.s30);
}

AppBar costumeChatAppBar(
    BuildContext context,
    ScrollController scrollController,
    void Function()? onPlatformTapAndAvatarIsOpen) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.maybePop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.arrow_back,
                color: ColorManager.white,
              ),
              SizedBox(width: AppSizeW.s5),
              Text(
                AppStrings().main,
                style: TextStyle(
                    color: ColorManager.white,
                    fontSize: AppSizeW.s12,
                    fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ),
        BlocBuilder<DropdownCubit, ChatTypeEnum>(
          bloc: BlocProvider.of<DropdownCubit>(context),
          builder: (context, selectedOption) {
            return Text(
              selectedOption == ChatTypeEnum.qatarRealEstatePlatform
                  ? AppStrings().moreTitle
                  : AppStrings().realEstateRegulatoryAuthority,
              style:
                  TextStyle(color: ColorManager.white, fontSize: AppSizeW.s16),
            );
          },
        ),
      ],
    ),
    actions: [
      Builder(builder: (context) {
        return PopupMenuButton<int>(
          icon: Icon(
            Icons.more_vert,
            color: ColorManager.white,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizeR.s10),
          ),
          color: Theme.of(context).cardTheme.color,
          shadowColor: ColorManager.primary,
          itemBuilder: (context) => [
            PopupMenuItem<int>(
              value: 0,
              child: MultiBlocProvider(
                providers: [
                  BlocProvider.value(
                    value: BlocProvider.of<DropdownCubit>(context),
                  ),
                  BlocProvider.value(
                    value: BlocProvider.of<ChatHistoryCubit>(context),
                  ),
                ],
                child: BlocBuilder<DropdownCubit, ChatTypeEnum>(
                  builder: (context, selectedOption) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CheckBoxWidget(
                          onPlatformTapAndAvatarIsOpen:
                              onPlatformTapAndAvatarIsOpen,
                          scrollController: scrollController,
                          text: AppStrings().moreTitle,
                          value: ChatTypeEnum.qatarRealEstatePlatform,
                          isChecked: selectedOption ==
                              ChatTypeEnum.qatarRealEstatePlatform,
                        ),
                        CheckBoxWidget(
                          onPlatformTapAndAvatarIsOpen: null,
                          scrollController: scrollController,
                          text: AppStrings().realEstateRegulatoryAuthority,
                          value: ChatTypeEnum.authority,
                          isChecked: selectedOption == ChatTypeEnum.authority,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        );
      }),
    ],
  );
}
