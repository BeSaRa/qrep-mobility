part of 'mortgage_transactions_bloc.dart';

@freezed
class MortgageTransactionsState with _$MortgageTransactionsState {
  const factory MortgageTransactionsState.initial() = _Initial;

  const factory MortgageTransactionsState.loading() = _Loading;

  const factory MortgageTransactionsState.done(
      MortgageTransactionResponse response) = _Done;

  const factory MortgageTransactionsState.error(String message) = _Error;
}
