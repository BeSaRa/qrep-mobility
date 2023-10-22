import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/sell_models/sell_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/requests/sell_requests/request_sell_values.dart';
import '../../../../../domain/usecases/usecases.dart';

part 'sell_transaction_bloc.freezed.dart';
part 'sell_transaction_event.dart';
part 'sell_transaction_state.dart';

class SellTransactionBloc
    extends Bloc<SellTransactionEvent, SellTransactionState> {
  SellTransactionUseCase sellTransactionUseCase;

  SellTransactionBloc(this.sellTransactionUseCase)
      : super(const SellTransactionState.initial()) {
    on<SellTransactionEvent>((event, emit) async {
      await event.map(started: (_Started value) async {
        final failureOrSuccess =
            await sellTransactionUseCase.execute(event.request);
        failureOrSuccess.when((success) {
          emit(SellTransactionState.success(success));
        }, (error) {
          emit(SellTransactionState.error(error.message));
        });
      });
    });
  }
}
