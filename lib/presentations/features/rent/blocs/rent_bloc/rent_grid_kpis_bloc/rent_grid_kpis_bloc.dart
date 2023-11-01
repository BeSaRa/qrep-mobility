import 'package:bloc/bloc.dart';
import 'package:ebla/data/newtwok/failure_model/failure.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/domain/models/requests/rent_requests/request_mean_value.dart';
import 'package:ebla/domain/usecases/usecases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multiple_result/multiple_result.dart';

part 'rent_grid_kpis_bloc.freezed.dart';
part 'rent_grid_kpis_event.dart';
part 'rent_grid_kpis_state.dart';

class RentGridKPIsBloc extends Bloc<RentGridKPIsEvent, RentGridKPIsState> {
  /// KPI1
  final TotalContractsUseCase totalContractsUseCase;

  /// KPI4
  final TotalRentedUnitsUseCase totalRentedUnitsUseCase;

  /// KPI7
  final ContractValueUseCase contractValueUseCase;

  /// KPI10
  final TotalRentedSpaceUsecase totalRentedSpaceUsecase;

  /// KPI13
  final MeanValueUsecase meanValueUsecase;

  /// KPI16
  final MeanAreaUsecase meanAreaUsecase;

  RentGridKPIsBloc({
    required this.totalContractsUseCase,
    required this.totalRentedUnitsUseCase,
    required this.meanValueUsecase,
    required this.meanAreaUsecase,
    required this.contractValueUseCase,
    required this.totalRentedSpaceUsecase,
  }) : super(const RentGridKPIsState.initialState()) {
    on<RentGridKPIsEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      /// KPI1
      final failureOrSuccessTotalContracts =
          await totalContractsUseCase.execute(event.request);

      /// KPI4
      final failureOrSuccessTotalRentedUnits =
          await totalRentedUnitsUseCase.execute(event.request);

      /// KPI7
      final failureOrSuccessContractValueUseCase =
          await contractValueUseCase.execute(event.request);

      /// KPI10
      // todo: call the usecase once total rented spaces are available and not "البيانات قيد الجمع والتدقيق"
      final failureOrSuccessTotalRentedSpaceUsecase =
          await Future.delayed(Duration(milliseconds: 100))
              .then((value) => Result.success(<BaseRentResponse>[]));

      /// KPI13
      final failureOrSuccessMeanValue =
          await meanValueUsecase.execute(event.request);

      /// KPI16
      // todo: call the usecase once mean area con are available and not "البيانات قيد الجمع والتدقيق"
      final failureOrSuccessMeanArea =
          await Future.delayed(Duration(milliseconds: 100))
              .then((value) => Result.success(<BaseRentResponse>[]));

      //------------------------KPI1--------------------------------------------
      failureOrSuccessTotalContracts.when(
        (success) {
          success.isEmpty
              ? emit(state.copyWith(
                  isLoading: true, hasErrorTotalContracts: false))
              : emit(state.copyWith(
                  isLoading: false,
                  hasErrorTotalContracts: false,
                  totalContracts: success));
        },
        (error) {
          emit(state.copyWith(
              isLoading: false,
              hasErrorTotalContracts: true,
              errorMessage: error.message,
              totalContracts: []));
        },
      );
      //------------------------KPI4--------------------------------------------
      failureOrSuccessTotalRentedUnits.when(
        (success) {
          success.isEmpty
              ? emit(state.copyWith(
                  isLoading: true, hasErrorTotalRentedSpace: false))
              : emit(state.copyWith(
                  isLoading: false,
                  hasErrorTotalRentedSpace: false,
                  totalRentedUnits: success));
        },
        (error) {
          emit(state.copyWith(
              isLoading: false,
              hasErrorTotalRentedSpace: true,
              errorMessage: error.message,
              totalRentedUnits: []));
        },
      );

      //------------------------KPI7--------------------------------------------
      failureOrSuccessContractValueUseCase.when(
        (success) {
          success.isEmpty
              ? emit(state.copyWith(
                  isLoading: true, hasErrorTotalContractsValue: false))
              : emit(state.copyWith(
                  isLoading: false,
                  hasErrorTotalContractsValue: false,
                  totalContractsValue: success));
        },
        (error) {
          emit(state.copyWith(
              isLoading: false,
              hasErrorTotalContractsValue: true,
              errorMessage: error.message,
              totalContractsValue: []));
        },
      );
      //------------------------KPI10-------------------------------------------
      failureOrSuccessTotalRentedSpaceUsecase.when(
        (success) {
          success.isEmpty
              ? emit(state.copyWith(
                  isLoading: true, hasErrorTotalRentedSpace: false))
              : emit(state.copyWith(
                  isLoading: false,
                  hasErrorTotalRentedSpace: false,
                  totalRentedSpace: success));
        },
        (error) {
          emit(state.copyWith(
              isLoading: false,
              hasErrorTotalRentedSpace: true,
              errorMessage: error.message,
              totalRentedSpace: []));
        },
      );
      //------------------------KPI13-------------------------------------------
      failureOrSuccessMeanValue.when(
        (success) {
          success.isEmpty
              ? emit(state.copyWith(
                  isLoading: true, hasErrorMeanRentUnitValue: false))
              : emit(state.copyWith(
                  isLoading: false,
                  hasErrorMeanRentUnitValue: false,
                  meanRentUnitValue: success));
        },
        (error) {
          emit(state.copyWith(
              isLoading: false,
              hasErrorMeanRentUnitValue: true,
              errorMessage: error.message,
              meanRentUnitValue: []));
        },
      );
      //------------------------KPI16-------------------------------------------
      failureOrSuccessMeanArea.when(
        (success) {
          success.isEmpty
              ? emit(
                  state.copyWith(isLoading: true, hasErrorMeanAreaValue: false))
              : emit(state.copyWith(
                  isLoading: false,
                  hasErrorMeanAreaValue: false,
                  meanAreaValue: success));
        },
        (error) {
          emit(state.copyWith(
              isLoading: false,
              hasErrorMeanAreaValue: true,
              errorMessage: error.message,
              meanAreaValue: []));
        },
      );
      //========================================================================
    });
  }
  static bool getErrorValue(RentGridKPIsState state, RentGridKPIs? kpi) {
    switch (kpi) {
      case RentGridKPIs.totalContracts:
        return state.hasErrorTotalContracts;
      case RentGridKPIs.totalRentedUnits:
        return state.hasErrorTotalRentedUnits;
      case RentGridKPIs.totalContractsValue:
        return state.hasErrorTotalContractsValue;
      case RentGridKPIs.totalRentedSpaces:
        return state.hasErrorTotalRentedSpace;
      case RentGridKPIs.meanRentUnitValue:
        return state.hasErrorMeanRentUnitValue;
      case RentGridKPIs.meanRentAreaValue:
        return state.hasErrorMeanAreaValue;
      default:
        return false;
    }
  }

  static List<BaseRentResponse> getState(
      RentGridKPIsState state, RentGridKPIs? kpi) {
    switch (kpi) {
      case RentGridKPIs.totalContracts:
        return state.totalContracts;
      case RentGridKPIs.totalRentedUnits:
        return state.totalRentedUnits;
      case RentGridKPIs.totalContractsValue:
        return state.totalContractsValue;
      case RentGridKPIs.totalRentedSpaces:
        return state.totalRentedSpace;
      case RentGridKPIs.meanRentUnitValue:
        return state.meanRentUnitValue;
      case RentGridKPIs.meanRentAreaValue:
        return state.meanAreaValue;
      default:
        return [];
    }
  }

  static num getKPIVal(RentDefault rentDefault, RentGridKPIs? kpi) {
    switch (kpi) {
      case RentGridKPIs.totalContracts:
        return rentDefault.kpi1Val ?? 0;
      case RentGridKPIs.totalRentedUnits:
        return rentDefault.kpi4Val ?? 0;
      case RentGridKPIs.totalContractsValue:
        return rentDefault.kpi7Val ?? 0;
      case RentGridKPIs.meanRentUnitValue:
        return rentDefault.kpi10Val ?? 0;
      case RentGridKPIs.totalRentedSpaces:
        return rentDefault.kpi13Val ?? 0;
      case RentGridKPIs.meanRentAreaValue:
        return rentDefault.kpi16Val ?? 0;
      default:
        return 0;
    }
  }
}
