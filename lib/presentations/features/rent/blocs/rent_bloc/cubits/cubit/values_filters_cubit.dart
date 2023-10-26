import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ValuesFiltersCubit extends Cubit<RentLookupModel> {
  ValuesFiltersCubit(super.initialState);

// -------------------------Municaplity Filters------------------------------------------
  RentLookupModel municapility = const RentLookupModel();

  void changeMunicapility(RentLookupModel newmunicapility) {
    municapility = newmunicapility;
    emit(municapility);
  }

  // --------------------------Zone Filter----------------------------------
  RentLookupModel zone = const RentLookupModel();

  void changeZone(RentLookupModel newZone) {
    zone = newZone;
    emit(zone);
  }

//-----------------------Property Type Filters------------------------------------------
  List<RentLookupModel> propertyTypeList = [];

  void addToPropertyList(RentLookupModel newPropertyType) {
    propertyTypeList.add(newPropertyType);
    emit(RentLookupModel(arName: newPropertyType.arName));
  }

  void removeFromPropertyList(RentLookupModel newPropertyType) {
    if (propertyTypeList.length == 1) {
      null;
    } else {
      propertyTypeList.remove(newPropertyType);
    }
    emit(RentLookupModel(enName: newPropertyType.enName));
  }

  RentLookupModel propertyType = const RentLookupModel();

  // RentLookupModel propertyType = const RentLookupModel(
  //     lookupKey: -1, arName: "الكل", enName: "All", isActive: true);

//-----------------------------rentPurpose List-------------------------------------------
  List<RentLookupModel> rentPurposeList = [];
  RentLookupModel purposeType = const RentLookupModel(
      id: 6, lookupKey: -1, arName: "الكل", enName: "All", isActive: true);

  void addToPurposeList(RentLookupModel newPurposeType) {
    rentPurposeList.add(newPurposeType);
    emit(RentLookupModel(arName: newPurposeType.arName));
  }

  void removeFromPurposeList(RentLookupModel newPurposeType) {
    if (rentPurposeList.length == 1) {
      null;
    } else {
      rentPurposeList.remove(newPurposeType);
    }
    emit(RentLookupModel(enName: newPurposeType.enName));
  }

  //---------------------------BedRooms Count-------------------------------
  // List<RentLookupModel> bedRoomsList = [];
  // RentLookupModel bedRoom = const RentLookupModel(id: -1, arName: "الكل");
  RentLookupModel bedRoom = const RentLookupModel();

  void changeBedRooms(RentLookupModel newBedRoom) {
    bedRoom = newBedRoom;
    emit(bedRoom);
  }

//-------------------------Preiod Time---------------------------------------------

  RentLookupModel periodTime = const RentLookupModel();

  void changePeriodTime(RentLookupModel period) {
    periodTime = period;
    emit(periodTime);
  }

  //-------------------------Year-------------------------------
  RentLookupModel year = const RentLookupModel();
  List<RentLookupModel> yearsLists = [];

  void changeYear(RentLookupModel newYear) {
    year = newYear;
    emit(year);
  }

  //------------------------halfYear------------------------------
  List<PeriodTimeDetails> halfYear = [];

  void changehalfYear(PeriodTimeDetails newhalfYear) {
    periodTimeHalfDetails = newhalfYear;
    emit(RentLookupModel(arName: periodTimeHalfDetails.name));
  }

  PeriodTimeDetails periodTimeHalfDetails = const PeriodTimeDetails();

  // PeriodTimeDetails periodTimeHalfDetails =
  // const PeriodTimeDetails(name: 'نصف اول', value: [1, 2]);

  //--------------------------quarter Year----------------------------------------
  List<PeriodTimeDetails> quarterYear = [];

  // PeriodTimeDetails periodTimeQuarterDetails =
  //     const PeriodTimeDetails(name: 'ربع اول', value: [1]);

  //--------------------Month------------------------------------------------------
  void changeMonth(PeriodTimeDetails newMonth) {
    month = newMonth;
    emit(RentLookupModel(arName: month.name));
  }

  List<PeriodTimeDetails> months = [];
  PeriodTimeDetails month = const PeriodTimeDetails();

  // -------------------------Nationality Filters------------------------------------------
  RentLookupModel nationality = const RentLookupModel();

  void changeNationality(RentLookupModel newnationality) {
    nationality = newnationality;
    emit(nationality);
  }

  // --------------------------Furniture status Filter----------------------------------
  RentLookupModel furniture = const RentLookupModel();

  void changeFurniture(RentLookupModel newfurniture) {
    furniture = newfurniture;
    emit(furniture);
  }

  //--------------------------Unit---------------------------------------------
  int unit = 1;

  void changeUnit(int newUnit) {
    unit = newUnit;
    emit(RentLookupModel(id: unit));
  }

  //---------------------------PaymentMonthlyPerUnit-------------------------------
  num? rentPaymentMonthlyPerUnitFrom;
  num? rentPaymentMonthlyPerUnitTo;
  RangeValues? rangeRentPaymentMonthlyPerUnit;

  void changeRangeRentPaymentMonthlyPerUnitReset() {
    rentPaymentMonthlyPerUnitFrom = null;
    rentPaymentMonthlyPerUnitTo = null;
    rangeRentPaymentMonthlyPerUnit = null;
    areaFrom = null;
    areaTo = null;
    rangeValuesArea = null;
    emit(const RentLookupModel(id: 8, lookupKey: 7));
  }

  void changeRangeRentPaymentMonthlyPerUnit(RangeValues values) {
    rangeRentPaymentMonthlyPerUnit = values;
    emit(RentLookupModel(
        id: values.start.toInt(), lookupKey: values.end.toInt()));
  }

  // void changePaymentMonthlyPerUnit(num start, num end) {
  //   rentPaymentMonthlyPerUnitFrom = start;
  //   rentPaymentMonthlyPerUnitTo = end;
  //   emit(RentLookupModel(id: start.toInt(), value: end.toInt()));
  // }

  //---------------------------Area-------------------------------
  num? areaFrom;
  num? areaTo;
  RangeValues? rangeValuesArea;

  void changeRangeValuesArea(RangeValues values) {
    rangeValuesArea = values;
    emit(RentLookupModel(
        id: values.start.toInt(), lookupKey: values.end.toInt()));
  }

  //----------------------Range DateTime-------------------------
  PickerDateRange? pickerDateRange;

  //Sell----------------------RealEstateValue Range------------------
  num? realEstateValueFrom;
  num? realEstateValueTo;
  RangeValues? rangerealEstateValue;

  void changeRangeRealEstateValueReset() {
    realEstateValueFrom = null;
    realEstateValueTo = null;
    rangerealEstateValue = null;
    areaFrom = null;
    areaTo = null;
    rangeValuesArea = null;
    emit(const RentLookupModel(id: 8, lookupKey: 7));
  }

  void changeRangeRealEstateValue(RangeValues values) {
    rangerealEstateValue = values;
    emit(RentLookupModel(
        id: values.start.toInt(), lookupKey: values.end.toInt()));
  }
}
