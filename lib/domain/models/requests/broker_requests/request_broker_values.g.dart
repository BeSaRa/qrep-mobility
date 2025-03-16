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
        _$RequestBrokerValuesImpl instance) =>
    <String, dynamic>{
      if (instance.brokerCategoryId case final value?)
        'brokerCategoryId': value,
      if (instance.limit case final value?) 'limit': value,
      if (instance.municipalityId case final value?) 'municipalityId': value,
      if (instance.offset case final value?) 'offset': value,
      if (instance.brokerName case final value?) 'brokerName': value,
    };
