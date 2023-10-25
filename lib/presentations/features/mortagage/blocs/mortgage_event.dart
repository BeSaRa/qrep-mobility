part of 'mortgage_bloc.dart';

@freezed
class MortgageEvent with _$MortgageEvent {
  const factory MortgageEvent.started() = _Started;
}
