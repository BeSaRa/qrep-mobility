import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ValuesFiltersCubit extends Cubit<LookupModel> {
  ValuesFiltersCubit(super.initialState);

// -------------------------Municaplity Filters------------------------------------------
  LookupModel municapility = const LookupModel();

  void changeMunicapility(LookupModel newmunicapility) {
    municapility = newmunicapility;
    emit(municapility);
  }

  // --------------------------Zone Filter----------------------------------
  LookupModel zone = const LookupModel();

  void changeZone(LookupModel newZone) {
    zone = newZone;
    emit(zone);
  }

  // --------------------------contract type Filter----------------------------------
  LookupModel contract = const LookupModel();

  void changeContract(LookupModel newZone) {
    contract = newZone;
    emit(contract);
  }

//-----------------------Property Type Filters------------------------------------------
  List<LookupModel> propertyTypeList = [];

  void addToPropertyList(LookupModel newPropertyType) {
    propertyTypeList.add(newPropertyType);
    emit(LookupModel(arName: newPropertyType.arName));
  }

  void removeFromPropertyList(LookupModel newPropertyType) {
    if (propertyTypeList.length == 1) {
      null;
    } else {
      propertyTypeList.remove(newPropertyType);
    }
    emit(LookupModel(enName: newPropertyType.enName));
  }

  LookupModel propertyType = const LookupModel();

  // RentLookupModel propertyType = const RentLookupModel(
  //     lookupKey: -1, arName: "الكل", enName: "All", isActive: true);

//-----------------------------rentPurpose List-------------------------------------------
  List<LookupModel> rentPurposeList = [];
  LookupModel purposeType = const LookupModel(
      id: 6, lookupKey: -1, arName: "الكل", enName: "All", isActive: true);

  void addToPurposeList(LookupModel newPurposeType) {
    rentPurposeList.add(newPurposeType);
    emit(LookupModel(arName: newPurposeType.arName));
  }

  void removeFromPurposeList(LookupModel newPurposeType) {
    if (rentPurposeList.length == 1) {
      null;
    } else {
      rentPurposeList.remove(newPurposeType);
    }
    emit(LookupModel(enName: newPurposeType.enName));
  }

  //---------------------------BedRooms Count-------------------------------
  // List<RentLookupModel> bedRoomsList = [];
  // RentLookupModel bedRoom = const RentLookupModel(id: -1, arName: "الكل");
  LookupModel bedRoom = const LookupModel();

  void changeBedRooms(LookupModel newBedRoom) {
    bedRoom = newBedRoom;
    emit(bedRoom);
  }

//-------------------------Preiod Time---------------------------------------------

  LookupModel periodTime = const LookupModel();

  void changePeriodTime(LookupModel period) {
    periodTime = period;
    emit(periodTime);
  }

  //-------------------------Year-------------------------------
  LookupModel year = const LookupModel();
  List<LookupModel> yearsLists = [];

  void changeYear(LookupModel newYear) {
    year = newYear;
    emit(year);
  }

  //------------------------halfYear------------------------------
  List<PeriodTimeDetails> halfYear = [];

  void changehalfYear(PeriodTimeDetails newhalfYear) {
    periodTimeHalfDetails = newhalfYear;
    emit(LookupModel(arName: periodTimeHalfDetails.name));
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
    emit(LookupModel(arName: month.name));
  }

  List<PeriodTimeDetails> months = [];
  List<PeriodTimeDetails> monthsFromApril = [];
  PeriodTimeDetails month = const PeriodTimeDetails();

  // -------------------------Nationality Filters------------------------------------------
  LookupModel nationality = const LookupModel();

  void changeNationality(LookupModel newnationality) {
    nationality = newnationality;
    emit(nationality);
  }

  // --------------------------Furniture status Filter----------------------------------
  LookupModel furniture = const LookupModel();

  void changeFurniture(LookupModel newfurniture) {
    furniture = newfurniture;
    emit(furniture);
  }

  //--------------------------Unit---------------------------------------------
  int unit = 1;

  void changeUnit(int newUnit) {
    unit = newUnit;
    emit(LookupModel(id: unit));
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
    emit(const LookupModel(id: 8, lookupKey: 7));
  }

  void changeRangeRentPaymentMonthlyPerUnit(RangeValues values) {
    rangeRentPaymentMonthlyPerUnit = values;
    emit(LookupModel(id: values.start.toInt(), lookupKey: values.end.toInt()));
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
    emit(LookupModel(id: values.start.toInt(), lookupKey: values.end.toInt()));
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
    emit(const LookupModel(id: 8, lookupKey: 7));
  }

  void changeRangeRealEstateValue(RangeValues values) {
    rangerealEstateValue = values;
    emit(LookupModel(id: values.start.toInt(), lookupKey: values.end.toInt()));
  }

  // -------------------------Broker Category Filters------------------------------------------
  LookupModel brokerCategory = const LookupModel();

  void changeBrokerCategory(LookupModel newBrokerCategory) {
    brokerCategory = newBrokerCategory;
    emit(brokerCategory);
  }

  //-----------------------Property Type Filters------------------------------------------
  List<LookupModel> streetList = [];

  void addToStreetList(LookupModel street) {
    propertyTypeList.add(street);
    emit(LookupModel(
      arName: street.arName,
    ));
  }

  void removeFromStreetList(LookupModel street) {
    if (streetList.length == 1) {
      null;
    } else {
      streetList.remove(street);
    }
    emit(LookupModel(enName: street.enName));
  }

  LookupModel street = const LookupModel();

// RentLookupModel propertyType = const RentLookupModel(
//     lookupKey: -1, arName: "الكل", enName: "All", isActive: true);
}
