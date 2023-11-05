part of 'sell_grid_kpis_bloc.dart';

@freezed
class SellGridKPIsEvent with _$SellGridKPIsEvent {
  const factory SellGridKPIsEvent.getData(
      {required RequestSellValues request}) = _SellGridKPIsEvent;
}

