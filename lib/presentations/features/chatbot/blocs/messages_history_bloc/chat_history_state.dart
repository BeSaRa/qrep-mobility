part of 'chat_history_cubit.dart';
// State class to hold the chat history
class ChatHistoryState {
  final List<MessageRequestModel>   messages;

  ChatHistoryState({required this.messages});

  ChatHistoryState copyWith({List<MessageRequestModel>? messages}) {
    return ChatHistoryState(
      messages: messages ?? this.messages,
    );
  }
}
