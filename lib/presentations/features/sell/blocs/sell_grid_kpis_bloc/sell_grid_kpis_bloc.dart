import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/domain/models/requests/sell_requests/request_sell_values.dart';
import 'package:ebla/domain/usecases/usecases.dart';
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
      emit(state.copyWith(isLoading: true, hasError: false));

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

      //-------------------------------KPI4-------------------------------------
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
      //-------------------------------KPI7-------------------------------------
      failureOrSuccessTotalTransactions.when(
        (success) {
          success.isEmpty
              ? emit(state.copyWith(isLoading: true, hasError: false))
              : emit(state.copyWith(
                  isLoading: false,
                  hasError: false,
                  totalTransactionsValue: success));
        },
        (error) {
          emit(state.copyWith(
              isLoading: false,
              hasError: true,
              errorMessage: error.message,
              totalTransactionsValue: []));
        },
      );
      //-------------------------------KPI10------------------------------------
      failureOrSuccessTotalSoldSpaces.when(
        (success) {
          success.isEmpty
              ? emit(state.copyWith(isLoading: true, hasError: false))
              : emit(state.copyWith(
                  isLoading: false, hasError: false, totalSoldSpaces: success));
        },
        (error) {
          emit(state.copyWith(
              isLoading: false,
              hasError: true,
              errorMessage: error.message,
              totalSoldSpaces: []));
        },
      );
      //-------------------------------KPI3-------------------------------------
      failureOrSuccessMeanValue.when(
        (success) {
          success.isEmpty
              ? emit(state.copyWith(isLoading: true, hasError: false))
              : emit(state.copyWith(
                  isLoading: false,
                  hasError: false,
                  meanSellUnitValue: success));
        },
        (error) {
          emit(state.copyWith(
              isLoading: false,
              hasError: true,
              errorMessage: error.message,
              meanSellUnitValue: []));
        },
      );
      //-------------------------------KPI16------------------------------------
      failureOrSuccessMeanSoldAreaUsecase.when(
        (success) {
          success.isEmpty
              ? emit(state.copyWith(isLoading: true, hasError: false))
              : emit(state.copyWith(
                  isLoading: false,
                  hasError: false,
                  meanSoldAreaValue: success));
        },
        (error) {
          emit(state.copyWith(
            isLoading: false,
            hasError: true,
            errorMessage: error.message,
            meanSoldAreaValue: [],
          ));
        },
      );
    });
  }
}
