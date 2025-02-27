part of 'send_answer_and_candidate_bloc.dart';

@freezed
class SendAnswerAndCandidateState with _$SendAnswerAndCandidateState {
  const factory SendAnswerAndCandidateState.initial() = _Initial;
  const factory SendAnswerAndCandidateState.loading() = _Loading;
  const factory SendAnswerAndCandidateState.done({required SendAnswerResponseModel startStreamResponse}) = _Done;
  const factory SendAnswerAndCandidateState.error(String message) = _Error;
}