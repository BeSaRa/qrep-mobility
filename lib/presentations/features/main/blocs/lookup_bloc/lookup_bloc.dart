import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:ebla/app/depndency_injection.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/broker_models/broker_models.dart';
import '../../../../../domain/models/rent_models/rent_models.dart';
import '../../../../../domain/usecases/usecases.dart';
import '../../../../resources/resources.dart';

part 'lookup_bloc.freezed.dart';
part 'lookup_event.dart';
part 'lookup_state.dart';

class LookupBloc extends Bloc<LookupEvent, LookupState> {
  GetRentLookupUseCase getRentLookupUseCase;
  GetSellLookupUseCase getSellLookupUseCase;
  LookUpMortgageUseCase lookUpMortgageUseCase;
  BrokerLookUpUseCase lookupBrokerUsecase;
  BrokerLookOVUpUseCase lookOVUpUseCase;

  LookupResponse? lookUpRent = const LookupResponse();
  LookupResponse? lookUpSell = const LookupResponse();
  LookupResponse? lookUpMortgage = const LookupResponse();
  RealEstateBrokerLookUp? lookupBroker = RealEstateBrokerLookUp();
  RealEstateBrokerLookUp? lookupBrokerOv = RealEstateBrokerLookUp();

  LookupBloc(
      {required this.getRentLookupUseCase,
      required this.getSellLookupUseCase,
      required this.lookUpMortgageUseCase,
      required this.lookupBrokerUsecase,
      required this.lookOVUpUseCase})
      : super(const LookupState.loadingLookup()) {
    on<LookupEvent>((event, emit) async {
      await event.map(
        getRentLookupEvent: (value) async {
          if (lookUpRent == const LookupResponse()) {
            if (kDebugMode) {
              print("this event is been called");
            }
            emit(const LookupState.loadingLookup());
            final failureOrSuccess = await getRentLookupUseCase.execute();
            failureOrSuccess.when((rentLookup) {
              lookUpRent = rentLookup;
              emit(LookupState.loadedLookup(lookup: rentLookup));
            }, (error) {
              emit(LookupState.errorLookUp(message: error.message));
            });
          } else {
            emit(LookupState.loadedLookup(lookup: lookUpRent!));
          }
        },
        getMortgageLookupEvent: (value) async {
          if (lookUpMortgage == const LookupResponse()) {
            emit(const LookupState.loadingLookup());
            final failureOrSuccess = await lookUpMortgageUseCase.execute();
            failureOrSuccess.when((mortgageLookup) {
              lookUpMortgage = mortgageLookup;
              emit(LookupState.loadedLookup(lookup: mortgageLookup));
            }, (error) {
              emit(LookupState.errorLookUp(message: error.message));
            });
          } else {
            emit(LookupState.loadedLookup(lookup: lookUpMortgage!));
          }
        },
        getSellLookupEvent: (value) async {
          if (lookUpSell == const LookupResponse()) {
            emit(const LookupState.loadingLookup());
            final failureOrSuccess = await getSellLookupUseCase.execute();
            failureOrSuccess.when((sellLookup) {
              lookUpSell = sellLookup;
              emit(LookupState.loadedLookup(lookup: sellLookup));
            }, (error) {
              emit(LookupState.errorLookUp(message: error.message));
            });
          } else {
            emit(LookupState.loadedLookup(lookup: lookUpSell!));
          }
        },
        initilaEvent: (value) {
          getRentLookupUseCase = instance<GetRentLookupUseCase>();
          getSellLookupUseCase = instance<GetSellLookupUseCase>();
          lookUpMortgageUseCase = instance<LookUpMortgageUseCase>();
          lookupBrokerUsecase = instance<BrokerLookUpUseCase>();
          lookOVUpUseCase = instance<BrokerLookOVUpUseCase>();
        },
        getBrokerLookupEvent: (_GetBrokerLookupEvent value) async {
          emit(const LookupState.loadingLookup());
          if (lookUpRent == const LookupResponse()) {
            final failureOrSuccessRent = await getRentLookupUseCase.execute();
            failureOrSuccessRent.when((rentLookup) {
              lookUpRent = rentLookup;
            }, (error) {});
          }
          if (lookUpMortgage == const LookupResponse()) {
            final failureOrSuccessMortgage =
                await lookUpMortgageUseCase.execute();
            failureOrSuccessMortgage.when((mortgageLookup) {
              lookUpMortgage = mortgageLookup;
            }, (error) {});
          }
          if (lookUpSell == const LookupResponse()) {
            final failureOrSuccessSell = await getSellLookupUseCase.execute();
            failureOrSuccessSell.when((sellLookup) {
              lookUpSell = sellLookup;
            }, (error) {});
          }

          if (lookupBrokerOv == RealEstateBrokerLookUp()) {
            final ovFailureOrSucces = await lookOVUpUseCase.execute();
            ovFailureOrSucces.when((success) {
              lookupBrokerOv = success;
              if (kDebugMode) {
                print("fatina successov $success");
              }
            }, (error) {});
          }
          if (lookupBroker == RealEstateBrokerLookUp()) {
            final failureOrSuccess = await lookupBrokerUsecase.execute();
            failureOrSuccess.when((success) {
              lookupBroker = success;
              if (kDebugMode) {
                print("fatina success $success");
              }
            }, (error) {
              if (kDebugMode) {
                print("fatina error $error");
              }
            });
          }
          if (lookUpSell != const LookupResponse() &&
              lookupBroker != const LookupResponse() &&
              lookupBrokerOv != const LookupResponse() &&
              lookUpMortgage != RealEstateBrokerLookUp() &&
              lookUpRent != RealEstateBrokerLookUp()) {
            emit(LookupState.loadedLookup(lookup: lookUpRent!));
          } else {
            emit(LookupState.errorLookUp(
                message: AppStrings().somethingWentWrong));
          }
        },
      );
    }, transformer: restartable());
  }
}
