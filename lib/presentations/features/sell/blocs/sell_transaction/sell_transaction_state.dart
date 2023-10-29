part of 'sell_transaction_bloc.dart';

@freezed
class SellTransactionState with _$SellTransactionState {
  const factory SellTransactionState.initial() = _Initial;

  const factory SellTransactionState.loading() = _Loading;

  const factory SellTransactionState.success(SellTransactionResponse
  response, bool isMetere) =
  _Success;

  const factory SellTransactionState.error(String message) = _Error;
}
