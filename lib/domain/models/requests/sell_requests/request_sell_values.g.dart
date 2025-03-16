// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_sell_values.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestSellValuesImpl _$$RequestSellValuesImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestSellValuesImpl(
      areaCode: json['areaCode'] as num? ?? -1,
      areaFrom: json['areaFrom'] as num?,
      areaTo: json['areaTo'] as num?,
      issueDateEndMonth: (json['issueDateEndMonth'] as num?)?.toInt(),
      issueDateFrom: json['issueDateFrom'] as String?,
      issueDateQuarterList: (json['issueDateQuarterList'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      issueDateStartMonth: (json['issueDateStartMonth'] as num?)?.toInt(),
      issueDateMonth: (json['issueDateMonth'] as num?)?.toInt(),
      halfYearDuration: (json['halfYearDuration'] as num?)?.toInt(),
      issueDateTo: json['issueDateTo'] as String?,
      issueDateYear: (json['issueDateYear'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      municipalityId: (json['municipalityId'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
      propertyTypeList: (json['propertyTypeList'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      purposeList: (json['purposeList'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      realEstateValueFrom: json['realEstateValueFrom'] as num?,
      realEstateValueTo: json['realEstateValueTo'] as num?,
      zoneId: (json['zoneId'] as num?)?.toInt(),
      unit: (json['unit'] as num?)?.toInt() ?? 2,
      periodId: (json['periodId'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$RequestSellValuesImplToJson(
        _$RequestSellValuesImpl instance) =>
    <String, dynamic>{
      'areaCode': instance.areaCode,
      if (instance.areaFrom case final value?) 'areaFrom': value,
      if (instance.areaTo case final value?) 'areaTo': value,
      if (instance.issueDateEndMonth case final value?)
        'issueDateEndMonth': value,
      if (instance.issueDateFrom case final value?) 'issueDateFrom': value,
      if (instance.issueDateQuarterList case final value?)
        'issueDateQuarterList': value,
      if (instance.issueDateStartMonth case final value?)
        'issueDateStartMonth': value,
      if (instance.issueDateMonth case final value?) 'issueDateMonth': value,
      if (instance.halfYearDuration case final value?)
        'halfYearDuration': value,
      if (instance.issueDateTo case final value?) 'issueDateTo': value,
      if (instance.issueDateYear case final value?) 'issueDateYear': value,
      if (instance.limit case final value?) 'limit': value,
      if (instance.municipalityId case final value?) 'municipalityId': value,
      if (instance.offset case final value?) 'offset': value,
      if (instance.propertyTypeList case final value?)
        'propertyTypeList': value,
      if (instance.purposeList case final value?) 'purposeList': value,
      if (instance.realEstateValueFrom case final value?)
        'realEstateValueFrom': value,
      if (instance.realEstateValueTo case final value?)
        'realEstateValueTo': value,
      if (instance.zoneId case final value?) 'zoneId': value,
      if (instance.unit case final value?) 'unit': value,
      'periodId': instance.periodId,
    };
