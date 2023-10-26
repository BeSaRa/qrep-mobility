import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/requests/mortgage_requests/request_mortgage_values.dart';
import 'package:ebla/domain/usecases/mortgage_usecases/transactions_mortgage_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/mrtgage_models/mortgage_models.dart';

part 'mortgage_transactions_bloc.freezed.dart';
part 'mortgage_transactions_event.dart';
part 'mortgage_transactions_state.dart';

class MortgageTransactionsBloc
    extends Bloc<MortgageTransactionsEvent, MortgageTransactionsState> {
  final MortgageTransactionUseCase mortgageTransactionUse;
  late MortgageTransactionResponse response = MortgageTransactionResponse();

  MortgageTransactionsBloc(this.mortgageTransactionUse)
      : super(const MortgageTransactionsState.initial()) {
    on<MortgageTransactionsEvent>((event, emit) async {
      await event.map(
        started: (_Started value) async {
          emit(const MortgageTransactionsState.loading());
          final failureOrSuccess =
              await mortgageTransactionUse.execute(event.requestMortgageValues);
          failureOrSuccess.when((success) {
            response = success;
            emit(MortgageTransactionsState.done(success));
          }, (error) {
            emit(MortgageTransactionsState.error(error.message));
          });
        },
      );
    });
  }
}
