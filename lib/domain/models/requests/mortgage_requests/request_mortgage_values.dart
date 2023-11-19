import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_mortgage_values.freezed.dart';
part 'request_mortgage_values.g.dart';

@freezed
abstract class RequestMortgageValues with _$RequestMortgageValues {
  factory RequestMortgageValues({
    @Default(-1) num areaCode,
    num? areaFrom,
    num? areaTo,
    int? issueDateEndMonth,
    String? issueDateFrom,
    List<int>? issueDateQuarterList,
    int? issueDateStartMonth,
    int? issueDateMonth,
    String? issueDateTo,
    int? issueDateYear,
    int? halfYearDuration,
    int? limit,
    int? municipalityId,
    int? offset,
    List<int>? propertyTypeList,
    List<int>? purposeList,
    num? realEstateValueFrom,
    num? realEstateValueTo,
    // int? streetNo,
    int? zoneId,
    @Default(2) int unit,
    @Default(1) int periodId,
  }) = _RequestMortgageValues;

  factory RequestMortgageValues.fromJson(Map<String, dynamic> json) =>
      _$RequestMortgageValuesFromJson(json);
}
