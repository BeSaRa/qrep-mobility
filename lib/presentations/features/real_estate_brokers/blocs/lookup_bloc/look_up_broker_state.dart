part of 'look_up_broker_bloc.dart';

@freezed
class LookUpBrokerState with _$LookUpBrokerState {
  const factory LookUpBrokerState.loading() = _Loading;

  const factory LookUpBrokerState.done(
      {required RealEstateBrokerLookUp success,
      required RealEstateBrokerLookUp successov}) = _Done;

  const factory LookUpBrokerState.error({required String message}) = _Error;
}
