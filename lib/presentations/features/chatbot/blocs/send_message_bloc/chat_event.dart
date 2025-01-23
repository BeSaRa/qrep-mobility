part of 'chat_bloc.dart';

// abstract class ChatBotEvent {}

// class SendMessageEvent extends ChatBotEvent {
//   final ChatbotRequestModel message;
//   SendMessageEvent(this.message);
// }

@freezed
class SendMessageEvent with _$SendMessageEvent {
  const factory SendMessageEvent.started(ChatbotRequestModel message) = _Started;
}
