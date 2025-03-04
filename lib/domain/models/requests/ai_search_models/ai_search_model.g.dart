// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiSearchRequestModelImpl _$$AiSearchRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AiSearchRequestModelImpl(
      facet: json['facet'] as String? ?? "",
      query: json['query'] as String? ?? "",
      sort: json['sort'] as String? ?? "",
      pageSize: (json['page_size'] as num?)?.toInt() ?? 0,
      pageNumber: (json['page_number'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$AiSearchRequestModelImplToJson(
        _$AiSearchRequestModelImpl instance) =>
    <String, dynamic>{
      'facet': instance.facet,
      'query': instance.query,
      'sort': instance.sort,
      'page_size': instance.pageSize,
      'page_number': instance.pageNumber,
    };
