import 'package:bloc/bloc.dart';

class GetLocationNameCubit extends Cubit<String> {
  GetLocationNameCubit(super.initialState);

  void save(String val) {
    emit(val);
  }
}
