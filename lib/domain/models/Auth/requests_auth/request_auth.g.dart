// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestAuthImpl _$$RequestAuthImplFromJson(Map<String, dynamic> json) =>
    _$RequestAuthImpl(
      email: json['email'] as String,
      mode: json['mode'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$RequestAuthImplToJson(_$RequestAuthImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'mode': instance.mode,
      'password': instance.password,
    };

_$RefreshTokenImpl _$$RefreshTokenImplFromJson(Map<String, dynamic> json) =>
    _$RefreshTokenImpl(
      refresh_token: json['refresh_token'] as String,
      mode: json['mode'] as String,
    );

Map<String, dynamic> _$$RefreshTokenImplToJson(_$RefreshTokenImpl instance) =>
    <String, dynamic>{
      'refresh_token': instance.refresh_token,
      'mode': instance.mode,
    };
