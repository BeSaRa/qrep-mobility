part of 'total_contracts_bloc.dart';

@freezed
class TotalContractsEvent with _$TotalContractsEvent {
  const factory TotalContractsEvent.getTotalContracts() = _TotalContractsEvent;
}
