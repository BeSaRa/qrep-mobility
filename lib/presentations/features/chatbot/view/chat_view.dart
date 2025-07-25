import 'dart:async';
import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/domain/models/chatboot/new_chatbot_response_models/new_chatbot_response_model.dart';
import 'package:ebla/domain/models/requests/chatbot_requests/chatbot_request_model.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/send_answer_usecase.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/send_candidate_usecase.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/start_stream_usecase.dart';
import 'package:ebla/presentations/features/chatbot/blocs/close_stream/close_stream_bloc.dart';
import 'package:ebla/presentations/features/chatbot/blocs/drobdown_cubit.dart';
import 'package:ebla/presentations/features/chatbot/blocs/messages_history_bloc/chat_history_cubit.dart';
import 'package:ebla/presentations/features/chatbot/blocs/record_cubit/voice_cubit.dart';
import 'package:ebla/presentations/features/chatbot/blocs/send_feedback_bloc/send_feedback_bloc.dart';
import 'package:ebla/presentations/features/chatbot/blocs/send_message_bloc/chat_bloc.dart';
import 'package:ebla/presentations/features/chatbot/blocs/stop_render/stop_render_bloc.dart';
import 'package:ebla/presentations/features/chatbot/blocs/stream_bloc/stream_bloc.dart';
import 'package:ebla/presentations/features/chatbot/blocs/stream_bloc/stream_state.dart';
import 'package:ebla/presentations/features/chatbot/blocs/stream_id_cubit.dart/stream_id_cubit.dart';
import 'package:ebla/presentations/features/chatbot/utility/chatbot_enums.dart';
import 'package:ebla/presentations/features/chatbot/widgets/ai_avatar_icon_widget.dart';
import 'package:ebla/presentations/features/chatbot/widgets/chat_messages_list_widget.dart';
import 'package:ebla/presentations/features/chatbot/widgets/check_box_widget.dart';
import 'package:ebla/presentations/features/chatbot/widgets/rera_text_faild.dart';
import 'package:ebla/presentations/features/chatbot/widgets/send_button_widget.dart';
import 'package:ebla/presentations/features/chatbot/view/stream_page.dart';
import 'package:ebla/presentations/features/main/cubit/bottom_nav_cubit.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:ebla/presentations/widgets/animated_pulse_logo.dart';
import 'package:ebla/presentations/widgets/taost_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui' as ui;

import '../../../resources/language_manager.dart';
import '../widgets/faq_list_widget.dart';
import '../widgets/hold_message_widget.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  final TextEditingController _controller = TextEditingController();
  late ChatBotBloc chatBotBloc;
  late CloseStreamBloc closeStreamBloc;
  late StopRenderBloc stopRenderBloc;
  late StreamIdCubit streamIdCubit;
  final ValueNotifier<bool> isSendEnabled = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isAvatarExpanded = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _isPDFFileLoadingForSAS =
      ValueNotifier<bool>(false);
  final ValueNotifier<bool> isStreamFullReady = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isRecordMode = ValueNotifier<bool>(true);
  //for Stop Speak button
  final ValueNotifier<bool> isAvatarSpeaking = ValueNotifier(false);
  bool isMessageSending = false;
  final ScrollController scrollController = ScrollController();
  final ValueNotifier<bool> showScrollDownButton = ValueNotifier(false);
  final ValueNotifier<bool> isOpen = ValueNotifier(false);
  final ValueNotifier<bool> showHoldMessage = ValueNotifier(false);
  Timer? holdMessageTimer;
  /*================ timer for close stream when App in foreground ================*/
  DateTime? _lastPausedTime;
  Timer? _resumeTimer;
