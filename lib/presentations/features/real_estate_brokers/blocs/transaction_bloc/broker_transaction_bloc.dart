import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/requests/broker_requests/request_broker_values.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/usecases/real_estate_broker/broker_transaction_usecase.dart';

part 'broker_transaction_bloc.freezed.dart';
part 'broker_transaction_event.dart';
part 'broker_transaction_state.dart';

class BrokerTransactionBloc
    extends Bloc<BrokerTransactionEvent, BrokerTransactionState> {
  final BrokerTransactionUseCase brokerTransactionUseCase;

  BrokerTransactionBloc(this.brokerTransactionUseCase)
      : super(const BrokerTransactionState.initial()) {
    on<BrokerTransactionEvent>((event, emit) async {
      await event.map(started: (value) async {
        event.map(started: (value) async {
          brokerTransactionUseCase.execute(event.request);
        });
      });
    });
  }
}
