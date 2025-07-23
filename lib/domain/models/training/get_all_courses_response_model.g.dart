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

_$CourseDetailsResponseModelImpl _$$CourseDetailsResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CourseDetailsResponseModelImpl(
      code: (json['Code'] as num?)?.toInt() ?? 0,
      message: json['Message'] as String? ?? '',
      result: json['Result'] as bool? ?? true,
      data: json['Data'] == null
          ? null
          : CourseDetailsData.fromJson(json['Data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CourseDetailsResponseModelImplToJson(
        _$CourseDetailsResponseModelImpl instance) =>
    <String, dynamic>{
      'Code': instance.code,
      'Message': instance.message,
      'Result': instance.result,
      'Data': instance.data,
    };

_$CourseDetailsDataImpl _$$CourseDetailsDataImplFromJson(
        Map<String, dynamic> json) =>
    _$CourseDetailsDataImpl(
      lookup: CourseLookup.fromJson(json['Lookup'] as Map<String, dynamic>),
      track: (json['Track'] as num).toInt(),
      trackTranslation: TrackTranslation.fromJson(
          json['TrackTranslation'] as Map<String, dynamic>),
      translations: (json['Translations'] as List<dynamic>?)
              ?.map((e) => CourseDescriptionTranslation.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
      categories: (json['Categories'] as List<dynamic>?)
              ?.map((e) => CourseCategory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      trainingCourseRequirements: (json['TrainingCourseRequirements']
                  as List<dynamic>?)
              ?.map(
                  (e) => CourseRequirement.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      fee: (json['Fee'] as num?)?.toDouble() ?? 0.0,
      link: json['Link'] as String?,
      isFree: json['IsFree'] as bool? ?? false,
      certificateType: (json['CertificateType'] as num?)?.toInt() ?? 0,
      certificateTypeTranslation: CertificateTypeTranslation.fromJson(
          json['CertificateTypeTranslation'] as Map<String, dynamic>),
      courseProvider: json['CourseProvider'] as String?,
      trainingCourseProvider: CourseProvider.fromJson(
          json['TrainingCourseProvider'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CourseDetailsDataImplToJson(
        _$CourseDetailsDataImpl instance) =>
    <String, dynamic>{
      'Lookup': instance.lookup,
      'Track': instance.track,
      'TrackTranslation': instance.trackTranslation,
      'Translations': instance.translations,
      'Categories': instance.categories,
      'TrainingCourseRequirements': instance.trainingCourseRequirements,
      'Fee': instance.fee,
      'Link': instance.link,
      'IsFree': instance.isFree,
      'CertificateType': instance.certificateType,
      'CertificateTypeTranslation': instance.certificateTypeTranslation,
      'CourseProvider': instance.courseProvider,
      'TrainingCourseProvider': instance.trainingCourseProvider,
    };

_$CourseLookupImpl _$$CourseLookupImplFromJson(Map<String, dynamic> json) =>
    _$CourseLookupImpl(
      translations: (json['Translations'] as List<dynamic>?)
              ?.map((e) =>
                  LookupNameTranslation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      canDeleted: json['CanDeleted'] as bool? ?? false,
      id: (json['Id'] as num).toInt(),
    );

Map<String, dynamic> _$$CourseLookupImplToJson(_$CourseLookupImpl instance) =>
    <String, dynamic>{
      'Translations': instance.translations,
      'CanDeleted': instance.canDeleted,
      'Id': instance.id,
    };

_$LookupNameTranslationImpl _$$LookupNameTranslationImplFromJson(
        Map<String, dynamic> json) =>
    _$LookupNameTranslationImpl(
      languageId: (json['LanguageId'] as num?)?.toInt() ?? 0,
      name: json['Name'] as String? ?? '',
    );

Map<String, dynamic> _$$LookupNameTranslationImplToJson(
        _$LookupNameTranslationImpl instance) =>
    <String, dynamic>{
      'LanguageId': instance.languageId,
      'Name': instance.name,
    };

_$TrackTranslationImpl _$$TrackTranslationImplFromJson(
        Map<String, dynamic> json) =>
    _$TrackTranslationImpl(
      key: (json['Key'] as List<dynamic>?)
              ?.map((e) =>
                  TrackNameTranslation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      value: (json['Value'] as num).toInt(),
    );

Map<String, dynamic> _$$TrackTranslationImplToJson(
        _$TrackTranslationImpl instance) =>
    <String, dynamic>{
      'Key': instance.key,
      'Value': instance.value,
    };

_$TrackNameTranslationImpl _$$TrackNameTranslationImplFromJson(
        Map<String, dynamic> json) =>
    _$TrackNameTranslationImpl(
      languageId: (json['LanguageId'] as num?)?.toInt() ?? 0,
      name: json['Name'] as String? ?? '',
    );

Map<String, dynamic> _$$TrackNameTranslationImplToJson(
        _$TrackNameTranslationImpl instance) =>
    <String, dynamic>{
      'LanguageId': instance.languageId,
      'Name': instance.name,
    };

_$CourseDescriptionTranslationImpl _$$CourseDescriptionTranslationImplFromJson(
        Map<String, dynamic> json) =>
    _$CourseDescriptionTranslationImpl(
      description: json['Description'] as String? ?? '',
      languageId: (json['LanguageId'] as num?)?.toInt() ?? 0,
      summary: json['Summary'] as String? ?? '',
    );

Map<String, dynamic> _$$CourseDescriptionTranslationImplToJson(
        _$CourseDescriptionTranslationImpl instance) =>
    <String, dynamic>{
      'Description': instance.description,
      'LanguageId': instance.languageId,
      'Summary': instance.summary,
    };

_$CourseCategoryImpl _$$CourseCategoryImplFromJson(Map<String, dynamic> json) =>
    _$CourseCategoryImpl(
      translations: (json['Translations'] as List<dynamic>?)
              ?.map((e) =>
                  CategoryNameTranslation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      showInHeader: json['ShowInHeader'] as bool? ?? false,
      isDefault: json['IsDefault'] as bool? ?? false,
      isAutoSelected: json['IsAutoSelected'] as bool? ?? false,
      picture: json['Picture'] == null
          ? null
          : CategoryPicture.fromJson(json['Picture'] as Map<String, dynamic>),
      id: (json['Id'] as num).toInt(),
    );

Map<String, dynamic> _$$CourseCategoryImplToJson(
        _$CourseCategoryImpl instance) =>
    <String, dynamic>{
      'Translations': instance.translations,
      'ShowInHeader': instance.showInHeader,
      'IsDefault': instance.isDefault,
      'IsAutoSelected': instance.isAutoSelected,
      'Picture': instance.picture,
      'Id': instance.id,
    };

_$CategoryNameTranslationImpl _$$CategoryNameTranslationImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryNameTranslationImpl(
      description: json['Description'] as String? ?? '',
      languageId: (json['LanguageId'] as num?)?.toInt() ?? 0,
      name: json['Name'] as String? ?? '',
    );

Map<String, dynamic> _$$CategoryNameTranslationImplToJson(
        _$CategoryNameTranslationImpl instance) =>
    <String, dynamic>{
      'Description': instance.description,
      'LanguageId': instance.languageId,
      'Name': instance.name,
    };

_$CategoryPictureImpl _$$CategoryPictureImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryPictureImpl(
      id: (json['id'] as num?)?.toInt() ?? null,
      mimeType: json['mimeType'] as String? ?? null,
      base64File: json['base64File'] as String? ?? null,
      fileName: json['fileName'] as String? ?? null,
    );

Map<String, dynamic> _$$CategoryPictureImplToJson(
        _$CategoryPictureImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mimeType': instance.mimeType,
      'base64File': instance.base64File,
      'fileName': instance.fileName,
    };

_$CourseRequirementImpl _$$CourseRequirementImplFromJson(
        Map<String, dynamic> json) =>
    _$CourseRequirementImpl(
      translations: (json['Translations'] as List<dynamic>?)
              ?.map((e) => RequirementTitleTranslation.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
      id: (json['Id'] as num).toInt(),
    );

Map<String, dynamic> _$$CourseRequirementImplToJson(
        _$CourseRequirementImpl instance) =>
    <String, dynamic>{
      'Translations': instance.translations,
      'Id': instance.id,
    };

_$RequirementTitleTranslationImpl _$$RequirementTitleTranslationImplFromJson(
        Map<String, dynamic> json) =>
    _$RequirementTitleTranslationImpl(
      languageId: (json['LanguageId'] as num?)?.toInt() ?? 0,
      title: json['Title'] as String? ?? '',
    );

Map<String, dynamic> _$$RequirementTitleTranslationImplToJson(
        _$RequirementTitleTranslationImpl instance) =>
    <String, dynamic>{
      'LanguageId': instance.languageId,
      'Title': instance.title,
    };

_$CertificateTypeTranslationImpl _$$CertificateTypeTranslationImplFromJson(
        Map<String, dynamic> json) =>
    _$CertificateTypeTranslationImpl(
      key: (json['Key'] as List<dynamic>?)
              ?.map((e) => CertificateNameTranslation.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
      value: (json['Value'] as num).toInt(),
    );

Map<String, dynamic> _$$CertificateTypeTranslationImplToJson(
        _$CertificateTypeTranslationImpl instance) =>
    <String, dynamic>{
      'Key': instance.key,
      'Value': instance.value,
    };

_$CertificateNameTranslationImpl _$$CertificateNameTranslationImplFromJson(
        Map<String, dynamic> json) =>
    _$CertificateNameTranslationImpl(
      languageId: (json['LanguageId'] as num?)?.toInt() ?? 0,
      name: json['Name'] as String? ?? '',
    );

Map<String, dynamic> _$$CertificateNameTranslationImplToJson(
        _$CertificateNameTranslationImpl instance) =>
    <String, dynamic>{
      'LanguageId': instance.languageId,
      'Name': instance.name,
    };

_$CourseProviderImpl _$$CourseProviderImplFromJson(Map<String, dynamic> json) =>
    _$CourseProviderImpl(
      isActive: json['IsActive'] as bool? ?? false,
      translations: (json['Translations'] as List<dynamic>?)
              ?.map((e) =>
                  ProviderNameTranslation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      canDeleted: json['CanDeleted'] as bool? ?? false,
      id: (json['Id'] as num).toInt(),
    );

Map<String, dynamic> _$$CourseProviderImplToJson(
        _$CourseProviderImpl instance) =>
    <String, dynamic>{
      'IsActive': instance.isActive,
      'Translations': instance.translations,
      'CanDeleted': instance.canDeleted,
      'Id': instance.id,
    };

_$ProviderNameTranslationImpl _$$ProviderNameTranslationImplFromJson(
        Map<String, dynamic> json) =>
    _$ProviderNameTranslationImpl(
      languageId: (json['LanguageId'] as num?)?.toInt() ?? 0,
      name: json['Name'] as String? ?? '',
    );

Map<String, dynamic> _$$ProviderNameTranslationImplToJson(
        _$ProviderNameTranslationImpl instance) =>
    <String, dynamic>{
      'LanguageId': instance.languageId,
      'Name': instance.name,
    };

_$GetTrainingCourseAttachmentResponseModelImpl
    _$$GetTrainingCourseAttachmentResponseModelImplFromJson(
            Map<String, dynamic> json) =>
        _$GetTrainingCourseAttachmentResponseModelImpl(
          code: (json['Code'] as num).toInt(),
          message: json['Message'] as String,
          result: json['Result'] as bool,
          data: (json['Data'] as List<dynamic>)
              .map((e) => AttachmentModel.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$GetTrainingCourseAttachmentResponseModelImplToJson(
        _$GetTrainingCourseAttachmentResponseModelImpl instance) =>
    <String, dynamic>{
      'Code': instance.code,
      'Message': instance.message,
      'Result': instance.result,
      'Data': instance.data,
    };

_$AttachmentModelImpl _$$AttachmentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AttachmentModelImpl(
      id: (json['Id'] as num).toInt(),
      mimeType: json['MimeType'] as String,
      base64File: json['Base64File'] as String,
      fileName: json['FileName'] as String,
    );

Map<String, dynamic> _$$AttachmentModelImplToJson(
        _$AttachmentModelImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'MimeType': instance.mimeType,
      'Base64File': instance.base64File,
      'FileName': instance.fileName,
    };

_$GetTrainingCourseSessionsResponseModelImpl
    _$$GetTrainingCourseSessionsResponseModelImplFromJson(
            Map<String, dynamic> json) =>
        _$GetTrainingCourseSessionsResponseModelImpl(
          code: (json['Code'] as num).toInt(),
          message: json['Message'] as String,
          result: json['Result'] as bool,
          data: TrainingSessionsDataModel.fromJson(
              json['Data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$GetTrainingCourseSessionsResponseModelImplToJson(
        _$GetTrainingCourseSessionsResponseModelImpl instance) =>
    <String, dynamic>{
      'Code': instance.code,
      'Message': instance.message,
      'Result': instance.result,
      'Data': instance.data,
    };

_$TrainingSessionsDataModelImpl _$$TrainingSessionsDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TrainingSessionsDataModelImpl(
      sessions: (json['Sessions'] as List<dynamic>)
          .map((e) => TrainingSessionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pager: Pager.fromJson(json['Pager'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TrainingSessionsDataModelImplToJson(
        _$TrainingSessionsDataModelImpl instance) =>
    <String, dynamic>{
      'Sessions': instance.sessions,
      'Pager': instance.pager,
    };

_$TrainingSessionModelImpl _$$TrainingSessionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TrainingSessionModelImpl(
      startDate: json['StartDate'] as String,
      endDate: json['EndDate'] as String,
      registrationDeadline: json['RegistrationDeadline'] as String,
      timeFrom: json['TimeFrom'] as String,
      timeTo: json['TimeTo'] as String,
      numberOfHours: (json['NumberOfHours'] as num).toInt(),
      numberOfDays: (json['NumberOfDays'] as num).toInt(),
      language: (json['Language'] as num).toInt(),
      languageTranslation: TranslationModel.fromJson(
          json['LanguageTranslation'] as Map<String, dynamic>),
      latitude: (json['Latitude'] as num).toDouble(),
      longitude: (json['Longitude'] as num).toDouble(),
      location: (json['Location'] as num).toInt(),
      locationTranslation: TranslationModel.fromJson(
          json['LocationTranslation'] as Map<String, dynamic>),
      address: json['Address'] as String,
      link: json['Link'] as String,
      status: (json['Status'] as num).toInt(),
      statusTranslation: TranslationModel.fromJson(
          json['StatusTranslation'] as Map<String, dynamic>),
      trainingCourseId: (json['TrainingCourseId'] as num).toInt(),
      registered: json['Registered'] as bool,
      id: (json['Id'] as num).toInt(),
    );

Map<String, dynamic> _$$TrainingSessionModelImplToJson(
        _$TrainingSessionModelImpl instance) =>
    <String, dynamic>{
      'StartDate': instance.startDate,
      'EndDate': instance.endDate,
      'RegistrationDeadline': instance.registrationDeadline,
      'TimeFrom': instance.timeFrom,
      'TimeTo': instance.timeTo,
      'NumberOfHours': instance.numberOfHours,
      'NumberOfDays': instance.numberOfDays,
      'Language': instance.language,
      'LanguageTranslation': instance.languageTranslation,
      'Latitude': instance.latitude,
      'Longitude': instance.longitude,
      'Location': instance.location,
      'LocationTranslation': instance.locationTranslation,
      'Address': instance.address,
      'Link': instance.link,
      'Status': instance.status,
      'StatusTranslation': instance.statusTranslation,
      'TrainingCourseId': instance.trainingCourseId,
      'Registered': instance.registered,
      'Id': instance.id,
    };

_$TranslationModelImpl _$$TranslationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TranslationModelImpl(
      key: (json['Key'] as List<dynamic>)
          .map((e) => TranslationItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      value: (json['Value'] as num).toInt(),
    );

Map<String, dynamic> _$$TranslationModelImplToJson(
        _$TranslationModelImpl instance) =>
    <String, dynamic>{
      'Key': instance.key,
      'Value': instance.value,
    };

_$TranslationItemModelImpl _$$TranslationItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TranslationItemModelImpl(
      languageId: (json['LanguageId'] as num).toInt(),
      name: json['Name'] as String,
    );

Map<String, dynamic> _$$TranslationItemModelImplToJson(
        _$TranslationItemModelImpl instance) =>
    <String, dynamic>{
      'LanguageId': instance.languageId,
      'Name': instance.name,
    };
