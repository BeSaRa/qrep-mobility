// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_rent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RentRequestImpl _$$RentRequestImplFromJson(Map<String, dynamic> json) =>
    _$RentRequestImpl(
      areaFrom: json['areaFrom'] as num?,
      areaTo: json['areaTo'] as num?,
      bedRoomsCount: (json['bedRoomsCount'] as num?)?.toInt(),
      furnitureStatus: (json['furnitureStatus'] as num?)?.toInt(),
      issueDateEndMonth: (json['issueDateEndMonth'] as num?)?.toInt(),
      issueDateFrom: json['issueDateFrom'] as String?,
      issueDateQuarterList: (json['issueDateQuarterList'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      issueDateStartMonth: (json['issueDateStartMonth'] as num?)?.toInt(),
      halfYearDuration: (json['halfYearDuration'] as num?)?.toInt(),
      issueDateTo: json['issueDateTo'] as String?,
      issueDateYear: (json['issueDateYear'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      municipalityId: (json['municipalityId'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
      nationalityCode: (json['nationalityCode'] as num?)?.toInt(),
      serviceType: (json['serviceType'] as num?)?.toInt(),
      propertyTypeList: (json['propertyTypeList'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      purposeList: (json['purposeList'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      rentPaymentMonthlyPerUnitFrom:
          json['rentPaymentMonthlyPerUnitFrom'] as num?,
      rentPaymentMonthlyPerUnitTo: json['rentPaymentMonthlyPerUnitTo'] as num?,
      zoneId: (json['zoneId'] as num?)?.toInt(),
      areaCode: (json['areaCode'] as num?)?.toInt(),
      unit: (json['unit'] as num?)?.toInt() ?? 2,
      periodId: (json['periodId'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$RentRequestImplToJson(_$RentRequestImpl instance) =>
    <String, dynamic>{
      if (instance.areaFrom case final value?) 'areaFrom': value,
      if (instance.areaTo case final value?) 'areaTo': value,
      if (instance.bedRoomsCount case final value?) 'bedRoomsCount': value,
      if (instance.furnitureStatus case final value?) 'furnitureStatus': value,
      if (instance.issueDateEndMonth case final value?)
        'issueDateEndMonth': value,
      if (instance.issueDateFrom case final value?) 'issueDateFrom': value,
      if (instance.issueDateQuarterList case final value?)
        'issueDateQuarterList': value,
      if (instance.issueDateStartMonth case final value?)
        'issueDateStartMonth': value,
      if (instance.halfYearDuration case final value?)
        'halfYearDuration': value,
      if (instance.issueDateTo case final value?) 'issueDateTo': value,
      if (instance.issueDateYear case final value?) 'issueDateYear': value,
      if (instance.limit case final value?) 'limit': value,
      if (instance.municipalityId case final value?) 'municipalityId': value,
      if (instance.offset case final value?) 'offset': value,
      if (instance.nationalityCode case final value?) 'nationalityCode': value,
      if (instance.serviceType case final value?) 'serviceType': value,
      if (instance.propertyTypeList case final value?)
        'propertyTypeList': value,
      if (instance.purposeList case final value?) 'purposeList': value,
      if (instance.rentPaymentMonthlyPerUnitFrom case final value?)
        'rentPaymentMonthlyPerUnitFrom': value,
      if (instance.rentPaymentMonthlyPerUnitTo case final value?)
        'rentPaymentMonthlyPerUnitTo': value,
      if (instance.zoneId case final value?) 'zoneId': value,
      if (instance.areaCode case final value?) 'areaCode': value,
      'unit': instance.unit,
      'periodId': instance.periodId,
    };
