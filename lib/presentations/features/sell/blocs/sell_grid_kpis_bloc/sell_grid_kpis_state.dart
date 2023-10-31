part of 'sell_grid_kpis_bloc.dart';

@freezed
class SellGridKPIsState with _$SellGridKPIsState {
  const factory SellGridKPIsState.initialState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    @Default('') String errorMessage,
    @Default([]) List<BaseRentResponse> totalContracts,
    @Default([]) List<BaseRentResponse> totalSoldUnits,
    @Default([]) List<BaseRentResponse> totalTransactionsValue,
    @Default([]) List<BaseRentResponse> meanSellUnitValue,
    @Default([]) List<BaseRentResponse> totalSoldSpaces,
    @Default([]) List<BaseRentResponse> meanSoldAreaValue,
  }) = _InitialState;
}
