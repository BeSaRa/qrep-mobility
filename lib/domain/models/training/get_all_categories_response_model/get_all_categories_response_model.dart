import 'package:ebla/domain/models/training/get_all_courses_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_categories_response_model.freezed.dart';
part 'get_all_categories_response_model.g.dart';

@freezed
class GetAllCategoriesResponseModel with _$GetAllCategoriesResponseModel {
  const factory GetAllCategoriesResponseModel({
    @Default(0) @JsonKey(name: 'Code') int code,
    @Default('') @JsonKey(name: 'Message') String message,
    @Default(true) @JsonKey(name: 'Result') bool result,
    @JsonKey(name: 'Data') CategoryData? data,
  }) = _GetAllCategoriesResponseModel;

  factory GetAllCategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllCategoriesResponseModelFromJson(json);
}

@freezed
class CategoryData with _$CategoryData {
  const factory CategoryData({
    @Default([]) @JsonKey(name: 'Categories') List<Category> categories,
    @Default(null) @JsonKey(name: 'Pager') Pager? pager,
    // @JsonKey(name: 'Pager') required Pager pager,
  }) = _CategoryData;

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);
}


@freezed
class CategoryTranslation with _$CategoryTranslation {
  const factory CategoryTranslation({
    @JsonKey(name: 'LanguageId') @Default(0) int languageId,
    @JsonKey(name: 'Name') @Default('') String name,
    @JsonKey(name: 'Description') @Default('') String description,
  }) = _CategoryTranslation;

  factory CategoryTranslation.fromJson(Map<String, dynamic> json) =>
      _$CategoryTranslationFromJson(json);
}

@freezed
class Picture with _$Picture {
  const factory Picture({
    @JsonKey(name: "Id") @Default(0) int id,
    @JsonKey(name: "MimeType") @Default('') String mimeType,
    @JsonKey(name: "Base64File") @Default('') String base64File,
    @JsonKey(name: "FileName") @Default('') String fileName,
  }) = _Picture;

  factory Picture.fromJson(Map<String, dynamic> json) =>
      _$PictureFromJson(json);
}

@freezed
class Pager with _$Pager {
  const factory Pager({
    @Default(0) @JsonKey(name: 'PageIndex') int pageIndex,
    @Default(0) @JsonKey(name: 'PageSize') int pageSize,
    @Default(0) @JsonKey(name: 'TotalCount') int totalCount,
    @Default(0) @JsonKey(name: 'TotalPages') int totalPages,
    @Default(false) @JsonKey(name: 'HasPreviousPage') bool hasPreviousPage,
    @Default(false) @JsonKey(name: 'HasNextPage') bool hasNextPage,
  }) = _Pager;

  factory Pager.fromJson(Map<String, dynamic> json) => _$PagerFromJson(json);
}
