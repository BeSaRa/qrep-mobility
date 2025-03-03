part of 'send_feedback_bloc.dart';

@freezed
class SendFeedbackEvent with _$SendFeedbackEvent {
  const factory SendFeedbackEvent.sendFeedBack(MainSendFeedbackRequestModel request) = _SendFeedBack;
}
