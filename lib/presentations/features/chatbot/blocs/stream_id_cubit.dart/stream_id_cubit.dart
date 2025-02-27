import 'package:flutter_bloc/flutter_bloc.dart';
part 'stream_id_state.dart';

class StreamIdCubit extends Cubit<StreamIdState> {
  StreamIdCubit() : super(StreamIdState(streamId: null));

  // ✅ Set a new streamId
  void setStreamId(String id) {
    emit(state.copyWith(streamId: id));
  }

  // ✅ Clear the streamId
  void clearStreamId() {
    state.streamId = null;
    emit(state);
  }
}
