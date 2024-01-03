part of 'broker_transaction_bloc.dart';

@freezed
class BrokerTransactionEvent with _$BrokerTransactionEvent {
  const factory BrokerTransactionEvent.started(
      {required RequestBrokerValues request}) = _Started;

  const factory BrokerTransactionEvent.search(
      {required RequestBrokerValues request}) = _Search;
}
