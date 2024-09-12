// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SellTransactionImpl _$$SellTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$SellTransactionImpl(
      areaCode: (json['areaCode'] as num?)?.toInt() ?? 0,
      issueDate: json['issueDate'] as String? ?? '',
      municipalityId: (json['municipalityId'] as num?)?.toInt() ?? 0,
      priceMT: (json['priceMT'] as num?)?.toDouble() ?? 0,
      priceSQ: (json['priceSQ'] as num?)?.toDouble() ?? 0,
      realEstateMT: (json['realEstateMT'] as num?)?.toDouble() ?? 0,
      realEstateSQT: (json['realEstateSQT'] as num?)?.toDouble() ?? 0,
      realEstateValue: (json['realEstateValue'] as num?)?.toDouble() ?? 0,
      roi: (json['roi'] as num?)?.toDouble() ?? 0,
      soldTo: json['soldTo'] as String? ?? '',
      unitNo: (json['unitNo'] as num?)?.toDouble() ?? 0,
      unitStatus: (json['unitStatus'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$SellTransactionImplToJson(
        _$SellTransactionImpl instance) =>
    <String, dynamic>{
      'areaCode': instance.areaCode,
      'issueDate': instance.issueDate,
      'municipalityId': instance.municipalityId,
      'priceMT': instance.priceMT,
      'priceSQ': instance.priceSQ,
      'realEstateMT': instance.realEstateMT,
      'realEstateSQT': instance.realEstateSQT,
      'realEstateValue': instance.realEstateValue,
      'roi': instance.roi,
      'soldTo': instance.soldTo,
      'unitNo': instance.unitNo,
      'unitStatus': instance.unitStatus,
    };

_$SellResponseImpl _$$SellResponseImplFromJson(Map<String, dynamic> json) =>
    _$SellResponseImpl(
      count: (json['count'] as num?)?.toInt() ?? 0,
      transactionList: (json['transactionList'] as List<dynamic>?)
              ?.map((e) => SellTransaction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SellResponseImplToJson(_$SellResponseImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'transactionList': instance.transactionList,
    };
