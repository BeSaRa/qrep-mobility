import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/usecases/sell_usecases/sell_usecases.dart';

part 'sell_event.dart';
part 'sell_state.dart';
part 'sell_bloc.freezed.dart';

class SellBloc extends Bloc<SellEvent, SellState> {
  final GetSellLookupUseCase getSellLookupUseCase;
  SellBloc({required this.getSellLookupUseCase})
      : super(const SellState.loadingSellLookup()) {
    on<SellEvent>((event, emit) async {
      await event.map(
        getSellLookupEvent: (value) async {
          emit(const SellState.loadingSellLookup());
          final failureOrSuccess = await getSellLookupUseCase.execute();
          failureOrSuccess.when((sellLookup) {
            emit(SellState.loadedSellLookup(sellLookup: sellLookup));
          }, (error) {
            emit(SellState.errorSellLookUp(message: error.message));
          });
        },
      );
    });
  }
}
