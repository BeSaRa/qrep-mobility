import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/rent_models/rent_models.dart';
import '../../../../../domain/usecases/rent_usecases/rent_usecases.dart';

part 'rent_event.dart';
part 'rent_state.dart';
part 'rent_bloc.freezed.dart';

class RentBloc extends Bloc<RentEvent, RentState> {
  final GetRentLookupUseCase getRentLookupUseCase;
  RentBloc({required this.getRentLookupUseCase}) : super(const _Initial()) {
    on<RentEvent>((event, emit) async {
      await event.map(
        getRentLookupEvent: (value) async {
          emit(state.copyWith(
            isLoadingRentLookup: true,
            isHasErrorRentLookup: false,
            rentLookup: const RentLookupResponse(),
          ));
          final failureOrSuccess = await getRentLookupUseCase.execute();
          failureOrSuccess.when((success) {
            emit(
              state.copyWith(
                rentLookup: success,
                isLoadingRentLookup: false,
                isHasErrorRentLookup: false,
              ),
            );
          }, (error) {
            emit(
              state.copyWith(
                isLoadingRentLookup: false,
                isHasErrorRentLookup: true,
                errorMessageRentLookup: error.message,
                rentLookup: const RentLookupResponse(),
              ),
            );
          });
        },
      );
    });
  }
}
