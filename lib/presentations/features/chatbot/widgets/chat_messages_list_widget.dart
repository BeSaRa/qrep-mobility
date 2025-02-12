import 'package:ebla/presentations/features/chatbot/blocs/messages_history_bloc/chat_history_cubit.dart';
import 'package:ebla/presentations/features/chatbot/utility/chatbot_enums.dart';
import 'package:ebla/presentations/features/chatbot/widgets/shown_loading_indecator.dart';
import 'package:ebla/presentations/features/chatbot/widgets/shown_message_widget.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatMessagesListWidget extends StatelessWidget {
  const ChatMessagesListWidget({
    super.key,
    required this.isSending,
    required this.isAvatarPressed,
    required this.scrollController,
  });

  final ScrollController scrollController;
  final bool isSending;
  final bool isAvatarPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizeW.s8),
      child: BlocConsumer<ChatHistoryCubit, ChatHistoryState>(
        listener: (context, state) {},
        builder: (context, messageHistory) {
          //-----------------------------------------
          // ✅ Get messages for the active chat
          final chatState = context.read<ChatHistoryCubit>().state;
          final messages = chatState.activeChat == ChatTypeEnum.authority
              ? chatState.authorityMessages
              : chatState.platformMessages;
          //-----------------------------------------
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizeW.s10),
            child: ListView.builder(
              controller: scrollController,
              // itemCount: messageHistory.messages.length + (isSending ? 1 : 0),
              itemCount: messages.length + (isSending ? 1 : 0),
              itemBuilder: (context, index) {
                //-----------------Loading container-------------
                // if (isSending && index == messageHistory.messages.length) {
                if (isSending && index == messages.length) {
                  return const ShownLoadingIndecetorWidget();
                } else {
                  //-----------------main message-------------
                  final message = messages[index];
                  // final message = messageHistory.messages[index];
                  return ShownMessageWidget(
                      currentMessageIndex: index,
                      isAvatarShow: isAvatarPressed,
                      message: message);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
