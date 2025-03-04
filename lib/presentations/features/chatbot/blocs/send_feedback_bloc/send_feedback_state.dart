part of 'send_feedback_bloc.dart';

@freezed
class SendFeedbackState with _$SendFeedbackState {
  const factory SendFeedbackState.initial() = _Initial;
  const factory SendFeedbackState.loading() = _Loading;
  const factory SendFeedbackState.done(
      {required SendAnswerResponseModel sendFeedbackResponse,
      required bool isRated}) = _Done;
  const factory SendFeedbackState.error(String message) = _Error;
}
