// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppSettingsResponseImpl _$$AppSettingsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AppSettingsResponseImpl(
      data: json['data'] == null
          ? const ProjectResponse()
          : ProjectResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AppSettingsResponseImplToJson(
        _$AppSettingsResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$ProjectResponseImpl _$$ProjectResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectResponseImpl(
      ios_version: json['ios_version'] as String? ?? '',
      android_version: (json['android_version'] as num?)?.toDouble() ?? 0,
      force_update: json['force_update'] as bool? ?? false,
    );

Map<String, dynamic> _$$ProjectResponseImplToJson(
        _$ProjectResponseImpl instance) =>
    <String, dynamic>{
      'ios_version': instance.ios_version,
      'android_version': instance.android_version,
      'force_update': instance.force_update,
    };
