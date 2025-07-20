// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_courses_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetAllCoursesResponseModelImpl _$$GetAllCoursesResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GetAllCoursesResponseModelImpl(
      code: (json['Code'] as num?)?.toInt() ?? 0,
      message: json['Message'] as String? ?? '',
      result: json['Result'] as bool? ?? true,
      data: json['Data'] == null
          ? null
          : CourseData.fromJson(json['Data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetAllCoursesResponseModelImplToJson(
        _$GetAllCoursesResponseModelImpl instance) =>
    <String, dynamic>{
      'Code': instance.code,
      'Message': instance.message,
      'Result': instance.result,
      'Data': instance.data,
    };

_$CourseDataImpl _$$CourseDataImplFromJson(Map<String, dynamic> json) =>
    _$CourseDataImpl(
      pager: Pager.fromJson(json['Pager'] as Map<String, dynamic>),
      trainingCourses: (json['TrainingCourses'] as List<dynamic>?)
              ?.map((e) => TrainingCourse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CourseDataImplToJson(_$CourseDataImpl instance) =>
    <String, dynamic>{
      'Pager': instance.pager,
      'TrainingCourses': instance.trainingCourses,
    };

_$PagerImpl _$$PagerImplFromJson(Map<String, dynamic> json) => _$PagerImpl(
      pageIndex: (json['PageIndex'] as num?)?.toInt() ?? 0,
      pageSize: (json['PageSize'] as num?)?.toInt() ?? 0,
      totalCount: (json['TotalCount'] as num?)?.toInt() ?? 0,
      totalPages: (json['TotalPages'] as num?)?.toInt() ?? 0,
      hasPreviousPage: json['HasPreviousPage'] as bool? ?? false,
      hasNextPage: json['HasNextPage'] as bool? ?? false,
    );

Map<String, dynamic> _$$PagerImplToJson(_$PagerImpl instance) =>
    <String, dynamic>{
      'PageIndex': instance.pageIndex,
      'PageSize': instance.pageSize,
      'TotalCount': instance.totalCount,
      'TotalPages': instance.totalPages,
      'HasPreviousPage': instance.hasPreviousPage,
      'HasNextPage': instance.hasNextPage,
    };

_$TrainingCourseImpl _$$TrainingCourseImplFromJson(Map<String, dynamic> json) =>
    _$TrainingCourseImpl(
      id: (json['Id'] as num).toInt(),
      lookup: Lookup.fromJson(json['Lookup'] as Map<String, dynamic>),
      translations: (json['Translations'] as List<dynamic>?)
              ?.map(
                  (e) => SummaryTranslation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      categories: (json['Categories'] as List<dynamic>?)
              ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      interested: json['Interested'] as bool? ?? false,
      fee: (json['Fee'] as num?)?.toDouble() ?? 0.0,
      isFree: json['IsFree'] as bool? ?? false,
      certificateType: (json['CertificateType'] as num?)?.toInt() ?? 0,
      certificateTypeTranslation: KeyValueTranslation.fromJson(
          json['CertificateTypeTranslation'] as Map<String, dynamic>),
      trainingCourseProvider: Provider.fromJson(
          json['TrainingCourseProvider'] as Map<String, dynamic>),
      session: json['Session'] == null
          ? null
          : Session.fromJson(json['Session'] as Map<String, dynamic>),
      track: (json['Track'] as num?)?.toInt() ?? 0,
      trackTranslation: json['TrackTranslation'] == null
          ? null
          : KeyValueTranslation.fromJson(
              json['TrackTranslation'] as Map<String, dynamic>),
      registered: json['Registered'] as bool? ?? false,
    );

Map<String, dynamic> _$$TrainingCourseImplToJson(
        _$TrainingCourseImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Lookup': instance.lookup,
      'Translations': instance.translations,
      'Categories': instance.categories,
      'Interested': instance.interested,
      'Fee': instance.fee,
      'IsFree': instance.isFree,
      'CertificateType': instance.certificateType,
      'CertificateTypeTranslation': instance.certificateTypeTranslation,
      'TrainingCourseProvider': instance.trainingCourseProvider,
      'Session': instance.session,
      'Track': instance.track,
      'TrackTranslation': instance.trackTranslation,
      'Registered': instance.registered,
    };

_$LookupImpl _$$LookupImplFromJson(Map<String, dynamic> json) => _$LookupImpl(
      translations: (json['Translations'] as List<dynamic>?)
              ?.map((e) => NameTranslation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      canDeleted: json['CanDeleted'] as bool? ?? false,
      id: (json['Id'] as num).toInt(),
    );

Map<String, dynamic> _$$LookupImplToJson(_$LookupImpl instance) =>
    <String, dynamic>{
      'Translations': instance.translations,
      'CanDeleted': instance.canDeleted,
      'Id': instance.id,
    };

_$NameTranslationImpl _$$NameTranslationImplFromJson(
        Map<String, dynamic> json) =>
    _$NameTranslationImpl(
      languageId: (json['LanguageId'] as num?)?.toInt() ?? 0,
      name: json['Name'] as String? ?? '',
    );

Map<String, dynamic> _$$NameTranslationImplToJson(
        _$NameTranslationImpl instance) =>
    <String, dynamic>{
      'LanguageId': instance.languageId,
      'Name': instance.name,
    };

_$SummaryTranslationImpl _$$SummaryTranslationImplFromJson(
        Map<String, dynamic> json) =>
    _$SummaryTranslationImpl(
      languageId: (json['LanguageId'] as num?)?.toInt() ?? 0,
      summary: json['Summary'] as String? ?? '',
    );

Map<String, dynamic> _$$SummaryTranslationImplToJson(
        _$SummaryTranslationImpl instance) =>
    <String, dynamic>{
      'LanguageId': instance.languageId,
      'Summary': instance.summary,
    };

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: (json['Id'] as num).toInt(),
      translations: (json['Translations'] as List<dynamic>?)
              ?.map((e) =>
                  CategoryTranslation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      showInHeader: json['ShowInHeader'] as bool? ?? false,
      isDefault: json['IsDefault'] as bool? ?? false,
      isAutoSelected: json['IsAutoSelected'] as bool? ?? false,
      picture: json['Picture'] == null
          ? null
          : Picture.fromJson(json['Picture'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Translations': instance.translations,
      'ShowInHeader': instance.showInHeader,
      'IsDefault': instance.isDefault,
      'IsAutoSelected': instance.isAutoSelected,
      'Picture': instance.picture,
    };

_$CategoryTranslationImpl _$$CategoryTranslationImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryTranslationImpl(
      languageId: (json['LanguageId'] as num?)?.toInt() ?? 0,
      name: json['Name'] as String? ?? '',
      description: json['Description'] as String? ?? '',
    );

Map<String, dynamic> _$$CategoryTranslationImplToJson(
        _$CategoryTranslationImpl instance) =>
    <String, dynamic>{
      'LanguageId': instance.languageId,
      'Name': instance.name,
      'Description': instance.description,
    };

_$PictureImpl _$$PictureImplFromJson(Map<String, dynamic> json) =>
    _$PictureImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      mimeType: json['mimeType'] as String? ?? '',
      base64File: json['base64File'] as String? ?? '',
      fileName: json['fileName'] as String? ?? '',
    );

Map<String, dynamic> _$$PictureImplToJson(_$PictureImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mimeType': instance.mimeType,
      'base64File': instance.base64File,
      'fileName': instance.fileName,
    };

_$KeyValueTranslationImpl _$$KeyValueTranslationImplFromJson(
        Map<String, dynamic> json) =>
    _$KeyValueTranslationImpl(
      key: (json['Key'] as List<dynamic>?)
              ?.map((e) => NameTranslation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      value: (json['Value'] as num).toInt(),
    );

Map<String, dynamic> _$$KeyValueTranslationImplToJson(
        _$KeyValueTranslationImpl instance) =>
    <String, dynamic>{
      'Key': instance.key,
      'Value': instance.value,
    };

_$ProviderImpl _$$ProviderImplFromJson(Map<String, dynamic> json) =>
    _$ProviderImpl(
      id: (json['Id'] as num).toInt(),
      isActive: json['IsActive'] as bool? ?? false,
      translations: (json['Translations'] as List<dynamic>?)
              ?.map((e) => NameTranslation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      canDeleted: json['CanDeleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$ProviderImplToJson(_$ProviderImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'IsActive': instance.isActive,
      'Translations': instance.translations,
      'CanDeleted': instance.canDeleted,
    };

_$SessionImpl _$$SessionImplFromJson(Map<String, dynamic> json) =>
    _$SessionImpl(
      id: (json['id'] as num).toInt(),
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      status: (json['status'] as num?)?.toInt() ?? 0,
      statusTranslation: KeyValueTranslation.fromJson(
          json['statusTranslation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SessionImplToJson(_$SessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'status': instance.status,
      'statusTranslation': instance.statusTranslation,
    };
