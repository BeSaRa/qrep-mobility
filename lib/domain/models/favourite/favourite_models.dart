import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourite_models.freezed.dart';
part 'favourite_models.g.dart';

@freezed
abstract class FavouriteResponse with _$FavouriteResponse {
  @JsonSerializable(includeIfNull: false)
  const factory FavouriteResponse(
      {String? creationTime,
      @Default("") String? criteria,
      int? id,
      String? lastModifiedTime,
      @Default("") String? name,
      String? pageDescription,
      @Default(Indicators.sell) Indicators pageName,
      String? userId}) = _FavouriteResponse;

  factory FavouriteResponse.fromJson(Map<String, dynamic> json) =>
      _$FavouriteResponseFromJson(json);
}

String _inputToJson(Indicators it) => it.name;

@JsonEnum(valueField: "pageName")
enum Indicators {
  @JsonValue("/broker-indicators")
  @JsonKey(name: "/broker-indicators", toJson: _inputToJson)
  broker,
  @JsonValue("/sell-indicators")
  @JsonKey(name: "/sell-indicators", toJson: _inputToJson)
  sell,
  @JsonValue("/rental-indicators")
  @JsonKey(name: "/rental-indicators", toJson: _inputToJson)
  rental,
  @JsonValue("/mortgage-indicators")
  @JsonKey(name: "/mortgage-indicators", toJson: _inputToJson)
  mortgage,
  @JsonValue("/general-secretariat")
  @JsonKey(name: "/general-secretariat", toJson: _inputToJson)
  general,
  @JsonValue("/occupied-and-vacant-indicators")
  @JsonKey(name: "/occupied-and-vacant-indicators", toJson: _inputToJson)
  occupied,
  @JsonValue("/ownership-indicators")
  @JsonKey(name: "/ownership-indicators", toJson: _inputToJson)
  ownership;
}

@freezed
abstract class CriteriaObject with _$CriteriaObject {
  @JsonSerializable(includeIfNull: false)
  const factory CriteriaObject({
    int? municipalityId,
    int? areaCode,
    List<int>? propertyTypeList,
    List<int>? purposeList,
    List<int>? issueDateQuarterList,
    List<int>? premiseCategoryList,
    int? bedRoomsCount,
    int? furnitureStatus,
    int? issueDateYear,
    int? issueDateMonth,
    int? issueDateStartMonth,
    int? issueDateEndMonth,
    int? rentPaymentMonthlyPerUnitFrom,
    int? rentPaymentMonthlyPerUnitTo,
    int? zoneId,
    int? durationType,
    double? realEstateValueFrom,
    double? realEstateValueTo,
    int? halfYearDuration,
    double? areaFrom,
    double? areaTo,
    int? occupancyStatus,
    int? unit,
    int? periodId,
    String? issueDateFrom,
    String? issueDateTo,
    List<int>? premiseTypeList,
    String? ownerCategoryCode,
    String? brokerName,
    int? brokerCategoryId,
    int? nationalityCode,
  }) = _CriteriaObject;

  factory CriteriaObject.fromJson(Map<String, dynamic> json) =>
      _$CriteriaObjectFromJson(json);
}
