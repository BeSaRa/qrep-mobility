// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RentDefaultImpl _$$RentDefaultImplFromJson(Map<String, dynamic> json) =>
    _$RentDefaultImpl(
      issueYear: json['issueYear'] as int? ?? 0,
      kpi10PreviousYear: json['kpi10PreviousYear'] as int? ?? 0,
      kpi10Val: json['kpi10Val'] as int? ?? 0,
      kpi13PreviousYear: json['kpi13PreviousYear'] as int? ?? 0,
      kpi13Val: json['kpi13Val'] as int? ?? 0,
      kpi16PreviousYear: json['kpi16PreviousYear'] as int? ?? 0,
      kpi16Val: json['kpi16Val'] as int? ?? 0,
      kpi16_2PreviousYear: json['kpi16_2PreviousYear'] as int? ?? 0,
      kpi16_2Val: json['kpi16_2Val'] as int? ?? 0,
      kpi1PreviousYear: json['kpi1PreviousYear'] as int? ?? 0,
      kpi1Val: json['kpi1Val'] as int? ?? 0,
      kpi4PreviousYear: json['kpi4PreviousYear'] as int? ?? 0,
      kpi4Val: json['kpi4Val'] as int? ?? 0,
      kpi7PreviousYear: json['kpi7PreviousYear'] as int? ?? 0,
      kpi7Val: json['kpi7Val'] as int? ?? 0,
      kpiYoY1: json['kpiYoY1'] as int? ?? 0,
      kpiYoY10: json['kpiYoY10'] as int? ?? 0,
      kpiYoY10Difference: json['kpiYoY10Difference'] as int? ?? 0,
      kpiYoY13: json['kpiYoY13'] as int? ?? 0,
      kpiYoY13Difference: json['kpiYoY13Difference'] as int? ?? 0,
      kpiYoY16: json['kpiYoY16'] as int? ?? 0,
      kpiYoY16Difference: json['kpiYoY16Difference'] as int? ?? 0,
      kpiYoY16_2: json['kpiYoY16_2'] as int? ?? 0,
      kpiYoY16_2Difference: json['kpiYoY16_2Difference'] as int? ?? 0,
      kpiYoY1Difference: json['kpiYoY1Difference'] as int? ?? 0,
      kpiYoY4: json['kpiYoY4'] as int? ?? 0,
      kpiYoY4Difference: json['kpiYoY4Difference'] as int? ?? 0,
      kpiYoY7: json['kpiYoY7'] as int? ?? 0,
      kpiYoY7Difference: json['kpiYoY7Difference'] as int? ?? 0,
    );

Map<String, dynamic> _$$RentDefaultImplToJson(_$RentDefaultImpl instance) =>
    <String, dynamic>{
      'issueYear': instance.issueYear,
      'kpi10PreviousYear': instance.kpi10PreviousYear,
      'kpi10Val': instance.kpi10Val,
      'kpi13PreviousYear': instance.kpi13PreviousYear,
      'kpi13Val': instance.kpi13Val,
      'kpi16PreviousYear': instance.kpi16PreviousYear,
      'kpi16Val': instance.kpi16Val,
      'kpi16_2PreviousYear': instance.kpi16_2PreviousYear,
      'kpi16_2Val': instance.kpi16_2Val,
      'kpi1PreviousYear': instance.kpi1PreviousYear,
      'kpi1Val': instance.kpi1Val,
      'kpi4PreviousYear': instance.kpi4PreviousYear,
      'kpi4Val': instance.kpi4Val,
      'kpi7PreviousYear': instance.kpi7PreviousYear,
      'kpi7Val': instance.kpi7Val,
      'kpiYoY1': instance.kpiYoY1,
      'kpiYoY10': instance.kpiYoY10,
      'kpiYoY10Difference': instance.kpiYoY10Difference,
      'kpiYoY13': instance.kpiYoY13,
      'kpiYoY13Difference': instance.kpiYoY13Difference,
      'kpiYoY16': instance.kpiYoY16,
      'kpiYoY16Difference': instance.kpiYoY16Difference,
      'kpiYoY16_2': instance.kpiYoY16_2,
      'kpiYoY16_2Difference': instance.kpiYoY16_2Difference,
      'kpiYoY1Difference': instance.kpiYoY1Difference,
      'kpiYoY4': instance.kpiYoY4,
      'kpiYoY4Difference': instance.kpiYoY4Difference,
      'kpiYoY7': instance.kpiYoY7,
      'kpiYoY7Difference': instance.kpiYoY7Difference,
    };

