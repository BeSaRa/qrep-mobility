import 'dart:developer';
import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/domain/models/requests/chatbot_requests/chatbot_request_model.dart';
import 'package:ebla/presentations/features/chatbot/blocs/close_stream/close_stream_bloc.dart';
import 'package:ebla/presentations/features/chatbot/blocs/drobdown_cubit.dart';
import 'package:ebla/presentations/features/chatbot/blocs/messages_history_bloc/chat_history_cubit.dart';
import 'package:ebla/presentations/features/chatbot/blocs/record_cubit/voice_cubit.dart';
import 'package:ebla/presentations/features/chatbot/blocs/send_message_bloc/chat_bloc.dart';
import 'package:ebla/presentations/features/chatbot/blocs/start_stream_bloc/start_stream_bloc.dart';
import 'package:ebla/presentations/features/chatbot/utility/chatbot_enums.dart';
import 'package:ebla/presentations/features/chatbot/widgets/appbar_clipper.dart';
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
  final ValueNotifier<bool> isSendEnabled = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isAvatarExpanded = ValueNotifier(false);
  bool isSending = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    chatBotBloc = instance<ChatBotBloc>();
    startStreamBloc = instance<StartStreamBloc>();
    closeStreamBloc = instance<CloseStreamBloc>();
    _controller.addListener(() {
      isSendEnabled.value = _controller.text.trim().isNotEmpty;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.microtask(() {
        if (mounted) {
          context.read<VoiceCubit>().initializeSpeech();
          //to make the data shown dirctly when message send
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (_scrollController.hasClients) {
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            }
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    isSendEnabled.dispose();
    isAvatarExpanded.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: costumeChatAppBar(context, _scrollController),
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
                        ? BlocProvider.value(
                            value: startStreamBloc,
                            child: const AvatarStreamWidget())
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
                    ],
                    child: BlocConsumer<ChatBotBloc, ChatBotState>(
                        listener: (context, sendState) {
                          sendState.map(
                              initial: (val) {},
                              loading: (val) {
                                isSending = true;
                              },
                              done: (val) {
                                //----- if i'm in authority-----
                                if (val.response != null) {
                                  context
                                      .read<ChatHistoryCubit>()
                                      .addMessage(MessageRequestModel(
                                        role: 'assistant',
                                        content: val.response!.message.content,
                                      ));
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
                                isSending = false;
                              },
                              error: (val) {
                                if (mounted) {
                                  errorToast(
                                      AppStrings().defaultError, context);
                                }
                                isSending = false;
                              });
                        },
                        bloc: chatBotBloc,
                        builder: (context, sendState) {
                          return Column(
                            children: <Widget>[
                              if (isAvatarPressed)
                                SizedBox(
                                  height: AppSizeH.s310,
                                  child: ChatMessagesListWidget(
                                    scrollController: _scrollController,
                                    isSending: isSending,
                                    isAvatarPressed: isAvatarPressed,
                                  ),
                                ),
                              if (!isAvatarPressed)
                                Expanded(
                                    child: ChatMessagesListWidget(
                                  scrollController: _scrollController,
                                  isSending: isSending,
                                  isAvatarPressed: isAvatarPressed,
                                )),
                              Padding(
                                padding: EdgeInsets.all(AppSizeW.s8),
                                child: Row(
                                  textDirection: ui.TextDirection.ltr,
                                  children: <Widget>[
                                    /*========================For Ai Avatar========================= */

                                    // BlocBuilder<DropdownCubit, ChatTypeEnum>(
                                    //     bloc: BlocProvider.of<DropdownCubit>(
                                    //         context),
                                    //     builder: (context, selectedOption) {
                                    //       if (context
                                    //               .read<DropdownCubit>()
                                    //               .state ==
                                    //           ChatTypeEnum.authority) {
                                    //         return ValueListenableBuilder<bool>(
                                    //             valueListenable:
                                    //                 isAvatarExpanded,
                                    //             builder:
                                    //                 (context, expanded, child) {
                                    //               return BlocConsumer<
                                    //                       StartStreamBloc,
                                    //                       StartStreamState>(
                                    //                   bloc: startStreamBloc,
                                    //                   listener: (context,
                                    //                       avatarState) {},
                                    //                   builder: (context,
                                    //                       avatarState) {
                                    //                     return BlocConsumer<
                                    //                             CloseStreamBloc,
                                    //                             CloseStreamState>(
                                    //                         listener: (context,
                                    //                             closestate) {
                                    //                       closestate.mapOrNull(
                                    //                         error: (value) {
                                    //                           errorToast(
                                    //                               value.message,
                                    //                               context);
                                    //                         },
                                    //                         done: (value) {
                                    //                           isAvatarExpanded
                                    //                                   .value =
                                    //                               !isAvatarExpanded
                                    //                                   .value;
                                    //                         },
                                    //                       );
                                    //                     }, builder: (context,
                                    //                             closeState) {
                                    //                       return closeState
                                    //                           .maybeMap(
                                    //                               loading: (_) => SizedBox(
                                    //                                   width: AppSizeW
                                    //                                       .s40,
                                    //                                   height:
                                    //                                       AppSizeH
                                    //                                           .s40,
                                    //                                   child:
                                    //                                       const CircularProgressIndicator()),
                                    //                               orElse: () =>
                                    //                                   GestureDetector(
                                    //                                     onTap:
                                    //                                         () async {
                                    //                                       //here i start the stream
                                    //                                       // context.read<>().add(StartStream());
                                    //                                       // startStreamBloc.add( const StartStreamEvent.started());
                                    //                                       // Navigator.push(
                                    //                                       //   context,
                                    //                                       //   MaterialPageRoute(
                                    //                                       //       builder: (context) =>
                                    //                                       //           const StreamPage()),
                                    //                                       // );
                                    //                                       if (expanded) {
                                    //                                         // If the close icon is shown, perform logic for closing the AI assistant
                                    //                                         log("Close icon pressed - Perform close logic");
                                    //                                         if (context.read<StartStreamBloc>().state.startStreamResponse.data !=
                                    //                                             null) {
                                    //                                           context.read<CloseStreamBloc>().add(CloseStreamEvent.closeStream(
                                    //                                               //here i pass the streamID
                                    //                                               context.read<StartStreamBloc>().state.startStreamResponse.data!.id));
                                    //                                         }

                                    //                                         // startStreamBloc.add(const StopStreamEvent());
                                    //                                       } else {
                                    //                                         // If the avatar icon is shown, perform logic for opening the AI assistant
                                    //                                         log("Avatar icon pressed - Perform open logic");
                                    //                                         context.read<StartStreamBloc>().add(const StartStreamEvent.started());
                                    //                                         isAvatarExpanded.value =
                                    //                                             !isAvatarExpanded.value;
                                    //                                         // startStreamBloc.add(const StartStreamEvent.started());
                                    //                                       }
                                    //                                     },
                                    //                                     child:
                                    //                                         AnimatedRotation(
                                    //                                       turns: expanded
                                    //                                           ? 0.5
                                    //                                           : 0.0, // Rotate 180° when expanded, back when closed
                                    //                                       duration:
                                    //                                           const Duration(milliseconds: 300),
                                    //                                       child:
                                    //                                           Container(
                                    //                                         width:
                                    //                                             AppSizeW.s40,
                                    //                                         height:
                                    //                                             AppSizeH.s40,
                                    //                                         padding:
                                    //                                             EdgeInsets.symmetric(horizontal: AppSizeW.s5),
                                    //                                         decoration:
                                    //                                             BoxDecoration(
                                    //                                           border: Border(
                                    //                                             right: BorderSide(width: 1, color: Theme.of(context).hoverColor),
                                    //                                           ),
                                    //                                         ),
                                    //                                         child:
                                    //                                             AnimatedSwitcher(
                                    //                                           duration: Duration(milliseconds: 300),
                                    //                                           transitionBuilder: (child, animation) => ScaleTransition(
                                    //                                             scale: animation,
                                    //                                             child: child,
                                    //                                           ),
                                    //                                           child: expanded ? Icon(Icons.close, key: ValueKey("closeIcon")) : Image.asset(ImageAssets.chatBot, key: ValueKey("avatarIcon")),
                                    //                                         ),
                                    //                                       ),
                                    //                                     ),
                                    //                                   ));
                                    //                     });
                                    //                   });
                                    //             });
                                    //       } else {
                                    //         return const SizedBox.shrink();
                                    //       }
                                    //     }),
                                    // SizedBox(
                                    //   width: AppSizeW.s5,
                                    // ),
                                    /*========================For record========================= */
                                    BlocBuilder<VoiceCubit, VoiceState>(
                                        bloc: BlocProvider.of<VoiceCubit>(
                                            context),
                                        builder: (context, voiceState) {
                                          return GestureDetector(
                                            onTap: () {
                                              log("${voiceState.isListening}");
                                              if (voiceState.isListening) {
                                                context
                                                    .read<VoiceCubit>()
                                                    .stopListening();
                                              } else {
                                                context
                                                    .read<VoiceCubit>()
                                                    .startListening();
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
                                      child:
                                          BlocBuilder<VoiceCubit, VoiceState>(
                                              bloc: BlocProvider.of<VoiceCubit>(
                                                  context),
                                              builder: (context, voiceState) {
                                                // Schedule the update to the text field after the build phase
                                                // if (isSendEnabled.value) {
                                                WidgetsBinding.instance
                                                    .addPostFrameCallback((_) {
                                                  if (_controller.text !=
                                                      voiceState.text) {
                                                    _controller.text =
                                                        voiceState.text;
                                                  }
                                                });
                                                // }
                                                return ReraTextFaild(
                                                  onChange: (p0) {
                                                    // _controller.text = p0;
                                                  },
                                                  controller: _controller,
                                                  readOnly: false,
                                                  enabled: true,
                                                  prefixIcon: null,
                                                  hint: AppStrings()
                                                      .writeUourMessage,
                                                );
                                              }),
                                    ),
                                    /*======================== Send button ========================= */
                                    ValueListenableBuilder<bool>(
                                        valueListenable: isSendEnabled,
                                        builder: (context, enabled, child) {
                                          return SendButtonWidget(
                                            scrollController: _scrollController,
                                            enabled: enabled,
                                            controller: _controller,
                                          );
                                        }),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                );
              }),
//the clip of appbar
          ClipPath(
            clipper: AppBarClipper(),
            child: Container(
              height: preferredSize.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ColorManager.primary,
                    const Color.fromARGB(255, 194, 86, 118),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Size get preferredSize => Size.fromHeight(AppSizeH.s30);
}

AppBar costumeChatAppBar(
    BuildContext context, ScrollController scrollController) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorManager.primary,
            const Color.fromARGB(255, 194, 86, 118),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    ),
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
                  )
                ],
                // value: BlocProvider.of<DropdownCubit>(context),
                child: BlocBuilder<DropdownCubit, ChatTypeEnum>(
                  builder: (context, selectedOption) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CheckBoxWidget(
                          scrollController: scrollController,
                          text: AppStrings().moreTitle,
                          value: ChatTypeEnum.qatarRealEstatePlatform,
                          isChecked: selectedOption ==
                              ChatTypeEnum.qatarRealEstatePlatform,
                        ),
                        CheckBoxWidget(
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
