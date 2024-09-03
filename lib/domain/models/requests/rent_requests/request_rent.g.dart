// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_rent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// RentRequest _$RentRequestFromJson(Map<String, dynamic> json) => RentRequest(
//       areaFrom: json['areaFrom'] as num?,
//       areaTo: json['areaTo'] as num?,
//       bedRoomsCount: json['bedRoomsCount'] as int?,
//       furnitureStatus: json['furnitureStatus'] as int?,
//       issueDateEndMonth: json['issueDateEndMonth'] as int?,
//       issueDateFrom: json['issueDateFrom'] as String?,
//       issueDateQuarterList: (json['issueDateQuarterList'] as List<dynamic>?)
//           ?.map((e) => e as int)
//           .toList(),
//       issueDateStartMonth: json['issueDateStartMonth'] as int?,
//       halfYearDuration: json['halfYearDuration'] as int?,
//       issueDateTo: json['issueDateTo'] as String?,
//       issueDateYear: json['issueDateYear'] as int?,
//       limit: json['limit'] as int?,
//       municipalityId: json['municipalityId'] as int?,
//       offset: json['offset'] as int?,
//       nationalityCode: json['nationalityCode'] as int?,
//       serviceType: json['serviceType'] as int?,
//       propertyTypeList: (json['propertyTypeList'] as List<dynamic>?)
//           ?.map((e) => e as int)
//           .toList(),
//       purposeList: (json['purposeList'] as List<dynamic>?)
//           ?.map((e) => e as int)
//           .toList(),
//       rentPaymentMonthlyPerUnitFrom:
//           json['rentPaymentMonthlyPerUnitFrom'] as num?,
//       rentPaymentMonthlyPerUnitTo: json['rentPaymentMonthlyPerUnitTo'] as num?,
//       zoneId: json['zoneId'] as int?,
//       unit: json['unit'] as int,
//       periodId: json['periodId'] as int,
//     );

Map<String, dynamic> _$RentRequestToJson(RentRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('areaFrom', instance.areaFrom);
  writeNotNull('areaTo', instance.areaTo);
  writeNotNull('bedRoomsCount', instance.bedRoomsCount);
  writeNotNull('furnitureStatus', instance.furnitureStatus);
  writeNotNull('issueDateEndMonth', instance.issueDateEndMonth);
  writeNotNull('issueDateFrom', instance.issueDateFrom);
  writeNotNull('issueDateQuarterList', instance.issueDateQuarterList);
  writeNotNull('issueDateStartMonth', instance.issueDateStartMonth);
  writeNotNull('halfYearDuration', instance.halfYearDuration);
  writeNotNull('issueDateTo', instance.issueDateTo);
  writeNotNull('issueDateYear', instance.issueDateYear);
  writeNotNull('limit', instance.limit);
  writeNotNull('municipalityId', instance.municipalityId);
  writeNotNull('offset', instance.offset);
  writeNotNull('nationalityCode', instance.nationalityCode);
  writeNotNull('serviceType', instance.serviceType);
  writeNotNull('propertyTypeList', instance.propertyTypeList);
  writeNotNull('purposeList', instance.purposeList);
  writeNotNull(
      'rentPaymentMonthlyPerUnitFrom', instance.rentPaymentMonthlyPerUnitFrom);
  writeNotNull(
      'rentPaymentMonthlyPerUnitTo', instance.rentPaymentMonthlyPerUnitTo);
  writeNotNull('zoneId', instance.zoneId);
  val['unit'] = instance.unit;
  val['periodId'] = instance.periodId;
  return val;
}

_$RentRequestImpl _$$RentRequestImplFromJson(Map<String, dynamic> json) =>
    _$RentRequestImpl(
      areaFrom: json['areaFrom'] as num?,
      areaTo: json['areaTo'] as num?,
      bedRoomsCount: json['bedRoomsCount'] as int?,
      furnitureStatus: json['furnitureStatus'] as int?,
      issueDateEndMonth: json['issueDateEndMonth'] as int?,
      issueDateFrom: json['issueDateFrom'] as String?,
      issueDateQuarterList: (json['issueDateQuarterList'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      issueDateStartMonth: json['issueDateStartMonth'] as int?,
      halfYearDuration: json['halfYearDuration'] as int?,
      issueDateTo: json['issueDateTo'] as String?,
      issueDateYear: json['issueDateYear'] as int?,
      limit: json['limit'] as int?,
      municipalityId: json['municipalityId'] as int?,
      offset: json['offset'] as int?,
      nationalityCode: json['nationalityCode'] as int?,
      serviceType: json['serviceType'] as int?,
      propertyTypeList: (json['propertyTypeList'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      purposeList: (json['purposeList'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      rentPaymentMonthlyPerUnitFrom:
          json['rentPaymentMonthlyPerUnitFrom'] as num?,
      rentPaymentMonthlyPerUnitTo: json['rentPaymentMonthlyPerUnitTo'] as num?,
      zoneId: json['zoneId'] as int?,
      unit: json['unit'] as int? ?? 2,
      periodId: json['periodId'] as int? ?? 1,
    );

Map<String, dynamic> _$$RentRequestImplToJson(_$RentRequestImpl instance) =>
    <String, dynamic>{
      'areaFrom': instance.areaFrom,
      'areaTo': instance.areaTo,
      'bedRoomsCount': instance.bedRoomsCount,
      'furnitureStatus': instance.furnitureStatus,
      'issueDateEndMonth': instance.issueDateEndMonth,
      'issueDateFrom': instance.issueDateFrom,
      'issueDateQuarterList': instance.issueDateQuarterList,
      'issueDateStartMonth': instance.issueDateStartMonth,
      'halfYearDuration': instance.halfYearDuration,
      'issueDateTo': instance.issueDateTo,
      'issueDateYear': instance.issueDateYear,
      'limit': instance.limit,
      'municipalityId': instance.municipalityId,
      'offset': instance.offset,
      'nationalityCode': instance.nationalityCode,
      'serviceType': instance.serviceType,
      'propertyTypeList': instance.propertyTypeList,
      'purposeList': instance.purposeList,
      'rentPaymentMonthlyPerUnitFrom': instance.rentPaymentMonthlyPerUnitFrom,
      'rentPaymentMonthlyPerUnitTo': instance.rentPaymentMonthlyPerUnitTo,
      'zoneId': instance.zoneId,
      'unit': instance.unit,
      'periodId': instance.periodId,
    };
