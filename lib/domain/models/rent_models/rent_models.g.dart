// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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

_$BaseRentResponseImpl _$$BaseRentResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BaseRentResponseImpl(
      issueYear: json['issueYear'] as int? ?? 0,
      kpiPreviousYear: json['kpiPreviousYear'] as int? ?? 0,
      kpiVal: json['kpiVal'] as int? ?? 0,
      kpiYoYDifference: json['kpiYoYDifference'] as int? ?? 0,
      kpiYoYVal: json['kpiYoYVal'] as int? ?? 0,
      purposeId: json['purposeId'] as int? ?? 0,
      propertyTypeId: json['propertyTypeId'] as int? ?? 0,
    );

Map<String, dynamic> _$$BaseRentResponseImplToJson(
        _$BaseRentResponseImpl instance) =>
    <String, dynamic>{
      'issueYear': instance.issueYear,
      'kpiPreviousYear': instance.kpiPreviousYear,
      'kpiVal': instance.kpiVal,
      'kpiYoYDifference': instance.kpiYoYDifference,
      'kpiYoYVal': instance.kpiYoYVal,
      'purposeId': instance.purposeId,
      'propertyTypeId': instance.propertyTypeId,
    };

_$MeanAreaResponseImpl _$$MeanAreaResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MeanAreaResponseImpl(
      issueYear: json['issueYear'] as int? ?? 0,
      kpi2PreviousYear: json['kpi2PreviousYear'] as int? ?? 0,
      kpi2Val: json['kpi2Val'] as int? ?? 0,
      kpi2YoYDifference: json['kpi2YoYDifference'] as int? ?? 0,
      kpi2YoYVal: json['kpi2YoYVal'] as int? ?? 0,
      kpiPreviousYear: json['kpiPreviousYear'] as int? ?? 0,
      kpiVal: json['kpiVal'] as int? ?? 0,
      kpiYoYDifference: json['kpiYoYDifference'] as int? ?? 0,
      kpiYoYVal: json['kpiYoYVal'] as int? ?? 0,
    );

Map<String, dynamic> _$$MeanAreaResponseImplToJson(
        _$MeanAreaResponseImpl instance) =>
    <String, dynamic>{
      'issueYear': instance.issueYear,
      'kpi2PreviousYear': instance.kpi2PreviousYear,
      'kpi2Val': instance.kpi2Val,
      'kpi2YoYDifference': instance.kpi2YoYDifference,
      'kpi2YoYVal': instance.kpi2YoYVal,
      'kpiPreviousYear': instance.kpiPreviousYear,
      'kpiVal': instance.kpiVal,
      'kpiYoYDifference': instance.kpiYoYDifference,
      'kpiYoYVal': instance.kpiYoYVal,
    };
