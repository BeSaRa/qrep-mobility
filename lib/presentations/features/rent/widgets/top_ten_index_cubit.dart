
import 'package:bloc/bloc.dart';

class TopTenIndexCubit extends Cubit<int> {
  TopTenIndexCubit(super.initialState);


  void save(int val) => emit(val);
}
