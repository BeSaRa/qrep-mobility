// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_mortgage_values.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// RequestMortgageValues _$RequestMortgageValuesFromJson(
//         Map<String, dynamic> json) =>
//     RequestMortgageValues(
//       areaCode: json['areaCode'] as num,
//       areaFrom: json['areaFrom'] as num?,
//       areaTo: json['areaTo'] as num?,
//       issueDateEndMonth: json['issueDateEndMonth'] as int?,
//       issueDateFrom: json['issueDateFrom'] as String?,
//       issueDateQuarterList: (json['issueDateQuarterList'] as List<dynamic>?)
//           ?.map((e) => e as int)
//           .toList(),
//       issueDateStartMonth: json['issueDateStartMonth'] as int?,
//       issueDateMonth: json['issueDateMonth'] as int?,
//       issueDateTo: json['issueDateTo'] as String?,
//       issueDateYear: json['issueDateYear'] as int?,
//       halfYearDuration: json['halfYearDuration'] as int?,
//       limit: json['limit'] as int?,
//       municipalityId: json['municipalityId'] as int?,
//       offset: json['offset'] as int?,
//       propertyTypeList: (json['propertyTypeList'] as List<dynamic>?)
//           ?.map((e) => e as int)
//           .toList(),
//       purposeList: (json['purposeList'] as List<dynamic>?)
//           ?.map((e) => e as int)
//           .toList(),
//       realEstateValueFrom: json['realEstateValueFrom'] as num?,
//       realEstateValueTo: json['realEstateValueTo'] as num?,
//       zoneId: json['zoneId'] as int?,
//       unit: json['unit'] as int,
//       periodId: json['periodId'] as int,
//     );

Map<String, dynamic> _$RequestMortgageValuesToJson(
    RequestMortgageValues instance) {
  final val = <String, dynamic>{
    'areaCode': instance.areaCode,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('areaFrom', instance.areaFrom);
  writeNotNull('areaTo', instance.areaTo);
  writeNotNull('issueDateEndMonth', instance.issueDateEndMonth);
  writeNotNull('issueDateFrom', instance.issueDateFrom);
  writeNotNull('issueDateQuarterList', instance.issueDateQuarterList);
  writeNotNull('issueDateStartMonth', instance.issueDateStartMonth);
  writeNotNull('issueDateMonth', instance.issueDateMonth);
  writeNotNull('issueDateTo', instance.issueDateTo);
  writeNotNull('issueDateYear', instance.issueDateYear);
  writeNotNull('halfYearDuration', instance.halfYearDuration);
  writeNotNull('limit', instance.limit);
  writeNotNull('municipalityId', instance.municipalityId);
  writeNotNull('offset', instance.offset);
  writeNotNull('propertyTypeList', instance.propertyTypeList);
  writeNotNull('purposeList', instance.purposeList);
  writeNotNull('realEstateValueFrom', instance.realEstateValueFrom);
  writeNotNull('realEstateValueTo', instance.realEstateValueTo);
  writeNotNull('zoneId', instance.zoneId);
  val['unit'] = instance.unit;
  val['periodId'] = instance.periodId;
  return val;
}

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
      halfYearDuration: json['halfYearDuration'] as int?,
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
      'halfYearDuration': instance.halfYearDuration,
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
