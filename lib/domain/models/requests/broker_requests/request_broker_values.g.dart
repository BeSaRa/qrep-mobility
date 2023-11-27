// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_broker_values.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestBrokerValuesImpl _$$RequestBrokerValuesImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestBrokerValuesImpl(
      brokerCategoryId: json['brokerCategoryId'] as int?,
      limit: json['limit'] as int?,
      municipalityId: json['municipalityId'] as int?,
      offset: json['offset'] as int?,
    );

Map<String, dynamic> _$$RequestBrokerValuesImplToJson(
        _$RequestBrokerValuesImpl instance) =>
    <String, dynamic>{
      'brokerCategoryId': instance.brokerCategoryId,
      'limit': instance.limit,
      'municipalityId': instance.municipalityId,
      'offset': instance.offset,
    };
