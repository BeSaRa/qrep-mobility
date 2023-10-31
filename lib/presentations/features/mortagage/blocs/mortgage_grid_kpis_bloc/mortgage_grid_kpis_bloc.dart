import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/domain/models/requests/mortgage_requests/request_mortgage_values.dart';

import 'package:ebla/domain/usecases/usecases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mortgage_grid_kpis_state.dart';
part 'mortgage_grid_kpis_event.dart';
part 'mortgage_grid_kpis_bloc.freezed.dart';

class MortgageGridKPIsBloc
    extends Bloc<MortgageGridKPIsEvent, MortgageGridKPIsState> {
  /// KPI1
  /// عدد معاملات الرهن
  final TotalMortgageTransactionsUseCase totalMortgageTransactionsUseCase;

  // KPI3
  /// إجمالي عدد الوحدات المرهونة
  final TotalNumOfMortgageUnitsUsecase totalNumOfMortgageUnitsUsecase;

  // KPI5
  /// إجمالي قيمة معاملات الرهن
  final TotalValOfMortgageTransactionsUsecase
      totalValOfMortgageTransactionsUsecase;

  MortgageGridKPIsBloc({
    required this.totalMortgageTransactionsUseCase,
    required this.totalNumOfMortgageUnitsUsecase,
    required this.totalValOfMortgageTransactionsUsecase,
  }) : super(const MortgageGridKPIsState.initialState()) {
    on<MortgageGridKPIsEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true, hasError: false));

      /// KPI1
      /// عدد معاملات الرهن
      final failureOrSuccessTotalMortgageTransactions =
          await totalMortgageTransactionsUseCase.execute(event.request);
      // KPI3
      /// إجمالي عدد الوحدات المرهونة
      final failureOrSuccessTotalMortgageUnitsNum =
          await totalNumOfMortgageUnitsUsecase.execute(event.request);

      // KPI5
      /// إجمالي قيمة معاملات الرهن
      final failureOrSuccessTotalMortgageTransactionsVal =
          await totalValOfMortgageTransactionsUsecase.execute(event.request);

      //-------------------------------KPI1-------------------------------------
      failureOrSuccessTotalMortgageTransactions.when(
        (success) {
          success.isEmpty
              ? emit(state.copyWith(isLoading: true, hasError: false))
              : emit(state.copyWith(
                  isLoading: false,
                  hasError: false,
                  totalMortgageTransactions: success));
        },
        (error) {
          emit(state.copyWith(
              isLoading: false,
              hasError: true,
              errorMessage: error.message,
              totalMortgageTransactions: []));
        },
      );

      //-------------------------------KPI4-------------------------------------
      failureOrSuccessTotalMortgageUnitsNum.when(
        (success) {
          success.isEmpty
              ? emit(state.copyWith(isLoading: true, hasError: false))
              : emit(state.copyWith(
                  isLoading: false,
                  hasError: false,
                  totalMortgageUnitsNum: success));
        },
        (error) {
          emit(state.copyWith(
              isLoading: false,
              hasError: true,
              errorMessage: error.message,
              totalMortgageUnitsNum: []));
        },
      );
      //-------------------------------KPI7-------------------------------------
      failureOrSuccessTotalMortgageTransactionsVal.when(
        (success) {
          success.isEmpty
              ? emit(state.copyWith(isLoading: true, hasError: false))
              : emit(state.copyWith(
                  isLoading: false,
                  hasError: false,
                  totalMortgageTransactionsValue: success));
        },
        (error) {
          emit(state.copyWith(
              isLoading: false,
              hasError: true,
              errorMessage: error.message,
              totalMortgageTransactionsValue: []));
        },
      );
    });
  }
}
