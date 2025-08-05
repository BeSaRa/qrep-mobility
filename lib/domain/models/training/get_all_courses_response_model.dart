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
    @JsonKey(name: "Translations")@Default([])List<SummaryTranslation> translations,
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
     @Default(null)@JsonKey(name: "Picture") Picture? picture,
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
     @JsonKey(name: "Id") @Default(0) int id,
     @JsonKey(name: "MimeType") @Default('') String mimeType,
     @JsonKey(name: "Base64File") @Default('') String base64File,
     @JsonKey(name: "FileName") @Default('') String fileName,
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
    @JsonKey(name: "Id") required int id,
    @JsonKey(name: "StartDate")required String startDate,
    @JsonKey(name: "EndDate")required String endDate,
    @JsonKey(name: "Status")@Default(0) int status,
    @JsonKey(name: "StatusTranslation")required KeyValueTranslation statusTranslation,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}

//======================================= Details =============================================

@freezed
class CourseDetailsResponseModel with _$CourseDetailsResponseModel {
  const factory CourseDetailsResponseModel({
    @Default(0) @JsonKey(name: "Code") int code,
    @Default('') @JsonKey(name: "Message") String message,
    @Default(true) @JsonKey(name: "Result") bool result,
    @JsonKey(name: "Data") CourseDetailsData? data,
  }) = _CourseDetailsResponseModel;

  factory CourseDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseDetailsResponseModelFromJson(json);
}

@freezed
class CourseDetailsData with _$CourseDetailsData {
  const factory CourseDetailsData({
    @JsonKey(name: "Lookup") required CourseLookup lookup,
    @JsonKey(name: "Track") required int track,
    @JsonKey(name: "TrackTranslation") required TrackTranslation trackTranslation,
    @JsonKey(name: "Translations") 
    @Default([])
    List<CourseDescriptionTranslation> translations,
    @JsonKey(name: "Categories") @Default([]) List<CourseCategory> categories,
    @JsonKey(name: "TrainingCourseRequirements") 
    @Default([])
    List<CourseRequirement> trainingCourseRequirements,
    @JsonKey(name: "Fee") @Default(0.0) double fee,
    @JsonKey(name: "Link") String? link,
    @JsonKey(name: "IsFree") @Default(false) bool isFree,
    @JsonKey(name: "CertificateType") @Default(0) int certificateType,
    @JsonKey(name: "CertificateTypeTranslation") 
    required CertificateTypeTranslation certificateTypeTranslation,
    @JsonKey(name: "CourseProvider") String? courseProvider,
    @JsonKey(name: "TrainingCourseProvider") 
    required CourseProvider trainingCourseProvider,
  }) = _CourseDetailsData;

  factory CourseDetailsData.fromJson(Map<String, dynamic> json) =>
      _$CourseDetailsDataFromJson(json);
}

@freezed
class CourseLookup with _$CourseLookup {
  const factory CourseLookup({
    @JsonKey(name: "Translations")
    @Default([])
    List<LookupNameTranslation> translations,
    @JsonKey(name: "CanDeleted") @Default(false) bool canDeleted,
    @JsonKey(name: "Id") required int id,
  }) = _CourseLookup;

  factory CourseLookup.fromJson(Map<String, dynamic> json) =>
      _$CourseLookupFromJson(json);
}

@freezed
class LookupNameTranslation with _$LookupNameTranslation {
  const factory LookupNameTranslation({
    @JsonKey(name: "LanguageId") @Default(0) int languageId,
    @JsonKey(name: "Name") @Default('') String name,
  }) = _LookupNameTranslation;

  factory LookupNameTranslation.fromJson(Map<String, dynamic> json) =>
      _$LookupNameTranslationFromJson(json);
}

@freezed
class TrackTranslation with _$TrackTranslation {
  const factory TrackTranslation({
    @Default([]) @JsonKey(name: "Key") List<TrackNameTranslation> key,
    @JsonKey(name: "Value") required int value,
  }) = _TrackTranslation;

  factory TrackTranslation.fromJson(Map<String, dynamic> json) =>
      _$TrackTranslationFromJson(json);
}

@freezed
class TrackNameTranslation with _$TrackNameTranslation {
  const factory TrackNameTranslation({
    @JsonKey(name: "LanguageId") @Default(0) int languageId,
    @JsonKey(name: "Name") @Default('') String name,
  }) = _TrackNameTranslation;

  factory TrackNameTranslation.fromJson(Map<String, dynamic> json) =>
      _$TrackNameTranslationFromJson(json);
}

