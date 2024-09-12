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
      unit: (json['unit'] as num?)?.toInt() ?? 2,
      periodId: (json['periodId'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$RentRequestImplToJson(_$RentRequestImpl instance) {
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
