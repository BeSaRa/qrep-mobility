import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/favourite/favourite_models.dart';
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

  setRequestCriteria(CriteriaObject criteriaObject) {
    requestSell = RequestSellValues(
        areaCode: criteriaObject.areaCode ?? -1,
        areaFrom: criteriaObject.areaFrom,
        areaTo: criteriaObject.areaTo,
        issueDateEndMonth: 12,
        issueDateFrom: null,
        issueDateQuarterList: criteriaObject.issueDateQuarterList,
        issueDateStartMonth: 1,
        issueDateMonth: criteriaObject.issueDateMonth,
        halfYearDuration: criteriaObject.halfYearDuration,
        issueDateTo: null,
        issueDateYear: criteriaObject.issueDateYear ?? DateTime.now().year,
        limit: 5,
        municipalityId: criteriaObject.municipalityId ?? -1,
        offset: 0,
        propertyTypeList: criteriaObject.propertyTypeList ?? [-1],
        purposeList: criteriaObject.purposeList ?? [-1],
        realEstateValueFrom: criteriaObject.realEstateValueFrom,
        realEstateValueTo: criteriaObject.realEstateValueTo,
        zoneId: criteriaObject.zoneId ?? -1,
        periodId: 1);
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
      issueDateYear: DateTime.now().year,
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
      issueDateYear: DateTime.now().year,
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
