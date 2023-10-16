part of 'rent_default_bloc.dart';

@freezed
class RentDefaultState with _$RentDefaultState {
  const factory RentDefaultState.initial() = _Initial;

  const factory RentDefaultState.success(RentDefault response) = _Success;

  const factory RentDefaultState.error(String message) = _Error;
}
