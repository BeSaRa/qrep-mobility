import 'package:freezed_annotation/freezed_annotation.dart';

part 'rent_models.freezed.dart';
part 'rent_models.g.dart';

@freezed
abstract class RentDefault with _$RentDefault {
  factory RentDefault(
      {@Default(0) int? issueYear,
      @Default(0) double? kpi10PreviousYear,
      @Default(0) double? kpi10Val,
      @Default(0) double? kpi13PreviousYear,
      @Default(0) double? kpi13Val,
      @Default(0) double? kpi16PreviousYear,
      @Default(0) double? kpi16Val,
      @Default(0) double? kpi16_2PreviousYear,
      @Default(0) double? kpi16_2Val,
      @Default(0) double? kpi1PreviousYear,
      @Default(0) double? kpi1Val,
      @Default(0) double? kpi4PreviousYear,
      @Default(0) double? kpi4Val,
      @Default(0) double? kpi7PreviousYear,
      @Default(0) double? kpi7Val,
      @Default(0) double? kpiYoY1,
      @Default(0) double? kpiYoY10,
      @Default(0) double? kpiYoY10Difference,
      @Default(0) double? kpiYoY13,
      @Default(0) double? kpiYoY13Difference,
      @Default(0) double? kpiYoY16,
      @Default(0) double? kpiYoY16Difference,
      @Default(0) double? kpiYoY16_2,
      @Default(0) double? kpiYoY16_2Difference,
      @Default(0) double? kpiYoY1Difference,
      @Default(0) double? kpiYoY4,
      @Default(0) double? kpiYoY4Difference,
      @Default(0) double? kpiYoY7,
      @Default(0) double? kpiYoY7Difference}) = _RentDefault;

  factory RentDefault.fromJson(Map<String, dynamic> json) =>
      _$RentDefaultFromJson(json);
}

@freezed
abstract class LookupResponse with _$LookupResponse {
  const factory LookupResponse({
    @Default([]) List<LookupModel> rooms,
    @Default([]) List<LookupModel> durations,
    @Default([]) List<LookupModel> halfYearDurations,
    @Default([]) List<LookupModel> quarterYearDurations,
    @Default([]) List<LookupModel> spaces,
    @Default([]) List<LookupModel> unitStatus,
    @Default([]) List<LookupModel> propertyTypeList,
    @Default([]) List<LookupModel> rentPurposeList,
    @Default([]) List<LookupModel> zoneList,
    @Default([
      PeriodTimeDetails(name: 'نصف اول', value: [1, 2], enName: 'First Half'),
      PeriodTimeDetails(name: 'نصف ثاني', value: [3, 4], enName: 'Last Half')
    ])
    List<PeriodTimeDetails> halfYearList,
    @Default([
      PeriodTimeDetails(name: 'ربع اول', value: [1], enName: 'First Quarter'),
      PeriodTimeDetails(name: 'ربع ثاني', value: [2], enName: 'Second Quarter'),
      PeriodTimeDetails(name: 'ربع ثالث', value: [3], enName: 'Third Quarter'),
      PeriodTimeDetails(name: 'ربع اخير', value: [4], enName: 'Last Quarter')
    ])
    List<PeriodTimeDetails> quarterYearList,
    @Default([
      LookupModel(arName: 'سنوي', id: 1, enName: 'Yearly'),
      LookupModel(arName: 'نصف سنوي', id: 2, enName: 'Half Yearly'),
      LookupModel(arName: 'ربع سنوي ', id: 3, enName: 'Quarter Yearly'),
      LookupModel(arName: 'شهري', id: 4, enName: 'Monthly'),
      // RentLookupModel(arName: ' فترة محددة', id: 5, enName: 'Duration'),
    ])
    List<LookupModel> periodTime,
    @Default([
      LookupModel(arName: 'الكل', id: -1, enName: 'ALL'),
      LookupModel(arName: 'استوديو', id: 6, enName: 'studio'),
      LookupModel(arName: 'غرفة', id: 1, enName: 'one room'),
      LookupModel(arName: 'غرفتين', id: 2, enName: '2 rooms'),
      LookupModel(arName: '3 غرف', id: 3, enName: '3 rooms'),
      LookupModel(arName: '4 غرف', id: 4, enName: '4 rooms'),
      LookupModel(arName: '5 غرف', id: 5, enName: '5 rooms'),
    ])
    List<LookupModel> bedRooms,
    @Default([]) List<LookupModel> districtList,
    @Default([]) List<LookupModel> municipalityList,
    @Default([]) List<LookupModel> furnitureStatusList,
    @Default([]) List<LookupModel> nationalityList,
    @Default([]) List<LookupModel> nationalityCategoryList,
    @Default([]) List<LookupModel> genderList,
    @Default([]) List<LookupModel> ageCategoryList,
    @Default([]) List<LookupModel> ownerCategoryList,
    @Default([]) List<MaxParamsModel> maxParams,
    @Default([]) List<LookupModel> streetList,
  }) = _RentLookupResponse;

  factory LookupResponse.fromJson(Map<String, dynamic> json) =>
      _$LookupResponseFromJson(json);
}

