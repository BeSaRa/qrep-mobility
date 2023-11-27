import 'package:freezed_annotation/freezed_annotation.dart';

part 'broker_models.freezed.dart';
part 'broker_models.g.dart';

@freezed
abstract class RealEstateBrokerLookUp with _$RealEstateBrokerLookUp {
  factory RealEstateBrokerLookUp(
      {@Default([]) List<BrokerLookUpModel> ageCategoryList,
      @Default([]) List<BrokerLookUpModel> brokerCategoryList,
      @Default([]) List<BrokerLookUpModel> brokerTypeList,
      @Default([]) List<BrokerLookUpModel> districtList,
      @Default([]) List<BrokerLookUpModel> furnitureStatusList,
      @Default([]) List<BrokerLookUpModel> genderList,
      @Default([]) List<BrokerLookUpModel> maxParams,
      @Default([]) List<BrokerLookUpModel> municipalityList,
      @Default([]) List<BrokerLookUpModel> nationalityCategoryList,
      @Default([]) List<BrokerLookUpModel> nationalityList,
      @Default([]) List<BrokerLookUpModel> occupancyStatusList,
      @Default([]) List<BrokerLookUpModel> ownerCategoryList,
      @Default([]) List<BrokerLookUpModel> premiseCategoryList,
      @Default([]) List<BrokerLookUpModel> premiseTypeList,
      @Default([]) List<BrokerLookUpModel> propertyTypeList,
      rentPurposeList,
      zoneList}) = _RealEstateBrokerLookUp;

  factory RealEstateBrokerLookUp.fromJson(Map<String, dynamic> json) =>
      _$RealEstateBrokerLookUpFromJson(json);
}

@freezed
abstract class BrokerLookUpModel with _$BrokerLookUpModel {
  factory BrokerLookUpModel({
    @Default('') String? arName,
    @Default('') String? enName,
    @Default(true) bool? isActive,
    @Default(0) int? lookupKey,
    @Default(0) int? municipalityId,
    @Default(0) int? id,
    @Default('') String? fieldName,
    @Default(0) int? maxVal,
    @Default(0) int? minVal,
    @Default('') String? model,
    @Default(0) int? nationalityCode,
  }) = _BrokerLookUpModel;

  factory BrokerLookUpModel.fromJson(Map<String, dynamic> json) =>
      _$BrokerLookUpModelFromJson(json);
}
