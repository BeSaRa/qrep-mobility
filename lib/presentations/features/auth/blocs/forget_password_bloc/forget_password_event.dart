part of 'forget_password_bloc.dart';

@freezed
class ForgetPasswordEvent with _$ForgetPasswordEvent {
  const factory ForgetPasswordEvent.started(String email) = _Started;
}
