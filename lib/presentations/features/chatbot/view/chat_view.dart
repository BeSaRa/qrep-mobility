import 'dart:async';
import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
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
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui' as ui;

import '../../../resources/language_manager.dart';
import '../widgets/faq_list_widget.dart';
import '../widgets/hold_message_widget.dart';
import '../widgets/mini_screen_widget.dart';

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

  late final AnimationController _circularMenuController;
  final ValueNotifier<bool> isOpen = ValueNotifier(false);
  final ValueNotifier<bool> showHoldMessage = ValueNotifier(false);
  Timer? holdMessageTimer;

  void showHoldHint() {
    if (!context.read<VoiceCubit>().state.isListening) {
      showHoldMessage.value = true;
      Future.delayed(const Duration(seconds: 2), () {
        showHoldMessage.value = false;
      });
    }
  }

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
      body: Stack(
        children: [
          //Avatar edges background color
          ValueListenableBuilder<bool>(
              valueListenable: isAvatarExpanded,
              builder: (context, expanded, child) {
                return expanded
                    ? Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xffD8DAD9),
                                Color(0xffD8DAD9),
                                Color(0xffA8ABB2),
                                Color(0xffA8ABB2),
                                Color(0xff7E7E86),
                              ]),
                          // color: Color(0xffD8DAD9),
                        ),
                      )
                    : const SizedBox.shrink();
              }),

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

                                        isAvatarExpanded.value = false;
                                        //here i close the webRTCCubit after closing done success to avoid leak in memory
                                        //I add this because:
                                        //1-  when timer is done from back-end so this i hundle in IF
                                        //2- when i open the stream but i have a faild peer connection, so this i hundle in ELSE
                                        if (webRtcState.elapsedTime > 60) {
                                          errorToast(
                                              AppStrings().avatarSessionExpired,
                                              context);
                                        } else {
                                          errorToast(
                                              AppStrings().somethingWentWrong,
                                              context);
                                        }
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
                                          context.read<StartStreamBloc>().add(
                                              const StartStreamEvent
                                                  .clearState());
                                          //I close the avatar and dispose the camera renderer
                                          if (webRTCCubit != null) {
                                            webRTCCubit!.closeStreamCubit();
                                            webRTCCubit!.close();
                                            webRTCCubit == null;
                                          }
                                          BlocProvider.of<StreamIdCubit>(
                                                  context)
                                              .clearStreamId();
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
                              sendState.maybeMap(
                                loading: (value) => const SizedBox.shrink(),
                                orElse: () {
                                  return FAQListWidget(
                                      scrollController: scrollController);
                                },
                              ),
                              BlocBuilder<VoiceCubit, VoiceState>(
                                  builder: (context, voiceState) {
                                return ValueListenableBuilder<bool>(
                                    valueListenable: isRecordMode,
                                    builder:
                                        (context, isRecordModeEnabled, child) {
                                      return Padding(
                                        padding: EdgeInsets.all(AppSizeW.s8),
                                        child: Column(
                                          crossAxisAlignment:
                                              context.locale == ARABIC_LOCAL
                                                  ? CrossAxisAlignment.end
                                                  : CrossAxisAlignment.start,
                                          children: [
                                            HoldMessageWidget(
                                                showHoldMessage:
                                                    showHoldMessage),
                                            Row(
                                              //
                                              mainAxisAlignment:
                                                  !isRecordModeEnabled
                                                      ? MainAxisAlignment.start
                                                      : MainAxisAlignment
                                                          .spaceEvenly,

                                              textDirection:
                                                  ui.TextDirection.ltr,
                                              children: <Widget>[
                                                /*========================For Ai Avatar========================= */
                                                voiceState.isListening &&
                                                        isAvatarPressed
                                                    ? SizedBox(
                                                        width: AppSizeW.s40,
                                                        height: AppSizeH.s40,
                                                        child: Lottie.asset(
                                                          ImageAssets
                                                              .chatBotRecordingIndecetor,
                                                          delegates:
                                                              LottieDelegates(
                                                            values: [
                                                              ValueDelegate
                                                                  .color(
                                                                const ['**'],
                                                                value:
                                                                    ColorManager
                                                                        .primary,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    : AiAvatarIconWidget(
                                                        isRecordModeActive:
                                                            isRecordMode,
                                                        // startAvatarTimer:
                                                        //     startOrResetAvatarTimer,
                                                        onWebRTCCubitCreated:
                                                            (WebRTCCubit?
                                                                newCubit) async {
                                                          //I close the avatar and dispose the camera renderer
                                                          if (newCubit ==
                                                                  null &&
                                                              webRTCCubit !=
                                                                  null) {
                                                            await webRTCCubit!
                                                                .closeStreamCubit();
                                                            await webRTCCubit!
                                                                .close();
                                                            webRTCCubit == null;
                                                          } else {
                                                            //I Start the avatar
                                                            webRTCCubit =
                                                                newCubit;
                                                          }
                                                        },
                                                        isAvatarExpanded:
                                                            isAvatarExpanded,
                                                      ),
                                                SizedBox(
                                                  width: AppSizeW.s5,
                                                ),
                                                /*========================For record========================= */
                                                // hhere make widget
                                                BlocConsumer<VoiceCubit,
                                                        VoiceState>(
                                                    listener:
                                                        (context, voiceState) {
                                                      if (!voiceState
                                                              .isListening &&
                                                          voiceState.text
                                                              .isNotEmpty &&
                                                          isAvatarPressed) {
                                                        showHoldMessage.value =
                                                            false; // Add this line
                                                      }
                                                      //------------------- send message via record-------------------\
                                                      final message =
                                                          voiceState.text;
                                                      if (!voiceState
                                                              .isListening &&
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
                                                              curve: Curves
                                                                  .easeOut,
                                                            );
                                                          }
                                                        });

                                                        //--------------
                                                        final chatState = context
                                                            .read<
                                                                ChatHistoryCubit>()
                                                            .state;
                                                        final userMessage =
                                                            MessageRequestModel(
                                                                content:
                                                                    message,
                                                                role: 'user');
                                                        context
                                                            .read<
                                                                ChatHistoryCubit>()
                                                            .addMessage(
                                                                userMessage);
                                                        if (chatState
                                                                    .activeChat ==
                                                                ChatTypeEnum
                                                                    .authority &&
                                                            webRTCCubit !=
                                                                null) {
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
                                                    bloc: BlocProvider.of<
                                                        VoiceCubit>(context),
                                                    builder:
                                                        (context, voiceState) {
                                                      return GestureDetector(
                                                        onLongPressStart:
                                                            isAvatarPressed
                                                                ? (_) async {
                                                                    final can =
                                                                        await Haptics
                                                                            .canVibrate();
                                                                    if (!can)
                                                                      return;
                                                                    await Haptics.vibrate(
                                                                        HapticsType
                                                                            .heavy);
                                                                    // _wasLongPressed =
                                                                    //     true;
                                                                    // Start recording when pressed
                                                                    context
                                                                        .read<
                                                                            VoiceCubit>()
                                                                        .checkAndRequestPermissionToStart();
                                                                  }
                                                                : null,
                                                        onLongPressEnd:
                                                            isAvatarPressed
                                                                ? (_) {
                                                                    // Stop recording and send when released
                                                                    context
                                                                        .read<
                                                                            VoiceCubit>()
                                                                        .stopListening();
                                                                    showHoldMessage
                                                                            .value =
                                                                        false;
                                                                  }
                                                                : null,
                                                        onTap: isAvatarPressed
                                                            ? () {
                                                                showHoldHint();
                                                              }
                                                            : () async {
                                                                final can =
                                                                    await Haptics
                                                                        .canVibrate();
                                                                if (!can)
                                                                  return;
                                                                await Haptics.vibrate(
                                                                    HapticsType
                                                                        .heavy);
                                                                if (voiceState
                                                                    .isListening) {
                                                                  context
                                                                      .read<
                                                                          VoiceCubit>()
                                                                      .stopListening();
                                                                } else {
                                                                  context
                                                                      .read<
                                                                          VoiceCubit>()
                                                                      .checkAndRequestPermissionToStart();
                                                                  // .startListening();
                                                                }
                                                              },
                                                        child: isAvatarPressed
                                                            ? isRecordModeEnabled
                                                                ? AnimatedContainer(
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            200),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                            boxShadow: [
                                                                          BoxShadow(
                                                                            blurStyle:
                                                                                BlurStyle.outer,
                                                                            color:
                                                                                ColorManager.primary.withValues(alpha: .7),
                                                                            blurRadius:
                                                                                30,
                                                                            spreadRadius:
                                                                                1,
                                                                          ),
                                                                        ],
                                                                            gradient:
                                                                                LinearGradient(
                                                                              colors: [
                                                                                ColorManager.primary,
                                                                                ColorManager.primary.withValues(alpha: .7),
                                                                              ],
                                                                              begin: Alignment.topLeft,
                                                                              end: Alignment.bottomRight,
                                                                            ),
                                                                            color: voiceState.isListening
                                                                                ? ColorManager.primary.withValues(
                                                                                    alpha:
                                                                                        0.3)
                                                                                : Theme.of(context)
                                                                                    .primaryColor,
                                                                            borderRadius: BorderRadius.circular(AppSizeR
                                                                                .s100)),
                                                                    height:
                                                                        AppSizeH
                                                                            .s60,
                                                                    width: AppSizeH
                                                                        .s120,
                                                                    child: Icon(
                                                                      Icons
                                                                          .mic_none,
                                                                      color: ColorManager
                                                                          .white,
                                                                    ))
                                                                : const SizedBox
                                                                    .shrink()
                                                            :
                                                            //we will see this widget when the avatar is not enabled
                                                            voiceState
                                                                    .isListening
                                                                ? SizedBox(
                                                                    height:
                                                                        AppSizeH
                                                                            .s40,
                                                                    width: AppSizeH
                                                                        .s40,
                                                                    child: Lottie.asset(
                                                                        ImageAssets.chatBotRecordingIndecetor))
                                                                : const Icon(Icons.mic_none),
                                                      );
                                                    }),

                                                SizedBox(
                                                  width: isRecordModeEnabled
                                                      ? AppSizeW.s0
                                                      : AppSizeW.s5,
                                                ),
                                                if (isAvatarPressed)
                                                  GestureDetector(
                                                    onTap: () {
                                                      isRecordMode.value =
                                                          !isRecordMode.value;
                                                    },
                                                    child: ValueListenableBuilder<
                                                            bool>(
                                                        valueListenable:
                                                            isRecordMode,
                                                        builder: (context,
                                                            isRecordModeEnabled,
                                                            child) {
                                                          return Container(
                                                            width: AppSizeW.s40,
                                                            height:
                                                                AppSizeH.s40,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        AppSizeR
                                                                            .s5),
                                                                color: ColorManager
                                                                    .lightSilver
                                                                    .withValues(
                                                                        alpha:
                                                                            .3)),
                                                            child: isRecordModeEnabled
                                                                ? const Icon(Icons
                                                                    .keyboard)
                                                                : const Icon(Icons
                                                                    .mic_none),
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
                                                    child:
                                                        BlocBuilder<VoiceCubit,
                                                                VoiceState>(
                                                            bloc: BlocProvider
                                                                .of<VoiceCubit>(
                                                                    context),
                                                            builder: (context,
                                                                voiceState) {
                                                              WidgetsBinding
                                                                  .instance
                                                                  .addPostFrameCallback(
                                                                      (_) {
                                                                if (_controller
                                                                        .text !=
                                                                    voiceState
                                                                        .text) {
                                                                  _controller
                                                                          .text =
                                                                      voiceState
                                                                          .text;
                                                                }
                                                              });

                                                              return ReraTextFaild(
                                                                onChange:
                                                                    (p0) {},
                                                                controller:
                                                                    _controller,
                                                                readOnly: false,
                                                                enabled: true,
                                                                suffixIcon:
                                                                    GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          //--------------
                                                                          final chatState = context
                                                                              .read<ChatHistoryCubit>()
                                                                              .state;
                                                                          //-------------------- authority clear button ------------------------
                                                                          if (chatState.activeChat ==
                                                                              ChatTypeEnum.authority) {
                                                                            chatState.authorityMessages.clear();
                                                                            context.read<ChatHistoryCubit>().addMessage(MessageRequestModel(
                                                                                  role: 'assistant',
                                                                                  content: AppStrings().defaultAuthorityBotMessage,
                                                                                ));
                                                                          }
                                                                          //-------------------- Platform clear button ------------------------
                                                                          else {
                                                                            chatState.platformMessages.clear();
                                                                            context.read<ChatHistoryCubit>().addMessage(MessageRequestModel(
                                                                                  role: 'assistant',
                                                                                  content: AppStrings().defaultPlatformBotMessage,
                                                                                ));
                                                                          }
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .refresh_rounded,
                                                                          color:
                                                                              Theme.of(context).primaryColor,
                                                                        )),
                                                                hint: AppStrings()
                                                                    .writeUourMessage,
                                                              );
                                                            }),
                                                  ),
                                                /*======================== Send button ========================= */

                                                /*========================TextFaild button if avatar pressed ========================= */

                                                if (!isRecordModeEnabled ||
                                                    !isAvatarPressed)
                                                  BlocProvider<
                                                      WebRTCCubit>.value(
                                                    value: webRTCCubit ??
                                                        WebRTCCubit(),
                                                    child:
                                                        ValueListenableBuilder<
                                                                bool>(
                                                            valueListenable:
                                                                isSendEnabled,
                                                            builder: (context,
                                                                enabled,
                                                                child) {
                                                              return SendButtonWidget(
                                                                isAvatarShown:
                                                                    isAvatarPressed,
                                                                scrollController:
                                                                    scrollController,
                                                                enabled:
                                                                    enabled,
                                                                controller:
                                                                    _controller,
                                                              );
                                                            }),
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    });
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
                            ],
                          );
                        }),
                  ),
                );
              }),
//========================== Start Menu Button  ============================================
          // DropDownMenuButtonWidget(
          //   isAvatarExpanded: isAvatarExpanded,
          //   scrollController: scrollController,
          // ),
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
          Positioned(
            top: AppSizeH.s10,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizeW.s5),
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
                                    // mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // _buildAnimatedItem(
                                      //   delay: 200,
                                      //   child: open
                                      //       ? _buildActionButton(
                                      //           icon: state.isPlaying
                                      //               ? Icons.pause
                                      //               : Icons.play_arrow,
                                      //           onTap: () => webRTCCubit!
                                      //               .togglePlayPause(),
                                      //         )
                                      //       : const SizedBox.shrink(),
                                      // ),
                                      FloatingActionButton.small(
                                        heroTag: "toggleMenu",
                                        backgroundColor: ColorManager.primary,
                                        child: Icon(
                                          open ? Icons.close : Icons.more_vert,
                                          color: Colors.white,
                                        ),
                                        onPressed: () =>
                                            isOpen.value = !isOpen.value,
                                      ),
                                      Opacity(
                                        opacity: open ? 1 : 0,
                                        child: _buildAnimatedItem(
                                            delay: 0,
                                            child:
                                                //  open
                                                //     ?
                                                _buildActionButton(
                                                    icon: state.isMiniScreen
                                                        ? Icons.fullscreen
                                                        : Icons
                                                            .fit_screen_sharp,
                                                    onTap: () {
                                                      if (open) {
                                                        setState(() {
                                                          webRTCCubit!
                                                              .toggleMiniScreen();
                                                        });
                                                      }
                                                    })
                                            // : const SizedBox.shrink(),
                                            ),
                                      ),
                                      Opacity(
                                        opacity: open ? 1 : 0,
                                        child: _buildAnimatedItem(
                                            delay: 100,
                                            child:
                                                // open
                                                //     ?
                                                _buildActionButton(
                                                    icon: state.isMuted
                                                        ? Icons.volume_off
                                                        : Icons.volume_up,
                                                    onTap: () {
                                                      if (open) {
                                                        webRTCCubit!
                                                            .toggleMute();
                                                      }
                                                    })
                                            // : const SizedBox.shrink(),
                                            ),
                                      ),
                                      // SizedBox(
                                      //   height: AppSizeH.s120,
                                      // )
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

          // ValueListenableBuilder<bool>(
          //     valueListenable: isAvatarExpanded,
          //     builder: (context, expanded, child) {
          //       if (webRTCCubit != null && expanded) {
          //         return BlocBuilder<WebRTCCubit, WebRTCState>(
          //             bloc: webRTCCubit,
          //             builder: (context, state) {
          //               // Convert elapsedTime into mm:ss format
          //               String formattedTime = _formatTime(state.elapsedTime);
          //               return state.isMiniScreen
          //                   ? const SizedBox.shrink()
          //                   : Container(
          //                       padding: EdgeInsets.all(AppSizeW.s8),
          //                       margin: EdgeInsets.all(AppSizeW.s8),
          //                       decoration: BoxDecoration(
          //                           color: Theme.of(context).cardColor,
          //                           borderRadius:
          //                               BorderRadius.circular(AppSizeR.s5)),
          //                       child: Text(formattedTime,
          //                           style: Theme.of(context)
          //                               .textTheme
          //                               .displaySmall),
          //                     );
          //             });
          //       } else {
          //         return const SizedBox.shrink();
          //       }
          //     }),
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
