part of 'guest_token_bloc.dart';

@freezed
class GuestTokenEvent with _$GuestTokenEvent {
  const factory GuestTokenEvent.tokenGuest() = _SetTokenGuest;
}
