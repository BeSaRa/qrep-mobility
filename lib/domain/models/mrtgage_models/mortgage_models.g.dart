// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mortgage_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MortgageTransactionImpl _$$MortgageTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$MortgageTransactionImpl(
      municipalityId: (json['municipalityId'] as num?)?.toInt() ?? 0,
      unitStatus: json['unitStatus'] as String? ?? '',
      realEstateValue: (json['realEstateValue'] as num?)?.toDouble() ?? 0,
      realEstateArea: (json['realEstateArea'] as num?)?.toDouble() ?? 0,
      issueDate: json['issueDate'] as String? ?? '',
      areaCode: (json['areaCode'] as num?)?.toInt() ?? 0,
      seller: json['seller'] as String? ?? '',
      buyer: json['buyer'] as String? ?? '',
      unitNo: json['unitNo'] as String? ?? '',
    );

Map<String, dynamic> _$$MortgageTransactionImplToJson(
        _$MortgageTransactionImpl instance) =>
    <String, dynamic>{
      'municipalityId': instance.municipalityId,
      'unitStatus': instance.unitStatus,
      'realEstateValue': instance.realEstateValue,
      'realEstateArea': instance.realEstateArea,
      'issueDate': instance.issueDate,
      'areaCode': instance.areaCode,
      'seller': instance.seller,
      'buyer': instance.buyer,
      'unitNo': instance.unitNo,
    };

_$MortgageTransactionResponseImpl _$$MortgageTransactionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MortgageTransactionResponseImpl(
      count: (json['count'] as num?)?.toInt() ?? 0,
      transactionList: (json['transactionList'] as List<dynamic>?)
              ?.map((e) =>
                  MortgageTransaction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MortgageTransactionResponseImplToJson(
        _$MortgageTransactionResponseImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'transactionList': instance.transactionList,
    };
