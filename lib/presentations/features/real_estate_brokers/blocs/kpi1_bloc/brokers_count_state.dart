part of 'brokers_count_bloc.dart';

@freezed
class BrokersCountState with _$BrokersCountState {
  const factory BrokersCountState.initial() = _Initial;

  const factory BrokersCountState.loading() = _Loading;

  const factory BrokersCountState.loaded(double val) = _Loaded;

  const factory BrokersCountState.error(String message) = _Error;
}
