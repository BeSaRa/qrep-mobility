import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/requests/mortgage_requests/request_mortgage_values.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
      issueDateYear: 2023,
      halfYearDuration: null,
      limit: 5,
      municipalityId: -1,
      offset: 0,
      propertyTypeList: [-1],
      purposeList: [-1],
      realEstateValueFrom: null,
      realEstateValueTo: null,
      zoneId: -1,
      unit: 2,
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
      issueDateYear: 2023,
      halfYearDuration: null,
      limit: 5,
      municipalityId: -1,
      offset: 0,
      propertyTypeList: [-1],
      purposeList: [-1],
      realEstateValueFrom: null,
      realEstateValueTo: null,
      zoneId: -1,
      unit: 2,
      periodId: 1);
}
