import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../presentations/resources/strings_manager.dart';

part 'failure.freezed.dart';
part 'failure.g.dart';

@freezed
class FailureModel with _$FailureModel {
  const factory FailureModel({
    @Default([]) List<String> errorDescription,
    @Default('') String message,
    @Default(0) int statusCode,
  }) = _FailureModel;

  factory FailureModel.fromJson(Map<String, dynamic> json) =>
      _$FailureModelFromJson(json);
}

Map<String, String> defaultError = {'message': AppStrings().defaultError};

@freezed
class FailureResponse with _$FailureResponse {
  const factory FailureResponse({
    @Default([]) List<ErrorModel> errors,
  }) = _FailureResponse;

  factory FailureResponse.fromJson(Map<String, dynamic> json) =>
      _$FailureResponseFromJson(json);
}

@freezed
abstract class ErrorModel with _$ErrorModel {
  factory ErrorModel({
    @Default("") String message,
  }) = _ErrorModel;
  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);
}
