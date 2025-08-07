// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_training_course_providers_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetTrainingCourseProviderImpl _$$GetTrainingCourseProviderImplFromJson(
        Map<String, dynamic> json) =>
    _$GetTrainingCourseProviderImpl(
      code: (json['Code'] as num?)?.toInt() ?? 0,
      message: json['Message'] as String? ?? '',
      result: json['Result'] as bool? ?? true,
      data: json['Data'] == null
          ? null
          : TrainingCourseProviderData.fromJson(
              json['Data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetTrainingCourseProviderImplToJson(
        _$GetTrainingCourseProviderImpl instance) =>
    <String, dynamic>{
      'Code': instance.code,
      'Message': instance.message,
      'Result': instance.result,
      'Data': instance.data,
    };

_$TrainingCourseProviderDataImpl _$$TrainingCourseProviderDataImplFromJson(
        Map<String, dynamic> json) =>
    _$TrainingCourseProviderDataImpl(
      providers: (json['TrainingCourseProviders'] as List<dynamic>?)
              ?.map((e) =>
                  TrainingCourseProvider.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      pager: Pager.fromJson(json['Pager'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TrainingCourseProviderDataImplToJson(
        _$TrainingCourseProviderDataImpl instance) =>
    <String, dynamic>{
      'TrainingCourseProviders': instance.providers,
      'Pager': instance.pager,
    };

_$TrainingCourseProviderImpl _$$TrainingCourseProviderImplFromJson(
        Map<String, dynamic> json) =>
    _$TrainingCourseProviderImpl(
      isActive: json['IsActive'] as bool,
      canDeleted: json['CanDeleted'] as bool,
      id: (json['Id'] as num).toInt(),
      translations: (json['Translations'] as List<dynamic>?)
              ?.map((e) => Translation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TrainingCourseProviderImplToJson(
        _$TrainingCourseProviderImpl instance) =>
    <String, dynamic>{
      'IsActive': instance.isActive,
      'CanDeleted': instance.canDeleted,
      'Id': instance.id,
      'Translations': instance.translations,
    };

_$TranslationImpl _$$TranslationImplFromJson(Map<String, dynamic> json) =>
    _$TranslationImpl(
      languageId: (json['LanguageId'] as num).toInt(),
      name: json['Name'] as String,
    );

Map<String, dynamic> _$$TranslationImplToJson(_$TranslationImpl instance) =>
    <String, dynamic>{
      'LanguageId': instance.languageId,
      'Name': instance.name,
    };

_$PagerImpl _$$PagerImplFromJson(Map<String, dynamic> json) => _$PagerImpl(
      pageIndex: (json['PageIndex'] as num).toInt(),
      pageSize: (json['PageSize'] as num).toInt(),
      totalCount: (json['TotalCount'] as num).toInt(),
      totalPages: (json['TotalPages'] as num).toInt(),
      hasPreviousPage: json['HasPreviousPage'] as bool,
      hasNextPage: json['HasNextPage'] as bool,
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
