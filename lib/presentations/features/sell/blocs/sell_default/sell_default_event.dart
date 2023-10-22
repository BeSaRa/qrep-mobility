part of 'sell_default_bloc.dart';

@freezed
class SellDefaultEvent with _$SellDefaultEvent {
  const factory SellDefaultEvent.started({required RequestMeanValue request}) =
      _Started;
}
