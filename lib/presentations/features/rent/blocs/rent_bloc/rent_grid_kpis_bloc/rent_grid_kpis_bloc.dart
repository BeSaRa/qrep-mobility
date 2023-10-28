import 'package:bloc/bloc.dart';
import 'package:ebla/data/newtwok/failure_model/failure.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/domain/models/requests/rent_requests/request_mean_value.dart';
import 'package:ebla/domain/usecases/rent_usecases/contract_value_kpi7/contract_value_usecase.dart';
import 'package:ebla/domain/usecases/rent_usecases/mean_value_usecases/mean_value_usecases.dart';
import 'package:ebla/domain/usecases/rent_usecases/total_contracts_usecase.dart';
import 'package:ebla/domain/usecases/rent_usecases/total_rented_units_usecase.dart';
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
  final MeanValueUsecase meanValueUsecase;

  /// KPI13
  final ContractValueUseCase contractValueUseCase;

  /// KPI10
  final TotalRentedSpaceUsecase totalRentedSpaceUsecase;

  RentGridKPIsBloc({
    required this.totalContractsUseCase,
    required this.totalRentedUnitsUseCase,
    required this.meanValueUsecase,
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

      // await totalRentedSpaceUsecase.execute(event.request);

      /// KPI13
      final failureOrSuccessMeanValue =
          await meanValueUsecase.execute(event.request);

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
                  isLoading: false, hasError: false, contractsValue: success));
        },
        (error) {
          emit(state.copyWith(
              isLoading: false,
              hasError: true,
              errorMessage: error.message,
              contractsValue: []));
        },
      );
      //------------------------KPI10-------------------------------------------
      failureOrSuccessTotalRentedSpaceUsecase.when(
        (success) {
          ColoredPrinter.printColored("in success");
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
          ColoredPrinter.printColored("in error");
        },
      );
      //------------------------KPI13-------------------------------------------
      failureOrSuccessMeanValue.when(
        (success) {
          success.isEmpty
              ? emit(state.copyWith(isLoading: true, hasError: false))
              : emit(state.copyWith(
                  isLoading: false, hasError: false, meanValue: success));
        },
        (error) {
          emit(state.copyWith(
              isLoading: false,
              hasError: true,
              errorMessage: error.message,
              meanValue: []));
        },
      );
    });
  }
}
