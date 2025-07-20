import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/domain/models/requests/sell_requests/request_sell_values.dart';
import 'package:ebla/domain/usecases/usecases.dart';
import 'package:ebla/presentations/widgets/grid/grid_item_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sell_grid_kpis_bloc.freezed.dart';
part 'sell_grid_kpis_event.dart';
part 'sell_grid_kpis_state.dart';

class SellGridKPIsBloc extends Bloc<SellGridKPIsEvent, SellGridKPIsState> {
  /// KPI1
  // اجمالي عدد معاملات البيع
  final TotalContractsSellUseCase totalContractsSellUseCase;

  // KPI4
  // إجمالي عدد العقارات \\ الوحدات المباعة
  final TotalSoldUnitsUseCase totalSoldUnitsUseCase;

  // KPI7
  // إجمالي قيمة عقود البيع
  final TotalTransactionSellUseCase totalTransactionSellUseCase;

  // KPI0
  // إجمالي المساحات المباعة
  final TotalSoldSpacesUsecase totalSoldPlacesUseCase;

  // KPI13
  // متوسط سعر البيع للوحدة \\ العقار
  final MeanSellUnitValueUsecase meanSellUnitValueUsecase;

  // KPI16
  // متوسط سعر البيع لكل قدم مربع
  final MeanSoldAreaUsecase meanSoldAreaUseCase;

