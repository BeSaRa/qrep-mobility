// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestAuthImpl _$$RequestAuthImplFromJson(Map<String, dynamic> json) =>
    _$RequestAuthImpl(
      identifier: json['identifier'] as String,
      json: json['json'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$RequestAuthImplToJson(_$RequestAuthImpl instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'json': instance.json,
      'password': instance.password,
    };
