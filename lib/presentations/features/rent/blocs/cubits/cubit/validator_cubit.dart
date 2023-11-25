import 'package:flutter_bloc/flutter_bloc.dart';

class ValidatorCubit extends Cubit<int> {
  ValidatorCubit(super.initialState);
  //1 --> value smaller than min
  //2 --> value bigger than max
  //0 --> init state

  void validator(String? value, int max, int min) {
    if (value?.isNotEmpty ?? false) {
      if (int.parse(value ?? "0") > max) {
        emit(2);
      } else if (int.parse(value ?? "0") < min) {
        emit(1);
      } else {
        emit(0);
      }
    } else {
      emit(0);
    }
  }
}
