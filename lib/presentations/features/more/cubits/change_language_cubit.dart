
import 'package:bloc/bloc.dart';

class ChangeLanguageCubit extends Cubit<int> {
  ChangeLanguageCubit(super.initialState);

  void save(int val){
    emit(val);
  }

}
