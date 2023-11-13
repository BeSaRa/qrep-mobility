import 'package:freezed_annotation/freezed_annotation.dart';

part 'sell_models.freezed.dart';
part 'sell_models.g.dart';

@freezed
abstract class SellTransaction with _$SellTransaction {
  const factory SellTransaction(
      {@Default(0) int? areaCode,
      @Default('') String? issueDate,
      @Default(0) int? municipalityId,
      @Default(0) double? priceMT,
      @Default(0) double? priceSQ,
      @Default(0) double? realEstateMT,
      @Default(0) double? realEstateSQT,
      @Default(0) double? realEstateValue,
      @Default(0) double? roi,
      @Default('') String? soldTo,
      @Default(0) double? unitNo,
      @Default(0) int? unitStatus}) = _SellTransaction;

  factory SellTransaction.fromJson(Map<String, dynamic> json) =>
      _$SellTransactionFromJson(json);
}

@freezed
abstract class SellTransactionResponse with _$SellTransactionResponse {
  const factory SellTransactionResponse(
      {@Default(0) int count,
      @Default([]) List<SellTransaction> transactionList}) = _SellResponse;

  factory SellTransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$SellTransactionResponseFromJson(json);
}
