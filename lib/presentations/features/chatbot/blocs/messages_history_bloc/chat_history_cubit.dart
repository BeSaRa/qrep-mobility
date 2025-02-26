
import 'package:ebla/presentations/features/chatbot/utility/chatbot_enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ebla/domain/models/requests/chatbot_requests/chatbot_request_model.dart';

part 'chat_history_state.dart';

// enum ChatType { authority, platform } // ✅ Enum to distinguish chats

class ChatHistoryCubit extends Cubit<ChatHistoryState> {
  ChatHistoryCubit()
      : super(ChatHistoryState(
          authorityMessages: [],
          platformMessages: [],
          activeChat: ChatTypeEnum.authority, // ✅ Default chat type
        ));

  // ✅ Switch between chat types
  void switchChat(ChatTypeEnum chatType) {
    emit(state.copyWith(activeChat: chatType));
  }

  // ✅ Add a message to the active chat history
  void addMessage(MessageRequestModel message) {
    if (state.activeChat == ChatTypeEnum.authority) {
      emit(state
          .copyWith(authorityMessages: [...state.authorityMessages, message]));
    } else {
      emit(state
          .copyWith(platformMessages: [...state.platformMessages, message]));
    }
  }

  // ✅ Clear history for a specific chat
  void clearHistory(ChatTypeEnum chatType) {
    if (chatType == ChatTypeEnum.authority) {
      emit(state.copyWith(authorityMessages: []));
    } else {
      emit(state.copyWith(platformMessages: []));
    }
  }
}
