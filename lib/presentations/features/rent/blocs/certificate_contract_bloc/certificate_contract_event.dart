part of 'certificate_contract_bloc.dart';

@freezed
class CertificateContractEvent with _$CertificateContractEvent {
  const factory CertificateContractEvent.certificateCountEvent(
      {required RequestMeanValue request}) = _CertificateCountEvent;

  const factory CertificateContractEvent.contractCountEvent(
      {required RequestMeanValue request}) = _ContractCountEvent;

  const factory CertificateContractEvent.meanRentAmountEvent(
      {required RequestMeanValue request}) = _MeanRentAmountEvent;

  const factory CertificateContractEvent.RentAmountEvent(
      {required RequestMeanValue request}) = _RentAmountEvent;

  const factory CertificateContractEvent.RentValuePerMeterEvent(
      {required RequestMeanValue request}) = _RentValuePerMeterEvent;

  const factory CertificateContractEvent.RentedAreasEvent(
      {required RequestMeanValue request}) = _RentedAreasEvent;
}
