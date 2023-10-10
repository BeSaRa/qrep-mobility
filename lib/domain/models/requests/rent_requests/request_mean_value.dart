import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_mean_value.freezed.dart';
part 'request_mean_value.g.dart';

@freezed
abstract class RequestMeanValue with _$RequestMeanValue {
  factory RequestMeanValue({
    int? areaFrom,
    int? areaTo,
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
    int? rentPaymentMonthlyPerUnitFrom,
    int? rentPaymentMonthlyPerUnitTo,
    int? streetNo,
    int? zoneId,
  }) = _RequestMeanValue;
  factory RequestMeanValue.fromJson(Map<String, dynamic> json) =>
      _$RequestMeanValueFromJson(json);
}
