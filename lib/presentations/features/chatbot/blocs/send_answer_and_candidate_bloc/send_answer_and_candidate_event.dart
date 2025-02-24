part of 'send_answer_and_candidate_bloc.dart';

@freezed
class SendAnswerAndCandidateEvent with _$SendAnswerAndCandidateEvent {
  const factory SendAnswerAndCandidateEvent.sendAnswer(MainSendAnswerRequestModelById request) = _SendAnswer;
  const factory SendAnswerAndCandidateEvent.sendCandidate(MainSendCandidateRequestModelById request) = _SendCandidate;
}
