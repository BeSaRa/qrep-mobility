import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_rent.freezed.dart';
part 'request_rent.g.dart';

@freezed
abstract class RentRequest with _$RentRequest {
  @JsonSerializable(includeIfNull: false)
  factory RentRequest({
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
    int? serviceType,
    List<int>? propertyTypeList,
    List<int>? purposeList,
    num? rentPaymentMonthlyPerUnitFrom,
    num? rentPaymentMonthlyPerUnitTo,
    // List<int>? streetNo,
    int? zoneId,
    @Default(2) int unit,
    @Default(1) int periodId,
  }) = _RentRequest;

  factory RentRequest.fromJson(Map<String, dynamic> json) =>
      _$RentRequestFromJson(json);
}
