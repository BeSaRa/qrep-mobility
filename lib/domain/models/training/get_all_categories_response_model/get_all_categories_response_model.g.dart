// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_categories_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetAllCategoriesResponseModelImpl
    _$$GetAllCategoriesResponseModelImplFromJson(Map<String, dynamic> json) =>
        _$GetAllCategoriesResponseModelImpl(
          code: (json['Code'] as num?)?.toInt() ?? 0,
          message: json['Message'] as String? ?? '',
          result: json['Result'] as bool? ?? true,
          data: json['Data'] == null
              ? null
              : CategoryData.fromJson(json['Data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$GetAllCategoriesResponseModelImplToJson(
        _$GetAllCategoriesResponseModelImpl instance) =>
    <String, dynamic>{
      'Code': instance.code,
      'Message': instance.message,
      'Result': instance.result,
      'Data': instance.data,
    };

_$CategoryDataImpl _$$CategoryDataImplFromJson(Map<String, dynamic> json) =>
    _$CategoryDataImpl(
      categories: (json['Categories'] as List<dynamic>?)
              ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      pager: Pager.fromJson(json['Pager'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CategoryDataImplToJson(_$CategoryDataImpl instance) =>
    <String, dynamic>{
      'Categories': instance.categories,
      'Pager': instance.pager,
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
