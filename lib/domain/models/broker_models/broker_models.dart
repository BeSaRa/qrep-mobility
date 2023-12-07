import 'package:freezed_annotation/freezed_annotation.dart';

import '../models.dart';

part 'broker_models.freezed.dart';
part 'broker_models.g.dart';

@freezed
abstract class RealEstateBrokerLookUp with _$RealEstateBrokerLookUp {
  factory RealEstateBrokerLookUp({
    @Default([]) List<RentLookupModel> propertyTypeList,
    @Default([]) List<RentLookupModel> rentPurposeList,
    @Default([]) List<RentLookupModel> zoneList,
    @Default([]) List<RentLookupModel> districtList,
    @Default([]) List<RentLookupModel> municipalityList,
    @Default([]) List<RentLookupModel> brokerCategoryList,
    @Default([]) List<RentLookupModel> brokerTypeList,
  }) = _RealEstateBrokerLookUp;

  factory RealEstateBrokerLookUp.fromJson(Map<String, dynamic> json) =>
      _$RealEstateBrokerLookUpFromJson(json);
}

@freezed
abstract class RealEstateBrokerTransactionData
    with _$RealEstateBrokerTransactionData {
  const factory RealEstateBrokerTransactionData(
      {@Default('') String brokerArDescription,
      @Default('') String brokerArName,
      @Default(0) int brokerCategoryId,
      @Default('') String brokerEmail,
      @Default('') String brokerEnDescription,
      @Default('') String brokerEnName,
      @Default('') String brokerIcon,
      @Default('') String brokerPhone1,
      @Default('') String? brokerPhone2,
      @Default('') String? brokerPhone3,
      @Default(0) int brokerTypeId,
      @Default('') String brokerlicenseNumber,
      @Default(true) bool isActive,
      @Default('') String managerArName,
      @Default('') String managerEnName,
      @Default(0) int municipalityId}) = _RealEstateBrokerTransactionData;

  factory RealEstateBrokerTransactionData.fromJson(Map<String, dynamic> json) =>
      _$RealEstateBrokerTransactionDataFromJson(json);
}

@freezed
abstract class RealEstateBrokerTransactions
    with _$RealEstateBrokerTransactions {
  factory RealEstateBrokerTransactions(
          {@Default(0) int count,
          @Default([]) List<RealEstateBrokerTransactionData> transactionList}) =
      _RealEstateBrokerTransactions;

  factory RealEstateBrokerTransactions.fromJson(Map<String, dynamic> json) =>
      _$RealEstateBrokerTransactionsFromJson(json);
}

@freezed
abstract class RealEstateBrokerKpi1 with _$RealEstateBrokerKpi1 {
  factory RealEstateBrokerKpi1({@Default(0) double kpiVal}) =
      _RealEstateBrokerKpi1;

  factory RealEstateBrokerKpi1.fromJson(Map<String, dynamic> json) =>
      _$RealEstateBrokerKpi1FromJson(json);
}
