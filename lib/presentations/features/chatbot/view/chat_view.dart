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
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui' as ui;

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView>
    with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  late ChatBotBloc chatBotBloc;
  late StartStreamBloc startStreamBloc;
  late CloseStreamBloc closeStreamBloc;
  late StreamIdCubit streamIdCubit;
  late SendAnswerAndCandidateBloc sendAnswerAndCandidateBloc;
  final ValueNotifier<bool> isSendEnabled = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isAvatarExpanded = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isRecordMode = ValueNotifier<bool>(true);
  bool isMessageSending = false;
  final ScrollController scrollController = ScrollController();
/*================ timer for close stream after 2 minutes of no action ================*/
  Timer? inactivityTimer;
  // final Duration inactivityDuration = const Duration(minutes: 1, seconds: 45);
  WebRTCCubit? webRTCCubit;
  final ValueNotifier<bool> showScrollDownButton = ValueNotifier(false);
  //zak
  late final AnimationController _circularMenuController;
  final ValueNotifier<bool> isOpen = ValueNotifier(false);

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
    //zak
    _circularMenuController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.microtask(() {
        if (mounted) {
          context.read<VoiceCubit>().initializeSpeech();
          if (scrollController.hasClients) {
            scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          }
        }
      });
    });
    scrollController.addListener(() {
      final maxScroll = scrollController.position.maxScrollExtent;
      final currentScroll = scrollController.offset;
      final isAtBottom = currentScroll >= maxScroll - AppSizeH.s10;

      // Only update if state actually changes
      if (showScrollDownButton.value != !isAtBottom) {
        showScrollDownButton.value = !isAtBottom;
      }
    });
  }

  @override
  void dispose() {
    //when user pressed the back button to homepage
    closeStreamAfterTimerOrBack();

    showScrollDownButton.dispose();
    _controller.dispose();
    isSendEnabled.dispose();
    isAvatarExpanded.dispose();
    isRecordMode.dispose();
    scrollController.dispose();
    inactivityTimer?.cancel();
    streamIdCubit.close();
    if (webRTCCubit != null) {
      webRTCCubit!.closeStreamCubit();
      webRTCCubit!.close();
    }
    super.dispose();
  }

  // void startOrResetAvatarTimer() {
  //   inactivityTimer?.cancel();
  //   inactivityTimer = Timer(inactivityDuration, closeStreamAfterTimerOrBack);
  // }

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
                            BlocProvider.value(
                              value: streamIdCubit,
                            ),
                            BlocProvider.value(
                              value: closeStreamBloc,
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
                                          contextData: val
                                              .response!.message.contextModel,
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
                                    child: Stack(
                                  children: [
                                    ChatMessagesListWidget(
                                      scrollController: scrollController,
                                      isSending: isMessageSending,
                                      isAvatarPressed: isAvatarPressed,
                                    ),
                                    Positioned(
                                      bottom: AppSizeH.s0,
                                      right: AppSizeW.s15,
                                      child: ValueListenableBuilder<bool>(
                                        valueListenable: showScrollDownButton,
                                        builder: (context, visible, _) {
                                          return AnimatedSwitcher(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            transitionBuilder:
                                                (child, animation) {
                                              return FadeTransition(
                                                  opacity: animation,
                                                  child: child);
                                            },
                                            child: visible
                                                ? GestureDetector(
                                                    key: const ValueKey(
                                                        'visible'),
                                                    onTap: () {
                                                      if (scrollController
                                                          .hasClients) {
                                                        // setState(() {
                                                        scrollController
                                                            .animateTo(
                                                          scrollController
                                                                  .position
                                                                  .maxScrollExtent +
                                                              AppSizeH.s30,
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      300),
                                                          curve: Curves.easeOut,
                                                        );
                                                        // });
                                                      }
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.all(
                                                          AppSizeW.s5),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    AppSizeR
                                                                        .s100),
                                                        color: ColorManager
                                                            .greyCloud,
                                                      ),
                                                      child: Icon(
                                                        Icons
                                                            .arrow_downward_outlined,
                                                        color:
                                                            ColorManager.white,
                                                      ),
                                                    ),
                                                  )
                                                : const SizedBox.shrink(
                                                    key: ValueKey('hidden')),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                              if (isAvatarPressed)
                                BlocConsumer<WebRTCCubit, WebRTCState>(
                                    listener: (context, webRtcState) {
                                      if (webRtcState.rTCPeerConnectionState ==
                                          RTCPeerConnectionState
                                              .RTCPeerConnectionStateFailed) {
                                        //============================ Fix White Screen =============================
                                        // ----------------------------------- Close Stream From Front-end --------------------------

                                        BlocProvider.of<StreamIdCubit>(context)
                                            .clearStreamId();
                                        isAvatarExpanded.value = false;
                                        //here i close the webRTCCubit after closing done success to avoid leak in memory

                                        errorToast(
                                            AppStrings().somethingWentWrong,
                                            context);
                                        // ----------------------------------- Close Stream From Back-end --------------------------
                                        final String? streamId =
                                            BlocProvider.of<StreamIdCubit>(
                                                    context)
                                                .state
                                                .streamId;
                                        if (streamId != null) {
                                          //
                                          closeStreamBloc.add(
                                              CloseStreamEvent.closeStream(
                                                  //here i pass the streamID
                                                  streamIdCubit
                                                      .state.streamId!));
                                          //here i clear the state of startstream to make sure that i don't use the old sdp and data
                                          startStreamBloc.add(
                                              const StartStreamEvent
                                                  .clearState());
                                          //I close the avatar and dispose the camera renderer
                                          if (webRTCCubit != null) {
                                            webRTCCubit!.closeStreamCubit();
                                            webRTCCubit!.close();
                                            webRTCCubit == null;
                                          }
                                        }
                                        //=========================================================
                                      }
                                    },
                                    bloc: webRTCCubit,
                                    builder: (context, state) {
                                      return state.rTCPeerConnectionState ==
                                              RTCPeerConnectionState
                                                  .RTCPeerConnectionStateConnecting
                                          ? Container(
                                              padding:
                                                  EdgeInsets.all(AppSizeW.s5),
                                              width: AppSizeW.s40,
                                              height: AppSizeH.s40,
                                              child:
                                                  const CircularProgressIndicator())
                                          : SizedBox(
                                              height: state.isMiniScreen ==
                                                      false
                                                  ? MediaQuery.sizeOf(context)
                                                          .height /
                                                      5
                                                  : MediaQuery.sizeOf(context)
                                                          .height /
                                                      1.6,
                                              child: ChatMessagesListWidget(
                                                scrollController:
                                                    scrollController,
                                                isSending: isMessageSending,
                                                isAvatarPressed:
                                                    isAvatarPressed,
                                              ),
                                            );
                                    }),
                              //and here  make widget

                              ValueListenableBuilder<bool>(
                                  valueListenable: isRecordMode,
                                  builder:
                                      (context, isRecordModeEnabled, child) {
                                    return Padding(
                                      padding: EdgeInsets.all(AppSizeW.s8),
                                      child: Row(
                                        //
                                        mainAxisAlignment: !isRecordModeEnabled
                                            ? MainAxisAlignment.start
                                            : MainAxisAlignment.spaceAround,
                                        textDirection: ui.TextDirection.ltr,
                                        children: <Widget>[
                                          /*========================For Ai Avatar========================= */
                                          AiAvatarIconWidget(
                                            isRecordModeActive: isRecordMode,
                                            // startAvatarTimer:
                                            //     startOrResetAvatarTimer,
                                            onWebRTCCubitCreated:
                                                (WebRTCCubit? newCubit) async {
                                              //I close the avatar and dispose the camera renderer
                                              if (newCubit == null &&
                                                  webRTCCubit != null) {
                                                await webRTCCubit!
                                                    .closeStreamCubit();
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
                                          // hhere make widget
                                          BlocConsumer<VoiceCubit, VoiceState>(
                                              listener: (context, voiceState) {
                                                //------------------- send message via record-------------------
                                                final message = voiceState.text;
                                                if (!voiceState.isListening &&
                                                    message.isNotEmpty &&
                                                    isAvatarPressed) {
                                                  //--------------
                                                  //to make the data shown dirctly when message send
                                                  WidgetsBinding.instance
                                                      .addPostFrameCallback(
                                                          (_) {
                                                    if (scrollController
                                                        .hasClients) {
                                                      scrollController
                                                          .animateTo(
                                                        scrollController
                                                                .position
                                                                .maxScrollExtent +
                                                            AppSizeH.s30,
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    300),
                                                        curve: Curves.easeOut,
                                                      );
                                                    }
                                                  });

                                                  //--------------
                                                  final chatState = context
                                                      .read<ChatHistoryCubit>()
                                                      .state;
                                                  final userMessage =
                                                      MessageRequestModel(
                                                          content: message,
                                                          role: 'user');
                                                  context
                                                      .read<ChatHistoryCubit>()
                                                      .addMessage(userMessage);
                                                  if (chatState.activeChat ==
                                                          ChatTypeEnum
                                                              .authority &&
                                                      webRTCCubit != null) {
                                                    // Send the user's message as a ChatMessage instance
                                                    // chatBotBloc.add(
                                                    chatBotBloc.add(SendMessageEvent.started(
                                                        ChatbotRequestModel(
                                                            streamId:
                                                                //===== NOTE: Here I send the stream id as null when i make a pause to te webRTC and user send message =======
                                                                !webRTCCubit!
                                                                        .state
                                                                        .isPlaying
                                                                    ? null
                                                                    : streamIdCubit
                                                                        .state
                                                                        .streamId,
                                                            messages: context
                                                                .read<
                                                                    ChatHistoryCubit>()
                                                                .state
                                                                .authorityMessages)));
                                                  }
                                                  _controller.clear();
                                                  context
                                                      .read<VoiceCubit>()
                                                      .clearText();
                                                  // if (isAvatarPressed) {
                                                  //   startOrResetAvatarTimer();
                                                  // }
                                                }
                                                //---------------------------------------------------------------
                                              },
                                              bloc: BlocProvider.of<VoiceCubit>(
                                                  context),
                                              builder: (context, voiceState) {
                                                print(
                                                    "this is voice state $voiceState");
                                                return GestureDetector(
                                                  onTap: () {
                                                    if (voiceState
                                                        .isListening) {
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
                                                  child: isAvatarPressed
                                                      ? isRecordModeEnabled
                                                          ? Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                      boxShadow: [
                                                                    BoxShadow(
                                                                      blurStyle:
                                                                          BlurStyle
                                                                              .outer,
                                                                      color: ColorManager
                                                                          .primary
                                                                          .withValues(
                                                                              alpha: .7),
                                                                      blurRadius:
                                                                          30,
                                                                      spreadRadius:
                                                                          1,
                                                                    ),
                                                                  ],
                                                                      gradient:
                                                                          LinearGradient(
                                                                        colors: [
                                                                          ColorManager
                                                                              .primary,
                                                                          ColorManager
                                                                              .primary
                                                                              .withValues(alpha: .7),
                                                                        ],
                                                                        begin: Alignment
                                                                            .topLeft,
                                                                        end: Alignment
                                                                            .bottomRight,
                                                                      ),
                                                                      color: Theme.of(context)
                                                                          .primaryColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(AppSizeR
                                                                              .s100)),
                                                              height:
                                                                  AppSizeH.s60,
                                                              width:
                                                                  AppSizeH.s120,
                                                              child: voiceState
                                                                      .isListening
                                                                  ? Lottie
                                                                      .asset(
                                                                      ImageAssets
                                                                          .chatBotRecordingIndecetor,
                                                                      delegates:
                                                                          LottieDelegates(
                                                                        values: [
                                                                          ValueDelegate
                                                                              .color(
                                                                            const [
                                                                              '**'
                                                                            ],
                                                                            value:
                                                                                ColorManager.white,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    )
                                                                  : Icon(
                                                                      Icons
                                                                          .mic_none,
                                                                      color: ColorManager
                                                                          .white,
                                                                    ))
                                                          : const SizedBox
                                                              .shrink()
                                                      :
                                                      //we will see this widget when the avatar is not enabled
                                                      voiceState.isListening
                                                          ? SizedBox(
                                                              height:
                                                                  AppSizeH.s40,
                                                              width:
                                                                  AppSizeH.s40,
                                                              child: Lottie.asset(
                                                                  ImageAssets
                                                                      .chatBotRecordingIndecetor))
                                                          : const Icon(
                                                              Icons.mic_none),
                                                );
                                              }),

                                          SizedBox(
                                            width: isRecordModeEnabled
                                                ? AppSizeW.s0
                                                : AppSizeW.s5,
                                          ),
                                          // Container(
                                          //   margin: EdgeInsets.symmetric(
                                          //       horizontal: AppSizeW.s150),
                                          //   height: AppSizeH.s60,
                                          //   width: AppSizeW.s60,
                                          //   child: CircularMenu(
                                          //     toggleButtonSize: AppSizeW.s20,
                                          //     alignment: Alignment.center,
                                          //     toggleButtonColor: ColorManager.primary,
                                          //     toggleButtonMargin: 0,
                                          //     toggleButtonIconColor: Colors.white,
                                          //     startingAngleInRadian:
                                          //         3.14, // From 180°
                                          //     endingAngleInRadian:
                                          //         // 6.28, // To 360° (full circle in clockwise)
                                          //         4.71, // To 270° (full circle in clockwise)
                                          //     // 5.10, // To 270° (full circle in clockwise)
                                          //     radius: 100,
                                          //     items: [
                                          //       CircularMenuItem(
                                          //         enableBadge: true,
                                          //         badgeColor: Colors.amber,
                                          //         badgeLabel: '3:00',
                                          //         badgeRadius: 15,
                                          //         badgeTextColor: Colors.white,
                                          //         badgeRightOffet: 0,
                                          //         badgeTopOffet: 0,
                                          //         onTap: () {
                                          //           print(
                                          //               'badge on circular menu item');
                                          //         },
                                          //         icon: Icons.home,
                                          //         color: Colors.teal,
                                          //       ),
                                          //       // CircularMenuItem(
                                          //       //     iconSize: AppSizeW.s20,
                                          //       //     icon: Icons.keyboard,
                                          //       //     color: ColorManager.lightSilver,
                                          //       //     onTap: () {}),
                                          //       CircularMenuItem(
                                          //           iconSize: AppSizeW.s20,
                                          //           icon: Icons.fit_screen_sharp,
                                          //           color: ColorManager.lightSilver,
                                          //           onTap: () {
                                          //             log(" miniscreen");
                                          //             // setState(() {
                                          //             //   webRTCCubit!
                                          //             //       .toggleMiniScreen();
                                          //             // });
                                          //           }),
                                          //       CircularMenuItem(
                                          //           iconSize: AppSizeW.s20,
                                          //           icon: Icons.volume_up,
                                          //           color: ColorManager.lightSilver,
                                          //           onTap: () {
                                          //             log(" mute");

                                          //             // webRTCCubit!
                                          //             //     .toggleMute();
                                          //           }),
                                          //       CircularMenuItem(
                                          //           iconSize: AppSizeW.s20,
                                          //           icon: Icons.play_arrow,
                                          //           color: ColorManager.lightSilver,
                                          //           onTap: () {
                                          //             log(" pause");
                                          //             // webRTCCubit!
                                          //             //     .togglePlayPause();
                                          //           }),
                                          //     ],
                                          //   ),
                                          // ),
                                          // if (!isAvatarPressed)
                                          //
                                          if (isAvatarPressed)
                                            GestureDetector(
                                              onTap: () {
                                                isRecordMode.value =
                                                    !isRecordMode.value;
                                              },
                                              child: ValueListenableBuilder<
                                                      bool>(
                                                  valueListenable: isRecordMode,
                                                  builder: (context,
                                                      isRecordModeEnabled,
                                                      child) {
                                                    return Container(
                                                      width: AppSizeW.s40,
                                                      height: AppSizeH.s40,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      AppSizeR
                                                                          .s5),
                                                          color: ColorManager
                                                              .lightSilver
                                                              .withValues(
                                                                  alpha: .3)),
                                                      child: isRecordModeEnabled
                                                          ? const Icon(
                                                              Icons.keyboard)
                                                          : const Icon(
                                                              Icons.mic_none),
                                                    );
                                                  }),
                                            ),
                                          SizedBox(
                                            width: isRecordModeEnabled
                                                ? AppSizeW.s0
                                                : AppSizeW.s5,
                                          ),
                                          /*========================TextFaild========================= */
                                          if (!isRecordModeEnabled ||
                                              !isAvatarPressed)
                                            // if (false)
                                            Expanded(
                                              child: BlocBuilder<VoiceCubit,
                                                      VoiceState>(
                                                  bloc: BlocProvider.of<
                                                      VoiceCubit>(context),
                                                  builder:
                                                      (context, voiceState) {
                                                    WidgetsBinding.instance
                                                        .addPostFrameCallback(
                                                            (_) {
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
                                                      suffixIcon:
                                                          GestureDetector(
                                                              onTap: () {
                                                                //--------------
                                                                final chatState =
                                                                    context
                                                                        .read<
                                                                            ChatHistoryCubit>()
                                                                        .state;
                                                                //-------------------- authority send button ------------------------
                                                                if (chatState
                                                                        .activeChat ==
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
                                                                        role:
                                                                            'assistant',
                                                                        content:
                                                                            AppStrings().defaultAuthorityBotMessage,
                                                                      ));
                                                                }
                                                                //-------------------- Platform send button ------------------------
                                                                else {
                                                                  chatState
                                                                      .platformMessages
                                                                      .clear();
                                                                  context
                                                                      .read<
                                                                          ChatHistoryCubit>()
                                                                      .addMessage(
                                                                          MessageRequestModel(
                                                                        role:
                                                                            'assistant',
                                                                        content:
                                                                            AppStrings().defaultPlatformBotMessage,
                                                                      ));
                                                                }
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .refresh_rounded,
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor,
                                                              )),
                                                      hint: AppStrings()
                                                          .writeUourMessage,
                                                    );
                                                  }),
                                            ),
                                          /*======================== Send button ========================= */

                                          /*========================TextFaild button if avatar pressed ========================= */
                                          //
                                          // if (webRTCCubit != null && isAvatarPressed)
                                          // VideoControlsMenu(
                                          //     webRTCCubit: webRTCCubit!),

                                          if (!isRecordModeEnabled ||
                                              !isAvatarPressed)
                                            // if (false)
                                            BlocProvider<WebRTCCubit>.value(
                                              value:
                                                  webRTCCubit ?? WebRTCCubit(),
                                              child:
                                                  ValueListenableBuilder<bool>(
                                                      valueListenable:
                                                          isSendEnabled,
                                                      builder: (context,
                                                          enabled, child) {
                                                        return SendButtonWidget(
                                                          // startAvatarTimer:
                                                          //     startOrResetAvatarTimer,
                                                          isAvatarShown:
                                                              isAvatarPressed,
                                                          scrollController:
                                                              scrollController,
                                                          enabled: enabled,
                                                          controller:
                                                              _controller,
                                                        );
                                                      }),
                                            ),
                                        ],
                                      ),
                                    );
                                  }),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: isAvatarPressed
                                      ? AppSizeH.s20
                                      : AppSizeH.s0,
                                  bottom: AppSizeH.s20,
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
                              // here  make widget
                              // if (webRTCCubit != null && isAvatarPressed)
                              //   BlocBuilder<WebRTCCubit, WebRTCState>(
                              //       bloc: webRTCCubit,
                              //       builder: (context, state) {
                              //         return state.isMiniScreen
                              //             ? const SizedBox.shrink()
                              //             :
                              //             Container(
                              //                 padding: EdgeInsets.only(
                              //                   bottom: AppSizeW.s20,
                              //                   right: AppSizeW.s15,
                              //                   left: AppSizeW.s15,
                              //                 ),
                              //                 decoration:
                              //                     BoxDecoration(boxShadow: [
                              //                   BoxShadow(
                              //                     color: Colors.black
                              //                         .withValues(alpha: 0.1),
                              //                     spreadRadius: 0,
                              //                     blurRadius: 20,
                              //                     offset: const Offset(0, 20),
                              //                   ),
                              //                   BoxShadow(
                              //                     color: Colors.black
                              //                         .withValues(alpha: 0.4),
                              //                     spreadRadius: 0,
                              //                     blurRadius: 20,
                              //                     offset: const Offset(0, 10),
                              //                   ),
                              //                   BoxShadow(
                              //                     color: Colors.black
                              //                         .withValues(alpha: 0.7),
                              //                     spreadRadius: 20,
                              //                     blurRadius: 20,
                              //                     offset: const Offset(0, 0),
                              //                   ),
                              //                 ]),
                              //                 child: Row(
                              //                   children: [
                              //                     //-------------------Pause- ---------
                              //                     Container(
                              //                       decoration: BoxDecoration(
                              //                           borderRadius:
                              //                               BorderRadius
                              //                                   .circular(
                              //                                       AppSizeR
                              //                                           .s130),
                              //                           color: ColorManager
                              //                               .textBlack
                              //                               .withValues(
                              //                                   alpha: .3)),
                              //                       child: IconButton(
                              //                         icon: Icon(
                              //                           color:
                              //                               ColorManager.white,
                              //                           state.isPlaying
                              //                               ? Icons.pause
                              //                               : Icons.play_arrow,
                              //                           size: AppSizeW.s25,
                              //                         ),
                              //                         onPressed: webRTCCubit!
                              //                             .togglePlayPause,
                              //                       ),
                              //                     ),
                              //                     //-------------------timer ----------
                              //                     Container(
                              //                       padding: EdgeInsets.all(
                              //                           AppSizeW.s8),
                              //                       child: BlocBuilder<
                              //                               WebRTCCubit,
                              //                               WebRTCState>(
                              //                           bloc: webRTCCubit,
                              //                           builder:
                              //                               (context, state) {
                              //                             // Convert elapsedTime into mm:ss format
                              //                             String formattedTime =
                              //                                 _formatTime(state
                              //                                     .elapsedTime);

                              //                             return Text(
                              //                                 formattedTime,
                              //                                 style: Theme.of(
                              //                                         context)
                              //                                     .textTheme
                              //                                     .displaySmall);
                              //                           }),
                              //                     ),
                              //                     //-------------------Sound ----------
                              //                     const Spacer(),
                              //                     IconButton(
                              //                       icon: Icon(
                              //                         state.isMuted
                              //                             ? Icons.volume_off
                              //                             : Icons.volume_up,
                              //                         color: ColorManager.white,
                              //                         size: AppSizeW.s25,
                              //                       ),
                              //                       onPressed: () {
                              //                         webRTCCubit!.toggleMute();
                              //                       },
                              //                     ),
                              //                     //------------------- Mini screen ----------

                              //                     IconButton(
                              //                         icon: Icon(
                              //                           state.isMiniScreen
                              //                               ? Icons.fullscreen
                              //                               : Icons
                              //                                   .fit_screen_sharp,
                              //                           color:
                              //                               ColorManager.white,
                              //                           size: AppSizeW.s25,
                              //                         ),
                              //                         onPressed: () {
                              //                           setState(() {
                              //                             webRTCCubit!
                              //                                 .toggleMiniScreen();
                              //                           });
                              //                         }),
                              //                   ],
                              //                 ),
                              //               );
                              //       }),
                            ],
                          );
                        }),
                  ),
                );
              }),
