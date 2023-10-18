// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_mean_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestMeanValueImpl _$$RequestMeanValueImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestMeanValueImpl(
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
      issueDateTo: json['issueDateTo'] as String?,
      issueDateYear: json['issueDateYear'] as int?,
      limit: json['limit'] as int?,
      municipalityId: json['municipalityId'] as int?,
      offset: json['offset'] as int?,
      propertyTypeList: (json['propertyTypeList'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      purposeList: (json['purposeList'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      rentPaymentMonthlyPerUnitFrom:
          json['rentPaymentMonthlyPerUnitFrom'] as num?,
      rentPaymentMonthlyPerUnitTo: json['rentPaymentMonthlyPerUnitTo'] as num?,
      streetNo: json['streetNo'] as int?,
      zoneId: json['zoneId'] as int?,
      unit: json['unit'] as int? ?? 1,
      periodId: json['periodId'] as int? ?? 1,
    );

Map<String, dynamic> _$$RequestMeanValueImplToJson(
        _$RequestMeanValueImpl instance) =>
    <String, dynamic>{
      'areaFrom': instance.areaFrom,
      'areaTo': instance.areaTo,
      'bedRoomsCount': instance.bedRoomsCount,
      'furnitureStatus': instance.furnitureStatus,
      'issueDateEndMonth': instance.issueDateEndMonth,
      'issueDateFrom': instance.issueDateFrom,
      'issueDateQuarterList': instance.issueDateQuarterList,
      'issueDateStartMonth': instance.issueDateStartMonth,
      'issueDateTo': instance.issueDateTo,
      'issueDateYear': instance.issueDateYear,
      'limit': instance.limit,
      'municipalityId': instance.municipalityId,
      'offset': instance.offset,
      'propertyTypeList': instance.propertyTypeList,
      'purposeList': instance.purposeList,
      'rentPaymentMonthlyPerUnitFrom': instance.rentPaymentMonthlyPerUnitFrom,
      'rentPaymentMonthlyPerUnitTo': instance.rentPaymentMonthlyPerUnitTo,
      'streetNo': instance.streetNo,
      'zoneId': instance.zoneId,
      'unit': instance.unit,
      'periodId': instance.periodId,
    };
