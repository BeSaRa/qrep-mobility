import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/rent_models/rent_models.dart';
import '../../../../../domain/models/requests/rent_requests/request_mean_value.dart';
import '../../../../../domain/usecases/rent_usecases/mean_value_usecases/mean_value_usecases.dart';

part 'mean_value_event.dart';
part 'mean_value_state.dart';
part 'mean_value_bloc.freezed.dart';

class MeanValueBloc extends Bloc<MeanValueEvent, MeanValueState> {
  final MeanValueUsecase meanValueUsecase;
  final MeanValuePurposeUsecase meanValuePurposeUsecase;
  final MeanValuePropertyUsecase meanValuePropertyUsecase;
  MeanValueBloc({
    required this.meanValueUsecase,
    required this.meanValuePurposeUsecase,
    required this.meanValuePropertyUsecase,
  }) : super(const _Initial()) {
    on<MeanValueEvent>((event, emit) async {
      await event.map(
        getMeanValue: (value) async {
          emit(state.copyWith(
              isLoadingMeanValue: true, isHasErrorMeanValue: false));
          final failureOrSuccess =
              await meanValueUsecase.execute(value.request);
          failureOrSuccess.when((success) {
            emit(state.copyWith(
                isLoadingMeanValue: false,
                isHasErrorMeanValue: false,
                meanValueResponse: success));
          }, (error) {
            emit(state.copyWith(
                isLoadingMeanValue: false,
                isHasErrorMeanValue: true,
                errorMessageMeanValue: error.message,
                meanValueResponse: []));
          });
        },
        getMeanPropertyValue: (value) async {
          emit(
            state.copyWith(
              isLoadingMeanValueProperty: true,
              isHasErrorMeanValueProperty: false,
            ),
          );
          final failureOrSuccess =
              await meanValuePropertyUsecase.execute(value.request);
          failureOrSuccess.when((success) {
            emit(state.copyWith(
                isLoadingMeanValueProperty: false,
                isHasErrorMeanValueProperty: false,
                meanValueResponseProperty: success));
          }, (error) {
            emit(state.copyWith(
                isLoadingMeanValueProperty: false,
                isHasErrorMeanValueProperty: true,
                errorMessageMeanValueProperty: error.message,
                meanValueResponseProperty: []));
          });
        },
        getMeanPurposeValue: (value) async {
          emit(state.copyWith(
              isLoadingMeanValuePurpose: true,
              isHasErrorMeanValuePurpose: false));
          final failureOrSuccess =
              await meanValuePurposeUsecase.execute(value.request);
          failureOrSuccess.when((success) {
            emit(state.copyWith(
                isLoadingMeanValuePurpose: false,
                isHasErrorMeanValuePurpose: false,
                meanValueResponsePurpose: success));
          }, (error) {
            emit(state.copyWith(
                isLoadingMeanValuePurpose: false,
                isHasErrorMeanValuePurpose: true,
                errorMessageMeanValuePurpose: error.message,
                meanValueResponsePurpose: []));
          });
        },
      );
    });
  }
}
