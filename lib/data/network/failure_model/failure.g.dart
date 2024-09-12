// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FailureModelImpl _$$FailureModelImplFromJson(Map<String, dynamic> json) =>
    _$FailureModelImpl(
      errorDescription: (json['errorDescription'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      message: json['message'] as String? ?? '',
      statusCode: (json['statusCode'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$FailureModelImplToJson(_$FailureModelImpl instance) =>
    <String, dynamic>{
      'errorDescription': instance.errorDescription,
      'message': instance.message,
      'statusCode': instance.statusCode,
    };

_$FailureResponseImpl _$$FailureResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FailureResponseImpl(
      errors: (json['errors'] as List<dynamic>?)
              ?.map((e) => ErrorModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$FailureResponseImplToJson(
        _$FailureResponseImpl instance) =>
    <String, dynamic>{
      'errors': instance.errors,
    };

_$ErrorModelImpl _$$ErrorModelImplFromJson(Map<String, dynamic> json) =>
    _$ErrorModelImpl(
      message: json['message'] as String? ?? "",
    );

Map<String, dynamic> _$$ErrorModelImplToJson(_$ErrorModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
