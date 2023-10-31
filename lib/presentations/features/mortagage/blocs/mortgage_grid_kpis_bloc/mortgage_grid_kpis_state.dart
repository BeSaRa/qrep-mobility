part of 'mortgage_grid_kpis_bloc.dart';

@freezed
class MortgageGridKPIsState with _$MortgageGridKPIsState {
  const factory MortgageGridKPIsState.initialState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    @Default('') String errorMessage,

    /// KPI1
    @Default([]) List<BaseRentResponse> totalMortgageTransactions,

    /// KPI3
    @Default([]) List<BaseRentResponse> totalMortgageUnitsNum,

    /// KPI5
    @Default([]) List<BaseRentResponse> totalMortgageTransactionsValue,
  }) = _InitialState;
}
