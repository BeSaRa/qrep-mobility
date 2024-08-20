import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/requests/mortgage_requests/request_mortgage_values.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/favourite/favourite_models.dart';
import '../../../../domain/models/rent_models/rent_models.dart';

part 'mortgage_bloc.freezed.dart';
part 'mortgage_event.dart';
part 'mortgage_state.dart';

class MortgageBloc extends Bloc<MortgageEvent, MortgageState> {
  // final LookUpMortgageUseCase lookUpMortgageUseCase;
  // RentLookupResponse? lookUpMortgage;

  MortgageBloc() : super(const MortgageState.initial()) {
    on<MortgageEvent>((event, emit) async {
      // await event.map(
      //   started: (_Started value) async {
      //     emit(const MortgageState.loading());
      //     final failureOrSuccess = await lookUpMortgageUseCase.execute();
      //     failureOrSuccess.when((success) {
      //       lookUpMortgage = success;
      //       emit(MortgageState.success(success));
      //     }, (error) {
      //       emit(MortgageState.error(error.message));
      //     });
      //   },
      // );
    });
  }
  setRequestCriteria(CriteriaObject criteriaObject) {
    requestMeanValue = RequestMortgageValues(
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

  RequestMortgageValues requestDefault = RequestMortgageValues(
      areaCode: -1,
      areaFrom: null,
      areaTo: null,
      issueDateEndMonth: 12,
      issueDateFrom: null,
      issueDateQuarterList: [1, 2, 3, 4],
      issueDateStartMonth: 1,
      issueDateMonth: null,
      issueDateTo: null,
      issueDateYear: DateTime.now().year,
      halfYearDuration: null,
      limit: 5,
      municipalityId: -1,
      offset: 0,
      propertyTypeList: [-1],
      purposeList: [-1],
      realEstateValueFrom: null,
      realEstateValueTo: null,
      zoneId: -1,
      unit: 1,
      periodId: 1);
  RequestMortgageValues requestMeanValue = RequestMortgageValues(
      areaCode: -1,
      areaFrom: null,
      areaTo: null,
      issueDateEndMonth: 12,
      issueDateFrom: null,
      issueDateQuarterList: [1, 2, 3, 4],
      issueDateStartMonth: 1,
      issueDateMonth: null,
      issueDateTo: null,
      issueDateYear: DateTime.now().year,
      halfYearDuration: null,
      limit: 5,
      municipalityId: -1,
      offset: 0,
      propertyTypeList: [-1],
      purposeList: [-1],
      realEstateValueFrom: null,
      realEstateValueTo: null,
      zoneId: -1,
      unit: 1,
      periodId: 1);
}
