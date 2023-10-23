import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/domain/models/requests/rent_requests/request_mean_value.dart';
import 'package:ebla/domain/models/requests/sell_requests/request_sell_values.dart';

import 'package:ebla/domain/usecases/usecases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sell_grid_kpis_state.dart';
part 'sell_grid_kpis_event.dart';
part 'sell_grid_kpis_bloc.freezed.dart';

class SellGridKPIsBloc extends Bloc<SellGridKPIsEvent, SellGridKPIsState> {
  // KPI1
  final TotalContractsSellUseCase totalContractsSellUseCase;
  // KPI4
  final TotalSoldUnitsUseCase totalSoldUnitsUseCase;
  // KPI7
  final TotalTransactionSellUseCase totalTransactionSellUseCase;
  // KPI13
  final MeanValueSellUsecase meanValueSellUsecase;

  SellGridKPIsBloc({
    required this.totalContractsSellUseCase,
    required this.totalSoldUnitsUseCase,
    required this.totalTransactionSellUseCase,
    required this.meanValueSellUsecase,
  }) : super(const SellGridKPIsState.initialState()) {
    on<SellGridKPIsEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true, hasError: false));
      // KPI1
      final failureOrSuccessTotalContracts =
          await totalContractsSellUseCase.execute(event.request);
      // KPI4
      final failureOrSuccessTotalSoldUnits =
          await totalSoldUnitsUseCase.execute(event.request);
      // KPI7
      final failureOrSuccessTotalTransactions =
          await totalTransactionSellUseCase.execute(event.request);
      // KPI13
      final failureOrSuccessMeanValue =
          await meanValueSellUsecase.execute(event.request);

      failureOrSuccessTotalSoldUnits.when(
        (success) {
          success.isEmpty
              ? emit(state.copyWith(isLoading: true, hasError: false))
              : emit(state.copyWith(
                  isLoading: false, hasError: false, totalSoldUnits: success));
        },
        (error) {
          emit(state.copyWith(
              isLoading: false,
              hasError: true,
              errorMessage: error.message,
              totalSoldUnits: []));
        },
      );

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

      failureOrSuccessTotalTransactions.when(
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
    });
  }
}
