part of 'rent_bloc.dart';

@freezed
class RentState with _$RentState {
  const factory RentState.initial({
    @Default(false) bool isLoadingRentLoockUp,
    @Default(false) bool isHasErrorRentLoockUp,
    @Default('') String errorMessageRentLoockUp,
    @Default(RentLookupResponse()) RentLookupResponse rentLoockUp,
  }) = _Initial;
}
