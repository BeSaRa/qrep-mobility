part of 'chat_faq_bloc.dart';

@freezed
class ChatFaqState with _$ChatFaqState {
  const factory ChatFaqState.initial() = _Initial;
  const factory ChatFaqState.loading() = _Loading;
  const factory ChatFaqState.done({@Default([]) List<ChatbotFAQResponseModel> response}) = _Done;
  const factory ChatFaqState.error(String message) = _Error;
}
