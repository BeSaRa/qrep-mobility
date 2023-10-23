import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/domain/models/requests/sell_requests/request_sell_values.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/usecases/sell_usecases/sell_usecases.dart';

part 'sell_event.dart';
part 'sell_state.dart';
part 'sell_bloc.freezed.dart';

class SellBloc extends Bloc<SellEvent, SellState> {
  final GetSellLookupUseCase getSellLookupUseCase;
  RentLookupResponse? loockUpSell;
  SellBloc({required this.getSellLookupUseCase})
      : super(const SellState.loadingSellLookup()) {
    on<SellEvent>((event, emit) async {
      await event.map(
        getSellLookupEvent: (value) async {
          emit(const SellState.loadingSellLookup());
          final failureOrSuccess = await getSellLookupUseCase.execute();
          failureOrSuccess.when((sellLookup) {
            loockUpSell = sellLookup;
            emit(SellState.loadedSellLookup(sellLookup: sellLookup));
          }, (error) {
            emit(SellState.errorSellLookUp(message: error.message));
          });
        },
      );
    });
  }
  RequestSellValues requestSellDefault = RequestSellValues(
    municipalityId: 4,
    propertyTypeList: [-1],
    purposeList: [-1],
    issueDateQuarterList: [1, 2, 3, 4],
    issueDateYear: 2023,
    issueDateStartMonth: 1,
    issueDateEndMonth: DateTime.now().month,
    zoneId: -1,
    limit: 5,
  );
}
