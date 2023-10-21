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
  const factory AboutModels({
    @Default(0) int id,
    @Default('') String status,
    @Default('') String title,
    @Default('') String content,
  }) = _AboutModels;
  factory AboutModels.fromJson(Map<String, dynamic> json) =>
      _$AboutModelsFromJson(json);
}
