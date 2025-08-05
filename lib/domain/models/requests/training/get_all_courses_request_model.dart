import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_courses_request_model.freezed.dart';
part 'get_all_courses_request_model.g.dart';

@freezed
class GetAllCoursesRequestModel with _$GetAllCoursesRequestModel {
  const factory GetAllCoursesRequestModel({
    @Default(1) @JsonKey(name: "PageIndex") int pageIndex,
    @Default(5) @JsonKey(name: "PageSize") int pageSize,
    // @Default([]) List<SortModel> sortList,
    @Default('') @JsonKey(name: "Name") String? name,
    @Default(null) @JsonKey(name: "Track") int? track,
    @Default(null) @JsonKey(name: "IsFree") bool? isFree,
    // @Default('') String link,
    // @Default('') String summary,
    // @Default('') String description,
    @Default(null)
    @JsonKey(name: "Categories")
    List<int>? categories,
    // @Default(0) int trainingCourseFee,
    // @Default('') String trainingCourseRequirements,
    @Default(null) @JsonKey(name: "language") int? language,
        @Default(null) @JsonKey(name: "startDate")String? startDate,
        @Default(null) @JsonKey(name: "endDate")String? endDate,
    // @Default(0) int numberOfHours,
    @Default(null) @JsonKey(name: "IsActive") bool? isActive,
    // @Default(0) int status,
    // @Default(0) int certificateType,
    // @Default('') String courseProvider,
    @Default(null)@JsonKey(name: "trainingCourseProvider") String? trainingCourseProvider,
    @Default(null)@JsonKey(name: "numberOfDays") String? numberOfDays,
    @Default(null)@JsonKey(name: "location") int? location,
    @Default(null)@JsonKey(name: "trainingCourseDate")String? trainingCourseDate,
    @Default(null)@JsonKey(name: "inMorning") bool? inMorning,
  }) = _GetAllCoursesRequestModel;

  factory GetAllCoursesRequestModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllCoursesRequestModelFromJson(json);
}

@freezed
class SortModel with _$SortModel {
  const factory SortModel({
    @Default('') String propertyName,
    @Default(0) int sortDirection,
    @Default(0) int languageId,
  }) = _SortModel;

  factory SortModel.fromJson(Map<String, dynamic> json) =>
      _$SortModelFromJson(json);
}

@freezed
class GetAllCategoriesRequestModel with _$GetAllCategoriesRequestModel {
  const factory GetAllCategoriesRequestModel({
    @JsonKey(name: "PageIndex") @Default(0) int pageIndex,
    @JsonKey(name: "PageSize") @Default(0) int pageSize,
    @JsonKey(name: "UserType") @Default(1) int userType,
  }) = _GetAllCategoriesRequestModel;

  factory GetAllCategoriesRequestModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllCategoriesRequestModelFromJson(json);
}


@freezed
class GetCourseDetailsRequestModel with _$GetCourseDetailsRequestModel {
  const factory GetCourseDetailsRequestModel({
    @JsonKey(name: "Id") @Default(0) int id,
  }) = _GetCourseDetailsRequestModel;

  factory GetCourseDetailsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$GetCourseDetailsRequestModelFromJson(json);
}
@freezed
class GetTrainingCourseSessionsRequestModel with _$GetTrainingCourseSessionsRequestModel {
  factory GetTrainingCourseSessionsRequestModel({
    @JsonKey(name: "TrainingCourseId") required int trainingCourseId,
    @JsonKey(name: "PageIndex") required int pageIndex,
    @JsonKey(name: "PageSize") required int pageSize,
    @JsonKey(name: "Language") String? language,
    @JsonKey(name: "Status") String? status,
    @JsonKey(name: "Location") String? location,
  }) = _GetTrainingCourseSessionsRequestModel;

  factory GetTrainingCourseSessionsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$GetTrainingCourseSessionsRequestModelFromJson(json);
}