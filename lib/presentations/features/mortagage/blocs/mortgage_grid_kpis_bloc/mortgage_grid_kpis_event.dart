part of 'mortgage_grid_kpis_bloc.dart';

@freezed
class MortgageGridKPIsEvent with _$MortgageGridKPIsEvent {
  const factory MortgageGridKPIsEvent.getData(
      {required RequestMortgageValues request}) = _MortgageGridKPIsEvent;
}
