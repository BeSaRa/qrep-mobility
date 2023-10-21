// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AboutModelsImpl _$$AboutModelsImplFromJson(Map<String, dynamic> json) =>
    _$AboutModelsImpl(
      id: json['id'] as int? ?? 0,
      status: json['status'] as String? ?? '',
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
    );

Map<String, dynamic> _$$AboutModelsImplToJson(_$AboutModelsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'title': instance.title,
      'content': instance.content,
    };
