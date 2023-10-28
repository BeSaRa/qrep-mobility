part of 'rent_grid_kpis_bloc.dart';

@freezed
class RentGridKPIsEvent with _$RentGridKPIsEvent {
  const factory RentGridKPIsEvent.getData({required RequestMeanValue request}) =
      _RentGridKPIsEvent;
}

enum KPI {
  /// KPI1
  totalContracts,

  /// KPI4
  totalRentedUnits,

  /// KPI7
  totalContractsValue,

  /// KPI13
  meanRentUnitValue,

  /// KPI10
  totalRentedSpaces,

  /// KPI16
  meanAreaValue,
}
