import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_broker_values.freezed.dart';
part 'request_broker_values.g.dart';

@freezed
abstract class RequestBrokerValues with _$RequestBrokerValues {
  @JsonSerializable(includeIfNull: false)
  factory RequestBrokerValues(
      {int? brokerCategoryId,
      int? limit,
      int? municipalityId,
      int? offset,
      String? brokerName}) = _RequestBrokerValues;

  factory RequestBrokerValues.fromJson(Map<String, dynamic> json) =>
      _$RequestBrokerValuesFromJson(json);
}
