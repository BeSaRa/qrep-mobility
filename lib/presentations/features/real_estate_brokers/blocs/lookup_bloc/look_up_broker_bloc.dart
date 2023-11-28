import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/models.dart';
import '../../../../../domain/models/requests/broker_requests/request_broker_values.dart';
import '../../../../../domain/usecases/usecases.dart';

part 'look_up_broker_bloc.freezed.dart';
part 'look_up_broker_event.dart';
part 'look_up_broker_state.dart';

class LookUpBrokerBloc extends Bloc<LookUpBrokerEvent, LookUpBrokerState> {
  final BrokerLookUpUseCase lookupBrokerUsecase;
  RealEstateBrokerLookUp? lookupBroker;
  LookUpBrokerBloc({required this.lookupBrokerUsecase})
      : super(const LookUpBrokerState.loading()) {
    on<LookUpBrokerEvent>((event, emit) async {
      await event.map(
        getBrokerLookup: (value) async {
          emit(const LookUpBrokerState.loading());
          final failureOrSuccess = await lookupBrokerUsecase.execute();
          failureOrSuccess.when((success) {
            lookupBroker = success;
            emit(LookUpBrokerState.done(success: success));
          }, (error) {
            emit(LookUpBrokerState.error(message: error.message));
          });
        },
      );
    });
  }
  RequestBrokerValues requestBroker = RequestBrokerValues(
    municipalityId: 4,
    brokerCategoryId: 2,
    limit: 5,
    offset: 0,
  );
}