//========================== Start Menu Button  ============================================
          ChatsMenuButtonWidget(
            isAvatarExpanded: isAvatarExpanded,
            scrollController: scrollController,
          ),
//========================== End Menu Button  ==============================================
// =========================== Start Mini-Screen Mode (Draggable Video)===========================
          if (webRTCCubit != null)
            BlocProvider.value(
              value: webRTCCubit!,
              child: MiniScreenWidget(
                isAvatarExpanded: isAvatarExpanded,
              ),
            ),
// =========================== End Mini-Screen Mode (Draggable Video)===========================
//============================ Start circular_menu =====================================

          // Positioned(
          //   top: 0,
          //   bottom: AppSizeH.s50,
          //   right: AppSizeW.s15,
          //   left: 0,
          //   child: ValueListenableBuilder<bool>(
          //       valueListenable: isAvatarExpanded,
          //       builder: (context, expanded, child) {
          //         if (webRTCCubit != null && expanded) {
          //           return BlocBuilder<WebRTCCubit, WebRTCState>(
          //               bloc: webRTCCubit,
          //               builder: (webContext, state) {
          //                 return state.isMiniScreen
          //                     ? const SizedBox.shrink()
          //                     : Align(
          //                         alignment: Alignment.centerRight,
          //                         child: CircularMenu(
          //                           toggleButtonSize: AppSizeW.s20,
          //                           alignment: Alignment.centerRight,
          //                           toggleButtonColor: ColorManager.primary,
          //                           toggleButtonMargin: 0,
          //                           toggleButtonIconColor: Colors.white,
          //                           startingAngleInRadian: 3.14, // From 180°
          //                           endingAngleInRadian:
          //                               // 6.28, // To 360° (full circle in clockwise)
          //                               4.71, // To 270° (full circle in clockwise)
          //                           // 5.10, // To 270° (full circle in clockwise)
          //                           radius: 100,
          //                           items: [
          //                             CircularMenuItem(
          //                                 iconSize: AppSizeW.s20,
          //                                 icon: state.isMiniScreen
          //                                     ? Icons.fullscreen
          //                                     : Icons.fit_screen_sharp,
          //                                 color: ColorManager.primary
          //                                     .withValues(alpha: .6),
          //                                 onTap: () {
          //                                   log(" miniscreen");
          //                                   setState(() {
          //                                     webRTCCubit!.toggleMiniScreen();
          //                                   });
          //                                 }),
          //                             CircularMenuItem(
          //                                 iconSize: AppSizeW.s20,
          //                                 icon: state.isMuted
          //                                     ? Icons.volume_off
          //                                     : Icons.volume_up,
          //                                 color: ColorManager.primary
          //                                     .withValues(alpha: .6),
          //                                 onTap: () {
          //                                   log(" mute");

          //                                   webRTCCubit!.toggleMute();
          //                                 }),
          //                             CircularMenuItem(
          //                                 iconSize: AppSizeW.s20,
          //                                 icon: state.isPlaying
          //                                     ? Icons.pause
          //                                     : Icons.play_arrow,
          //                                 color: ColorManager.primary
          //                                     .withValues(alpha: .6),
          //                                 onTap: () {
          //                                   log(" pause");
          //                                   webRTCCubit!.togglePlayPause();
          //                                 }),
          //                           ],
          //                         ),
          //                       );
          //               });
          //         } else {
          //           return const SizedBox.shrink();
          //         }
          //       }),
          // ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizeW.s5),
            child: Align(
              alignment: Alignment.centerRight,
              child: ValueListenableBuilder<bool>(
                  valueListenable: isAvatarExpanded,
                  builder: (context, expanded, child) {
                    if (webRTCCubit != null && expanded) {
                      return BlocBuilder<WebRTCCubit, WebRTCState>(
                          bloc: webRTCCubit,
                          builder: (context, state) {
                            if (state.isMiniScreen) {
                              return const SizedBox.shrink();
                            } else {
                              return ValueListenableBuilder<bool>(
                                valueListenable: isOpen,
                                builder: (context, open, _) {
                                  if (open &&
                                      !_circularMenuController.isAnimating) {
                                    _circularMenuController.forward();
                                  } else if (!open &&
                                      !_circularMenuController.isAnimating) {
                                    _circularMenuController.reverse();
                                  }

                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      _buildAnimatedItem(
                                        delay: 0,
                                        child: open
                                            ? _buildActionButton(
                                                icon: state.isMiniScreen
                                                    ? Icons.fullscreen
                                                    : Icons.fit_screen_sharp,
                                                onTap: () {
                                                  setState(() {
                                                    webRTCCubit!
                                                        .toggleMiniScreen();
                                                  });
                                                })
                                            : const SizedBox.shrink(),
                                      ),
                                      _buildAnimatedItem(
                                        delay: 100,
                                        child: open
                                            ? _buildActionButton(
                                                icon: state.isMuted
                                                    ? Icons.volume_off
                                                    : Icons.volume_up,
                                                onTap: () =>
                                                    webRTCCubit!.toggleMute(),
                                              )
                                            : const SizedBox.shrink(),
                                      ),
                                      _buildAnimatedItem(
                                        delay: 200,
                                        child: open
                                            ? _buildActionButton(
                                                icon: state.isPlaying
                                                    ? Icons.pause
                                                    : Icons.play_arrow,
                                                onTap: () => webRTCCubit!
                                                    .togglePlayPause(),
                                              )
                                            : const SizedBox.shrink(),
                                      ),
                                      FloatingActionButton.small(
                                        heroTag: "toggleMenu",
                                        backgroundColor: ColorManager.primary,
                                        child: Icon(
                                          open ? Icons.close : Icons.menu,
                                          color: Colors.white,
                                        ),
                                        onPressed: () =>
                                            isOpen.value = !isOpen.value,
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          });
                    } else {
                      return const SizedBox.shrink();
                    }
                  }),
            ),
          ),

//============================ End circular_menu =====================================
//============================ Start Timer =====================================

          ValueListenableBuilder<bool>(
              valueListenable: isAvatarExpanded,
              builder: (context, expanded, child) {
                if (webRTCCubit != null && expanded) {
                  return BlocBuilder<WebRTCCubit, WebRTCState>(
                      bloc: webRTCCubit,
                      builder: (context, state) {
                        // Convert elapsedTime into mm:ss format
                        String formattedTime = _formatTime(state.elapsedTime);
                        return state.isMiniScreen
                            ? const SizedBox.shrink()
                            : Container(
                                padding: EdgeInsets.all(AppSizeW.s8),
                                margin: EdgeInsets.all(AppSizeW.s8),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius:
                                        BorderRadius.circular(AppSizeR.s5)),
                                child: Text(formattedTime,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall),
                              );
                      });
                } else {
                  return const SizedBox.shrink();
                }
              }),
//============================ End Timer =====================================
        ],
      ),
    );
  }

  Widget _buildAnimatedItem({
    required int delay,
    required Widget child,
  }) {
    final animation = CurvedAnimation(
      parent: _circularMenuController,
      curve: Interval(delay / 300, 1, curve: Curves.easeInOut),
    );

    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.3),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: FloatingActionButton.small(
        heroTag: icon.toString(),
        backgroundColor: ColorManager.primary.withOpacity(0.6),
        onPressed: onTap,
        child: Icon(icon, color: Colors.white),
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

class VerticalActionMenu extends StatefulWidget {
  const VerticalActionMenu({super.key});

  @override
  State<VerticalActionMenu> createState() => _VerticalActionMenuState();
}

class _VerticalActionMenuState extends State<VerticalActionMenu>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<bool> isOpen = ValueNotifier(false);
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    isOpen.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final webRTCCubit = BlocProvider.of<WebRTCCubit>(context);

    return BlocBuilder<WebRTCCubit, WebRTCState>(
      builder: (context, state) {
        return state.isMiniScreen
            ? const SizedBox.shrink()
            : ValueListenableBuilder<bool>(
                valueListenable: isOpen,
                builder: (context, open, _) {
                  if (open && !_controller.isAnimating) {
                    _controller.forward();
                  } else if (!open && !_controller.isAnimating) {
                    _controller.reverse();
                  }

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _buildAnimatedItem(
                        delay: 0,
                        child: open
                            ? _buildActionButton(
                                icon: state.isMiniScreen
                                    ? Icons.fullscreen
                                    : Icons.fit_screen_sharp,
                                onTap: () {
                                  setState(() {
                                    webRTCCubit.toggleMiniScreen();
                                  });
                                })
                            : const SizedBox.shrink(),
                      ),
                      _buildAnimatedItem(
                        delay: 100,
                        child: open
                            ? _buildActionButton(
                                icon: state.isMuted
                                    ? Icons.volume_off
                                    : Icons.volume_up,
                                onTap: () => webRTCCubit.toggleMute(),
                              )
                            : const SizedBox.shrink(),
                      ),
                      _buildAnimatedItem(
                        delay: 200,
                        child: open
                            ? _buildActionButton(
                                icon: state.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                onTap: () => webRTCCubit.togglePlayPause(),
                              )
                            : const SizedBox.shrink(),
                      ),
                      FloatingActionButton.small(
                        heroTag: "toggleMenu",
                        backgroundColor: ColorManager.primary,
                        child: Icon(
                          open ? Icons.close : Icons.menu,
                          color: Colors.white,
                        ),
                        onPressed: () => isOpen.value = !isOpen.value,
                      ),
                    ],
                  );
                },
              );
      },
    );
  }

  Widget _buildAnimatedItem({
    required int delay,
    required Widget child,
  }) {
    final animation = CurvedAnimation(
      parent: _controller,
      curve: Interval(delay / 300, 1, curve: Curves.easeInOut),
    );

    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.3),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: FloatingActionButton.small(
        heroTag: icon.toString(),
        backgroundColor: ColorManager.primary.withOpacity(0.6),
        onPressed: onTap,
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}

