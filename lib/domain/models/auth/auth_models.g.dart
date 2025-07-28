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

_$TheRequestLoginModelImpl _$$TheRequestLoginModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TheRequestLoginModelImpl(
      code: (json['Code'] as num?)?.toInt(),
      message: json['Message'] as String?,
      result: json['Result'] as bool?,
      data: json['Data'] == null
          ? null
          : RequestLoginModel.fromJson(json['Data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TheRequestLoginModelImplToJson(
        _$TheRequestLoginModelImpl instance) =>
    <String, dynamic>{
      'Code': instance.code,
      'Message': instance.message,
      'Result': instance.result,
      'Data': instance.data,
    };

_$RequestLoginModelImpl _$$RequestLoginModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestLoginModelImpl(
      url: json['RedirectUrl'] as String?,
      state: json['State'] as String?,
    );

Map<String, dynamic> _$$RequestLoginModelImplToJson(
        _$RequestLoginModelImpl instance) =>
    <String, dynamic>{
      'RedirectUrl': instance.url,
      'State': instance.state,
    };
