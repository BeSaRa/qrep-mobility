part of 'sell_grid_kpis_bloc.dart';

@freezed
class SellGridKPIsState with _$SellGridKPIsState {
  const factory SellGridKPIsState.initialState({
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
    @Default([]) List<BaseRentResponse> totalContracts,
    @Default([]) List<BaseRentResponse> totalSoldUnits,
    @Default([]) List<BaseRentResponse> totalTransactionsValue,
    @Default([]) List<BaseRentResponse> meanSellUnitValue,
    @Default([]) List<BaseRentResponsePerAreaUnitType> totalSoldSpaces,
    @Default([]) List<BaseRentResponsePerAreaUnitType> meanSoldAreaValue,
    //----------------------------errors----------------------------------------
    @Default(false) bool hasErrorTotalContracts,
    @Default(false) bool hasErrorTotalSoldUnits,
    @Default(false) bool hasErrorTotalTransactionsValue,
    @Default(false) bool hasErrorMeanSellUnitValue,
    @Default(false) bool hasErrorTotalSoldSpaces,
    @Default(false) bool hasErrorMeanSoldAreaValue,
  }) = _InitialState;
}
