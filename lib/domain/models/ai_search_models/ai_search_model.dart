
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_search_model.freezed.dart';
part 'ai_search_model.g.dart';


@freezed
abstract class AiSearchResponseModel with _$AiSearchResponseModel {
  factory AiSearchResponseModel({
    @Default(0) @JsonKey(name: "total_count") int totalCount,
    @Default(0)  int count,
    @Default(0) @JsonKey(name: "page_number") int pageNumber,
    @Default([])  List<AiSearchItemModel> rs,
  
  }) = _AiSearchResponseModel;

  factory AiSearchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AiSearchResponseModelFromJson(json);
}
@freezed
abstract class AiSearchItemModel with _$AiSearchItemModel {
 factory AiSearchItemModel({
     @Default("")@JsonKey(name: "website_url")  String websiteUrl,
     @Default("") String chunk,
     @Default("")@JsonKey(name: "ref_url")  String refUrl,
     @Default("") String type,
     @Default("")@JsonKey(name: "parent_id")  String parentId,
     @Default("")@JsonKey(name: "chunk_id")  String chunkId,
     @Default("") String title,
     @Default("")@JsonKey(name: "indexing_type")  String indexingType,
     @Default(0.0)@JsonKey(name: "@search.score")  double searchScore,
     @Default(0.0)@JsonKey(name: "@search.reranker_score")  double searchRerankerScore,
     @Default("")@JsonKey(name: "@search.highlights") String? searchHighlights,
     @Default("")@JsonKey(name: "@search.captions") String? searchCaptions,
  }) = _AiSearchItemModel;

  factory AiSearchItemModel.fromJson(Map<String, dynamic> json) => _$AiSearchItemModelFromJson(json);
}