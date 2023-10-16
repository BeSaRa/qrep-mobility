import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/rent_models/rent_models.dart';
import '../../../../../domain/models/requests/rent_requests/request_mean_value.dart';
import '../../../../../domain/usecases/usecases.dart';

part 'rent_summery_bloc.freezed.dart';
part 'rent_summery_event.dart';
part 'rent_summery_state.dart';

class RentSummeryBloc extends Bloc<RentSummeryEvent, RentSummeryState> {
  final RentSummeryUseCase rentSummeryUseCase;
  RentListSummary? rentSummery;

  RentSummeryBloc(this.rentSummeryUseCase) : super(const _Initial()) {
    on<RentSummeryEvent>((event, emit) async {
      await event.map(
        getRentSummary: (_RentSummaryEvent value) async {
          emit(state.copyWith(
            isLoadingRentSummery: true,
            isHasErrorRentSummery: false,
            rentSummery: const RentListSummary(),
          ));
          final failureOrSuccess =
              await rentSummeryUseCase.execute(event.request);
          failureOrSuccess.when((success) {
            rentSummery = success;
            emit(
              state.copyWith(
                rentSummery: success,
                isLoadingRentSummery: false,
                isHasErrorRentSummery: false,
              ),
            );
          }, (error) {
            print("this is the error $error");
            emit(
              state.copyWith(
                isLoadingRentSummery: false,
                isHasErrorRentSummery: true,
                errorMessageRentSummery: error.message,
                rentSummery: const RentListSummary(),
              ),
            );
          });
        },
      );
    });
  }
}
