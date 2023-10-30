// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AboutResponseImpl _$$AboutResponseImplFromJson(Map<String, dynamic> json) =>
    _$AboutResponseImpl(
      data: json['data'] == null
          ? const AboutModels()
          : AboutModels.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AboutResponseImplToJson(_$AboutResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$AboutModelsImpl _$$AboutModelsImplFromJson(Map<String, dynamic> json) =>
    _$AboutModelsImpl(
      id: json['id'] as int? ?? 0,
      status: json['status'] as String? ?? '',
      translations: (json['translations'] as List<dynamic>?)
              ?.map((e) => AboutDataModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AboutModelsImplToJson(_$AboutModelsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'translations': instance.translations,
    };

_$AboutDataModelImpl _$$AboutDataModelImplFromJson(Map<String, dynamic> json) =>
    _$AboutDataModelImpl(
      id: json['id'] as int? ?? 0,
      aboutId: json['about_id'] as int? ?? 0,
      languagesCode: json['languages_code'] as String? ?? '',
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
    );

Map<String, dynamic> _$$AboutDataModelImplToJson(
        _$AboutDataModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'about_id': instance.aboutId,
      'languages_code': instance.languagesCode,
      'title': instance.title,
      'content': instance.content,
    };