class MiniScreenWidget extends StatelessWidget {
  const MiniScreenWidget({
    super.key,
    required this.isAvatarExpanded,
  });

  final ValueNotifier<bool> isAvatarExpanded;

  @override
  Widget build(BuildContext context) {
    final WebRTCCubit webRTCCubit = BlocProvider.of<WebRTCCubit>(context);
    return ValueListenableBuilder<bool>(
        valueListenable: isAvatarExpanded,
        builder: (context, expanded, child) {
          return BlocBuilder<WebRTCCubit, WebRTCState>(
              bloc: webRTCCubit,
              builder: (context, state) {
                if (state.isMiniScreen && expanded
                    // &&
                    //zak
                    // state.remoteRenderer.srcObject != null
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
                      opacity: state.isMiniScreen ? 1 : 0, // Fade effect
                      child: Stack(
                        children: [
                          Draggable(
                            feedback: MiniVideoPlayerWidget(state: state),
                            childWhenDragging:
                                Container(), // Hide original while dragging
                            onDragEnd: (details) {
                              final screenSize = MediaQuery.of(context).size;
                              final dx = details.offset.dx;
                              final dy = details.offset.dy;

                              // Calculate closest corner
                              final topLeft = Offset(AppSizeW.s0, AppSizeH.s0);
                              final topRight = Offset(
                                  screenSize.width - AppSizeW.s150,
                                  AppSizeH.s0);
                              final bottomLeft = Offset(AppSizeW.s0,
                                  screenSize.height - screenSize.height * 0.4);
                              final bottomRight = Offset(
                                  screenSize.width - AppSizeW.s150,
                                  screenSize.height - screenSize.height * 0.4);

                              List<Offset> corners = [
                                topLeft,
                                topRight,
                                bottomLeft,
                                bottomRight
                              ];

                              // Find the closest corner
                              Offset nearestCorner = corners.reduce((a, b) =>
                                  (dx - a.dx).abs() + (dy - a.dy).abs() <
                                          (dx - b.dx).abs() + (dy - b.dy).abs()
                                      ? a
                                      : b);

                              // Animate position update
                              webRTCCubit
                                  .updateMiniScreenPosition(nearestCorner);
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
                                webRTCCubit.toggleMiniScreen();
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
        });
  }
}

class ChatsMenuButtonWidget extends StatelessWidget {
  const ChatsMenuButtonWidget({
    super.key,
    required this.isAvatarExpanded,
    // required this.streamIdCubit,
    // required this.closeStreamBloc,
    // required this.webRTCCubit,
    required this.scrollController,
  });

  final ValueNotifier<bool> isAvatarExpanded;
  // final StreamIdCubit streamIdCubit;
  // final CloseStreamBloc closeStreamBloc;
  // final WebRTCCubit? webRTCCubit;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: isAvatarExpanded,
        builder: (context, expanded, child) {
          return expanded
              ? const SizedBox.shrink()
              : Align(
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
                                value:
                                    BlocProvider.of<ChatHistoryCubit>(context),
                              ),
                            ],
                            child: BlocBuilder<DropdownCubit, ChatTypeEnum>(
                              builder: (context, selectedOption) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CheckBoxWidget(
                                      onPlatformTapAndAvatarIsOpen: () async {
                                        //zak
                                        // //close stream if it's working:

                                        // final String? streamId =
                                        //     streamIdCubit.state.streamId;
                                        // isAvatarExpanded.value = false;
                                        // if (streamId != null) {
                                        //   closeStreamBloc.add(CloseStreamEvent
                                        //       .closeStream(
                                        //           //here i pass the streamID
                                        //           streamIdCubit
                                        //               .state.streamId!));
                                        //   streamIdCubit.clearStreamId();
                                        // }
                                        // if (webRTCCubit != null) {
                                        //   //clear the webrt Cubit
                                        //   await webRTCCubit!
                                        //       .closeStreamCubit();
                                        //   await webRTCCubit!.close();
                                        //   webRTCCubit == null;
                                        // }
                                      },
                                      scrollController: scrollController,
                                      text: AppStrings().moreTitle,
                                      value:
                                          ChatTypeEnum.qatarRealEstatePlatform,
                                      isChecked: selectedOption ==
                                          ChatTypeEnum.qatarRealEstatePlatform,
                                    ),
                                    CheckBoxWidget(
                                      onPlatformTapAndAvatarIsOpen: null,
                                      scrollController: scrollController,
                                      text: AppStrings()
                                          .realEstateRegulatoryAuthority,
                                      value: ChatTypeEnum.authority,
                                      isChecked: selectedOption ==
                                          ChatTypeEnum.authority,
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
                );
        });
  }
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
