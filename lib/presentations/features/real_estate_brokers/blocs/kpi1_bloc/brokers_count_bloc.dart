import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/requests/broker_requests/request_broker_values.dart';
import '../../../../../domain/usecases/real_estate_broker/broker_count_usecase.dart';

part 'brokers_count_bloc.freezed.dart';
part 'brokers_count_event.dart';
part 'brokers_count_state.dart';

class BrokersCountBloc extends Bloc<BrokersCountEvent, BrokersCountState> {
  final BrokerCountUseCase brokerCountUseCase;
  double count = 0;
  BrokersCountBloc(this.brokerCountUseCase) : super(const BrokersCountState.initial()) {
    on<BrokersCountEvent>((event, emit) async {
      await event.map(started: (value) async {
        emit(const BrokersCountState.loading());
        final failureOrSuccess = await brokerCountUseCase.execute(event.request);
        failureOrSuccess.when((success) {
          count = success.kpiVal;
          emit( BrokersCountState.loaded(success.kpiVal));
        }, (error) {
          emit(BrokersCountState.error(error.message));
        });
      });
    });
  }
}
