// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestUpdateInfoModelImpl _$$RequestUpdateInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestUpdateInfoModelImpl(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      fcmToken: json['fcm_token'] as String?,
      emailNotifications: json['email_notifications'] as bool?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$RequestUpdateInfoModelImplToJson(
        _$RequestUpdateInfoModelImpl instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'fcm_token': instance.fcmToken,
      'email_notifications': instance.emailNotifications,
      'title': instance.title,
    };
