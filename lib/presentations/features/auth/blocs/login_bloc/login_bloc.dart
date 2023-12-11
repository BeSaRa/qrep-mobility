import 'package:bloc/bloc.dart';
import 'package:ebla/app/app_preferences.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/Auth/auth_models.dart';
import '../../../../../domain/models/Auth/requests_auth/request_auth.dart';
import '../../../../../domain/usecases/auth_usecase/auth_usecases.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginUsecases loginUsecases;
  AppPreferences appPreferences;
  String? name;

  LoginBloc({required this.loginUsecases, required this.appPreferences})
      : super(const LoginState.initial()) {
    on<LoginEvent>((event, emit) async {
      await event.map(
        login: (value) async {
          emit(state.copyWith(
              isLoading: true, isHasError: false, isSuccessLogin: false));
          final failureOrSuccess =
              await loginUsecases.execute(value.authRequest);
          failureOrSuccess.when((success) async {
            name = "";
            name = value.authRequest.email;
            appPreferences.setUserToken(success.data.token);
            appPreferences.setUserRefreshToken(success.data.refreshToken);
            appPreferences.setUserLoggedIn(true);

            emit(state.copyWith(
                isLoading: false,
                isHasError: false,
                isSuccessLogin: true,
                successLogin: success));
          }, (error) {
            emit(state.copyWith(
                isLoading: false,
                isHasError: true,
                isSuccessLogin: false,
                errorMessage: error.errors[0].message,
                successLogin: const AuthResponse()));
          });
        },
      );
    });
  }
}
