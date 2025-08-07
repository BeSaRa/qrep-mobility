import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/broker_models/broker_models.dart';
import '../../../../../domain/models/requests/broker_requests/request_broker_values.dart';
import '../../../../../domain/usecases/usecases.dart';

part 'look_up_broker_bloc.freezed.dart';
part 'look_up_broker_event.dart';
part 'look_up_broker_state.dart';

class LookUpBrokerBloc extends Bloc<LookUpBrokerEvent, LookUpBrokerState> {
  final BrokerLookUpUseCase lookupBrokerUsecase;
  final BrokerLookOVUpUseCase lookOVUpUseCase;
  RealEstateBrokerLookUp? lookupBroker;
  RealEstateBrokerLookUp? lookupBrokerOv;

  LookUpBrokerBloc(
      {required this.lookupBrokerUsecase, required this.lookOVUpUseCase})
      : super(const LookUpBrokerState.loading()) {
    on<LookUpBrokerEvent>((event, emit) async {
      await event.map(
        getBrokerLookup: (value) async {
          emit(const LookUpBrokerState.loading());
          final failureOrSuccess = await lookupBrokerUsecase.execute();
          final ovFailureOrSucces = await lookOVUpUseCase.execute();
          ovFailureOrSucces.when((success) {
            lookupBrokerOv = success;
          }, (error) {
            emit(LookUpBrokerState.error(message: error.message));
          });

          failureOrSuccess.when((success) {
            lookupBroker = success;
          }, (error) {
            emit(LookUpBrokerState.error(message: error.message));
          });
          if (lookupBrokerOv != null && lookupBroker != null) {
            emit(LookUpBrokerState.done(
                successov: lookupBrokerOv!, success: lookupBroker!));
          }
        },
      );
    });
  }

  RequestBrokerValues requestBroker = RequestBrokerValues(
    municipalityId: -1,
    brokerCategoryId: 2,
    limit: 5,
    offset: 0,
  );
  RequestBrokerValues requestDefaultBroker = RequestBrokerValues(
    municipalityId: -1,
    brokerCategoryId: 2,
    limit: 5,
    offset: 0,
  );
}
