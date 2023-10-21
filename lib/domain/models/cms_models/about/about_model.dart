import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_model.freezed.dart';
part 'about_model.g.dart';

@freezed
abstract class AboutModels with _$AboutModels {
  factory AboutModels({
    @Default(0) int id,
    @Default('') String status,
    @Default('') String title,
    @Default('') String content,
  }) = _AboutModels;
  factory AboutModels.fromJson(Map<String, dynamic> json) =>
      _$AboutModelsFromJson(json);
}
