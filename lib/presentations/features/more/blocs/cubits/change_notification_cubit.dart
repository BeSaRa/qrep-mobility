import 'package:bloc/bloc.dart';

class ChangeNotificationCubit extends Cubit<bool> {
  ChangeNotificationCubit(super.initialState);

  void save(bool val) => emit(val);
}
