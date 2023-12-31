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
      municipalityId: 4,
      propertyTypeList: [-1],
      purposeList: [-1],
      issueDateQuarterList: [1, 2, 3, 4],
      areaCode: -1,
      issueDateYear: 2023,
      issueDateStartMonth: 1,
      issueDateEndMonth: DateTime.now().month,
      zoneId: -1,
      limit: 5,
      offset: 0);
  RequestMortgageValues requestMeanValue = RequestMortgageValues(
    municipalityId: 4,
    areaCode: -1,
    propertyTypeList: [-1],
    purposeList: [-1],
    issueDateQuarterList: [1, 2, 3, 4],
    issueDateYear: 2023,
    issueDateStartMonth: 1,
    issueDateEndMonth: DateTime.now().month,
    zoneId: -1,
    limit: 5,
    periodId: 1,
    offset: 0,
  );
}
