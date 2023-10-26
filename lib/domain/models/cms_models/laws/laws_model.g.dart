// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'laws_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LawsResponseImpl _$$LawsResponseImplFromJson(Map<String, dynamic> json) =>
    _$LawsResponseImpl(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => LawsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$LawsResponseImplToJson(_$LawsResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$LawByIdResponseImpl _$$LawByIdResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$LawByIdResponseImpl(
      data: json['data'] == null
          ? const LawsModel()
          : LawsModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LawByIdResponseImplToJson(
        _$LawByIdResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$LawsModelImpl _$$LawsModelImplFromJson(Map<String, dynamic> json) =>
    _$LawsModelImpl(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      issueDate: json['issue_date'] as String? ?? '',
      lawNumber: json['law_number'] as int? ?? 0,
      file: json['file'] as String? ?? '',
      articles: (json['articles'] as List<dynamic>?)
              ?.map((e) => ArticleModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$LawsModelImplToJson(_$LawsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'issue_date': instance.issueDate,
      'law_number': instance.lawNumber,
      'file': instance.file,
      'articles': instance.articles,
    };

_$ArticleModelImpl _$$ArticleModelImplFromJson(Map<String, dynamic> json) =>
    _$ArticleModelImpl(
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
    );

Map<String, dynamic> _$$ArticleModelImplToJson(_$ArticleModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
    };
