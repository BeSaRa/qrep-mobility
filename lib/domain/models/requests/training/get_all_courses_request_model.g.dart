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
      isActive: json['IsActive'] as bool? ?? null,
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
      'IsActive': instance.isActive,
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
