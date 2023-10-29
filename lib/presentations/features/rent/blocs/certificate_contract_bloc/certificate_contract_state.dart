part of 'certificate_contract_bloc.dart';

@freezed
class CertificateContractState with _$CertificateContractState {
  const factory CertificateContractState.initial({
    @Default(false) bool isLoading,
    @Default(false) bool isHasErrorContract,
    @Default('') String errorMessage,
    @Default([]) List<BaseRentResponse> listResponse,
  }) = _Initial;
}
