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
        _$FavouriteResponseImpl instance) =>
    <String, dynamic>{
      if (instance.creationTime case final value?) 'creationTime': value,
      if (instance.criteria case final value?) 'criteria': value,
      if (instance.id case final value?) 'id': value,
      if (instance.lastModifiedTime case final value?)
        'lastModifiedTime': value,
      if (instance.name case final value?) 'name': value,
      if (instance.pageDescription case final value?) 'pageDescription': value,
      'pageName': _$IndicatorsEnumMap[instance.pageName]!,
      if (instance.userId case final value?) 'userId': value,
    };

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
        _$CriteriaObjectImpl instance) =>
    <String, dynamic>{
      if (instance.municipalityId case final value?) 'municipalityId': value,
      if (instance.areaCode case final value?) 'areaCode': value,
      if (instance.propertyTypeList case final value?)
        'propertyTypeList': value,
      if (instance.purposeList case final value?) 'purposeList': value,
      if (instance.issueDateQuarterList case final value?)
        'issueDateQuarterList': value,
      if (instance.premiseCategoryList case final value?)
        'premiseCategoryList': value,
      if (instance.bedRoomsCount case final value?) 'bedRoomsCount': value,
      if (instance.furnitureStatus case final value?) 'furnitureStatus': value,
      if (instance.issueDateYear case final value?) 'issueDateYear': value,
      if (instance.issueDateMonth case final value?) 'issueDateMonth': value,
      if (instance.issueDateStartMonth case final value?)
        'issueDateStartMonth': value,
      if (instance.issueDateEndMonth case final value?)
        'issueDateEndMonth': value,
      if (instance.rentPaymentMonthlyPerUnitFrom case final value?)
        'rentPaymentMonthlyPerUnitFrom': value,
      if (instance.rentPaymentMonthlyPerUnitTo case final value?)
        'rentPaymentMonthlyPerUnitTo': value,
      if (instance.zoneId case final value?) 'zoneId': value,
      if (instance.durationType case final value?) 'durationType': value,
      if (instance.realEstateValueFrom case final value?)
        'realEstateValueFrom': value,
      if (instance.realEstateValueTo case final value?)
        'realEstateValueTo': value,
      if (instance.halfYearDuration case final value?)
        'halfYearDuration': value,
      if (instance.areaFrom case final value?) 'areaFrom': value,
      if (instance.areaTo case final value?) 'areaTo': value,
      if (instance.occupancyStatus case final value?) 'occupancyStatus': value,
      if (instance.unit case final value?) 'unit': value,
      if (instance.periodId case final value?) 'periodId': value,
      if (instance.issueDateFrom case final value?) 'issueDateFrom': value,
      if (instance.issueDateTo case final value?) 'issueDateTo': value,
      if (instance.premiseTypeList case final value?) 'premiseTypeList': value,
      if (instance.ownerCategoryCode case final value?)
        'ownerCategoryCode': value,
      if (instance.brokerName case final value?) 'brokerName': value,
      if (instance.serviceType case final value?) 'serviceType': value,
      if (instance.brokerCategoryId case final value?)
        'brokerCategoryId': value,
      if (instance.nationalityCode case final value?) 'nationalityCode': value,
    };
