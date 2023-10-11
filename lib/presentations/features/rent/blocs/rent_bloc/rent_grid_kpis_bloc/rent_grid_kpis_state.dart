part of 'rent_grid_kpis_bloc.dart';

@freezed
class RentGridKPIsState with _$RentGridKPIsState {
  const factory RentGridKPIsState.initialState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    @Default('') String errorMessage,
    @Default([]) List<BaseRentResponse> totalContracts,
    @Default([]) List<BaseRentResponse> totalRentedUnits,
  }) = _InitialState;

  // const factory TotalContractsState.loadInProgress() = _LoadInProgress;
}

enum CurrentKPI { totalRentedUnits, totalContracts, undefined }
