import 'package:freezed_annotation/freezed_annotation.dart';

import '../models.dart';

part 'broker_models.freezed.dart';
part 'broker_models.g.dart';

@freezed
abstract class RealEstateBrokerLookUp with _$RealEstateBrokerLookUp {
  factory RealEstateBrokerLookUp({
    @Default([]) List<RentLookupModel> propertyTypeList,
    @Default([]) List<RentLookupModel> rentPurposeList,
    @Default([]) List<RentLookupModel> zoneList,
    @Default([]) List<RentLookupModel> districtList,
    @Default([]) List<RentLookupModel> municipalityList,
    @Default([]) List<RentLookupModel> brokerCategoryList,
    @Default([]) List<RentLookupModel> brokerTypeList,
  }) = _RealEstateBrokerLookUp;

  factory RealEstateBrokerLookUp.fromJson(Map<String, dynamic> json) =>
      _$RealEstateBrokerLookUpFromJson(json);
}
