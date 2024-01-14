import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/domain/models/requests/sell_requests/request_sell_values.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sell_bloc.freezed.dart';
part 'sell_event.dart';
part 'sell_state.dart';

class SellBloc extends Bloc<SellEvent, SellState> {
  // final GetSellLookupUseCase getSellLookupUseCase;
  // RentLookupResponse? loockUpSell;
  SellBloc() : super(const SellState.loadingSellLookup()) {
    on<SellEvent>((event, emit) async {
      // await event.map(
      //   getSellLookupEvent: (value) async {
      //     emit(const SellState.loadingSellLookup());
      //     final failureOrSuccess = await getSellLookupUseCase.execute();
      //     failureOrSuccess.when((sellLookup) {
      //       loockUpSell = sellLookup;
      //       emit(SellState.loadedSellLookup(sellLookup: sellLookup));
      //     }, (error) {
      //       emit(SellState.errorSellLookUp(message: error.message));
      //     });
      //   },
      // );
    });
  }

  int unit = 2;

  setUnit(int val) {
    unit = val;
  }

  RequestSellValues requestSellDefault = RequestSellValues(
      areaCode: -1,
      areaFrom: null,
      areaTo: null,
      issueDateEndMonth: 12,
      issueDateFrom: null,
      issueDateQuarterList: [1, 2, 3, 4],
      issueDateStartMonth: 1,
      issueDateMonth: null,
      halfYearDuration: null,
      issueDateTo: null,
      issueDateYear: 2023,
      limit: 5,
      municipalityId: -1,
      offset: 0,
      propertyTypeList: [-1],
      purposeList: [-1],
      realEstateValueFrom: null,
      realEstateValueTo: null,
      zoneId: -1,
      periodId: 1);
  RequestSellValues requestSell = RequestSellValues(
      areaCode: -1,
      areaFrom: null,
      areaTo: null,
      issueDateEndMonth: 12,
      issueDateFrom: null,
      issueDateQuarterList: [1, 2, 3, 4],
      issueDateStartMonth: 1,
      issueDateMonth: null,
      halfYearDuration: null,
      issueDateTo: null,
      issueDateYear: 2023,
      limit: 5,
      municipalityId: -1,
      offset: 0,
      propertyTypeList: [-1],
      purposeList: [-1],
      realEstateValueFrom: null,
      realEstateValueTo: null,
      zoneId: -1,
      periodId: 1);
}
