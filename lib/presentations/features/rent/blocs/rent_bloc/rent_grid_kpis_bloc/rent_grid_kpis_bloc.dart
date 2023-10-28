import 'package:bloc/bloc.dart';
import 'package:ebla/data/newtwok/failure_model/failure.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/domain/models/requests/rent_requests/request_mean_value.dart';

import 'package:ebla/domain/usecases/usecases.dart';
import 'package:ebla/utils/colored_printer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multiple_result/multiple_result.dart';

part 'rent_grid_kpis_state.dart';
part 'rent_grid_kpis_event.dart';
part 'rent_grid_kpis_bloc.freezed.dart';

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
      emit(state.copyWith(isLoading: true, hasError: false));

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
              .then((value) => Result.error(FailureModel()));

      /// KPI13
      final failureOrSuccessMeanValue =
          await meanValueUsecase.execute(event.request);

      /// KPI16
      // todo: call the usecase once mean area con are available and not "البيانات قيد الجمع والتدقيق"
      final failureOrSuccessMeanArea =
          await Future.delayed(Duration(milliseconds: 100))
              .then((value) => Result.error(FailureModel()));

      //------------------------KPI1--------------------------------------------
      failureOrSuccessTotalContracts.when(
        (success) {
          success.isEmpty
              ? emit(state.copyWith(isLoading: true, hasError: false))
              : emit(state.copyWith(
                  isLoading: false, hasError: false, totalContracts: success));
        },
        (error) {
          emit(state.copyWith(
              isLoading: false,
              hasError: true,
              errorMessage: error.message,
              totalContracts: []));
        },
      );
      //------------------------KPI4--------------------------------------------
      failureOrSuccessTotalRentedUnits.when(
        (success) {
          success.isEmpty
              ? emit(state.copyWith(isLoading: true, hasError: false))
              : emit(state.copyWith(
                  isLoading: false,
                  hasError: false,
                  totalRentedUnits: success));
        },
        (error) {
          emit(state.copyWith(
              isLoading: false,
              hasError: true,
              errorMessage: error.message,
              totalRentedUnits: []));
        },
      );

      //------------------------KPI7--------------------------------------------
      failureOrSuccessContractValueUseCase.when(
        (success) {
          success.isEmpty
              ? emit(state.copyWith(isLoading: true, hasError: false))
              : emit(state.copyWith(
                  isLoading: false,
                  hasError: false,
                  totalContractsValue: success));
        },
        (error) {
          emit(state.copyWith(
              isLoading: false,
              hasError: true,
              errorMessage: error.message,
              totalContractsValue: []));
        },
      );
      //------------------------KPI10-------------------------------------------
      failureOrSuccessTotalRentedSpaceUsecase.when(
        (success) {
          success.isEmpty
              ? emit(state.copyWith(isLoading: true, hasError: false))
              : emit(state.copyWith(
                  isLoading: false,
                  hasError: false,
                  totalRentedSpace: success));
        },
        (error) {
          emit(state.copyWith(
              isLoading: false,
              hasError: true,
              errorMessage: error.message,
              totalRentedSpace: []));
        },
      );
      //------------------------KPI13-------------------------------------------
      failureOrSuccessMeanValue.when(
        (success) {
          success.isEmpty
              ? emit(state.copyWith(isLoading: true, hasError: false))
              : emit(state.copyWith(
                  isLoading: false,
                  hasError: false,
                  meanRentUnitValue: success));
        },
        (error) {
          emit(state.copyWith(
              isLoading: false,
              hasError: true,
              errorMessage: error.message,
              meanRentUnitValue: []));
        },
      );
      //------------------------KPI16-------------------------------------------
      failureOrSuccessMeanArea.when(
        (success) {
          success.isEmpty
              ? emit(state.copyWith(isLoading: true, hasError: false))
              : emit(state.copyWith(
                  isLoading: false, hasError: false, meanAreaValue: success));
        },
        (error) {
          emit(state.copyWith(
              isLoading: false,
              hasError: true,
              errorMessage: error.message,
              meanAreaValue: []));
        },
      );
    });
  }
}
