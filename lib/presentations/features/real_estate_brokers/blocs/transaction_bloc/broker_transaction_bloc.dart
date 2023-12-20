import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/requests/broker_requests/request_broker_values.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/broker_models/broker_models.dart';
import '../../../../../domain/usecases/real_estate_broker/broker_transaction_usecase.dart';

part 'broker_transaction_bloc.freezed.dart';
part 'broker_transaction_event.dart';
part 'broker_transaction_state.dart';

class BrokerTransactionBloc
    extends Bloc<BrokerTransactionEvent, BrokerTransactionState> {
  final BrokerTransactionUseCase brokerTransactionUseCase;

  BrokerTransactionBloc(this.brokerTransactionUseCase)
      : super(const BrokerTransactionState.initial()) {
    List<RealEstateBrokerTransactionData> data = [];
    on<BrokerTransactionEvent>((event, emit) async {
      await event.map(started: (value) async {
        emit(const BrokerTransactionState.loading());
        final failureOrSuccess =
            await brokerTransactionUseCase.execute(value.request);
        failureOrSuccess.when((success) {
          data = success.transactionList;
          emit(BrokerTransactionState.loaded(success.transactionList));
        }, (error) {
          emit(BrokerTransactionState.error(error.message));
        });
      }, search: (_Search value) {
        List<RealEstateBrokerTransactionData> newData = [];
        if (value.name.isNotEmpty) {
          data.map((e) {
            if (e.brokerEnName.contains(value.name) ||
                e.brokerArName.contains(value.name)) {
              newData.add(e);
            }
          }).toList();
          emit(BrokerTransactionState.loaded(newData));
        } else {
          emit(BrokerTransactionState.loaded(data));
        }
      });
    });
  }
}
