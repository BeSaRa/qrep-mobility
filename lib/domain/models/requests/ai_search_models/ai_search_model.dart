
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_search_model.freezed.dart';
part 'ai_search_model.g.dart';


@freezed
abstract class AiSearchRequestModel with _$AiSearchRequestModel {
  factory AiSearchRequestModel({
    @Default("")  String facet,
    @Default("")  String query,
    @Default("")  String sort,
    @Default(0) @JsonKey(name: "page_size") int pageSize,
    @Default(0) @JsonKey(name: "page_number") int pageNumber,
  
  }) = _AiSearchRequestModel;

  factory AiSearchRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AiSearchRequestModelFromJson(json);
}
