import 'package:freezed_annotation/freezed_annotation.dart';

part 'mortgage_models.freezed.dart';
part 'mortgage_models.g.dart';

@freezed
abstract class MortgageTransaction with _$MortgageTransaction {
  const factory MortgageTransaction(
      {@Default(0) int? municipalityId,
      @Default('') String? unitStatus,
      @Default(0) double? realEstateValue,
      @Default(0) double? realEstateArea,
      @Default('') String? issueDate,
      @Default(0) int areaCode,
      @Default('') String? seller,
      @Default('') String? buyer,
      @Default('') String? unitNo}) = _MortgageTransaction;

  factory MortgageTransaction.fromJson(Map<String, dynamic> json) =>
      _$MortgageTransactionFromJson(json);
}

@freezed
abstract class MortgageTransactionResponse with _$MortgageTransactionResponse {
  const factory MortgageTransactionResponse(
          {@Default(0) int count,
          @Default([]) List<MortgageTransaction> transactionList}) =
      _MortgageTransactionResponse;

  factory MortgageTransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$MortgageTransactionResponseFromJson(json);
}
