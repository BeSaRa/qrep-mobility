part of 'forget_password_bloc.dart';

@freezed
class ForgetPasswordState with _$ForgetPasswordState {
  const factory ForgetPasswordState.initial() = _Initial;

  const factory ForgetPasswordState.loading() = _Loading;

  const factory ForgetPasswordState.done(String url) = _Done;

  const factory ForgetPasswordState.error(String message) = _Error;
}
