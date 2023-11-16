// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_mortgage_values.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestMortgageValuesImpl _$$RequestMortgageValuesImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestMortgageValuesImpl(
      areaCode: json['areaCode'] as num? ?? -1,
      areaFrom: json['areaFrom'] as num?,
      areaTo: json['areaTo'] as num?,
      issueDateEndMonth: json['issueDateEndMonth'] as int?,
      issueDateFrom: json['issueDateFrom'] as String?,
      issueDateQuarterList: (json['issueDateQuarterList'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      issueDateStartMonth: json['issueDateStartMonth'] as int?,
      issueDateMonth: json['issueDateMonth'] as int?,
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
      realEstateValueFrom: json['realEstateValueFrom'] as num?,
      realEstateValueTo: json['realEstateValueTo'] as num?,
      zoneId: json['zoneId'] as int?,
      unit: json['unit'] as int? ?? 2,
      periodId: json['periodId'] as int? ?? 1,
    );

Map<String, dynamic> _$$RequestMortgageValuesImplToJson(
        _$RequestMortgageValuesImpl instance) =>
    <String, dynamic>{
      'areaCode': instance.areaCode,
      'areaFrom': instance.areaFrom,
      'areaTo': instance.areaTo,
      'issueDateEndMonth': instance.issueDateEndMonth,
      'issueDateFrom': instance.issueDateFrom,
      'issueDateQuarterList': instance.issueDateQuarterList,
      'issueDateStartMonth': instance.issueDateStartMonth,
      'issueDateMonth': instance.issueDateMonth,
      'issueDateTo': instance.issueDateTo,
      'issueDateYear': instance.issueDateYear,
      'limit': instance.limit,
      'municipalityId': instance.municipalityId,
      'offset': instance.offset,
      'propertyTypeList': instance.propertyTypeList,
      'purposeList': instance.purposeList,
      'realEstateValueFrom': instance.realEstateValueFrom,
      'realEstateValueTo': instance.realEstateValueTo,
      'zoneId': instance.zoneId,
      'unit': instance.unit,
      'periodId': instance.periodId,
    };
