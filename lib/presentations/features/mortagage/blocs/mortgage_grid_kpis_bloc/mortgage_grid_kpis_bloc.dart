import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/domain/models/requests/mortgage_requests/request_mortgage_values.dart';

import 'package:ebla/domain/usecases/usecases.dart';
import 'package:ebla/presentations/widgets/grid/grid_item_widget.dart';
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
      emit(state.copyWith(isLoading: true));

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
              ? emit(state.copyWith(
                  isLoading: true, hasErrorTotalMortgageTransactions: false))
              : emit(state.copyWith(
                  isLoading: false,
                  hasErrorTotalMortgageTransactions: false,
                  totalMortgageTransactions: success));
        },
        (error) {
          emit(state.copyWith(
              isLoading: false,
              hasErrorTotalMortgageTransactions: true,
              errorMessage: error.message,
              totalMortgageTransactions: []));
        },
      );

      //-------------------------------KPI4-------------------------------------
      failureOrSuccessTotalMortgageUnitsNum.when(
        (success) {
          success.isEmpty
              ? emit(state.copyWith(
                  isLoading: true, hasErrortotalMortgageUnitsNum: false))
              : emit(state.copyWith(
                  isLoading: false,
                  hasErrortotalMortgageUnitsNum: false,
                  totalMortgageUnitsNum: success));
        },
        (error) {
          emit(state.copyWith(
              isLoading: false,
              hasErrortotalMortgageUnitsNum: true,
              errorMessage: error.message,
              totalMortgageUnitsNum: []));
        },
      );
      //-------------------------------KPI7-------------------------------------
      failureOrSuccessTotalMortgageTransactionsVal.when(
        (success) {
          success.isEmpty
              ? emit(state.copyWith(
                  isLoading: true,
                  hasErrorTotalMortgageTransactionsValue: false))
              : emit(state.copyWith(
                  isLoading: false,
                  hasErrorTotalMortgageTransactionsValue: false,
                  totalMortgageTransactionsValue: success));
        },
        (error) {
          emit(state.copyWith(
              isLoading: false,
              hasErrorTotalMortgageTransactionsValue: true,
              errorMessage: error.message,
              totalMortgageTransactionsValue: []));
        },
      );
    });
  }
  //------------------------------------------------------------
  static bool getErrorValue(
      MortgageGridKPIsState state, MortgageGridKPIs? kpi) {
    switch (kpi) {
      case MortgageGridKPIs.totalMortgageTransactions:
        return state.hasErrorTotalMortgageTransactions;
      case MortgageGridKPIs.totalMortgageUnitsNum:
        return state.hasErrortotalMortgageUnitsNum;
      case MortgageGridKPIs.totalMortgageTransactionsValue:
        return state.hasErrorTotalMortgageTransactionsValue;

      default:
        return false;
    }
  }

  static List<BaseRentResponse> getState(
      MortgageGridKPIsState state, MortgageGridKPIs? kpi) {
    switch (kpi) {
      case MortgageGridKPIs.totalMortgageTransactions:
        return state.totalMortgageTransactions;
      case MortgageGridKPIs.totalMortgageUnitsNum:
        return state.totalMortgageUnitsNum;
      case MortgageGridKPIs.totalMortgageTransactionsValue:
        return state.totalMortgageTransactionsValue;
      default:
        return [];
    }
  }
}
