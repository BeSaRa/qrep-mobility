// ignore_for_file: non_constant_identifier_names, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

@freezed
abstract class ProjectDataResponse with _$ProjectDataResponse {
  const factory ProjectDataResponse(
          {@Default(ProjectResponse()) ProjectResponse project}) =
      _ProjectDataResponse;

  factory ProjectDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectDataResponseFromJson(json);
}

@freezed
abstract class AppSettingsResponse with _$AppSettingsResponse {
  factory AppSettingsResponse(
          {@Default(ProjectDataResponse()) ProjectDataResponse data}) =
      _AppSettingsResponse;

  factory AppSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsResponseFromJson(json);
}

@freezed
abstract class ProjectResponse with _$ProjectResponse {
  const factory ProjectResponse(
      {@Default('') String ios_version,
      @Default('') String android_version}) = _ProjectResponse;

  factory ProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectResponseFromJson(json);
}
