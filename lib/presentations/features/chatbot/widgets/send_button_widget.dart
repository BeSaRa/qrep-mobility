import 'package:ebla/domain/models/requests/chatbot_requests/chatbot_request_model.dart';
import 'package:ebla/presentations/features/chatbot/blocs/messages_history_bloc/chat_history_cubit.dart';
import 'package:ebla/presentations/features/chatbot/blocs/record_cubit/voice_cubit.dart';
import 'package:ebla/presentations/features/chatbot/blocs/send_message_bloc/chat_bloc.dart';
import 'package:ebla/presentations/features/chatbot/blocs/stream_id_cubit.dart/stream_id_cubit.dart';
import 'package:ebla/presentations/features/chatbot/blocs/web_rtc_cubit/web_rtc_cubit.dart';
import 'package:ebla/presentations/features/chatbot/utility/chatbot_enums.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui' as ui;

class SendButtonWidget extends StatelessWidget {
  final bool enabled;
  final bool isAvatarShown;
  // final VoidCallback startAvatarTimer;
  final TextEditingController controller;
  final ScrollController scrollController;
  const SendButtonWidget({
    super.key,
    required this.enabled,
    required this.controller,
    // required this.startAvatarTimer,
    required this.scrollController,
    required this.isAvatarShown,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: !enabled ? .5 : 1,
      child: BlocBuilder<VoiceCubit, VoiceState>(
          bloc: BlocProvider.of<VoiceCubit>(context),
          builder: (context, voiceState) {
            return GestureDetector(
              onTap: !enabled
                  ? () {}
                  : () {
                      final message = controller.text;
                      if (message.isNotEmpty) {
                        //--------------
                        //to make the data shown dirctly when message send
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (scrollController.hasClients) {
                            scrollController.animateTo(
                              scrollController.position.maxScrollExtent +
                                  AppSizeH.s30,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );
                          }
                        });

                        //--------------
                        final chatState =
                            context.read<ChatHistoryCubit>().state;

                        //-------------------- authority send button ------------------------
                        final userMessage = MessageRequestModel(content: message, role: 'user');
                        context
                            .read<ChatHistoryCubit>()
                            .addMessage(userMessage);
                        if (chatState.activeChat == ChatTypeEnum.authority) {
                          // Send the user's message as a ChatMessage instance
                          // chatBotBloc.add(
                          BlocProvider.of<ChatBotBloc>(context).add(
                              SendMessageEvent.started(ChatbotRequestModel(
                                  streamId:
                                      //===== NOTE: Here I send the stream id as null when i make a pause to te webRTC and user send message =======
                                      !BlocProvider.of<WebRTCCubit>(context)
                                              .state
                                              .isPlaying
                                          ? null
                                          : BlocProvider.of<StreamIdCubit>(
                                                  context)
                                              .state
                                              .streamId,
                                  messages: context
                                      .read<ChatHistoryCubit>()
                                      .state
                                      .authorityMessages)));
                        }
                        //-------------------- Platform send button ------------------------
                        else {
                          BlocProvider.of<ChatBotBloc>(context)
                              .add(SendMessageEvent.platformStarted(
                            PlatformChatbotRequestModel(
                                //check the message if it wrote in arabic
                                lang:
                                    RegExp(r'[\u0600-\u06FF]').hasMatch(message)
                                        ? 1
                                        : 2,
                                question: message),
                          ));
                        }
                        controller.clear();
                        context.read<VoiceCubit>().clearText();
                      }
                      // if (isAvatarShown) {
                      //   startAvatarTimer();
                      // }
                    },
              child: Container(
                  padding: EdgeInsets.all(AppSizeW.s10),
                  margin: EdgeInsets.symmetric(horizontal: AppSizeH.s5),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          ColorManager.primary,
                          ColorManager.primary.withValues(alpha: .7),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(AppSizeR.s100)),
                  child: Center(
                    child: Icon(
                      textDirection: ui.TextDirection.ltr,
                      Icons.send_rounded,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  )),
            );
          }),
    );
  }
}
