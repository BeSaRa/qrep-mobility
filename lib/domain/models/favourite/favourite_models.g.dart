// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavouriteResponseImpl _$$FavouriteResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FavouriteResponseImpl(
      creationTime: json['creationTime'] as String?,
      criteria: json['criteria'] as String? ?? "",
      id: (json['id'] as num?)?.toInt(),
      lastModifiedTime: json['lastModifiedTime'] as String?,
      name: json['name'] as String? ?? "",
      pageDescription: json['pageDescription'] as String?,
      pageName: $enumDecodeNullable(_$IndicatorsEnumMap, json['pageName']) ??
          Indicators.sell,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$$FavouriteResponseImplToJson(
    _$FavouriteResponseImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('creationTime', instance.creationTime);
  writeNotNull('criteria', instance.criteria);
  writeNotNull('id', instance.id);
  writeNotNull('lastModifiedTime', instance.lastModifiedTime);
  writeNotNull('name', instance.name);
  writeNotNull('pageDescription', instance.pageDescription);
  val['pageName'] = _$IndicatorsEnumMap[instance.pageName]!;
  writeNotNull('userId', instance.userId);
  return val;
}

const _$IndicatorsEnumMap = {
  Indicators.broker: '/broker-indicators',
  Indicators.sell: '/sell-indicators',
  Indicators.rental: '/rental-indicators',
  Indicators.mortgage: '/mortgage-indicators',
  Indicators.general: '/general-secretariat',
  Indicators.occupied: '/occupied-and-vacant-indicators',
  Indicators.ownership: '/ownership-indicators',
};

_$CriteriaObjectImpl _$$CriteriaObjectImplFromJson(Map<String, dynamic> json) =>
    _$CriteriaObjectImpl(
      municipalityId: (json['municipalityId'] as num?)?.toInt(),
      areaCode: (json['areaCode'] as num?)?.toInt(),
      propertyTypeList: (json['propertyTypeList'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      purposeList: (json['purposeList'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      issueDateQuarterList: (json['issueDateQuarterList'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      premiseCategoryList: (json['premiseCategoryList'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      bedRoomsCount: (json['bedRoomsCount'] as num?)?.toInt(),
      furnitureStatus: (json['furnitureStatus'] as num?)?.toInt(),
      issueDateYear: (json['issueDateYear'] as num?)?.toInt(),
      issueDateMonth: (json['issueDateMonth'] as num?)?.toInt(),
      issueDateStartMonth: (json['issueDateStartMonth'] as num?)?.toInt(),
      issueDateEndMonth: (json['issueDateEndMonth'] as num?)?.toInt(),
      rentPaymentMonthlyPerUnitFrom:
          (json['rentPaymentMonthlyPerUnitFrom'] as num?)?.toInt(),
      rentPaymentMonthlyPerUnitTo:
          (json['rentPaymentMonthlyPerUnitTo'] as num?)?.toInt(),
      zoneId: (json['zoneId'] as num?)?.toInt(),
      durationType: (json['durationType'] as num?)?.toInt(),
      realEstateValueFrom: (json['realEstateValueFrom'] as num?)?.toDouble(),
      realEstateValueTo: (json['realEstateValueTo'] as num?)?.toDouble(),
      halfYearDuration: (json['halfYearDuration'] as num?)?.toInt(),
      areaFrom: (json['areaFrom'] as num?)?.toDouble(),
      areaTo: (json['areaTo'] as num?)?.toDouble(),
      occupancyStatus: (json['occupancyStatus'] as num?)?.toInt(),
      unit: (json['unit'] as num?)?.toInt(),
      periodId: (json['periodId'] as num?)?.toInt(),
      issueDateFrom: json['issueDateFrom'] as String?,
      issueDateTo: json['issueDateTo'] as String?,
      premiseTypeList: (json['premiseTypeList'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      ownerCategoryCode: json['ownerCategoryCode'] as String?,
      brokerName: json['brokerName'] as String?,
      serviceType: (json['serviceType'] as num?)?.toInt(),
      brokerCategoryId: (json['brokerCategoryId'] as num?)?.toInt(),
      nationalityCode: (json['nationalityCode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CriteriaObjectImplToJson(
    _$CriteriaObjectImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('municipalityId', instance.municipalityId);
  writeNotNull('areaCode', instance.areaCode);
  writeNotNull('propertyTypeList', instance.propertyTypeList);
  writeNotNull('purposeList', instance.purposeList);
  writeNotNull('issueDateQuarterList', instance.issueDateQuarterList);
  writeNotNull('premiseCategoryList', instance.premiseCategoryList);
  writeNotNull('bedRoomsCount', instance.bedRoomsCount);
  writeNotNull('furnitureStatus', instance.furnitureStatus);
  writeNotNull('issueDateYear', instance.issueDateYear);
  writeNotNull('issueDateMonth', instance.issueDateMonth);
  writeNotNull('issueDateStartMonth', instance.issueDateStartMonth);
  writeNotNull('issueDateEndMonth', instance.issueDateEndMonth);
  writeNotNull(
      'rentPaymentMonthlyPerUnitFrom', instance.rentPaymentMonthlyPerUnitFrom);
  writeNotNull(
      'rentPaymentMonthlyPerUnitTo', instance.rentPaymentMonthlyPerUnitTo);
  writeNotNull('zoneId', instance.zoneId);
  writeNotNull('durationType', instance.durationType);
  writeNotNull('realEstateValueFrom', instance.realEstateValueFrom);
  writeNotNull('realEstateValueTo', instance.realEstateValueTo);
  writeNotNull('halfYearDuration', instance.halfYearDuration);
  writeNotNull('areaFrom', instance.areaFrom);
  writeNotNull('areaTo', instance.areaTo);
  writeNotNull('occupancyStatus', instance.occupancyStatus);
  writeNotNull('unit', instance.unit);
  writeNotNull('periodId', instance.periodId);
  writeNotNull('issueDateFrom', instance.issueDateFrom);
  writeNotNull('issueDateTo', instance.issueDateTo);
  writeNotNull('premiseTypeList', instance.premiseTypeList);
  writeNotNull('ownerCategoryCode', instance.ownerCategoryCode);
  writeNotNull('brokerName', instance.brokerName);
  writeNotNull('serviceType', instance.serviceType);
  writeNotNull('brokerCategoryId', instance.brokerCategoryId);
  writeNotNull('nationalityCode', instance.nationalityCode);
  return val;
}
