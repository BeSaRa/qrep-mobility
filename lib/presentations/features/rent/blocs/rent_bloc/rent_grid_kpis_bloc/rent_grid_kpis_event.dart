part of 'rent_grid_kpis_bloc.dart';

@freezed
class RentGridKPIsEvent with _$RentGridKPIsEvent {
  const factory RentGridKPIsEvent.getData({required RequestMeanValue request}) =
      _RentGridKPIsEvent;
}

enum KPI {
  totalRentedUntis,
  totalContracts,
  meanRentUnitValue,
  totalContractsValue,
}
