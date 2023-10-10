part of 'certificate_contract_bloc.dart';

@freezed
class CertificateContractState with _$CertificateContractState {
  const factory CertificateContractState.initial({
    @Default(false) bool isLoadingCertificate,
    @Default(false) bool isLoadingContract,
    @Default(false) bool isHasErrorContract,
    @Default(false) bool isHasErrorCertificate,
    @Default('') String errorMessageCertificate,
    @Default('') String errorMessageContract,
    @Default([]) List<BaseRentResponse> certificateCountResponse,
    @Default([]) List<BaseRentResponse> contractCountResponse,
  }) = _Initial;
}
