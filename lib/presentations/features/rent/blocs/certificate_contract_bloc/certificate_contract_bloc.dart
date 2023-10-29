import 'package:bloc/bloc.dart';
import 'package:ebla/domain/usecases/rent_usecases/mean_rent_amount/mean_rent_amount_usecase.dart';
import 'package:ebla/domain/usecases/rent_usecases/rent_amount/rent_amount_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/rent_models/rent_models.dart';
import '../../../../../domain/models/requests/rent_requests/request_mean_value.dart';
import '../../../../../domain/usecases/rent_usecases/certificate_contract_usecases/certificate_usecase.dart';
import '../../../../../domain/usecases/rent_usecases/certificate_contract_usecases/contract_usecase.dart';

part 'certificate_contract_bloc.freezed.dart';
part 'certificate_contract_event.dart';
part 'certificate_contract_state.dart';

class CertificateContractBloc
    extends Bloc<CertificateContractEvent, CertificateContractState> {
  final CertificateCountUsecase certificateCountUsecase;
  final ContractCountUsecase contractCountUsecase;
  final RentValueAmountUseCase rentValueAmountUseCase;
  final MeanRentAmountUsecase meanRentAmountUsecase;
  int index = 1;

  CertificateContractBloc(
      {required this.certificateCountUsecase,
      required this.contractCountUsecase,
      required this.rentValueAmountUseCase,
      required this.meanRentAmountUsecase})
      : super(const _Initial()) {
    on<CertificateContractEvent>((event, emit) async {
      await event.map(
        certificateCountEvent: (value) async {
          index = 1;
          emit(state.copyWith(isLoading: true, isHasErrorContract: false));
          final failureOrSuccess =
              await certificateCountUsecase.execute(value.request);
          failureOrSuccess.when((success) {
            emit(state.copyWith(
                isLoading: false,
                isHasErrorContract: false,
                listResponse: success));
          }, (error) {
            emit(state.copyWith(
                isLoading: false,
                isHasErrorContract: true,
                errorMessage: error.message,
                listResponse: []));
          });
        },
        contractCountEvent: (value) async {
          index = 2;
          emit(state.copyWith(isLoading: true, isHasErrorContract: false));
          final failureOrSuccess =
              await contractCountUsecase.execute(value.request);
          failureOrSuccess.when((success) {
            emit(state.copyWith(
                isLoading: false,
                isHasErrorContract: false,
                listResponse: success));
          }, (error) {
            emit(
              state.copyWith(
                  isLoading: false,
                  isHasErrorContract: true,
                  errorMessage: error.message,
                  listResponse: []),
            );
          });
        },
        meanRentAmountEvent: (_MeanRentAmountEvent value) async {
          index = 3;
          emit(state.copyWith(isLoading: true, isHasErrorContract: false));
          final failureOrSuccess =
              await meanRentAmountUsecase.execute(value.request);
          failureOrSuccess.when((success) {
            emit(state.copyWith(
                isLoading: false,
                isHasErrorContract: false,
                listResponse: success));
          }, (error) {
            emit(state.copyWith(
                isLoading: false,
                isHasErrorContract: true,
                errorMessage: error.message,
                listResponse: []));
          });
        },
        RentAmountEvent: (_RentAmountEvent value) async {
          index = 4;
          emit(state.copyWith(isLoading: true, isHasErrorContract: false));
          final failureOrSuccess =
              await rentValueAmountUseCase.execute(value.request);
          failureOrSuccess.when((success) {
            emit(state.copyWith(
                isLoading: false,
                isHasErrorContract: false,
                listResponse: success));
          }, (error) {
            emit(state.copyWith(
                isLoading: false,
                isHasErrorContract: true,
                errorMessage: error.message,
                listResponse: []));
          });
        },
      );
    });
  }
}
