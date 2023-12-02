part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.getUserInfo() = _GetUserInfoEvent;

  const factory UserEvent.initialUser() = _GetInitialUserEvent;

  const factory UserEvent.guestUser() = _GetGuestUserEvent;
}
