part of 'chat_bloc.dart';

@freezed
class ChatBotState with _$ChatBotState {
  const factory ChatBotState.initial() = _Initial;
  const factory ChatBotState.loading() = _Loading;
  const factory ChatBotState.streaming({
    required String accumulatedContent,
    required List<DocumentModel> citations,
    required String conversationId,
    required String streamId,
    required String userId,
    required List<ActionResult> actionResults,
  }) = _Streaming;
  const factory ChatBotState.done({
    NewChatbotResponseModel? response,
    PlatformChatbotResponseModel? platformResponse,
  }) = _Done;
  const factory ChatBotState.error(String message) = _Error;
}
