import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_mean_value.freezed.dart';
part 'request_mean_value.g.dart';

@freezed
abstract class RequestMeanValue with _$RequestMeanValue {
  factory RequestMeanValue({
    num? areaFrom,
    num? areaTo,
    int? bedRoomsCount,
    int? furnitureStatus,
    int? issueDateEndMonth,
    String? issueDateFrom,
    List<int>? issueDateQuarterList,
    int? issueDateStartMonth,
    int? halfYearDuration,
    String? issueDateTo,
    int? issueDateYear,
    int? limit,
    int? municipalityId,
    int? offset,
    int? nationalityCode,
    List<int>? propertyTypeList,
    List<int>? purposeList,
    num? rentPaymentMonthlyPerUnitFrom,
    num? rentPaymentMonthlyPerUnitTo,
    // int? streetNo,
    int? zoneId,
    @Default(2) int unit,
    @Default(1) int periodId,
  }) = _RequestMeanValue;
  factory RequestMeanValue.fromJson(Map<String, dynamic> json) =>
      _$RequestMeanValueFromJson(json);
}
