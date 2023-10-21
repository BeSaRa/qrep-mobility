// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translations_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TranslationsModelImpl _$$TranslationsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TranslationsModelImpl(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  TranslationDataItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TranslationsModelImplToJson(
        _$TranslationsModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$TranslationDataItemImpl _$$TranslationDataItemImplFromJson(
        Map<String, dynamic> json) =>
    _$TranslationDataItemImpl(
      id: json['id'] as String? ?? '',
      language: json['language'] as String? ?? '',
      key: json['key'] as String? ?? '',
      value: json['value'] as String? ?? '',
    );

Map<String, dynamic> _$$TranslationDataItemImplToJson(
        _$TranslationDataItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'language': instance.language,
      'key': instance.key,
      'value': instance.value,
    };
