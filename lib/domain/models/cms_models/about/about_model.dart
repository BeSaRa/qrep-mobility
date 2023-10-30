// ignore_for_file: non_constant_identifier_names, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_model.freezed.dart';
part 'about_model.g.dart';

@freezed
abstract class AboutResponse with _$AboutResponse {
  factory AboutResponse({@Default(AboutModels()) AboutModels data}) =
      _AboutResponse;
  factory AboutResponse.fromJson(Map<String, dynamic> json) =>
      _$AboutResponseFromJson(json);
}

@freezed
abstract class AboutModels with _$AboutModels {
  const factory AboutModels(
      {@Default(0) int id,
      @Default('') String status,
      @Default([]) List<AboutDataModel> translations}) = _AboutModels;
  factory AboutModels.fromJson(Map<String, dynamic> json) =>
      _$AboutModelsFromJson(json);
}

@freezed
abstract class AboutDataModel with _$AboutDataModel {
  factory AboutDataModel({
    @Default(0) int id,
    @Default(0) @JsonKey(name: "about_id") int aboutId,
    @Default('') @JsonKey(name: "languages_code") String languagesCode,
    @Default('') String title,
    @Default('') String content,
  }) = _AboutDataModel;
  factory AboutDataModel.fromJson(Map<String, dynamic> json) =>
      _$AboutDataModelFromJson(json);
}
