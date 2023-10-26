part of 'mortgage_transactions_bloc.dart';

@freezed
class MortgageTransactionsEvent with _$MortgageTransactionsEvent {
  const factory MortgageTransactionsEvent.started(
      {required RequestMortgageValues requestMortgageValues}) = _Started;
}
