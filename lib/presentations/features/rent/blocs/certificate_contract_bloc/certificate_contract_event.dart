part of 'certificate_contract_bloc.dart';

@freezed
class CertificateContractEvent with _$CertificateContractEvent {
  const factory CertificateContractEvent.certificateCountEvent(
      {required RentRequest request}) = _CertificateCountEvent;

  const factory CertificateContractEvent.contractCountEvent(
      {required RentRequest request}) = _ContractCountEvent;

  const factory CertificateContractEvent.meanRentAmountEvent(
      {required RentRequest request}) = _MeanRentAmountEvent;

  const factory CertificateContractEvent.rentAmountEvent(
      {required RentRequest request}) = _RentAmountEvent;

  const factory CertificateContractEvent.rentValuePerMeterEvent(
      {required RentRequest request}) = _RentValuePerMeterEvent;

  const factory CertificateContractEvent.rentedAreasEvent(
      {required RentRequest request}) = _RentedAreasEvent;
}
