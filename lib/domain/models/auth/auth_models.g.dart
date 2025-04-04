// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthResponseImpl _$$AuthResponseImplFromJson(Map<String, dynamic> json) =>
    _$AuthResponseImpl(
      data: json['data'] == null
          ? const AuthModel()
          : AuthModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AuthResponseImplToJson(_$AuthResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$AuthModelImpl _$$AuthModelImplFromJson(Map<String, dynamic> json) =>
    _$AuthModelImpl(
      token: json['access_token'] as String? ?? "",
      refreshToken: json['refresh_token'] as String? ?? "",
      expires: (json['expires'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$AuthModelImplToJson(_$AuthModelImpl instance) =>
    <String, dynamic>{
      'access_token': instance.token,
      'refresh_token': instance.refreshToken,
      'expires': instance.expires,
    };

_$ResetPasswordModelImpl _$$ResetPasswordModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ResetPasswordModelImpl(
      token: json['reset_url'] as String? ?? "",
    );

Map<String, dynamic> _$$ResetPasswordModelImplToJson(
        _$ResetPasswordModelImpl instance) =>
    <String, dynamic>{
      'reset_url': instance.token,
    };
