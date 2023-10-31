part of 'sell_grid_kpis_bloc.dart';

@freezed
class SellGridKPIsEvent with _$SellGridKPIsEvent {
  const factory SellGridKPIsEvent.getData(
      {required RequestSellValues request}) = _SellGridKPIsEvent;
}

enum SellGridKPIs {
  /// KPI1
  totalContracts,

  /// KPI4
  totalSoldUnits,

  /// KPI7
  totalTransactionsValue,

  /// KPI13
  meanSellUnitValue,

  /// KPI10
  totalSoldSpaces,

  /// KPI16
  meanSoldAreaValue,
}
