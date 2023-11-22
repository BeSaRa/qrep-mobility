// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_menu_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MainMenuResponseImpl _$$MainMenuResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MainMenuResponseImpl(
      mainMenu: json['main_menu'] == null
          ? const MainMenuModel()
          : MainMenuModel.fromJson(json['main_menu'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MainMenuResponseImplToJson(
        _$MainMenuResponseImpl instance) =>
    <String, dynamic>{
      'main_menu': instance.mainMenu,
    };

_$MainMenuModelImpl _$$MainMenuModelImplFromJson(Map<String, dynamic> json) =>
    _$MainMenuModelImpl(
      links: (json['links'] as List<dynamic>?)
              ?.map((e) => LinkModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MainMenuModelImplToJson(_$MainMenuModelImpl instance) =>
    <String, dynamic>{
      'links': instance.links,
    };

_$LinkModelImpl _$$LinkModelImplFromJson(Map<String, dynamic> json) =>
    _$LinkModelImpl(
      id: json['id'] as int? ?? 0,
      url: json['url'] as String? ?? "",
      dataSourceMessage: json['datasource_message_id'] == null
          ? const DataSourceMessageModel()
          : DataSourceMessageModel.fromJson(
              json['datasource_message_id'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LinkModelImplToJson(_$LinkModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'datasource_message_id': instance.dataSourceMessage,
    };

_$DataSourceMessageModelImpl _$$DataSourceMessageModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DataSourceMessageModelImpl(
      id: json['id'] as int? ?? 0,
      arMessage: json['arMessage'] as String? ?? "",
      enMessage: json['enMessage'] as String? ?? "",
    );

Map<String, dynamic> _$$DataSourceMessageModelImplToJson(
        _$DataSourceMessageModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'arMessage': instance.arMessage,
      'enMessage': instance.enMessage,
    };
