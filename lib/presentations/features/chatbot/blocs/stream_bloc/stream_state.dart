
import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';

abstract class StreamState {}

class StreamInitial extends StreamState {}

class StreamLoading extends StreamState {}

class StreamStarted extends StreamState {
  final StartStreamModel webRtcData;
  StreamStarted(this.webRtcData);
}

class StreamError extends StreamState {
  final String message;
  StreamError(this.message);
}
