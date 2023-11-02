part of 'rent_grid_kpis_bloc.dart';

@freezed
class RentGridKPIsState with _$RentGridKPIsState {
  const factory RentGridKPIsState.initialState({
    @Default(false) bool isLoading,

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

    //--------------------Error-------------------------------------------------
    @Default('') String errorMessage,

    /// KPI1
    @Default(false) bool hasErrorTotalContracts,

    /// KPI4
    @Default(false) bool hasErrorTotalRentedUnits,

    /// KPI7
    @Default(false) bool hasErrorTotalContractsValue,

    /// KPI10
    @Default(false) bool hasErrorTotalRentedSpace,

    /// KPI13
    @Default(false) bool hasErrorMeanRentUnitValue,

    /// KPI16
    @Default(false) bool hasErrorMeanAreaValue,
    //---------------------
  }) = _InitialState;

  // const factory TotalContractsState.loadInProgress() = _LoadInProgress;
}

enum CurrentKPI { totalRentedUnits, totalContracts, undefined }
