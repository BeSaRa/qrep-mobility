// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
