import 'package:freezed_annotation/freezed_annotation.dart';

part 'rent_models.freezed.dart';
part 'rent_models.g.dart';

@freezed
abstract class RentDefault with _$RentDefault {
  factory RentDefault(
      {@Default(0) int issueYear,
      @Default(0) int kpi10PreviousYear,
      @Default(0) int kpi10Val,
      @Default(0) int kpi13PreviousYear,
      @Default(0) int kpi13Val,
      @Default(0) int kpi16PreviousYear,
      @Default(0) int kpi16Val,
      @Default(0) int kpi16_2PreviousYear,
      @Default(0) int kpi16_2Val,
      @Default(0) int kpi1PreviousYear,
      @Default(0) int kpi1Val,
      @Default(0) int kpi4PreviousYear,
      @Default(0) int kpi4Val,
      @Default(0) int kpi7PreviousYear,
      @Default(0) int kpi7Val,
      @Default(0) int kpiYoY1,
      @Default(0) int kpiYoY10,
      @Default(0) int kpiYoY10Difference,
      @Default(0) int kpiYoY13,
      @Default(0) int kpiYoY13Difference,
      @Default(0) int kpiYoY16,
      @Default(0) int kpiYoY16Difference,
      @Default(0) int kpiYoY16_2,
      @Default(0) int kpiYoY16_2Difference,
      @Default(0) int kpiYoY1Difference,
      @Default(0) int kpiYoY4,
      @Default(0) int kpiYoY4Difference,
      @Default(0) int kpiYoY7,
      @Default(0) int kpiYoY7Difference}) = _RentDefault;

  factory RentDefault.fromJson(Map<String, dynamic> json) =>
      _$RentDefaultFromJson(json);
}

@freezed
abstract class RentLookupResponse with _$RentLookupResponse {
  const factory RentLookupResponse({
    @Default([]) List<RentLookupModel> rooms,
    @Default([]) List<RentLookupModel> durations,
    @Default([]) List<RentLookupModel> halfYearDurations,
    @Default([]) List<RentLookupModel> quarterYearDurations,
    @Default([]) List<RentLookupModel> spaces,
    @Default([]) List<RentLookupModel> unitStatus,
    @Default([]) List<RentLookupModel> propertyTypeList,
    @Default([]) List<RentLookupModel> rentPurposeList,
    @Default([]) List<RentLookupModel> zoneList,
    @Default([
      PeriodTimeDetails(name: 'نصف اول', value: [1, 2]),
      PeriodTimeDetails(name: 'نصف ثاني', value: [3, 4])
    ])
    List<PeriodTimeDetails> halfYearList,
    @Default([
      PeriodTimeDetails(name: 'ربع اول', value: [1]),
      PeriodTimeDetails(name: 'ربع ثاني', value: [2]),
      PeriodTimeDetails(name: 'ربع ثالث', value: [3]),
      PeriodTimeDetails(name: 'ربع اخير', value: [4])
    ])
    List<PeriodTimeDetails> quarterYearList,
    @Default([
      RentLookupModel(arName: 'سنوي', id: 1),
      RentLookupModel(arName: 'نصف سنوي', id: 2),
      RentLookupModel(arName: 'ربع سنوي ', id: 3),
      RentLookupModel(arName: 'شهري', id: 4),
      RentLookupModel(arName: ' فترة محددة', id: 5),
    ])
    List<RentLookupModel> periodTime,
    @Default([
      RentLookupModel(arName: 'استوديو', id: 6),
      RentLookupModel(arName: 'غرفة', id: 1),
      RentLookupModel(arName: 'غرفتين', id: 2),
      RentLookupModel(arName: '3 غرف', id: 3),
      RentLookupModel(arName: '4 غرف', id: 4),
      RentLookupModel(arName: '5 غرف', id: 5),
      RentLookupModel(arName: 'الكل', id: -1)
    ])
    List<RentLookupModel> bedRooms,
    @Default([]) List<RentLookupModel> districtList,
    @Default([]) List<RentLookupModel> municipalityList,
    @Default([]) List<RentLookupModel> furnitureStatusList,
    @Default([]) List<RentLookupModel> nationalityList,
    @Default([]) List<RentLookupModel> nationalityCategoryList,
    @Default([]) List<RentLookupModel> genderList,
    @Default([]) List<RentLookupModel> ageCategoryList,
    @Default([]) List<RentLookupModel> ownerCategoryList,
    @Default([]) List<MaxParamsModel> maxParams,
  }) = _RentLookupResponse;

  factory RentLookupResponse.fromJson(Map<String, dynamic> json) =>
      _$RentLookupResponseFromJson(json);
}

@freezed
abstract class RentLookupModel with _$RentLookupModel {
  const factory RentLookupModel({
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

  factory RentLookupModel.fromJson(Map<String, dynamic> json) =>
      _$RentLookupModelFromJson(json);
}

@freezed
abstract class PeriodTimeDetails with _$PeriodTimeDetails {
  const factory PeriodTimeDetails({
    @Default('') String name,
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
  }) = _BaseRentResponse;

  factory BaseRentResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseRentResponseFromJson(json);
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
      {@Default(0) double area,
      @Default(0) int bedRoomsCount,
      @Default('') String endDate,
      @Default(0) int issueYear,
      @Default(0) int municipalityid,
      @Default(0) int propertyTypeId,
      @Default(0) double rentPaymentMeterMT,
      @Default(0) double rentPaymentMeterSQT,
      @Default(0) double rentPaymentMonthly,
      @Default('') String startDate,
      @Default('') String unitBroker,
      @Default('') String unitNo,
      @Default('') String unitOwner,
      @Default('') String unitTenant}) = _RentSummaryObject;

  factory RentSummaryObject.fromJson(Map<String, dynamic> json) =>
      _$RentSummaryObjectFromJson(json);
}