@freezed
class CourseDescriptionTranslation with _$CourseDescriptionTranslation {
  const factory CourseDescriptionTranslation({
    @JsonKey(name: "Description") @Default('') String description,
    @JsonKey(name: "LanguageId") @Default(0) int languageId,
    @JsonKey(name: "Summary") @Default('') String summary,
  }) = _CourseDescriptionTranslation;

  factory CourseDescriptionTranslation.fromJson(Map<String, dynamic> json) =>
      _$CourseDescriptionTranslationFromJson(json);
}

@freezed
class CourseCategory with _$CourseCategory {
  const factory CourseCategory({
    @JsonKey(name: "Translations") 
    @Default([])
    List<CategoryNameTranslation> translations,
    @JsonKey(name: "ShowInHeader") @Default(false) bool showInHeader,
    @JsonKey(name: "IsDefault") @Default(false) bool isDefault,
    @JsonKey(name: "IsAutoSelected") @Default(false) bool isAutoSelected,
    @JsonKey(name: "Picture") CategoryPicture? picture,
    @JsonKey(name: "Id") required int id,
  }) = _CourseCategory;

  factory CourseCategory.fromJson(Map<String, dynamic> json) =>
      _$CourseCategoryFromJson(json);
}

@freezed
class CategoryNameTranslation with _$CategoryNameTranslation {
  const factory CategoryNameTranslation({
    @JsonKey(name: "Description") @Default('') String description,
    @JsonKey(name: "LanguageId") @Default(0) int languageId,
    @JsonKey(name: "Name") @Default('') String name,
  }) = _CategoryNameTranslation;

  factory CategoryNameTranslation.fromJson(Map<String, dynamic> json) =>
      _$CategoryNameTranslationFromJson(json);
}

@freezed
class CategoryPicture with _$CategoryPicture {
  const factory CategoryPicture({
    @Default(null) int? id,
    @Default(null) String? mimeType,
    @Default(null) String? base64File,
    @Default(null) String? fileName,
  }) = _CategoryPicture;

  factory CategoryPicture.fromJson(Map<String, dynamic> json) =>
      _$CategoryPictureFromJson(json);
}

@freezed
class CourseRequirement with _$CourseRequirement {
  const factory CourseRequirement({
    @JsonKey(name: "Translations")
    @Default([])
    List<RequirementTitleTranslation> translations,
    @JsonKey(name: "Id") required int id,
  }) = _CourseRequirement;

  factory CourseRequirement.fromJson(Map<String, dynamic> json) =>
      _$CourseRequirementFromJson(json);
}

@freezed
class RequirementTitleTranslation with _$RequirementTitleTranslation {
  const factory RequirementTitleTranslation({
    @JsonKey(name: "LanguageId") @Default(0) int languageId,
    @JsonKey(name: "Title") @Default('') String title,
  }) = _RequirementTitleTranslation;

  factory RequirementTitleTranslation.fromJson(Map<String, dynamic> json) =>
      _$RequirementTitleTranslationFromJson(json);
}

@freezed
class CertificateTypeTranslation with _$CertificateTypeTranslation {
  const factory CertificateTypeTranslation({
    @Default([]) @JsonKey(name: "Key") List<CertificateNameTranslation> key,
    @JsonKey(name: "Value") required int value,
  }) = _CertificateTypeTranslation;

  factory CertificateTypeTranslation.fromJson(Map<String, dynamic> json) =>
      _$CertificateTypeTranslationFromJson(json);
}

@freezed
class CertificateNameTranslation with _$CertificateNameTranslation {
  const factory CertificateNameTranslation({
    @JsonKey(name: "LanguageId") @Default(0) int languageId,
    @JsonKey(name: "Name") @Default('') String name,
  }) = _CertificateNameTranslation;

  factory CertificateNameTranslation.fromJson(Map<String, dynamic> json) =>
      _$CertificateNameTranslationFromJson(json);
}

@freezed
class CourseProvider with _$CourseProvider {
  const factory CourseProvider({
    @JsonKey(name: "IsActive") @Default(false) bool isActive,
    @JsonKey(name: "Translations")
    @Default([])
    List<ProviderNameTranslation> translations,
    @JsonKey(name: "CanDeleted") @Default(false) bool canDeleted,
    @JsonKey(name: "Id") required int id,
  }) = _CourseProvider;

  factory CourseProvider.fromJson(Map<String, dynamic> json) =>
      _$CourseProviderFromJson(json);
}

@freezed
class ProviderNameTranslation with _$ProviderNameTranslation {
  const factory ProviderNameTranslation({
    @JsonKey(name: "LanguageId") @Default(0) int languageId,
    @JsonKey(name: "Name") @Default('') String name,
  }) = _ProviderNameTranslation;

