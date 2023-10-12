part of 'rent_summery_bloc.dart';

@freezed
class RentSummeryState with _$RentSummeryState {
  const factory RentSummeryState.initial({
    @Default(false) bool isLoadingRentSummery,
    @Default(false) bool isHasErrorRentSummery,
    @Default('') String errorMessageRentSummery,
    @Default(RentListSummary()) RentListSummary rentSummery,
  }) = _Initial;
}
