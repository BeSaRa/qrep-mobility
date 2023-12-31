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
    municipalityId: -1,
    propertyTypeList: [-1],
    purposeList: [-1],
    issueDateQuarterList: [1, 2, 3, 4],
    furnitureStatus: -1,
    issueDateYear: 2023,
    issueDateStartMonth: 1,
    issueDateEndMonth: DateTime.now().month,
    zoneId: -1,
    nationalityCode: -1,
    limit: 5,
  );
  RequestMeanValue requestMeanValue = RequestMeanValue(
    municipalityId: -1,
    propertyTypeList: [-1],
    purposeList: [-1],
    issueDateQuarterList: [1, 2, 3, 4],
    furnitureStatus: -1,
    issueDateYear: 2023,
    issueDateStartMonth: 1,
    issueDateEndMonth: DateTime.now().month,
    zoneId: -1,
    nationalityCode: -1,
    limit: 5,
    periodId: 1,
    offset: 0,
  );
}