  factory ProviderNameTranslation.fromJson(Map<String, dynamic> json) =>
      _$ProviderNameTranslationFromJson(json);
}
//======================== Attachments ==============================

@freezed
class GetTrainingCourseAttachmentResponseModel with _$GetTrainingCourseAttachmentResponseModel  {
  factory GetTrainingCourseAttachmentResponseModel ({
    @JsonKey(name: "Code") required int code,
    @JsonKey(name: "Message") required String message,
    @JsonKey(name: "Result") required bool result,
    @JsonKey(name: "Data") required List<AttachmentModel> data,
  }) = _GetTrainingCourseAttachmentResponseModel ;

  factory GetTrainingCourseAttachmentResponseModel .fromJson(Map<String, dynamic> json) =>
      _$GetTrainingCourseAttachmentResponseModelFromJson(json);
}
@freezed
class AttachmentModel with _$AttachmentModel {
  factory AttachmentModel({
    @JsonKey(name: "Id") required int id,
    @JsonKey(name: "MimeType") required String mimeType,
    @JsonKey(name: "Base64File") required String base64File,
    @JsonKey(name: "FileName") required String fileName,
  }) = _AttachmentModel;

  factory AttachmentModel.fromJson(Map<String, dynamic> json) =>
      _$AttachmentModelFromJson(json);
}

@freezed
class GetTrainingCourseSessionsResponseModel with _$GetTrainingCourseSessionsResponseModel {
  factory GetTrainingCourseSessionsResponseModel({
    @JsonKey(name: "Code") required int code,
    @JsonKey(name: "Message") required String message,
    @JsonKey(name: "Result") required bool result,
    @JsonKey(name: "Data") required TrainingSessionsDataModel data,
  }) = _GetTrainingCourseSessionsResponseModel;

  factory GetTrainingCourseSessionsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetTrainingCourseSessionsResponseModelFromJson(json);
}

@freezed
class TrainingSessionsDataModel with _$TrainingSessionsDataModel {
  factory TrainingSessionsDataModel({
    @JsonKey(name: "Sessions") required List<TrainingSessionModel> sessions,
    @JsonKey(name: "Pager") required Pager pager,
  }) = _TrainingSessionsDataModel;

  factory TrainingSessionsDataModel.fromJson(Map<String, dynamic> json) =>
      _$TrainingSessionsDataModelFromJson(json);
}

@freezed
class TrainingSessionModel with _$TrainingSessionModel {
  factory TrainingSessionModel({
    @JsonKey(name: "StartDate") required String startDate,
    @JsonKey(name: "EndDate") required String endDate,
    @JsonKey(name: "RegistrationDeadline") required String registrationDeadline,
    @JsonKey(name: "TimeFrom") required String timeFrom,
    @JsonKey(name: "TimeTo") required String timeTo,
    @JsonKey(name: "NumberOfHours") required int numberOfHours,
    @JsonKey(name: "NumberOfDays") required int numberOfDays,
    @JsonKey(name: "Language") required int language,
    @JsonKey(name: "LanguageTranslation") 
        required TranslationModel languageTranslation,
    @JsonKey(name: "Latitude") required double latitude,
    @JsonKey(name: "Longitude") required double longitude,
    @JsonKey(name: "Location") required int location,
    @JsonKey(name: "LocationTranslation") 
        required TranslationModel locationTranslation,
    @JsonKey(name: "Address") required String address,
    @JsonKey(name: "Link") required String link,
    @JsonKey(name: "Status") required int status,
    @JsonKey(name: "StatusTranslation") 
        required TranslationModel statusTranslation,
    @JsonKey(name: "TrainingCourseId") required int trainingCourseId,
    @JsonKey(name: "Registered") required bool registered,
    @JsonKey(name: "Id") required int id,
  }) = _TrainingSessionModel;

  factory TrainingSessionModel.fromJson(Map<String, dynamic> json) =>
      _$TrainingSessionModelFromJson(json);
}

@freezed
class TranslationModel with _$TranslationModel {
  factory TranslationModel({
    @JsonKey(name: "Key") required List<TranslationItemModel> key,
    @JsonKey(name: "Value") required int value,
  }) = _TranslationModel;

  factory TranslationModel.fromJson(Map<String, dynamic> json) =>
      _$TranslationModelFromJson(json);
}

@freezed
class TranslationItemModel with _$TranslationItemModel {
  factory TranslationItemModel({
    @JsonKey(name: "LanguageId") required int languageId,
    @JsonKey(name: "Name") required String name,
  }) = _TranslationItemModel;

  factory TranslationItemModel.fromJson(Map<String, dynamic> json) =>
      _$TranslationItemModelFromJson(json);
}
