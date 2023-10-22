part of 'sell_transaction_bloc.dart';

@freezed
class SellTransactionEvent with _$SellTransactionEvent {
  const factory SellTransactionEvent.started(
      {required RequestSellValues request}) = _Started;
}
