part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial({
    @Default(false) bool isLoading,
    @Default(false) bool isHasError,
    @Default(false) bool isSuccessLogin,
    @Default("") String errorMessage,
    @Default(AuthResponse()) AuthResponse successLogin,
  }) = _Initial;
  // const factory LoginState.loading() = _Loading;
  // const factory LoginState.success({required AuthResponse success}) = _Success;
  // const factory LoginState.error({required String message}) = _Error;
}
