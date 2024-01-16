part of 'rent_bloc.dart';

@freezed
class RentState with _$RentState {
  const factory RentState.initial({
    @Default(false) bool isLoadingRentLookup,
    @Default(false) bool isHasErrorRentLookup,
    @Default('') String errorMessageRentLookup,
    @Default(LookupResponse()) LookupResponse rentLookup,
  }) = _Initial;
}
