// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'laws_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
