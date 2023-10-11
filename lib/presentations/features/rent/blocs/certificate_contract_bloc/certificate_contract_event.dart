part of 'certificate_contract_bloc.dart';

@freezed
class CertificateContractEvent with _$CertificateContractEvent {
  const factory CertificateContractEvent.certificateCountEvent(
      {required RequestMeanValue request}) = _CertificateCountEvent;
  const factory CertificateContractEvent.contractCountEvent(
      {required RequestMeanValue request}) = _ContractCountEvent;
}
