import 'package:bloc/bloc.dart';

class FaceIdCheckCubit extends Cubit<bool> {
  FaceIdCheckCubit(super.initialState);


  void save(bool val) => emit(val);
}
