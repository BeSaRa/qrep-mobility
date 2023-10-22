import 'package:bloc/bloc.dart';
import 'package:ebla/domain/usecases/sell_usecases/sell_default_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/rent_models/rent_models.dart';
import '../../../../../domain/models/requests/rent_requests/request_mean_value.dart';

part 'sell_default_bloc.freezed.dart';
part 'sell_default_event.dart';
part 'sell_default_state.dart';

class SellDefaultBloc extends Bloc<SellDefaultEvent, SellDefaultState> {
  final SellDefaultUseCase sellDefaultUseCase;

  SellDefaultBloc(this.sellDefaultUseCase)
      : super(const SellDefaultState.initial()) {
    on<SellDefaultEvent>((event, emit) async {
      await event.map(started: (_Started value) async {
        final failureOrSuccess =
            await sellDefaultUseCase.execute(event.request);
        failureOrSuccess.when((success) {
          emit(SellDefaultState.done(success.first));
        }, (error) {
          emit(SellDefaultState.error(error.message));
        });
      });
    });
  }
}
