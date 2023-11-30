part of 'brokers_count_bloc.dart';

@freezed
class BrokersCountEvent with _$BrokersCountEvent {
  const factory BrokersCountEvent.started(
      {required RequestBrokerValues request}) = _Started;
}
