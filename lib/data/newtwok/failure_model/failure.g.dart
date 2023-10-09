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
      statusCode: json['statusCode'] as int? ?? 0,
    );

Map<String, dynamic> _$$FailureModelImplToJson(_$FailureModelImpl instance) =>
    <String, dynamic>{
      'errorDescription': instance.errorDescription,
      'message': instance.message,
      'statusCode': instance.statusCode,
    };
