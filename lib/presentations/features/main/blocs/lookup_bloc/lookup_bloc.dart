import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:ebla/app/depndency_injection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/rent_models/rent_models.dart';
import '../../../../../domain/usecases/mortgage_usecases/lookup_mortgage_usecase.dart';
import '../../../../../domain/usecases/usecases.dart';

part 'lookup_event.dart';
part 'lookup_state.dart';
part 'lookup_bloc.freezed.dart';

class LookupBloc extends Bloc<LookupEvent, LookupState> {
  GetRentLookupUseCase getRentLookupUseCase;
  GetSellLookupUseCase getSellLookupUseCase;
  LookUpMortgageUseCase lookUpMortgageUseCase;

  RentLookupResponse? loockUpRent;
  RentLookupResponse? loockUpSell;
  RentLookupResponse? lookUpMortgage;
  LookupBloc({
    required this.getRentLookupUseCase,
    required this.getSellLookupUseCase,
    required this.lookUpMortgageUseCase,
  }) : super(const LookupState.loadingLookup()) {
    on<LookupEvent>((event, emit) async {
      await event.map(
        getRentLookupEvent: (value) async {
          emit(const LookupState.loadingLookup());
          final failureOrSuccess = await getRentLookupUseCase.execute();
          failureOrSuccess.when((rentLookup) {
            loockUpRent = rentLookup;
            emit(LookupState.loadedLookup(lookup: rentLookup));
          }, (error) {
            emit(LookupState.errorLookUp(message: error.message));
          });
        },
        getMortgageLookupEvent: (value) async {
          emit(const LookupState.loadingLookup());
          final failureOrSuccess = await lookUpMortgageUseCase.execute();
          failureOrSuccess.when((mortgageLookup) {
            lookUpMortgage = mortgageLookup;
            emit(LookupState.loadedLookup(lookup: mortgageLookup));
          }, (error) {
            emit(LookupState.errorLookUp(message: error.message));
          });
        },
        getSellLookupEvent: (value) async {
          emit(const LookupState.loadingLookup());
          final failureOrSuccess = await getSellLookupUseCase.execute();
          failureOrSuccess.when((sellLookup) {
            loockUpSell = sellLookup;
            emit(LookupState.loadedLookup(lookup: sellLookup));
          }, (error) {
            emit(LookupState.errorLookUp(message: error.message));
          });
        },
        initilaEvent: (value) {
          getRentLookupUseCase = instance<GetRentLookupUseCase>();
          getSellLookupUseCase = instance<GetSellLookupUseCase>();
          lookUpMortgageUseCase = instance<LookUpMortgageUseCase>();
          emit(const LookupState.loadingLookup());
        },
      );
    }, transformer: restartable());
  }
}
