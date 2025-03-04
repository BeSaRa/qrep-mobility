// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiSearchResponseModelImpl _$$AiSearchResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AiSearchResponseModelImpl(
      totalCount: (json['total_count'] as num?)?.toInt() ?? 0,
      count: (json['count'] as num?)?.toInt() ?? 0,
      pageNumber: (json['page_number'] as num?)?.toInt() ?? 0,
      rs: (json['rs'] as List<dynamic>?)
              ?.map(
                  (e) => AiSearchItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AiSearchResponseModelImplToJson(
        _$AiSearchResponseModelImpl instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'count': instance.count,
      'page_number': instance.pageNumber,
      'rs': instance.rs,
    };

_$AiSearchItemModelImpl _$$AiSearchItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AiSearchItemModelImpl(
      websiteUrl: json['website_url'] as String? ?? "",
      chunk: json['chunk'] as String? ?? "",
      refUrl: json['ref_url'] as String? ?? "",
      type: json['type'] as String? ?? "",
      parentId: json['parent_id'] as String? ?? "",
      chunkId: json['chunk_id'] as String? ?? "",
      title: json['title'] as String? ?? "",
      indexingType: json['indexing_type'] as String? ?? "",
      searchScore: (json['@search.score'] as num?)?.toDouble() ?? 0.0,
      searchRerankerScore:
          (json['@search.reranker_score'] as num?)?.toDouble() ?? 0.0,
      searchHighlights: json['@search.highlights'] as String? ?? "",
      searchCaptions: json['@search.captions'] as String? ?? "",
    );

Map<String, dynamic> _$$AiSearchItemModelImplToJson(
        _$AiSearchItemModelImpl instance) =>
    <String, dynamic>{
      'website_url': instance.websiteUrl,
      'chunk': instance.chunk,
      'ref_url': instance.refUrl,
      'type': instance.type,
      'parent_id': instance.parentId,
      'chunk_id': instance.chunkId,
      'title': instance.title,
      'indexing_type': instance.indexingType,
      '@search.score': instance.searchScore,
      '@search.reranker_score': instance.searchRerankerScore,
      '@search.highlights': instance.searchHighlights,
      '@search.captions': instance.searchCaptions,
    };
