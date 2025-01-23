// lib/cubits/chat_history_cubit.dart
import 'package:ebla/domain/models/requests/chatbot_requests/chatbot_request_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Include the part directive to reference the state file
part 'chat_history_state.dart';

// Cubit to manage chat history
class ChatHistoryCubit extends Cubit<ChatHistoryState> {
  ChatHistoryCubit() : super(ChatHistoryState(messages: []));

  // Add a message to the history
  void addMessage(MessageRequestModel message) {
    print('Adding message to chat history: ${state.messages}');
    emit(
      ChatHistoryState(messages: [...state.messages, message]),
      // state.copyWith(messages: List.from(state.messages)..add(message)),
    );
  }

  // Clear the history (if needed)
  void clearHistory() {
    emit(ChatHistoryState(messages: []));
  }
}
