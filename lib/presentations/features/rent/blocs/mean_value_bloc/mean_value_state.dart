part of 'mean_value_bloc.dart';

@freezed
class MeanValueState with _$MeanValueState {
  const factory MeanValueState.initial({
    @Default(false) bool isLoadingMeanValue,
    @Default(false) bool isHasErrorMeanValue,
    @Default('') String errorMessageMeanValue,
    @Default([]) List<BaseRentResponse> meanValueResponse,
  }) = _Initial;
}
