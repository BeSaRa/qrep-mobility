part of 'guest_token_bloc.dart';

@freezed
class GuestTokenState with _$GuestTokenState {
  const factory GuestTokenState.initial() = _Initial;
  const factory GuestTokenState.loading() = _Loading;
  const factory GuestTokenState.success() = _Success;
}
