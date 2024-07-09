// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavouriteResponseImpl _$$FavouriteResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FavouriteResponseImpl(
      creationTime: json['creationTime'] as String? ?? "",
      criteria: json['criteria'] as String? ?? "",
      id: json['id'] as int? ?? 0,
      lastModifiedTime: json['lastModifiedTime'] as String? ?? "",
      name: json['name'] as String? ?? "",
      pageDescription: json['pageDescription'] as String? ?? "",
      pageName: $enumDecodeNullable(_$IndicatorsEnumMap, json['pageName']) ??
          Indicators.sell,
      userId: json['userId'] as String? ?? "",
    );

Map<String, dynamic> _$$FavouriteResponseImplToJson(
        _$FavouriteResponseImpl instance) =>
    <String, dynamic>{
      'creationTime': instance.creationTime,
      'criteria': instance.criteria,
      'id': instance.id,
      'lastModifiedTime': instance.lastModifiedTime,
      'name': instance.name,
      'pageDescription': instance.pageDescription,
      'pageName': _$IndicatorsEnumMap[instance.pageName]!,
      'userId': instance.userId,
    };

const _$IndicatorsEnumMap = {
  Indicators.broker: '/broker-indicators',
  Indicators.sell: '/sell-indicators',
  Indicators.rental: '/rental-indicators',
  Indicators.mortgage: '/mortgage-indicators',
  Indicators.general: '/general-secretariat',
  Indicators.occupied: '/occupied-and-vacant-indicators',
  Indicators.ownership: '/ownership-indicators',
};
