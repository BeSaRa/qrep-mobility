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
    _$RequestSellValuesImpl instance) {
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
  writeNotNull('halfYearDuration', instance.halfYearDuration);
  writeNotNull('issueDateTo', instance.issueDateTo);
  writeNotNull('issueDateYear', instance.issueDateYear);
  writeNotNull('limit', instance.limit);
  writeNotNull('municipalityId', instance.municipalityId);
  writeNotNull('offset', instance.offset);
  writeNotNull('propertyTypeList', instance.propertyTypeList);
  writeNotNull('purposeList', instance.purposeList);
  writeNotNull('realEstateValueFrom', instance.realEstateValueFrom);
  writeNotNull('realEstateValueTo', instance.realEstateValueTo);
  writeNotNull('zoneId', instance.zoneId);
  writeNotNull('unit', instance.unit);
  val['periodId'] = instance.periodId;
  return val;
}
