part of 'broker_transaction_bloc.dart';

@freezed
class BrokerTransactionEvent with _$BrokerTransactionEvent {
  const factory BrokerTransactionEvent.started() = _Started;
}
