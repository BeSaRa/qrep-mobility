part of 'topvalues_bloc.dart';

@freezed
class TopvaluesState with _$TopvaluesState {
  const factory TopvaluesState.initial({
    @Default(false) bool isLoading,
    @Default(false) bool isHasErrorContract,
    @Default('') String errorMessage,
    @Default([]) List<BaseRentResponse> listResponse,
  }) = _Initial;
}
