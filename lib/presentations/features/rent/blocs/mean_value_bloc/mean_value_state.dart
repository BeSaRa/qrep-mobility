part of 'mean_value_bloc.dart';

@freezed
class MeanValueState with _$MeanValueState {
  const factory MeanValueState.initial({
    @Default(false) bool isLoadingMeanValue,
    @Default(false) bool isLoadingMeanValueProperty,
    @Default(false) bool isLoadingMeanValuePurpose,
    @Default(false) bool isHasErrorMeanValue,
    @Default(false) bool isHasErrorMeanValueProperty,
    @Default(false) bool isHasErrorMeanValuePurpose,
    @Default('') String errorMessageMeanValue,
    @Default('') String errorMessageMeanValuePurpose,
    @Default('') String errorMessageMeanValueProperty,
    @Default([]) List<BaseRentResponse> meanValueResponse,
    @Default([]) List<BaseRentResponse> meanValueResponseProperty,
    @Default([]) List<BaseRentResponse> meanValueResponsePurpose,
  }) = _Initial;
}
