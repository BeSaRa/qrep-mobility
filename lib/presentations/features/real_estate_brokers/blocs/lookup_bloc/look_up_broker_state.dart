part of 'look_up_broker_bloc.dart';

@freezed
class LookUpBrokerState with _$LookUpBrokerState {
  const factory LookUpBrokerState.initial() = _Initial;

  const factory LookUpBrokerState.loading() = _Loading;

  const factory LookUpBrokerState.done() = _Done;

  const factory LookUpBrokerState.error() = _Error;
}
