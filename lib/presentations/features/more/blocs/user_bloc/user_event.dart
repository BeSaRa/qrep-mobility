part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.getUserInfo() = _GetUserInfoEvent;

  const factory UserEvent.updateUserInfo(
          {required String id,
          required RequestUpdateInfoModel requestUpdateInfo}) =
      _UpdateUserInfoEvent;

  const factory UserEvent.initialUser() = _GetInitialUserEvent;

  const factory UserEvent.guestUser() = _GetGuestUserEvent;

  const factory UserEvent.updateFcm(String useId) = _GetUpdateFcmEvent;
}
