import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/rent_models/rent_models.dart';
import '../../../../../domain/models/requests/rent_requests/request_mean_value.dart';
import '../../../../../domain/usecases/rent_usecases/certificate_contract_usecases/certificate_usecase.dart';
import '../../../../../domain/usecases/rent_usecases/certificate_contract_usecases/contract_usecase.dart';

part 'certificate_contract_event.dart';
part 'certificate_contract_state.dart';
part 'certificate_contract_bloc.freezed.dart';

class CertificateContractBloc
    extends Bloc<CertificateContractEvent, CertificateContractState> {
  final CertificateCountUsecase certificateCountUsecase;
  final ContractCountUsecase contractCountUsecase;
  CertificateContractBloc(
      {required this.certificateCountUsecase,
      required this.contractCountUsecase})
      : super(const _Initial()) {
    on<CertificateContractEvent>((event, emit) async {
      await event.map(
        certificateCountEvent: (value) async {
          emit(state.copyWith(
              isLoadingCertificate: true, isHasErrorCertificate: false));
          final failureOrSuccess =
              await certificateCountUsecase.execute(value.request);
          failureOrSuccess.when((success) {
            emit(state.copyWith(
                isLoadingCertificate: false,
                isHasErrorCertificate: false,
                certificateCountResponse: success));
          }, (error) {
            emit(state.copyWith(
                isLoadingCertificate: false,
                isHasErrorCertificate: true,
                errorMessageCertificate: error.message,
                certificateCountResponse: []));
          });
        },
        contractCountEvent: (value) async {
          emit(state.copyWith(
              isLoadingContract: true, isHasErrorContract: false));
          final failureOrSuccess =
              await contractCountUsecase.execute(value.request);
          failureOrSuccess.when((success) {
            emit(state.copyWith(
                isLoadingContract: false,
                isHasErrorContract: false,
                contractCountResponse: success));
          }, (error) {
            emit(state.copyWith(
                isLoadingContract: false,
                isHasErrorContract: true,
                errorMessageContract: error.message,
                contractCountResponse: []));
          });
        },
      );
    });
  }
}
