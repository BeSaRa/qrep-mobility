part of 'topvalues_bloc.dart';

@freezed
class TopvaluesEvent with _$TopvaluesEvent {
  const factory TopvaluesEvent.countTransictionNumberEvent(
      {required RequestSellValues request}) = _CountTransictionNumberEvent;

  const factory TopvaluesEvent.countUnitPriceEvent(
      {required RequestSellValues request}) = _CountUnitPriceEvent;

  const factory TopvaluesEvent.countTransictionsValueEvent(
      {required RequestSellValues request}) = _CountTransictionsValueEvent;

  const factory TopvaluesEvent.countAreasEvent(
      {required RequestSellValues request}) = _CountAreasEvent;

  const factory TopvaluesEvent.realStateNumberEvent(
      {required RequestSellValues request}) = _RealStateNumberEvent;

  const factory TopvaluesEvent.realStateNumberMeterEvent(
      {required RequestSellValues request}) = _RealStateNumberMeterEvent;
}
