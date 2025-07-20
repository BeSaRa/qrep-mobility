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
    @JsonKey(name: "Categories")
    List<int>? categories,
    // @Default(0) int trainingCourseFee,
    // @Default('') String trainingCourseRequirements,
    // @Default(0) int language,
    // String? startDate,
    // String? endDate,
    // @Default(0) int numberOfHours,
    @Default(null) @JsonKey(name: "IsActive") bool? isActive,
    // @Default(0) int status,
    // @Default(0) int certificateType,
    // @Default('') String courseProvider,
    // @Default('') String trainingCourseProvider,
    // @Default(0) int numberOfDays,
    // @Default(0) int location,
    // String? trainingCourseDate,
    // @Default(null)@JsonKey(name: "Categories") bool? inMorning,
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
