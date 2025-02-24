part of 'start_stream_bloc.dart';

@freezed
class StartStreamEvent with _$StartStreamEvent {
  const factory StartStreamEvent.started() = _Started;
  // const factory StartStreamEvent.sendAnswer(MainSendAnswerRequestModelById request) = _SendAnswer;
  // const factory StartStreamEvent.sendCandidate(MainSendCandidateRequestModelById request) = _SendCandidate;
  // const factory StartStreamEvent.closeStream(int id) = _CloseStream;
}