/*================ timer for close stream after ================*/

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
    WidgetsBinding.instance.addObserver(this);
    chatBotBloc = instance<ChatBotBloc>();
    closeStreamBloc = instance<CloseStreamBloc>();
    stopRenderBloc = instance<StopRenderBloc>();
    streamIdCubit = instance<StreamIdCubit>();
    _controller.addListener(() {
      isSendEnabled.value = _controller.text.trim().isNotEmpty;
    });

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
    streamIdCubit.close();
    _resumeTimer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.paused) {
      // App went to background
      _lastPausedTime = DateTime.now();
    } else if (state == AppLifecycleState.resumed) {
      // App came back to foreground
      if (_lastPausedTime != null) {
        final duration = DateTime.now().difference(_lastPausedTime!);
        if (duration.inSeconds >= 106) {
          // 1.8 minutes = 108 seconds
          if (mounted) {
            context.read<BottomNavCubit>().changePage(0);
            context.goNamed(context.read<BottomNavCubit>().paths[0]);
          }
        }
      }
    }
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
                        ? MultiBlocProvider(
                            providers: [
                                BlocProvider.value(
                                  value: streamIdCubit,
                                ),
                                BlocProvider.value(
                                  value: closeStreamBloc,
                                ),
                                BlocProvider(
                                  create: (context) => StreamBloc(
                                    startStreamUsecase:
                                        instance<StartStreamUsecase>(),
                                    sendAnswerUsecase:
                                        instance<SendAnswerUsecase>(),
                                    sendCandidateUsecase:
                                        instance<SendCandidateUsecase>(),
                                  ),
                                )
                              ],
                            child: BlocListener<StreamBloc, StreamState>(
                              listener: (context, testStreamState) {
                                if (testStreamState is StreamStarted) {
                                  //=========== to show tha avatar in the UI with Record Mode =============
                                  isAvatarExpanded.value = true;
                                }
                                if (testStreamState is StreamError) {
                                  isAvatarExpanded.value = false;
                                }
                              },
                              child: StreamPage(
                                  isAvatarSpeaking: isAvatarSpeaking,
                                  isAvatarExpanded: isAvatarExpanded,
                                  isStreamFullReady: isStreamFullReady),
                            ))
                        : const SizedBox.shrink());
              }),
          ValueListenableBuilder<bool>(
              valueListenable: isStreamFullReady,
              builder: (context, isStreamFullReadyValue, child) {
                return ValueListenableBuilder<bool>(
                    valueListenable: isAvatarExpanded,
                    builder: (context, isAvatarPressed, child) {
                      return Positioned(
                        bottom: !isAvatarPressed ? null : 0,
                        left: !isAvatarPressed ? null : 0,
                        right: !isAvatarPressed ? null : 0,
                        child: MultiBlocProvider(
                          providers: [
                            BlocProvider<ChatHistoryCubit>.value(
                                value:
                                    BlocProvider.of<ChatHistoryCubit>(context)),
                            BlocProvider.value(value: chatBotBloc),
                            BlocProvider.value(value: closeStreamBloc),
                            BlocProvider.value(value: stopRenderBloc),
                            BlocProvider.value(
                                value: BlocProvider.of<VoiceCubit>(context)),
                            BlocProvider.value(
                                value: BlocProvider.of<DropdownCubit>(context)),
                            BlocProvider.value(value: streamIdCubit),
                            // BlocProvider.value(
                            //     value: sendAnswerAndCandidateBloc),
                            BlocProvider<SendFeedbackBloc>.value(
                                value:
                                    BlocProvider.of<SendFeedbackBloc>(context)),
                            BlocProvider(
                              create: (context) => StreamBloc(
                                startStreamUsecase:
                                    instance<StartStreamUsecase>(),
                                sendAnswerUsecase:
                                    instance<SendAnswerUsecase>(),
                                sendCandidateUsecase:
                                    instance<SendCandidateUsecase>(),
                              ),
                            )
                          ],
                          child: BlocConsumer<ChatBotBloc, ChatBotState>(
                              listener: (context, sendState) {
                                sendState.map(
                                  initial: (val) {},
                                  loading: (val) {
                                    isMessageSending = true;
                                  },
                                  streaming: (value) {
                                    final messages = context
                                        .read<ChatHistoryCubit>()
                                        .state
                                        .authorityMessages;

                                    // If this is the first streaming event, add a new message
                                    if (messages.isEmpty ||
                                        messages.last.role != 'assistant') {
                                      context
                                          .read<ChatHistoryCubit>()
                                          .addMessage(
                                            MessageRequestModel(
                                              role: 'assistant',
                                              content: NewChatbotResponseModel(
                                                event: 'streaming',
                                                data: DataResponseModel(
                                                  content:
                                                      value.accumulatedContent,
                                                  citations: value.citations,
                                                  conversationId:
                                                      value.conversationId,
                                                  streamId: value.streamId,
                                                  userId: value.userId,
                                                  actionResults:
                                                      value.actionResults,
                                                ),
                                              ),
                                            ),
                                          );
                                    } else {
                                      final lastMessage = messages.last;
                                      final updatedMessage =
                                          lastMessage.copyWith(
                                        content: NewChatbotResponseModel(
                                          event: 'streaming',
                                          data: DataResponseModel(
                                            content: value.accumulatedContent,
                                            citations: value.citations,
                                            conversationId:
                                                value.conversationId,
                                            streamId: value.streamId,
                                            userId: value.userId,
                                            actionResults: value.actionResults,
                                          ),
                                        ),
                                      );
                                      context
                                          .read<ChatHistoryCubit>()
                                          .updateLastMessage(updatedMessage);
                                    }
                                  },
                                  done: (val) {
                                    if (val.response != null) {
                                      final messages = context
                                          .read<ChatHistoryCubit>()
                                          .state
                                          .authorityMessages;

                                      if (messages.isNotEmpty &&
                                          messages.last.role == 'assistant') {
                                        final lastMessage = messages.last;
                                        final updatedMessage =
                                            lastMessage.copyWith(
                                                content: val.response!,
                                                authorityConvId: val.response!
                                                    .data.conversationId);
                                        context
                                            .read<ChatHistoryCubit>()
                                            .updateLastMessage(updatedMessage);
                                      }
                                    } else {
                                      // Handle platform response
                                      context
                                          .read<ChatHistoryCubit>()
                                          .addMessage(
                                            MessageRequestModel(
                                              role: 'assistant',
                                              content: val.platformResponse,
                                            ),
                                          );
                                    }
                                    isMessageSending = false;
                                  },
                                  error: (val) {
                                    if (mounted) {
                                      errorToast(
                                          AppStrings().defaultError, context);
                                    }
                                    isMessageSending = false;
                                  },
                                );
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
                                            isPDFFileLoadingForSAS:
                                                _isPDFFileLoadingForSAS,
                                            scrollController: scrollController,
                                            isSending: isMessageSending,
                                            isAvatarPressed: isAvatarPressed,
                                          ),
                                          Positioned(
                                            bottom: AppSizeH.s0,
                                            right: AppSizeW.s15,
                                            child: ValueListenableBuilder<bool>(
                                              valueListenable:
                                                  showScrollDownButton,
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
                                                              scrollController
                                                                  .animateTo(
                                                                scrollController
                                                                        .position
                                                                        .maxScrollExtent +
                                                                    AppSizeH
                                                                        .s30,
                                                                duration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            300),
                                                                curve: Curves
                                                                    .easeOut,
                                                              );
                                                              // });
                                                            }
                                                          },
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    AppSizeW
                                                                        .s5),
                                                            decoration:
                                                                BoxDecoration(
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
                                                                  ColorManager
                                                                      .white,
                                                            ),
                                                          ),
                                                        )
                                                      : const SizedBox.shrink(
                                                          key: ValueKey(
                                                              'hidden')),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      )),

                                    //===================================
                                    if (isAvatarPressed &&
                                        isStreamFullReadyValue)
                                      SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                .2,
                                        child: ChatMessagesListWidget(
                                          isPDFFileLoadingForSAS:
                                              _isPDFFileLoadingForSAS,
                                          scrollController: scrollController,
                                          isSending: isMessageSending,
                                          isAvatarPressed: isAvatarPressed,
                                        ),
                                      ),
