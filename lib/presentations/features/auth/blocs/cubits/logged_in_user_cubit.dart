import 'package:bloc/bloc.dart';

import '../../../../../app/app_preferences.dart';

class LoggedInUserCubit extends Cubit<bool> {
  final AppPreferences appPreferences;

  LoggedInUserCubit(super.initialState, this.appPreferences);

  void save(bool val) => emit(val);

  void checkLoggedIn() async {
    bool val = appPreferences.getUserLoggedIn();
    emit(val);
  }
}
