import 'package:bloc/bloc.dart';

class ChangeStatusCubit extends Cubit<bool> {
  ChangeStatusCubit() : super(false);

  void changeStatus() {
    emit(!state);
  }
}
