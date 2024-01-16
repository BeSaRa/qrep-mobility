part of 'mortgage_bloc.dart';

@freezed
class MortgageState with _$MortgageState {
  const factory MortgageState.initial() = _Initial;

  const factory MortgageState.loading() = _Loading;

  const factory MortgageState.success(LookupResponse response) = _Success;

  const factory MortgageState.error(String message) = _Error;
}
