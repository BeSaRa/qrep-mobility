import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/domain/models/requests/rent_requests/request_mean_value.dart';
import 'package:ebla/domain/usecases/rent_usecases/total_contracts_usecase.dart';
import 'package:ebla/domain/usecases/rent_usecases/total_rented_units_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rent_grid_kpis_state.dart';
part 'rent_grid_kpis_event.dart';
part 'rent_grid_kpis_bloc.freezed.dart';

class RentGridKPIsBloc extends Bloc<RentGridKPIsEvent, RentGridKPIsState> {
  final TotalContractsUseCase totalContractsUseCase;
  final TotalRentedUnitsUseCase totalRentedUnitsUseCase;

  RentGridKPIsBloc({
    required this.totalContractsUseCase,
    required this.totalRentedUnitsUseCase,
  }) : super(const RentGridKPIsState.initialState()) {
    on<RentGridKPIsEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true, hasError: false));

      final failureOrSuccessTotalContracts =
          await totalContractsUseCase.execute(event.request);
      final failureOrSuccessTotalRentedUnits =
          await totalRentedUnitsUseCase.execute(event.request);

      failureOrSuccessTotalRentedUnits.when(
        (success) {
          emit(state.copyWith(
              isLoading: false, hasError: false, totalRentedUnits: success));
        },
        (error) {
          emit(state.copyWith(
              isLoading: false,
              hasError: true,
              errorMessage: error.message,
              totalRentedUnits: []));
        },
      );

      failureOrSuccessTotalContracts.when(
        (success) {
          emit(state.copyWith(
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
    });
  }
}
