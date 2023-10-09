part of 'mean_value_bloc.dart';

@freezed
class MeanValueEvent with _$MeanValueEvent {
  // const factory MeanValueEvent.started() = _Started;
  const factory MeanValueEvent.getMeanValue(
      {required RequestMeanValue request}) = _GetMeanValueEvent;
  const factory MeanValueEvent.getMeanPurposeValue(
      {required RequestMeanValue request}) = _GetMeanPurposeValueEvent;
  const factory MeanValueEvent.getMeanPropertyValue(
      {required RequestMeanValue request}) = _GetMeanPropertyValueEvent;
}
