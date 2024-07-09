import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourite_models.freezed.dart';
part 'favourite_models.g.dart';

@freezed
abstract class FavouriteResponse with _$FavouriteResponse {
  factory FavouriteResponse(
      {@Default("") String? creationTime,
      @Default("") String? criteria,
      @Default(0) int? id,
      @Default("") String? lastModifiedTime,
      @Default("") String? name,
      @Default("") String? pageDescription,
      @Default(Indicators.sell) Indicators pageName,
      @Default("") String? userId}) = _FavouriteResponse;

  factory FavouriteResponse.fromJson(Map<String, dynamic> json) =>
      _$FavouriteResponseFromJson(json);
}

enum Indicators {
  @JsonValue("/broker-indicators")
  broker,
  @JsonValue("/sell-indicators")
  sell,
  @JsonValue("/rental-indicators")
  rental,
  @JsonValue("/mortgage-indicators")
  mortgage,
  @JsonValue("/general-secretariat")
  general,
  @JsonValue("/occupied-and-vacant-indicators")
  occupied,
  @JsonValue("/ownership-indicators")
  ownership;
}
