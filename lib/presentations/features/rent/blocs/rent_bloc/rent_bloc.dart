import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/rent_models/rent_models.dart';
import '../../../../../domain/models/requests/rent_requests/request_mean_value.dart';
import '../../../../../domain/usecases/rent_usecases/rent_usecases.dart';

part 'rent_event.dart';
part 'rent_state.dart';
part 'rent_bloc.freezed.dart';

class RentBloc extends Bloc<RentEvent, RentState> {
  final GetRentLookupUseCase getRentLookupUseCase;
  RentLookupResponse? loockUpRent;
  RentBloc({required this.getRentLookupUseCase}) : super(const _Initial()) {
    on<RentEvent>((event, emit) async {
      await event.map(
        getRentLookupEvent: (value) async {
          emit(state.copyWith(
            isLoadingRentLookup: true,
            isHasErrorRentLookup: false,
            rentLookup: const RentLookupResponse(),
          ));
          final failureOrSuccess = await getRentLookupUseCase.execute();
          failureOrSuccess.when((success) {
            loockUpRent = success;
            emit(
              state.copyWith(
                rentLookup: success,
                isLoadingRentLookup: false,
                isHasErrorRentLookup: false,
              ),
            );
          }, (error) {
            emit(
              state.copyWith(
                isLoadingRentLookup: false,
                isHasErrorRentLookup: true,
                errorMessageRentLookup: error.message,
                rentLookup: const RentLookupResponse(),
              ),
            );
          });
        },
      );
    });
  }

  RequestMeanValue requestMeanValue = RequestMeanValue(
    municipalityId: 2,
    propertyTypeList: [-1],
    purposeList: [-1],
    issueDateQuarterList: [1, 4],
    furnitureStatus: -1,
    issueDateYear: 2023,
    issueDateStartMonth: 4,
    issueDateEndMonth: 5,
    zoneId: -1,
    limit: 5,
    periodId: 4,
    // issueDateFrom: "2023-10-01T00:00:00.000",
    // issueDateTo: "2023-10-04T00:00:00.000",

    // rentPaymentMonthlyPerUnitFrom: 100000,
    // rentPaymentMonthlyPerUnitTo: 700000,
    // areaFrom: 5740103,
    // areaTo: 25358497,
  );
}
