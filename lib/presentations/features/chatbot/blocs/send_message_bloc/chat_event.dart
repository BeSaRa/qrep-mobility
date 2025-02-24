part of 'chat_bloc.dart';

@freezed
class SendMessageEvent with _$SendMessageEvent {
  const factory SendMessageEvent.started(ChatbotRequestModel message) = _Started;
   const factory SendMessageEvent.platformStarted(PlatformChatbotRequestModel platformMessage) = _PlatformStarted;
}
