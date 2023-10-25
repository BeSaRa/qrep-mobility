import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_mortgage_values.freezed.dart';
part 'request_mortgage_values.g.dart';

@freezed
abstract class RequestMortgageValues with _$RequestMortgageValues {
  factory RequestMortgageValues({
    num? areaFrom,
    num? areaTo,
    int? bedRoomsCount,
    int? furnitureStatus,
    int? issueDateEndMonth,
    String? issueDateFrom,
    List<int>? issueDateQuarterList,
    int? issueDateStartMonth,
    String? issueDateTo,
    int? issueDateYear,
    int? limit,
    int? municipalityId,
    int? offset,
    List<int>? propertyTypeList,
    List<int>? purposeList,
    num? rentPaymentMonthlyPerUnitFrom,
    num? rentPaymentMonthlyPerUnitTo,
    int? streetNo,
    int? zoneId,
    @Default(1) int unit,
    @Default(1) int periodId,
  }) = _RequestMortgageValues;

  factory RequestMortgageValues.fromJson(Map<String, dynamic> json) =>
      _$RequestMortgageValuesFromJson(json);
}
