// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_courses_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetAllCoursesRequestModelImpl _$$GetAllCoursesRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GetAllCoursesRequestModelImpl(
      pageIndex: (json['PageIndex'] as num?)?.toInt() ?? 1,
      pageSize: (json['PageSize'] as num?)?.toInt() ?? 5,
      name: json['Name'] as String? ?? '',
      track: (json['Track'] as num?)?.toInt() ?? null,
      isFree: json['IsFree'] as bool? ?? null,
      categories: (json['Categories'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          null,
      language: (json['language'] as num?)?.toInt() ?? null,
      startDate: json['startDate'] as String? ?? null,
      endDate: json['endDate'] as String? ?? null,
      isActive: json['IsActive'] as bool? ?? null,
      trainingCourseProvider: json['trainingCourseProvider'] as String? ?? null,
      numberOfDays: json['numberOfDays'] as String? ?? null,
      location: (json['location'] as num?)?.toInt() ?? null,
      trainingCourseDate: json['trainingCourseDate'] as String? ?? null,
      inMorning: json['inMorning'] as bool? ?? null,
    );

Map<String, dynamic> _$$GetAllCoursesRequestModelImplToJson(
        _$GetAllCoursesRequestModelImpl instance) =>
    <String, dynamic>{
      'PageIndex': instance.pageIndex,
      'PageSize': instance.pageSize,
      'Name': instance.name,
      'Track': instance.track,
      'IsFree': instance.isFree,
      'Categories': instance.categories,
      'language': instance.language,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'IsActive': instance.isActive,
      'trainingCourseProvider': instance.trainingCourseProvider,
      'numberOfDays': instance.numberOfDays,
      'location': instance.location,
      'trainingCourseDate': instance.trainingCourseDate,
      'inMorning': instance.inMorning,
    };

_$SortModelImpl _$$SortModelImplFromJson(Map<String, dynamic> json) =>
    _$SortModelImpl(
      propertyName: json['propertyName'] as String? ?? '',
      sortDirection: (json['sortDirection'] as num?)?.toInt() ?? 0,
      languageId: (json['languageId'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$SortModelImplToJson(_$SortModelImpl instance) =>
    <String, dynamic>{
      'propertyName': instance.propertyName,
      'sortDirection': instance.sortDirection,
      'languageId': instance.languageId,
    };

_$GetAllCategoriesRequestModelImpl _$$GetAllCategoriesRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GetAllCategoriesRequestModelImpl(
      pageIndex: (json['PageIndex'] as num?)?.toInt() ?? 0,
      pageSize: (json['PageSize'] as num?)?.toInt() ?? 0,
      userType: (json['UserType'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$GetAllCategoriesRequestModelImplToJson(
        _$GetAllCategoriesRequestModelImpl instance) =>
    <String, dynamic>{
      'PageIndex': instance.pageIndex,
      'PageSize': instance.pageSize,
      'UserType': instance.userType,
    };

_$GetCourseDetailsRequestModelImpl _$$GetCourseDetailsRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GetCourseDetailsRequestModelImpl(
      id: (json['Id'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$GetCourseDetailsRequestModelImplToJson(
        _$GetCourseDetailsRequestModelImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
    };

_$GetTrainingCourseSessionsRequestModelImpl
    _$$GetTrainingCourseSessionsRequestModelImplFromJson(
            Map<String, dynamic> json) =>
        _$GetTrainingCourseSessionsRequestModelImpl(
          trainingCourseId: (json['TrainingCourseId'] as num).toInt(),
          pageIndex: (json['PageIndex'] as num).toInt(),
          pageSize: (json['PageSize'] as num).toInt(),
          language: json['Language'] as String?,
          status: json['Status'] as String?,
          location: json['Location'] as String?,
        );

Map<String, dynamic> _$$GetTrainingCourseSessionsRequestModelImplToJson(
        _$GetTrainingCourseSessionsRequestModelImpl instance) =>
    <String, dynamic>{
      'TrainingCourseId': instance.trainingCourseId,
      'PageIndex': instance.pageIndex,
      'PageSize': instance.pageSize,
      'Language': instance.language,
      'Status': instance.status,
      'Location': instance.location,
    };
