// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'laws_model.freezed.dart';
part 'laws_model.g.dart';

@freezed
abstract class LawsResponse with _$LawsResponse {
  const factory LawsResponse({@Default([]) List<LawsModel> data}) =
      _LawsResponse;
  factory LawsResponse.fromJson(Map<String, dynamic> json) =>
      _$LawsResponseFromJson(json);
}

@freezed
abstract class LawsModel with _$LawsModel {
  const factory LawsModel(
      {@Default(0) int id,
      @Default('') String title,
      @Default('') @JsonKey(name: 'issue_date') String issueDate,
      @Default(0) @JsonKey(name: 'law_number') int lawNumber,
      @Default('') String file,
      @Default([]) List<ArticleModel> articles}) = _LawsModel;
  factory LawsModel.fromJson(Map<String, dynamic> json) =>
      _$LawsModelFromJson(json);
}

@freezed
abstract class ArticleModel with _$ArticleModel {
  const factory ArticleModel({
    @Default('') String title,
    @Default('') String content,
  }) = _ArticleModel;
  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);
}
