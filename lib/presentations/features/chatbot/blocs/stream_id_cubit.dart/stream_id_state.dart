part of 'stream_id_cubit.dart';

class StreamIdState {
  String? streamId;

  StreamIdState({required this.streamId});

  StreamIdState copyWith({String? streamId}) {
    return StreamIdState(
      streamId: streamId ?? this.streamId,
    );
  }
}
