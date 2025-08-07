import 'package:freezed_annotation/freezed_annotation.dart';
part  "get_training_course_providers_response_model.g.dart";
part  "get_training_course_providers_response_model.freezed.dart";

@freezed
class GetTrainingCourseProvidersResponseModel with _$GetTrainingCourseProvidersResponseModel {
  const factory GetTrainingCourseProvidersResponseModel({
    @Default(0) @JsonKey(name: "Code") int code,
    @Default('') @JsonKey(name: "Message") String message,
    @Default(true) @JsonKey(name: "Result") bool result,
    @JsonKey(name: "Data") TrainingCourseProviderData? data,
  }) = _GetTrainingCourseProvider;

  factory GetTrainingCourseProvidersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetTrainingCourseProvidersResponseModelFromJson(json);
}

@freezed
class TrainingCourseProviderData with _$TrainingCourseProviderData {
  const factory TrainingCourseProviderData({
    @JsonKey(name: "TrainingCourseProviders")
    @Default([])
    List<TrainingCourseProvider> providers,
    @JsonKey(name: "Pager") required Pager pager,
  }) = _TrainingCourseProviderData;

  factory TrainingCourseProviderData.fromJson(Map<String, dynamic> json) =>
      _$TrainingCourseProviderDataFromJson(json);
}

@freezed
class TrainingCourseProvider with _$TrainingCourseProvider {
  const factory TrainingCourseProvider({
    @JsonKey(name: "IsActive") required bool isActive,
    @JsonKey(name: "CanDeleted") required bool canDeleted,
    @JsonKey(name: "Id") required int id,
    @JsonKey(name: "Translations")
    @Default([])
    List<Translation> translations,
  }) = _TrainingCourseProvider;

  factory TrainingCourseProvider.fromJson(Map<String, dynamic> json) =>
      _$TrainingCourseProviderFromJson(json);
}

@freezed
class Translation with _$Translation {
  const factory Translation({
    @JsonKey(name: "LanguageId") required int languageId,
    @JsonKey(name: "Name") required String name,
  }) = _Translation;

  factory Translation.fromJson(Map<String, dynamic> json) =>
      _$TranslationFromJson(json);
}

@freezed
class Pager with _$Pager {
  const factory Pager({
    @JsonKey(name: "PageIndex") required int pageIndex,
    @JsonKey(name: "PageSize") required int pageSize,
    @JsonKey(name: "TotalCount") required int totalCount,
    @JsonKey(name: "TotalPages") required int totalPages,
    @JsonKey(name: "HasPreviousPage") required bool hasPreviousPage,
    @JsonKey(name: "HasNextPage") required bool hasNextPage,
  }) = _Pager;

  factory Pager.fromJson(Map<String, dynamic> json) => _$PagerFromJson(json);
}
