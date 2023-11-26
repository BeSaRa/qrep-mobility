// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'broker_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RealEstateBrokerLookUpImpl _$$RealEstateBrokerLookUpImplFromJson(
        Map<String, dynamic> json) =>
    _$RealEstateBrokerLookUpImpl(
      ageCategoryList: (json['ageCategoryList'] as List<dynamic>?)
              ?.map(
                  (e) => BrokerLookUpModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      brokerCategoryList: (json['brokerCategoryList'] as List<dynamic>?)
              ?.map(
                  (e) => BrokerLookUpModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      brokerTypeList: (json['brokerTypeList'] as List<dynamic>?)
              ?.map(
                  (e) => BrokerLookUpModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      districtList: (json['districtList'] as List<dynamic>?)
              ?.map(
                  (e) => BrokerLookUpModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      furnitureStatusList: (json['furnitureStatusList'] as List<dynamic>?)
              ?.map(
                  (e) => BrokerLookUpModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      genderList: (json['genderList'] as List<dynamic>?)
              ?.map(
                  (e) => BrokerLookUpModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      maxParams: (json['maxParams'] as List<dynamic>?)
              ?.map(
                  (e) => BrokerLookUpModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      municipalityList: (json['municipalityList'] as List<dynamic>?)
              ?.map(
                  (e) => BrokerLookUpModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      nationalityCategoryList: (json['nationalityCategoryList']
                  as List<dynamic>?)
              ?.map(
                  (e) => BrokerLookUpModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      nationalityList: (json['nationalityList'] as List<dynamic>?)
              ?.map(
                  (e) => BrokerLookUpModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      occupancyStatusList: (json['occupancyStatusList'] as List<dynamic>?)
              ?.map(
                  (e) => BrokerLookUpModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      ownerCategoryList: (json['ownerCategoryList'] as List<dynamic>?)
              ?.map(
                  (e) => BrokerLookUpModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      premiseCategoryList: (json['premiseCategoryList'] as List<dynamic>?)
              ?.map(
                  (e) => BrokerLookUpModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      premiseTypeList: (json['premiseTypeList'] as List<dynamic>?)
              ?.map(
                  (e) => BrokerLookUpModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      propertyTypeList: (json['propertyTypeList'] as List<dynamic>?)
              ?.map(
                  (e) => BrokerLookUpModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      rentPurposeList: json['rentPurposeList'],
      zoneList: json['zoneList'],
    );

Map<String, dynamic> _$$RealEstateBrokerLookUpImplToJson(
        _$RealEstateBrokerLookUpImpl instance) =>
    <String, dynamic>{
      'ageCategoryList': instance.ageCategoryList,
      'brokerCategoryList': instance.brokerCategoryList,
      'brokerTypeList': instance.brokerTypeList,
      'districtList': instance.districtList,
      'furnitureStatusList': instance.furnitureStatusList,
      'genderList': instance.genderList,
      'maxParams': instance.maxParams,
      'municipalityList': instance.municipalityList,
      'nationalityCategoryList': instance.nationalityCategoryList,
      'nationalityList': instance.nationalityList,
      'occupancyStatusList': instance.occupancyStatusList,
      'ownerCategoryList': instance.ownerCategoryList,
      'premiseCategoryList': instance.premiseCategoryList,
      'premiseTypeList': instance.premiseTypeList,
      'propertyTypeList': instance.propertyTypeList,
      'rentPurposeList': instance.rentPurposeList,
      'zoneList': instance.zoneList,
    };

_$BrokerLookUpModelImpl _$$BrokerLookUpModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BrokerLookUpModelImpl(
      arName: json['arName'] as String? ?? '',
      enName: json['enName'] as String? ?? '',
      isActive: json['isActive'] as bool? ?? true,
      lookupKey: json['lookupKey'] as int? ?? 0,
      municipalityId: json['municipalityId'] as int? ?? 0,
      id: json['id'] as int? ?? 0,
      fieldName: json['fieldName'] as String? ?? '',
      maxVal: json['maxVal'] as int? ?? 0,
      minVal: json['minVal'] as int? ?? 0,
      model: json['model'] as String? ?? '',
      nationalityCode: json['nationalityCode'] as int? ?? 0,
    );

Map<String, dynamic> _$$BrokerLookUpModelImplToJson(
        _$BrokerLookUpModelImpl instance) =>
    <String, dynamic>{
      'arName': instance.arName,
      'enName': instance.enName,
      'isActive': instance.isActive,
      'lookupKey': instance.lookupKey,
      'municipalityId': instance.municipalityId,
      'id': instance.id,
      'fieldName': instance.fieldName,
      'maxVal': instance.maxVal,
      'minVal': instance.minVal,
      'model': instance.model,
      'nationalityCode': instance.nationalityCode,
    };
