part of 'close_stream_bloc.dart';

@freezed
class CloseStreamEvent with _$CloseStreamEvent {
  const factory CloseStreamEvent.closeStream(String id) = _CloseStream;
}