//=================================== START FAQ ======================================
                                    ValueListenableBuilder<bool>(
                                        valueListenable: isAvatarSpeaking,
                                        builder: (context, isAvatarSpeakingVal,
                                            child) {
                                          return sendState.maybeMap(
                                            loading: (value) =>
                                                const SizedBox.shrink(),
                                            orElse: () {
                                              if ((isAvatarPressed &&
                                                      isStreamFullReadyValue &&
                                                      !isAvatarSpeakingVal) ||
                                                  !isAvatarPressed) {
                                                return FAQListWidget(
                                                    scrollController:
                                                        scrollController);
                                              } else {
                                                return const SizedBox.shrink();
                                              }
                                            },
                                          );
                                        }),
//=================================== END FAQ ======================================

                                    BlocBuilder<VoiceCubit, VoiceState>(
                                        builder: (context, voiceState) {
                                      return ValueListenableBuilder<bool>(
                                          valueListenable: isRecordMode,
                                          builder: (context,
                                              isRecordModeEnabled, child) {
                                            return Padding(
                                              padding:
                                                  EdgeInsets.all(AppSizeW.s8),
                                              child: Column(
                                                crossAxisAlignment: context
                                                            .locale ==
                                                        ARABIC_LOCAL
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
                                                            ? MainAxisAlignment
                                                                .start
                                                            : MainAxisAlignment
                                                                .spaceEvenly,

                                                    textDirection:
                                                        ui.TextDirection.ltr,
                                                    children: <Widget>[
                                                      /*========================For Ai Avatar========================= */

                                                      voiceState.isListening &&
                                                              isAvatarPressed
                                                          ? SizedBox(
                                                              width:
                                                                  AppSizeW.s40,
                                                              height:
                                                                  AppSizeH.s40,
                                                              child:
                                                                  Lottie.asset(
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
                                                                      value: ColorManager
                                                                          .primary,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          : AiAvatarIconWidget(
                                                              isAvatarSpeaking:
                                                                  isAvatarSpeaking,
                                                              isRecordModeActive:
                                                                  isRecordMode,
                                                              isAvatarExpanded:
                                                                  isAvatarExpanded,
                                                            ),
                                                      SizedBox(
                                                        width: AppSizeW.s5,
                                                      ),
                                                      /*========================For record========================= */
                                                      BlocConsumer<VoiceCubit,
                                                              VoiceState>(
                                                          listener: (context,
                                                              voiceState) {
                                                            if (!voiceState
                                                                    .isListening &&
                                                                voiceState.text
                                                                    .isNotEmpty &&
                                                                isAvatarPressed) {
                                                              showHoldMessage
                                                                      .value =
                                                                  false;
                                                            }
                                                            //------------------- send message via record-------------------
                                                            final message =
                                                                voiceState.text;
                                                            if (!voiceState
                                                                    .isListening &&
                                                                message
                                                                    .isNotEmpty &&
                                                                isAvatarPressed) {
                                                              //--------------
                                                              //to make the data shown dirctly when message send
                                                              WidgetsBinding
                                                                  .instance
                                                                  .addPostFrameCallback(
                                                                      (_) {
                                                                if (scrollController
                                                                    .hasClients) {
                                                                  scrollController
                                                                      .animateTo(
                                                                    scrollController
                                                                            .position
                                                                            .maxScrollExtent +
                                                                        AppSizeH
                                                                            .s30,
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            300),
                                                                    curve: Curves
                                                                        .easeOut,
                                                                  );
                                                                }
                                                              });

                                                              //--------------
                                                              final chatState =
                                                                  context
                                                                      .read<
                                                                          ChatHistoryCubit>()
                                                                      .state;
                                                              final userMessage =
                                                                  MessageRequestModel(
                                                                      content:
                                                                          message,
                                                                      role:
                                                                          'user');
                                                              context
                                                                  .read<
                                                                      ChatHistoryCubit>()
                                                                  .addMessage(
                                                                      userMessage);
                                                              if (chatState
                                                                      .activeChat ==
                                                                  ChatTypeEnum
                                                                      .authority) {
                                                                // Send the user's message as a ChatMessage instance
                                                                chatBotBloc.add(SendMessageEvent.started(ChatbotRequestModel(
                                                                    streamId: streamIdCubit
                                                                        .state
                                                                        .streamId,
                                                                    messages: context
                                                                        .read<
                                                                            ChatHistoryCubit>()
                                                                        .state
                                                                        .authorityMessages)));
                                                              }
                                                              _controller
                                                                  .clear();
                                                              context
                                                                  .read<
                                                                      VoiceCubit>()
                                                                  .clearText();
                                                            }
                                                            //---------------------------------------------------------------
                                                          },
                                                          bloc: BlocProvider.of<
                                                                  VoiceCubit>(
                                                              context),
                                                          builder: (context,
                                                              voiceState) {
                                                            return ValueListenableBuilder<
                                                                    bool>(
                                                                valueListenable:
                                                                    isAvatarSpeaking,
                                                                builder: (context,
                                                                    isAvatarSpeakingVal,
                                                                    child) {
                                                                  return GestureDetector(
                                                                    onLongPressStart: isAvatarPressed &&
                                                                            isStreamFullReadyValue
                                                                        ? (_) async {
                                                                            if (isAvatarSpeakingVal) {
                                                                              //don't do anything
                                                                            } else {
                                                                              final can = await Haptics.canVibrate();
                                                                              if (!can) {
                                                                                return;
                                                                              }
                                                                              await Haptics.vibrate(HapticsType.heavy);
                                                                              context.read<VoiceCubit>().checkAndRequestPermissionToStart(context);
                                                                            }
                                                                          }
                                                                        : null,
                                                                    onLongPressEnd: isAvatarPressed &&
                                                                            isStreamFullReadyValue
                                                                        ? (_) async {
                                                                            if (isAvatarSpeakingVal) {
                                                                              //don't do anything
                                                                            } else {
                                                                              try {
                                                                                await context.read<VoiceCubit>().stopListening();
                                                                              } catch (e) {
                                                                                log("⚠️ Error during audio release sequence: $e");
                                                                              }
                                                                              showHoldMessage.value = false;
                                                                            }
                                                                          }
                                                                        : null,
                                                                    onTap: isAvatarPressed
                                                                        ? isStreamFullReadyValue
                                                                            ? () {
                                                                                if (isAvatarSpeakingVal) {
                                                                                  if (streamIdCubit.state.streamId != null) {
                                                                                    stopRenderBloc.add(StopRenderEvent.stopRender(streamIdCubit.state.streamId!));
                                                                                  }
                                                                                } else {
                                                                                  showHoldHint();
                                                                                }
                                                                              }
                                                                            : null
                                                                        : () async {
                                                                            final can =
                                                                                await Haptics.canVibrate();
                                                                            if (!can) {
                                                                              return;
                                                                            }
                                                                            await Haptics.vibrate(HapticsType.heavy);
                                                                            if (voiceState.isListening) {
                                                                              context.read<VoiceCubit>().stopListening();
                                                                            } else {
                                                                              context.read<VoiceCubit>().checkAndRequestPermissionToStart(context);
                                                                            }
                                                                          },
                                                                    child: isAvatarPressed
                                                                        ? isRecordModeEnabled
                                                                            ? BlocConsumer<StopRenderBloc, StopRenderState>(listener: (context, stopState) {
                                                                                stopState.mapOrNull(
                                                                                  error: (value) {
                                                                                    errorToast(value.message, context);
                                                                                  },
                                                                                  done: (value) {
                                                                                    isAvatarSpeaking.value = false;
                                                                                    successToast(value.response.message, context);
                                                                                  },
                                                                                );
                                                                              }, builder: (context, stopState) {
                                                                                return AnimatedContainer(
                                                                                    duration: const Duration(milliseconds: 200),
                                                                                    decoration: BoxDecoration(
                                                                                        boxShadow: [
                                                                                          BoxShadow(
                                                                                            blurStyle: BlurStyle.outer,
                                                                                            color: ColorManager.primary.withValues(alpha: .7),
                                                                                            blurRadius: 30,
                                                                                            spreadRadius: 1,
                                                                                          ),
                                                                                        ],
                                                                                        gradient: LinearGradient(
                                                                                          colors: [
                                                                                            isStreamFullReadyValue ? ColorManager.primary : ColorManager.primary.withValues(alpha: .5),
                                                                                            ColorManager.primary.withValues(alpha: isStreamFullReadyValue ? .7 : .2),
                                                                                          ],
                                                                                          begin: Alignment.topLeft,
                                                                                          end: Alignment.bottomRight,
                                                                                        ),
                                                                                        color: voiceState.isListening ? ColorManager.primary.withValues(alpha: 0.3) : Theme.of(context).primaryColor,
                                                                                        borderRadius: BorderRadius.circular(AppSizeR.s100)),
                                                                                    height: AppSizeH.s60,
                                                                                    width: isAvatarSpeakingVal ? AppSizeW.s60 : AppSizeW.s120,
                                                                                    child: stopState.maybeMap(
                                                                                        loading: (_) => const Center(
                                                                                              child: CircularProgressIndicator(
                                                                                                strokeWidth: 3,
                                                                                                color: Colors.white,
                                                                                              ),
                                                                                            ),
                                                                                        orElse: () => Icon(
                                                                                              isAvatarSpeakingVal ? Icons.stop : Icons.mic_none,
                                                                                              color: ColorManager.white,
                                                                                            )));
                                                                              })
                                                                            : const SizedBox.shrink()
                                                                        :
                                                                        //we will see this widget when the avatar is not enabled
                                                                        voiceState.isListening
                                                                            ? SizedBox(height: AppSizeH.s40, width: AppSizeH.s40, child: Lottie.asset(ImageAssets.chatBotRecordingIndecetor))
                                                                            : const Icon(Icons.mic_none),
                                                                  );
                                                                });
                                                          }),
                                                      SizedBox(
                                                        width:
                                                            isRecordModeEnabled
                                                                ? AppSizeW.s0
                                                                : AppSizeW.s5,
                                                      ),
                                                      if (isAvatarPressed)
                                                        GestureDetector(
                                                          onTap:
                                                              isStreamFullReadyValue
                                                                  ? () {
                                                                      isRecordMode
                                                                              .value =
                                                                          !isRecordMode
                                                                              .value;
                                                                    }
                                                                  : null,
                                                          child: ValueListenableBuilder<
                                                                  bool>(
                                                              valueListenable:
                                                                  isRecordMode,
                                                              builder: (context,
                                                                  isRecordModeEnabled,
                                                                  child) {
                                                                return Container(
                                                                  width:
                                                                      AppSizeW
                                                                          .s40,
                                                                  height:
                                                                      AppSizeH
                                                                          .s40,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(AppSizeR
                                                                              .s5),
                                                                      color: ColorManager
                                                                          .lightSilver
                                                                          .withValues(
                                                                              alpha: .3)),
                                                                  child: isRecordModeEnabled
                                                                      ? const Icon(
                                                                          Icons
                                                                              .keyboard)
                                                                      : const Icon(
                                                                          Icons
                                                                              .mic_none),
                                                                );
                                                              }),
                                                        ),
                                                      SizedBox(
                                                        width: isRecordModeEnabled
                                                            ? !isAvatarPressed
                                                                ? AppSizeW.s5
                                                                : AppSizeW.s0
                                                            : AppSizeW.s5,
                                                      ),
                                                      /*========================TextFaild========================= */
                                                      if (!isRecordModeEnabled ||
                                                          !isAvatarPressed)
                                                        Expanded(
                                                          child: BlocBuilder<
                                                                  VoiceCubit,
                                                                  VoiceState>(
                                                              bloc: BlocProvider
                                                                  .of<VoiceCubit>(
                                                                      context),
                                                              builder: (context,
                                                                  voiceBuilderState) {
                                                                WidgetsBinding
                                                                    .instance
                                                                    .addPostFrameCallback(
                                                                        (_) {
                                                                  if (_controller
                                                                          .text !=
                                                                      voiceBuilderState
                                                                          .text) {
                                                                    _controller
                                                                            .text =
                                                                        voiceBuilderState
                                                                            .text;
                                                                  }
                                                                });
                                                                return ReraTextFaild(
                                                                  onChange:
                                                                      (p0) {},
                                                                  controller:
                                                                      _controller,
                                                                  readOnly:
                                                                      false,
                                                                  enabled: true,
                                                                  suffixIcon:
                                                                      GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            //--------------
                                                                            final chatState =
                                                                                context.read<ChatHistoryCubit>().state;
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
                                                                            size:
                                                                                AppSizeW.s23,
                                                                            Icons.delete_outline_outlined,
                                                                            color: Theme.of(context).brightness == Brightness.dark
                                                                                ? ColorManager.white
                                                                                : Theme.of(context).primaryColor,
                                                                          )),
                                                                  hint: AppStrings()
                                                                      .writeUourMessage,
                                                                );
                                                              }),
                                                        ),
                                                      /*======================== Send button ========================= */
                                                      if (!isRecordModeEnabled ||
                                                          !isAvatarPressed)
                                                        ValueListenableBuilder<
                                                                bool>(
                                                            valueListenable:
                                                                isSendEnabled,
                                                            builder: (context,
                                                                enabled,
                                                                child) {
                                                              return ValueListenableBuilder<
                                                                      bool>(
                                                                  valueListenable:
                                                                      isAvatarSpeaking,
                                                                  builder: (context,
                                                                      isAvatarSpeakingVal,
                                                                      child) {
                                                                    return SendButtonWidget(
                                                                      isAvatarSpeaking:
                                                                          isAvatarSpeakingVal,
                                                                      scrollController:
                                                                          scrollController,
                                                                      enabled:
                                                                          enabled,
                                                                      controller:
                                                                          _controller,
                                                                    );
                                                                  });
                                                            }),
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
                                      child: Text(AppStrings().aiNote,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium),
                                      //  Row(

                                      //   children: [
                                      //     // Text("${AppStrings().note}: ",
                                      //     //     style: Theme.of(context)
                                      //     //         .textTheme
                                      //     //         .titleSmall),
                                      //     // Flexible(
                                      //     //   child: Text(AppStrings().aiNote,
                                      //     //       style: Theme.of(context)
                                      //     //           .textTheme
                                      //     //           .headlineMedium),
                                      //     // ),
                                      //   ],
                                      // ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      );
                    });
              }),
//========================== Start Menu Button  ============================================
          // DropDownMenuButtonWidget(
          //   isAvatarExpanded: isAvatarExpanded,
          //   scrollController: scrollController,
          // ),
//========================== End Menu Button  ==============================================
          ValueListenableBuilder<bool>(
              valueListenable: _isPDFFileLoadingForSAS,
              builder: (context, isPDFFileLoading, child) {
                return isPDFFileLoading
                    ? const AnimatedPulesLogo()
                    : const SizedBox.shrink();
              })
        ],
      ),
    );
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
