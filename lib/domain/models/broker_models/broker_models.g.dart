// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'broker_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RealEstateBrokerLookUpImpl _$$RealEstateBrokerLookUpImplFromJson(
        Map<String, dynamic> json) =>
    _$RealEstateBrokerLookUpImpl(
      propertyTypeList: (json['propertyTypeList'] as List<dynamic>?)
              ?.map((e) => LookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      rentPurposeList: (json['rentPurposeList'] as List<dynamic>?)
              ?.map((e) => LookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      zoneList: (json['zoneList'] as List<dynamic>?)
              ?.map((e) => LookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      districtList: (json['districtList'] as List<dynamic>?)
              ?.map((e) => LookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      municipalityList: (json['municipalityList'] as List<dynamic>?)
              ?.map((e) => LookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      brokerCategoryList: (json['brokerCategoryList'] as List<dynamic>?)
              ?.map((e) => LookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      brokerTypeList: (json['brokerTypeList'] as List<dynamic>?)
              ?.map((e) => LookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RealEstateBrokerLookUpImplToJson(
        _$RealEstateBrokerLookUpImpl instance) =>
    <String, dynamic>{
      'propertyTypeList': instance.propertyTypeList,
      'rentPurposeList': instance.rentPurposeList,
      'zoneList': instance.zoneList,
      'districtList': instance.districtList,
      'municipalityList': instance.municipalityList,
      'brokerCategoryList': instance.brokerCategoryList,
      'brokerTypeList': instance.brokerTypeList,
    };

_$RealEstateBrokerTransactionDataImpl
    _$$RealEstateBrokerTransactionDataImplFromJson(Map<String, dynamic> json) =>
        _$RealEstateBrokerTransactionDataImpl(
          brokerArDescription: json['brokerArDescription'] as String? ?? '',
          brokerArName: json['brokerArName'] as String? ?? '',
          brokerCategoryId: (json['brokerCategoryId'] as num?)?.toInt() ?? 0,
          brokerEmail: json['brokerEmail'] as String? ?? '',
          brokerEnDescription: json['brokerEnDescription'] as String? ?? '',
          brokerEnName: json['brokerEnName'] as String? ?? '',
          brokerIcon: json['brokerIcon'] as String? ?? '',
          brokerPhone1: json['brokerPhone1'] as String? ?? '',
          brokerPhone2: json['brokerPhone2'] as String? ?? '',
          brokerPhone3: json['brokerPhone3'] as String? ?? '',
          brokerTypeId: (json['brokerTypeId'] as num?)?.toInt() ?? 0,
          brokerlicenseNumber: json['brokerlicenseNumber'] as String? ?? '',
          isActive: json['isActive'] as bool? ?? true,
          managerArName: json['managerArName'] as String? ?? '',
          managerEnName: json['managerEnName'] as String? ?? '',
          zoneNo: (json['zoneNo'] as num?)?.toDouble() ?? 0,
          streetNo: (json['streetNo'] as num?)?.toDouble() ?? 0,
          buuildingNo: (json['buuildingNo'] as num?)?.toDouble() ?? 0,
          municipalityId: (json['municipalityId'] as num?)?.toInt() ?? 0,
        );

Map<String, dynamic> _$$RealEstateBrokerTransactionDataImplToJson(
        _$RealEstateBrokerTransactionDataImpl instance) =>
    <String, dynamic>{
      'brokerArDescription': instance.brokerArDescription,
      'brokerArName': instance.brokerArName,
      'brokerCategoryId': instance.brokerCategoryId,
      'brokerEmail': instance.brokerEmail,
      'brokerEnDescription': instance.brokerEnDescription,
      'brokerEnName': instance.brokerEnName,
      'brokerIcon': instance.brokerIcon,
      'brokerPhone1': instance.brokerPhone1,
      'brokerPhone2': instance.brokerPhone2,
      'brokerPhone3': instance.brokerPhone3,
      'brokerTypeId': instance.brokerTypeId,
      'brokerlicenseNumber': instance.brokerlicenseNumber,
      'isActive': instance.isActive,
      'managerArName': instance.managerArName,
      'managerEnName': instance.managerEnName,
      'zoneNo': instance.zoneNo,
      'streetNo': instance.streetNo,
      'buuildingNo': instance.buuildingNo,
      'municipalityId': instance.municipalityId,
    };

_$RealEstateBrokerTransactionsImpl _$$RealEstateBrokerTransactionsImplFromJson(
        Map<String, dynamic> json) =>
    _$RealEstateBrokerTransactionsImpl(
      count: (json['count'] as num?)?.toInt() ?? 0,
      transactionList: (json['transactionList'] as List<dynamic>?)
              ?.map((e) => RealEstateBrokerTransactionData.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RealEstateBrokerTransactionsImplToJson(
        _$RealEstateBrokerTransactionsImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'transactionList': instance.transactionList,
    };

_$RealEstateBrokerKpi1Impl _$$RealEstateBrokerKpi1ImplFromJson(
        Map<String, dynamic> json) =>
    _$RealEstateBrokerKpi1Impl(
      kpiVal: (json['kpiVal'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$RealEstateBrokerKpi1ImplToJson(
        _$RealEstateBrokerKpi1Impl instance) =>
    <String, dynamic>{
      'kpiVal': instance.kpiVal,
    };
