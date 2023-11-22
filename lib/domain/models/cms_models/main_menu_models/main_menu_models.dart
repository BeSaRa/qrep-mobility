// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_menu_models.freezed.dart';
part 'main_menu_models.g.dart';

@freezed
abstract class MainMenuResponse with _$MainMenuResponse {
  factory MainMenuResponse(
      {@Default(MainMenuModel())
      @JsonKey(name: "main_menu")
      MainMenuModel mainMenu}) = _MainMenuResponse;
  factory MainMenuResponse.fromJson(Map<String, dynamic> json) =>
      _$MainMenuResponseFromJson(json);
}

@freezed
abstract class MainMenuModel with _$MainMenuModel {
  const factory MainMenuModel({
    @Default([]) List<LinkModel> links,
  }) = _MainMenuModel;
  factory MainMenuModel.fromJson(Map<String, dynamic> json) =>
      _$MainMenuModelFromJson(json);
}

@freezed
abstract class LinkModel with _$LinkModel {
  const factory LinkModel(
      {@Default(0) int id,
      @Default("") String url,
      @Default(DataSourceMessageModel())
      @JsonKey(name: "datasource_message_id")
      DataSourceMessageModel dataSourceMessage}) = _LinkModel;
  factory LinkModel.fromJson(Map<String, dynamic> json) =>
      _$LinkModelFromJson(json);
}

@freezed
abstract class DataSourceMessageModel with _$DataSourceMessageModel {
  const factory DataSourceMessageModel({
    @Default(0) int id,
    @Default("") String arMessage,
    @Default("") String enMessage,
  }) = _DataSourceMessageModel;
  factory DataSourceMessageModel.fromJson(Map<String, dynamic> json) =>
      _$DataSourceMessageModelFromJson(json);
}