@freezed
abstract class LookupModel with _$LookupModel {
  const factory LookupModel({
    @Default(0) int value,
    @Default(0) int yoy,
    @Default(false) bool selected,
    @Default('') String url,
    @Default(false) bool hasPrice,
    @Default(0) int id,
    @Default(0) int lookupKey,
    @Default('') String arName,
    @Default('') String enName,
    @Default(0) int municipalityId,
    @Default(false) bool isActive,
  }) = _RentLookupModel;

  factory LookupModel.fromJson(Map<String, dynamic> json) =>
      _$LookupModelFromJson(json);
}

@freezed
abstract class PeriodTimeDetails with _$PeriodTimeDetails {
  const factory PeriodTimeDetails({
    @Default('') String name,
    @Default('') String enName,
    @Default([]) List<int> value,
  }) = _PeriodTimeDetails;

  factory PeriodTimeDetails.fromJson(Map<String, dynamic> json) =>
      _$PeriodTimeDetailsFromJson(json);
}

@freezed
abstract class MaxParamsModel with _$MaxParamsModel {
  factory MaxParamsModel({
    @Default(0) int id,
    @Default('') String fieldName,
    @Default(0) int minVal,
    @Default(0) int maxVal,
    @Default('') String model,
    @Default(false) bool isActive,
  }) = _MaxParamsModel;

  factory MaxParamsModel.fromJson(Map<String, dynamic> json) =>
      _$MaxParamsModelFromJson(json);
}

@freezed
abstract class BaseRentResponse with _$BaseRentResponse {
  factory BaseRentResponse({
    @Default(0) num issueYear,
    @Default(0) num kpiPreviousYear,
    @Default(0) num kpiVal,
    @Default(0) num zoneId,
    @Default(0) num kpiYoYDifference,
    @Default(0) num kpiYoYVal,
    @Default(0) num purposeId,
    @Default(0) num propertyTypeId,
    @Default(0) num realEstateMT,
    @Default(0) num realEstateSQT,
    @Default(0) num priceMT,
    @Default(0) num priceSQ,
  }) = _BaseRentResponse;

  factory BaseRentResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseRentResponseFromJson(json);
}

@freezed
abstract class BaseRentResponsePerAreaUnitType
    with _$BaseRentResponsePerAreaUnitType {
  factory BaseRentResponsePerAreaUnitType({
    @Default(0) num issueYear,
    //----------------------
    @Default(0) num kpiSqft,
    @Default(0) num kpiSqmt,
    //----------------------
    @Default(0) num kpiSqftPreviousYear,
    @Default(0) num kpiSqmtPreviousYear,
    //----------------------
    @Default(0) num kpiSqftYoYDifference,
    @Default(0) num kpiSqmtYoYDifference,
    //----------------------
    @Default(0) num kpiSqftYoYVal,
    @Default(0) num kpiSqmtYoYVal,
  }) = _BaseRentResponsePerAreaUnitType;

  factory BaseRentResponsePerAreaUnitType.fromJson(Map<String, dynamic> json) =>
      _$BaseRentResponsePerAreaUnitTypeFromJson(json);
}

@freezed
abstract class MeanAreaResponse with _$MeanAreaResponse {
  const factory MeanAreaResponse({
    @Default(0) int issueYear,
    @Default(0) int kpi2PreviousYear,
    @Default(0) int kpi2Val,
    @Default(0) int kpi2YoYDifference,
    @Default(0) int kpi2YoYVal,
    @Default(0) int kpiPreviousYear,
    @Default(0) int kpiVal,
    @Default(0) int kpiYoYDifference,
    @Default(0) int kpiYoYVal,
  }) = _MeanAreaResponse;

  factory MeanAreaResponse.fromJson(Map<String, dynamic> json) =>
      _$MeanAreaResponseFromJson(json);
}

@freezed
abstract class RentListSummary with _$RentListSummary {
  const factory RentListSummary(
      {@Default(0) int count,
      @Default([]) List<RentSummaryObject> transactionList}) = _RentListSummary;

  factory RentListSummary.fromJson(Map<String, dynamic> json) =>
      _$RentListSummaryFromJson(json);
}

@freezed
abstract class RentSummaryObject with _$RentSummaryObject {
  const factory RentSummaryObject(
      {@Default(0) double? area,
      @Default(0) int? bedRoomsCount,
      @Default('') String? endDate,
      @Default(0) int? issueYear,
      @Default('') String? issueDate,
      @Default(0) int? municipalityid,
      @Default(0) int? propertyTypeId,
      @Default(0) double? rentPaymentMeterMT,
      @Default(0) double? rentPaymentMeterSQT,
      @Default(0) double? rentPaymentMonthly,
      @Default('') String? startDate,
      @Default('') String? unitBroker,
      @Default('') String? unitNo,
      @Default('') String? unitOwner,
      @Default('') String? unitTenant}) = _RentSummaryObject;

  factory RentSummaryObject.fromJson(Map<String, dynamic> json) =>
      _$RentSummaryObjectFromJson(json);
}
