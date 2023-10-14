import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ValuesFiltersCubit extends Cubit<RentLookupModel> {
  ValuesFiltersCubit(super.initialState);

  RentLookupModel municapility = const RentLookupModel(
      id: 1,
      lookupKey: 1,
      arName: "بلدية الدوحة",
      enName: "AL DOHA Municipality",
      isActive: true);
  RentLookupModel periodTime = const RentLookupModel(arName: 'سنوي', id: 1);

  void changePeriodTime(RentLookupModel period) {
    periodTime = period;
    emit(periodTime);
  }

  void changeMunicapility(RentLookupModel newmunicapility) {
    municapility = newmunicapility;
    emit(municapility);
  }

  void changeBedRooms(RentLookupModel newBedRoom) {
    bedRoom = newBedRoom;
    emit(bedRoom);
  }

  void changeYear(RentLookupModel newYear) {
    year = newYear;
    emit(year);
  }

  List<RentLookupModel> zones = [];
  List<RentLookupModel> propertyTypeList = [];
  List<RentLookupModel> rentPurposeList = [];
  List<RentLookupModel> bedRoomsList = [];
  List<RentLookupModel> yearsLists = [];
  List<PeriodTimeDetails> halfYear = [];
  List<PeriodTimeDetails> quarterYear = [];
  PeriodTimeDetails periodTimeHalfDetails =
      const PeriodTimeDetails(name: 'نصف اول', value: [1, 2]);
  PeriodTimeDetails periodTimeQuarterDetails =
      const PeriodTimeDetails(name: 'ربع اول', value: [1]);
  RentLookupModel bedRoom = const RentLookupModel(id: -1, arName: "الكل");
  RentLookupModel year = RentLookupModel(arName: "${DateTime.now().year}");
  RentLookupModel propertyType = const RentLookupModel(
      lookupKey: -1, arName: "الكل", enName: "All", isActive: true);

  RentLookupModel zone = const RentLookupModel(
      lookupKey: -1,
      arName: "الكل",
      enName: "All",
      municipalityId: -1,
      isActive: true);
}
