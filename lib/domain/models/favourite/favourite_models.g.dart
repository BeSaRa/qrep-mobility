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
      id: json['id'] as int?,
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
      municipalityId: json['municipalityId'] as int?,
      areaCode: json['areaCode'] as int?,
      propertyTypeList: (json['propertyTypeList'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      purposeList: (json['purposeList'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      issueDateQuarterList: (json['issueDateQuarterList'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      premiseCategoryList: (json['premiseCategoryList'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      bedRoomsCount: json['bedRoomsCount'] as int?,
      furnitureStatus: json['furnitureStatus'] as int?,
      issueDateYear: json['issueDateYear'] as int?,
      issueDateMonth: json['issueDateMonth'] as int?,
      issueDateStartMonth: json['issueDateStartMonth'] as int?,
      issueDateEndMonth: json['issueDateEndMonth'] as int?,
      rentPaymentMonthlyPerUnitFrom:
          json['rentPaymentMonthlyPerUnitFrom'] as int?,
      rentPaymentMonthlyPerUnitTo: json['rentPaymentMonthlyPerUnitTo'] as int?,
      zoneId: json['zoneId'] as int?,
      durationType: json['durationType'] as int?,
      realEstateValueFrom: json['realEstateValueFrom'] as int?,
      realEstateValueTo: json['realEstateValueTo'] as int?,
      halfYearDuration: json['halfYearDuration'] as int?,
      areaFrom: (json['areaFrom'] as num?)?.toDouble(),
      areaTo: (json['areaTo'] as num?)?.toDouble(),
      occupancyStatus: json['occupancyStatus'] as int?,
      unit: json['unit'] as int?,
      periodId: json['periodId'] as int?,
      issueDateFrom: json['issueDateFrom'] as String?,
      issueDateTo: json['issueDateTo'] as String?,
      premiseTypeList: (json['premiseTypeList'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      ownerCategoryCode: json['ownerCategoryCode'] as String?,
      brokerName: json['brokerName'] as String?,
      brokerCategoryId: json['brokerCategoryId'] as int?,
      nationalityCode: json['nationalityCode'] as int?,
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
  writeNotNull('brokerCategoryId', instance.brokerCategoryId);
  writeNotNull('nationalityCode', instance.nationalityCode);
  return val;
}
