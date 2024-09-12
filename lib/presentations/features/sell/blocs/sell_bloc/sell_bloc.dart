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
    print(
        "this is the criteria object i got ${criteriaObject.unit},${criteriaObject.areaFrom}");
    requestSell = RequestSellValues(
        areaCode: criteriaObject.areaCode ?? -1,
        areaFrom:
            getAreaFrom(criteriaObject.unit ?? 2, criteriaObject.areaFrom),
        areaTo: getAreaTo(criteriaObject.unit ?? 2, criteriaObject.areaTo),
        issueDateEndMonth: criteriaObject.issueDateEndMonth ?? 12,
        issueDateFrom: null,
        issueDateQuarterList: getQuarterList(
            criteriaObject.durationType,
            criteriaObject.halfYearDuration,
            criteriaObject.issueDateQuarterList),
        issueDateStartMonth: criteriaObject.issueDateStartMonth ?? 1,
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
        periodId: criteriaObject.periodId ?? 1,
        unit: criteriaObject.unit ?? 2);
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
      periodId: 1,
      unit: null);
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
      periodId: 1,
      unit: null);

  List<int>? getQuarterList(
      int? durationType, int? halfYearDuration, List<int>? quarter) {
    if (durationType == 2) {
      if (halfYearDuration == 1) {
        return [1, 2];
      } else {
        return [3, 4];
      }
    } else if (durationType == 3) {
      return quarter;
    } else {
      return [1, 2, 3, 4];
    }
  }

  double? getAreaFrom(int unit, double? area) {
    if (unit == 1) {
      return area;
    } else {
      return area != null ? null : area! / 10.8;
    }
  }

  double? getAreaTo(int unit, double? area) {
    if (unit == 1) {
      return area;
    } else {
      return area != null ? null : area! / 10.8;
    }
  }
}
