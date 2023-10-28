part of 'rent_grid_kpis_bloc.dart';

@freezed
class RentGridKPIsState with _$RentGridKPIsState {
  const factory RentGridKPIsState.initialState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    @Default('') String errorMessage,

    /// KPI1
    @Default([]) List<BaseRentResponse> totalContracts,

    /// KPI4
    @Default([]) List<BaseRentResponse> totalRentedUnits,

    /// KPI7
    @Default([]) List<BaseRentResponse> totalContractsValue,

    /// KPI10
    @Default([]) List<BaseRentResponse> totalRentedSpace,

    /// KPI13
    @Default([]) List<BaseRentResponse> meanRentUnitValue,

    /// KPI16
    @Default([]) List<BaseRentResponse> meanAreaValue,
  }) = _InitialState;

  // const factory TotalContractsState.loadInProgress() = _LoadInProgress;
}

enum CurrentKPI { totalRentedUnits, totalContracts, undefined }
