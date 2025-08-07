part of 'ask_for_login_cubit.dart';

sealed class AskForLoginState {}

final class AskForLoginInitial extends AskForLoginState {}

final class AskForLoginLoading extends AskForLoginState {}

final class AskForLoginDone extends AskForLoginState {
  final RequestLoginModel requestLoginModel;

  AskForLoginDone(this.requestLoginModel);
}

final class AskForLoginError extends AskForLoginState {
  final String message;

  AskForLoginError(this.message);
}
