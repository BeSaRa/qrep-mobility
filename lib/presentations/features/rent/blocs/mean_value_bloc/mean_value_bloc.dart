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
  MeanValueBloc({required this.meanValueUsecase}) : super(const _Initial()) {
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
      );
    });
  }
}
