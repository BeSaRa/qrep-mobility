part of 'sell_grid_kpis_bloc.dart';

@freezed
class SellGridKPIsEvent with _$SellGridKPIsEvent {
  const factory SellGridKPIsEvent.getData(
      {required RequestSellValues request}) = _SellGridKPIsEvent;
}

enum SellGridKPIs {
  // KPI4
  totalSoldUnits,
  // KPI1
  totalContracts,
  // KPI13
  meanSellValue,
  // KPI7
  totalTransactions,
}
