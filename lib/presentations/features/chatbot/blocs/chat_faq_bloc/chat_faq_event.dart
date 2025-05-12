part of 'chat_faq_bloc.dart';

@freezed
class ChatFaqEvent with _$ChatFaqEvent {
  const factory ChatFaqEvent.started(String botName) = _Started;
  //  const factory SendMessageEvent.platformStarted(PlatformChatbotRequestModel platformMessage) = _PlatformStarted;
}
