import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/cms_models/user/user_model.dart';

import '../../../../../app/app_preferences.dart';

class LoggedInUserCubit extends Cubit<bool> {
  final AppPreferences appPreferences;

  LoggedInUserCubit(super.initialState, this.appPreferences);

  UserModel inUser = UserModel();

  void save(bool val) => emit(val);

  void checkLoggedIn() async {
    bool val = appPreferences.getUserLoggedIn();

    emit(val);
  }

  void saveUser(UserModel user) => inUser = user;
}
