// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_broker_values.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// RequestBrokerValues _$RequestBrokerValuesFromJson(Map<String, dynamic> json) =>
//     RequestBrokerValues(
//       brokerCategoryId: json['brokerCategoryId'] as int?,
//       limit: json['limit'] as int?,
//       municipalityId: json['municipalityId'] as int?,
//       offset: json['offset'] as int?,
//       brokerName: json['brokerName'] as String?,
//     );

Map<String, dynamic> _$RequestBrokerValuesToJson(RequestBrokerValues instance) {
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

_$RequestBrokerValuesImpl _$$RequestBrokerValuesImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestBrokerValuesImpl(
      brokerCategoryId: json['brokerCategoryId'] as int?,
      limit: json['limit'] as int?,
      municipalityId: json['municipalityId'] as int?,
      offset: json['offset'] as int?,
      brokerName: json['brokerName'] as String?,
    );

Map<String, dynamic> _$$RequestBrokerValuesImplToJson(
        _$RequestBrokerValuesImpl instance) =>
    <String, dynamic>{
      'brokerCategoryId': instance.brokerCategoryId,
      'limit': instance.limit,
      'municipalityId': instance.municipalityId,
      'offset': instance.offset,
      'brokerName': instance.brokerName,
    };
