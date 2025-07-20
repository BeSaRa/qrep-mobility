import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_courses_response_model.freezed.dart';
part 'get_all_courses_response_model.g.dart';

@freezed
class GetAllCoursesResponseModel with _$GetAllCoursesResponseModel {
  const factory GetAllCoursesResponseModel({
    @Default(0) @JsonKey(name: "Code") int code,
    @Default('') @JsonKey(name: "Message") String message,
    @Default(true) @JsonKey(name: "Result") bool result,
    @JsonKey(name: "Data") CourseData? data,
  }) = _GetAllCoursesResponseModel;

  factory GetAllCoursesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllCoursesResponseModelFromJson(json);
}

@freezed
class CourseData with _$CourseData {
  const factory CourseData({
    @JsonKey(name: "Pager") required Pager pager,
    @Default([])
    @JsonKey(name: "TrainingCourses")
    List<TrainingCourse> trainingCourses,
  }) = _CourseData;

  factory CourseData.fromJson(Map<String, dynamic> json) =>
      _$CourseDataFromJson(json);
}

@freezed
class Pager with _$Pager {
  const factory Pager({
    @Default(0) @JsonKey(name: "PageIndex") int pageIndex,
    @Default(0) @JsonKey(name: "PageSize") int pageSize,
    @Default(0) @JsonKey(name: "TotalCount") int totalCount,
    @Default(0) @JsonKey(name: "TotalPages") int totalPages,
    @Default(false) @JsonKey(name: "HasPreviousPage") bool hasPreviousPage,
    @Default(false) @JsonKey(name: "HasNextPage") bool hasNextPage,
  }) = _Pager;

  factory Pager.fromJson(Map<String, dynamic> json) => _$PagerFromJson(json);
}

@freezed
class TrainingCourse with _$TrainingCourse {
  const factory TrainingCourse({
    @JsonKey(name: "Id") required int id,
    @JsonKey(name: "Lookup") required Lookup lookup,
    @JsonKey(name: "Translations")
    @Default([])
    List<SummaryTranslation> translations,
    @JsonKey(name: "Categories") @Default([]) List<Category> categories,
    @JsonKey(name: "Interested") @Default(false) bool interested,
    @JsonKey(name: "Fee") @Default(0.0) double fee,
    @JsonKey(name: "IsFree") @Default(false) bool isFree,
    @JsonKey(name: "CertificateType") @Default(0) int certificateType,
    @JsonKey(name: "CertificateTypeTranslation")
    required KeyValueTranslation certificateTypeTranslation,
    @JsonKey(name: "TrainingCourseProvider")
    required Provider trainingCourseProvider,
    @JsonKey(name: "Session") Session? session,
    @JsonKey(name: "Track") @Default(0) int track,
    @JsonKey(name: "TrackTranslation") KeyValueTranslation? trackTranslation,
    @JsonKey(name: "Registered") @Default(false) bool registered,
  }) = _TrainingCourse;

  factory TrainingCourse.fromJson(Map<String, dynamic> json) =>
      _$TrainingCourseFromJson(json);
}

@freezed
class Lookup with _$Lookup {
  const factory Lookup({
    @JsonKey(name: "Translations")
    @Default([])
    List<NameTranslation> translations,
    @JsonKey(name: "CanDeleted") @Default(false) bool canDeleted,
    @JsonKey(name: "Id") required int id,
  }) = _Lookup;

  factory Lookup.fromJson(Map<String, dynamic> json) => _$LookupFromJson(json);
}

@freezed
class NameTranslation with _$NameTranslation {
  const factory NameTranslation({
    @JsonKey(name: "LanguageId") @Default(0) int languageId,
    @JsonKey(name: "Name") @Default('') String name,
  }) = _NameTranslation;

  factory NameTranslation.fromJson(Map<String, dynamic> json) =>
      _$NameTranslationFromJson(json);
}

@freezed
class SummaryTranslation with _$SummaryTranslation {
  const factory SummaryTranslation({
    @JsonKey(name: "LanguageId") @Default(0) int languageId,
    @JsonKey(name: "Summary") @Default('') String summary,
  }) = _SummaryTranslation;

  factory SummaryTranslation.fromJson(Map<String, dynamic> json) =>
      _$SummaryTranslationFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    @JsonKey(name: "Id") required int id,
    @JsonKey(name: "Translations") @Default([]) List<CategoryTranslation> translations,
    @JsonKey(name: "ShowInHeader") @Default(false) bool showInHeader,
    @JsonKey(name: "IsDefault") @Default(false) bool isDefault,
    @JsonKey(name: "IsAutoSelected") @Default(false) bool isAutoSelected,
    @JsonKey(name: "Picture") Picture? picture,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@freezed
class CategoryTranslation with _$CategoryTranslation {
  const factory CategoryTranslation({
    @JsonKey(name: "LanguageId") @Default(0) int languageId,
    @JsonKey(name: "Name") @Default('') String name,
    @JsonKey(name: "Description") @Default('') String description,
  }) = _CategoryTranslation;

  factory CategoryTranslation.fromJson(Map<String, dynamic> json) =>
      _$CategoryTranslationFromJson(json);
}

@freezed
class Picture with _$Picture {
  const factory Picture({
    @Default(0) int id,
    @Default('') String mimeType,
    @Default('') String base64File,
    @Default('') String fileName,
  }) = _Picture;

  factory Picture.fromJson(Map<String, dynamic> json) =>
      _$PictureFromJson(json);
}

@freezed
class KeyValueTranslation with _$KeyValueTranslation {
  const factory KeyValueTranslation({
    @Default([]) @JsonKey(name: "Key") List<NameTranslation> key,
    @JsonKey(name: "Value") required int value,
  }) = _KeyValueTranslation;

  factory KeyValueTranslation.fromJson(Map<String, dynamic> json) =>
      _$KeyValueTranslationFromJson(json);
}

@freezed
class Provider with _$Provider {
  const factory Provider({
    @JsonKey(name: "Id") required int id,
    @Default(false) @JsonKey(name: "IsActive") bool isActive,
    @Default([])
    @JsonKey(name: "Translations")
    List<NameTranslation> translations,
    @Default(false) @JsonKey(name: "CanDeleted") bool canDeleted,
  }) = _Provider;

  factory Provider.fromJson(Map<String, dynamic> json) =>
      _$ProviderFromJson(json);
}

@freezed
class Session with _$Session {
  const factory Session({
    required int id,
    required String startDate,
    required String endDate,
    @Default(0) int status,
    required KeyValueTranslation statusTranslation,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}
