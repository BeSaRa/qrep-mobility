import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/rent_models/rent_models.dart';
import '../../../../../domain/models/requests/rent_requests/request_mean_value.dart';

part 'rent_bloc.freezed.dart';
part 'rent_event.dart';
part 'rent_state.dart';

class RentBloc extends Bloc<RentEvent, RentState> {
  // final GetRentLookupUseCase getRentLookupUseCase;
  // RentLookupResponse? loockUpRent;
  RentBloc() : super(const _Initial()) {
    on<RentEvent>((event, emit) async {
      // await event.map(
      //   getRentLookupEvent: (value) async {
      //     emit(state.copyWith(
      //       isLoadingRentLookup: true,
      //       isHasErrorRentLookup: false,
      //       rentLookup: const RentLookupResponse(),
      //     ));
      //     final failureOrSuccess = await getRentLookupUseCase.execute();
      //     failureOrSuccess.when((success) {
      //       loockUpRent = success;
      //       emit(
      //         state.copyWith(
      //           rentLookup: success,
      //           isLoadingRentLookup: false,
      //           isHasErrorRentLookup: false,
      //         ),
      //       );
      //     }, (error) {
      //       emit(
      //         state.copyWith(
      //           isLoadingRentLookup: false,
      //           isHasErrorRentLookup: true,
      //           errorMessageRentLookup: error.message,
      //           rentLookup: const RentLookupResponse(),
      //         ),
      //       );
      //     });
      //   },
      // );
    });
  }

  RequestMeanValue requestDefault = RequestMeanValue(
      areaFrom: null,
      areaTo: null,
      bedRoomsCount: 0,
      furnitureStatus: -1,
      issueDateEndMonth: 12,
      issueDateFrom: null,
      issueDateQuarterList: [1, 2, 3, 4],
      issueDateStartMonth: 1,
      halfYearDuration: null,
      issueDateTo: null,
      issueDateYear: 2023,
      limit: 5,
      municipalityId: -1,
      offset: 0,
      nationalityCode: -1,
      propertyTypeList: [-1],
      purposeList: [-1],
      rentPaymentMonthlyPerUnitFrom: null,
      rentPaymentMonthlyPerUnitTo: null,
      zoneId: -1,
      unit: 2,
      periodId: 1);
  RequestMeanValue requestMeanValue = RequestMeanValue(
      areaFrom: null,
      areaTo: null,
      bedRoomsCount: 0,
      furnitureStatus: -1,
      issueDateEndMonth: 12,
      issueDateFrom: null,
      issueDateQuarterList: [1, 2, 3, 4],
      issueDateStartMonth: 1,
      halfYearDuration: null,
      issueDateTo: null,
      issueDateYear: 2023,
      limit: 5,
      municipalityId: -1,
      offset: 0,
      nationalityCode: -1,
      propertyTypeList: [-1],
      purposeList: [-1],
      rentPaymentMonthlyPerUnitFrom: null,
      rentPaymentMonthlyPerUnitTo: null,
      zoneId: -1,
      unit: 2,
      periodId: 1);
}
