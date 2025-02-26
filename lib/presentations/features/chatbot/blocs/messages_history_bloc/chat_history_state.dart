part of 'chat_history_cubit.dart';

class ChatHistoryState {
  final List<MessageRequestModel> authorityMessages;
  final List<MessageRequestModel> platformMessages;
  final ChatTypeEnum activeChat; // ✅ Track current active chat

  ChatHistoryState({
    required this.authorityMessages,
    required this.platformMessages,
    required this.activeChat,
  });

  ChatHistoryState copyWith({
    List<MessageRequestModel>? authorityMessages,
    List<MessageRequestModel>? platformMessages,
    ChatTypeEnum? activeChat,
  }) {
    return ChatHistoryState(
      authorityMessages: authorityMessages ?? this.authorityMessages,
      platformMessages: platformMessages ?? this.platformMessages,
      activeChat: activeChat ?? this.activeChat,
    );
  }
}
