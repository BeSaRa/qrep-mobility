// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsModelImpl _$$NewsModelImplFromJson(Map<String, dynamic> json) =>
    _$NewsModelImpl(
      id: json['id'] as int? ?? 0,
      status: json['status'] as String? ?? '',
      userCreated: json['user_created'] as String? ?? '',
      dateCreated: json['date_created'] as String? ?? '',
      userUpdated: json['user_updated'] as String? ?? '',
      dateUpdated: json['date_updated'] as String? ?? '',
      excerpt: json['excerpt'] as String? ?? '',
      title: json['title'] as String? ?? '',
      image: json['image'] as String? ?? '',
      content: json['content'] as String? ?? '',
    );

Map<String, dynamic> _$$NewsModelImplToJson(_$NewsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'user_created': instance.userCreated,
      'date_created': instance.dateCreated,
      'user_updated': instance.userUpdated,
      'date_updated': instance.dateUpdated,
      'excerpt': instance.excerpt,
      'title': instance.title,
      'image': instance.image,
      'content': instance.content,
    };
