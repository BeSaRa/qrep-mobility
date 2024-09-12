// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_broker_values.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestBrokerValuesImpl _$$RequestBrokerValuesImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestBrokerValuesImpl(
      brokerCategoryId: (json['brokerCategoryId'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      municipalityId: (json['municipalityId'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
      brokerName: json['brokerName'] as String?,
    );

Map<String, dynamic> _$$RequestBrokerValuesImplToJson(
    _$RequestBrokerValuesImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('brokerCategoryId', instance.brokerCategoryId);
  writeNotNull('limit', instance.limit);
  writeNotNull('municipalityId', instance.municipalityId);
  writeNotNull('offset', instance.offset);
  writeNotNull('brokerName', instance.brokerName);
  return val;
}