_$RentLookupResponseImpl _$$RentLookupResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RentLookupResponseImpl(
      rooms: (json['rooms'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      durations: (json['durations'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      halfYearDurations: (json['halfYearDurations'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      quarterYearDurations: (json['quarterYearDurations'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      spaces: (json['spaces'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      unitStatus: (json['unitStatus'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      propertyTypeList: (json['propertyTypeList'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      rentPurposeList: (json['rentPurposeList'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      zoneList: (json['zoneList'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      districtList: (json['districtList'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      municipalityList: (json['municipalityList'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      furnitureStatusList: (json['furnitureStatusList'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      nationalityList: (json['nationalityList'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      nationalityCategoryList: (json['nationalityCategoryList']
                  as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      genderList: (json['genderList'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      ageCategoryList: (json['ageCategoryList'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      ownerCategoryList: (json['ownerCategoryList'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      maxParams: (json['maxParams'] as List<dynamic>?)
              ?.map((e) => MaxParamsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RentLookupResponseImplToJson(
        _$RentLookupResponseImpl instance) =>
    <String, dynamic>{
      'rooms': instance.rooms,
      'durations': instance.durations,
      'halfYearDurations': instance.halfYearDurations,
      'quarterYearDurations': instance.quarterYearDurations,
      'spaces': instance.spaces,
      'unitStatus': instance.unitStatus,
      'propertyTypeList': instance.propertyTypeList,
      'rentPurposeList': instance.rentPurposeList,
      'zoneList': instance.zoneList,
      'districtList': instance.districtList,
      'municipalityList': instance.municipalityList,
      'furnitureStatusList': instance.furnitureStatusList,
      'nationalityList': instance.nationalityList,
      'nationalityCategoryList': instance.nationalityCategoryList,
      'genderList': instance.genderList,
      'ageCategoryList': instance.ageCategoryList,
      'ownerCategoryList': instance.ownerCategoryList,
      'maxParams': instance.maxParams,
    };

_$RentLookupModelImpl _$$RentLookupModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RentLookupModelImpl(
      value: json['value'] as int? ?? 0,
      yoy: json['yoy'] as int? ?? 0,
      selected: json['selected'] as bool? ?? false,
      url: json['url'] as String? ?? '',
      hasPrice: json['hasPrice'] as bool? ?? false,
      id: json['id'] as int? ?? 0,
      lookupKey: json['lookupKey'] as int? ?? 0,
      arName: json['arName'] as String? ?? '',
      enName: json['enName'] as String? ?? '',
      municipalityId: json['municipalityId'] as int? ?? 0,
      isActive: json['isActive'] as bool? ?? false,
    );

Map<String, dynamic> _$$RentLookupModelImplToJson(
        _$RentLookupModelImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'yoy': instance.yoy,
      'selected': instance.selected,
      'url': instance.url,
      'hasPrice': instance.hasPrice,
      'id': instance.id,
      'lookupKey': instance.lookupKey,
      'arName': instance.arName,
      'enName': instance.enName,
      'municipalityId': instance.municipalityId,
      'isActive': instance.isActive,
    };

_$MaxParamsModelImpl _$$MaxParamsModelImplFromJson(Map<String, dynamic> json) =>
    _$MaxParamsModelImpl(
      id: json['id'] as int? ?? 0,
      fieldName: json['fieldName'] as String? ?? '',
      minVal: json['minVal'] as int? ?? 0,
      maxVal: json['maxVal'] as int? ?? 0,
      model: json['model'] as String? ?? '',
      isActive: json['isActive'] as bool? ?? false,
    );

Map<String, dynamic> _$$MaxParamsModelImplToJson(
        _$MaxParamsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fieldName': instance.fieldName,
      'minVal': instance.minVal,
      'maxVal': instance.maxVal,
      'model': instance.model,
      'isActive': instance.isActive,
    };
