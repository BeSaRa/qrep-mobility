import 'package:bloc/bloc.dart';


class ErrorMessageCubit extends Cubit<String> {
  ErrorMessageCubit(super.initialState);


  void save(String val) {
    emit(val);
  }

  void remove() {
    emit('');
  }
}
