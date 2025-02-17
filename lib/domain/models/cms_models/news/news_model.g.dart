// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsResponseImpl _$$NewsResponseImplFromJson(Map<String, dynamic> json) =>
    _$NewsResponseImpl(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => NewsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$NewsResponseImplToJson(_$NewsResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$NewsByIdResponseImpl _$$NewsByIdResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$NewsByIdResponseImpl(
      data: json['data'] == null
          ? const NewsModel()
          : NewsModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NewsByIdResponseImplToJson(
        _$NewsByIdResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$NewsModelImpl _$$NewsModelImplFromJson(Map<String, dynamic> json) =>
    _$NewsModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      link: json['link'] as String? ?? "",
      date: json['date'] as String? ?? "",
      modified: json['modified'] as String? ?? "",
      status: json['status'] as String? ?? '',
      title: json['title'] == null
          ? const TitleModel()
          : TitleModel.fromJson(json['title'] as Map<String, dynamic>),
      content: json['content'] == null
          ? const ContentModel()
          : ContentModel.fromJson(json['content'] as Map<String, dynamic>),
      yoastHeadJsonModel: json['yoast_head_json'] == null
          ? const YoastHeadJsonModel()
          : YoastHeadJsonModel.fromJson(
              json['yoast_head_json'] as Map<String, dynamic>),
      userCreated: json['user_created'] as String? ?? '',
      dateCreated: json['date_created'] as String? ?? '',
      userUpdated: json['user_updated'] as String? ?? '',
      dateUpdated: json['date_updated'] as String? ?? '',
    );

Map<String, dynamic> _$$NewsModelImplToJson(_$NewsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'date': instance.date,
      'modified': instance.modified,
      'status': instance.status,
      'title': instance.title,
      'content': instance.content,
      'yoast_head_json': instance.yoastHeadJsonModel,
      'user_created': instance.userCreated,
      'date_created': instance.dateCreated,
      'user_updated': instance.userUpdated,
      'date_updated': instance.dateUpdated,
    };

_$TitleModelImpl _$$TitleModelImplFromJson(Map<String, dynamic> json) =>
    _$TitleModelImpl(
      rendered: json['rendered'] as String? ?? "",
    );

Map<String, dynamic> _$$TitleModelImplToJson(_$TitleModelImpl instance) =>
    <String, dynamic>{
      'rendered': instance.rendered,
    };

_$ContentModelImpl _$$ContentModelImplFromJson(Map<String, dynamic> json) =>
    _$ContentModelImpl(
      rendered: json['rendered'] as String? ?? "",
    );

Map<String, dynamic> _$$ContentModelImplToJson(_$ContentModelImpl instance) =>
    <String, dynamic>{
      'rendered': instance.rendered,
    };

_$OgImageModelImpl _$$OgImageModelImplFromJson(Map<String, dynamic> json) =>
    _$OgImageModelImpl(
      url: json['url'] as String? ?? "",
      width: (json['width'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$OgImageModelImplToJson(_$OgImageModelImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
    };

_$YoastHeadJsonModelImpl _$$YoastHeadJsonModelImplFromJson(
        Map<String, dynamic> json) =>
    _$YoastHeadJsonModelImpl(
      ogImage: (json['og_image'] as List<dynamic>?)
              ?.map((e) => OgImageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$YoastHeadJsonModelImplToJson(
        _$YoastHeadJsonModelImpl instance) =>
    <String, dynamic>{
      'og_image': instance.ogImage,
    };
