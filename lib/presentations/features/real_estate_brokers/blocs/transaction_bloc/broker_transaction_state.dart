part of 'broker_transaction_bloc.dart';

@freezed
class BrokerTransactionState with _$BrokerTransactionState {
  const factory BrokerTransactionState.initial() = _Initial;

  const factory BrokerTransactionState.loading() = _Loading;

  const factory BrokerTransactionState.loaded() = _Loaded;

  const factory BrokerTransactionState.error() = _Error;
}
