abstract class StreamEvent {}

class StartStreamRequested extends StreamEvent {}

class SendAnswerToBackend extends StreamEvent {
  final String streamId;
  final String sdp;
  final String type;

  SendAnswerToBackend({
    required this.streamId,
    required this.sdp,
    required this.type,
  });
}

class SendCandidateToBackend extends StreamEvent {
  final String streamId;
  final String candidate;
  final String sdpMid;
  final int sdpMLineIndex;

  SendCandidateToBackend({
    required this.streamId,
    required this.candidate,
    required this.sdpMid,
    required this.sdpMLineIndex,
  });
}

class StreamFailed extends StreamEvent {
  final String message;
  StreamFailed(this.message);
}
