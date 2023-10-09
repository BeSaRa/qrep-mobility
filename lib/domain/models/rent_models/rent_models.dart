import 'package:freezed_annotation/freezed_annotation.dart';

part 'rent_models.freezed.dart';
part 'rent_models.g.dart';

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
  factory RentLookupModel({
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
    @Default(0) int issueYear,
    @Default(0) int kpiPreviousYear,
    @Default(0) int kpiVal,
    @Default(0) int kpiYoYDifference,
    @Default(0) int kpiYoYVal,
    @Default(0) int purposeId,
    @Default(0) int propertyTypeId,
  }) = _BaseRentResponse;
  factory BaseRentResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseRentResponseFromJson(json);
}
