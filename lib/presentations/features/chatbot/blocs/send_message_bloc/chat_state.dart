part of 'chat_bloc.dart';

@freezed
class ChatBotState with _$ChatBotState {
  const factory ChatBotState.initial() = _Initial;
  const factory ChatBotState.loading() = _Loading;
  const factory ChatBotState.done({ ChatbotResponseModel? response,PlatformChatbotResponseModel? platformResponse
  }) = _Done;
  const factory ChatBotState.error(String message) = _Error;
}
