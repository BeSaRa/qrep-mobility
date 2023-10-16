import 'package:bloc/bloc.dart';
import 'package:ebla/domain/usecases/rent_usecases/defualt_rent_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/rent_models/rent_models.dart';
import '../../../../../domain/models/requests/rent_requests/request_mean_value.dart';

part 'rent_default_bloc.freezed.dart';
part 'rent_default_event.dart';
part 'rent_default_state.dart';

class RentDefaultBloc extends Bloc<RentDefaultEvent, RentDefaultState> {
  final RentDefaultUseCase rentDefaultUseCase;
  RentDefault? rentDefault;

  RentDefaultBloc(this.rentDefaultUseCase)
      : super(const RentDefaultState.initial()) {
    on<RentDefaultEvent>((event, emit) async {
      await event.map(started: (_Started value) async {
        final failureOrSuccess =
            await rentDefaultUseCase.execute(event.request);
        failureOrSuccess.when((success) {
          emit(RentDefaultState.success(success.first));
        }, (error) {
          emit(RentDefaultState.error(error.message));
        });
      });
    });
  }
}
