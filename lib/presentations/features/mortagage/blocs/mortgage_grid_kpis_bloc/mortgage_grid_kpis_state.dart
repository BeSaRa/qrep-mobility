part of 'mortgage_grid_kpis_bloc.dart';

@freezed
class MortgageGridKPIsState with _$MortgageGridKPIsState {
  const factory MortgageGridKPIsState.initialState({
    @Default(false) bool isLoading,
    @Default('') String errorMessage,

    /// KPI1
    @Default([]) List<BaseRentResponse> totalMortgageTransactions,

    /// KPI3
    @Default([]) List<BaseRentResponse> totalMortgageUnitsNum,

    /// KPI5
    @Default([]) List<BaseRentResponse> totalMortgageTransactionsValue,
    //-------------------------------errors----------------------------
    @Default(false) bool hasErrorTotalMortgageTransactions,
    @Default(false) bool hasErrortotalMortgageUnitsNum,
    @Default(false) bool hasErrorTotalMortgageTransactionsValue,
  }) = _InitialState;
}
