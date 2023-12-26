import 'package:flutter_bloc/flutter_bloc.dart';

class ValidatorCubit extends Cubit<int> {
  ValidatorCubit(super.initialState);
  //1 --> value smaller than min
  //2 --> value bigger than max
  //3 --> when fromValue is bigger than toValue
  //0 --> init state

  void validator(String? value, int max, int min, String? tovalue,
      {bool? isFromValue}) {
    if (value?.isNotEmpty ?? false) {
      if (int.parse(value ?? "0") > max) {
        emit(2);
      } else if (int.parse(value ?? "0") < min) {
        emit(1);
      } else if (tovalue?.isNotEmpty ?? false) {
        if (isFromValue ?? true) {
          if (int.parse(value ?? '0') > int.parse(tovalue ?? '0')) {
            emit(3);
          } else {
            emit(0);
          }
        } else {
          if ((int.parse(value ?? '0') < int.parse(tovalue ?? '0'))) {
            emit(3);
          } else {
            emit(0);
          }
        }
      } else {
        emit(0);
      }
    } else {
      emit(0);
    }
  }

  void checkValue(String fromValue, String toValue) {
    if (toValue.isNotEmpty && fromValue.isNotEmpty) {
      if (int.parse(fromValue) > int.parse(toValue)) {
        emit(3);
      }
    }
  }
}