  SellGridKPIsBloc({
    required this.totalContractsSellUseCase,
    required this.totalSoldUnitsUseCase,
    required this.totalTransactionSellUseCase,
    required this.meanSellUnitValueUsecase,
    required this.totalSoldPlacesUseCase,
    required this.meanSoldAreaUseCase,
  }) : super(const SellGridKPIsState.initialState()) {
    on<SellGridKPIsEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      /// KPI1
      final failureOrSuccessTotalContracts =
          await totalContractsSellUseCase.execute(event.request);

      /// KPI4
      final failureOrSuccessTotalSoldUnits =
          await totalSoldUnitsUseCase.execute(event.request);

      /// KPI7
      final failureOrSuccessTotalTransactions =
          await totalTransactionSellUseCase.execute(event.request);

      /// KPI10
      final failureOrSuccessTotalSoldSpaces =
          await totalSoldPlacesUseCase.execute(event.request);

      /// KPI13
      final failureOrSuccessMeanValue =
          await meanSellUnitValueUsecase.execute(event.request);

      /// KPI16
      final failureOrSuccessMeanSoldAreaUsecase =
          await meanSoldAreaUseCase.execute(event.request);
      //-------------------------------KPI1-------------------------------------
      failureOrSuccessTotalContracts.when(
        (success) {
          emit(state.copyWith(
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

      //-------------------------------KPI4-------------------------------------
      failureOrSuccessTotalSoldUnits.when(
        (success) {
          emit(state.copyWith(
              isLoading: false,
              hasErrorTotalSoldUnits: false,
              totalSoldUnits: success));
        },
        (error) {
          emit(state.copyWith(
              isLoading: false,
              hasErrorTotalSoldUnits: true,
              errorMessage: error.message,
              totalSoldUnits: []));
        },
      );
      //-------------------------------KPI7-------------------------------------
      failureOrSuccessTotalTransactions.when(
        (success) {
          emit(state.copyWith(
              isLoading: false,
              hasErrorTotalTransactionsValue: false,
              totalTransactionsValue: success));
        },
        (error) {
          emit(state.copyWith(
              isLoading: false,
              hasErrorTotalTransactionsValue: true,
              errorMessage: error.message,
              totalTransactionsValue: []));
        },
      );
      //-------------------------------KPI10------------------------------------
      failureOrSuccessTotalSoldSpaces.when(
        (success) {
          emit(state.copyWith(
              isLoading: false,
              hasErrorTotalSoldSpaces: false,
              totalSoldSpaces: success));
        },
        (error) {
          emit(state.copyWith(
              isLoading: false,
              hasErrorTotalSoldSpaces: true,
              errorMessage: error.message,
              totalSoldSpaces: []));
        },
      );
      //-------------------------------KPI3-------------------------------------
      failureOrSuccessMeanValue.when(
        (success) {
          emit(state.copyWith(
              isLoading: false,
              hasErrorMeanSellUnitValue: false,
              meanSellUnitValue: success));
        },
        (error) {
          emit(state.copyWith(
              isLoading: false,
              hasErrorMeanSellUnitValue: true,
              errorMessage: error.message,
              meanSellUnitValue: []));
        },
      );
      //-------------------------------KPI16------------------------------------
      failureOrSuccessMeanSoldAreaUsecase.when(
        (success) {
          emit(state.copyWith(
              isLoading: false,
              hasErrorMeanSoldAreaValue: false,
              meanSoldAreaValue: success));
        },
        (error) {
          emit(state.copyWith(
              isLoading: false,
              hasErrorMeanSoldAreaValue: true,
              errorMessage: error.message,
              meanSoldAreaValue: []));
        },
      );
    });
  }
  static bool getErrorValue(SellGridKPIsState state, SellGridKPIs? kpi) {
    switch (kpi) {
      case SellGridKPIs.totalContracts:
        return state.hasErrorTotalContracts;
      case SellGridKPIs.totalSoldUnits:
        return state.hasErrorTotalSoldUnits;
      case SellGridKPIs.totalTransactionsValue:
        return state.hasErrorTotalTransactionsValue;
      case SellGridKPIs.meanSellUnitValue:
        return state.hasErrorMeanSellUnitValue;
      case SellGridKPIs.totalSoldSpaces:
        return state.hasErrorTotalSoldSpaces;
      case SellGridKPIs.meanSoldAreaValue:
        return state.hasErrorMeanSoldAreaValue;
      default:
        return false;
    }
  }

  static List getState(SellGridKPIsState state, SellGridKPIs? kpi) {
    switch (kpi) {
      case SellGridKPIs.totalContracts:
        return state.totalContracts;
      case SellGridKPIs.totalSoldUnits:
        return state.totalSoldUnits;
      case SellGridKPIs.totalTransactionsValue:
        return state.totalTransactionsValue;
      case SellGridKPIs.meanSellUnitValue:
        return state.meanSellUnitValue;
      case SellGridKPIs.totalSoldSpaces:
        return state.totalSoldSpaces;
      case SellGridKPIs.meanSoldAreaValue:
        return state.meanSoldAreaValue;
      default:
        return [];
    }
  }

  static num getKpiValOrYoYFromTypeAndUnit(
      {required var dataState,
      required int unitType,
      required bool returnYoYVal}) {
    if (dataState is List<BaseRentResponse>) {
      return returnYoYVal ? dataState.first.kpiYoYVal : dataState.first.kpiVal;
    } else if (dataState is List<BaseRentResponsePerAreaUnitType>) {
      // meter
      if (unitType == 1) {
        return returnYoYVal
            ? dataState.first.kpiSqmtYoYVal
            : dataState.first.kpiSqmt;
      } else {
        // foot
        return returnYoYVal
            ? dataState.first.kpiSqftYoYVal
            : dataState.first.kpiSqft;
      }
    } else {
      if (kDebugMode) {
      }
      return 0;
    }
  }

  static num getDefaultKpiVal(RentDefault rentDefault, SellGridKPIs? kpi) {
    switch (kpi) {
      case SellGridKPIs.totalContracts:
        return rentDefault.kpi1Val ?? 0;
      case SellGridKPIs.totalSoldUnits:
        return rentDefault.kpi4Val ?? 0;
      case SellGridKPIs.totalTransactionsValue:
        return rentDefault.kpi7Val ?? 0;
      case SellGridKPIs.meanSellUnitValue:
        return rentDefault.kpi13Val ?? 0;
      case SellGridKPIs.totalSoldSpaces:
        return rentDefault.kpi10Val ?? 0;
      case SellGridKPIs.meanSoldAreaValue:
        return rentDefault.kpi16Val ?? 0;
      default:
        return 0;
    }
  }

  static num getKpiValueBaseOnStateType(
      SellGridKPIsState state, SellGridKPIs? kpi) {
    switch (kpi) {
      case SellGridKPIs.totalSoldSpaces:
        if (state.totalSoldSpaces.isNotEmpty) {
          return state.totalSoldSpaces.first.kpiSqft;
        }
        break;

      default:
    }
    return 0;
  }
}
