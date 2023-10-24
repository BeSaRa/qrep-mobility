import 'package:bloc/bloc.dart';
import 'package:ebla/domain/usecases/mortgage_usecases/lookup_mortgage_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/rent_models/rent_models.dart';

part 'mortgage_bloc.freezed.dart';
part 'mortgage_event.dart';
part 'mortgage_state.dart';

class MortgageBloc extends Bloc<MortgageEvent, MortgageState> {
  final LookUpMortgageUseCase lookUpMortgageUseCase;
  RentLookupResponse? lookUpMortgage;

  MortgageBloc(this.lookUpMortgageUseCase)
      : super(const MortgageState.initial()) {
    on<MortgageEvent>((event, emit) async {
      await event.map(
        started: (_Started value) async {
          emit(const MortgageState.loading());
          final failureOrSuccess = await lookUpMortgageUseCase.execute();
          failureOrSuccess.when((success) {
            lookUpMortgage = success;
            emit(MortgageState.success(success));
          }, (error) {
            emit(MortgageState.error(error.message));
          });
        },
      );
    });
  }
}
