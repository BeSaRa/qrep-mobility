// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@freezed
abstract class NewsResponse with _$NewsResponse {
  factory NewsResponse({@Default([]) List<NewsModel> data}) = _NewsResponse;
  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);
}

@freezed
abstract class NewsByIdResponse with _$NewsByIdResponse {
  factory NewsByIdResponse({@Default(NewsModel()) NewsModel data}) =
      _NewsByIdResponse;
  factory NewsByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsByIdResponseFromJson(json);
}

@freezed
abstract class NewsModel with _$NewsModel {
  const factory NewsModel({
    @Default(0) int id,
    @Default('') String status,
    @Default('') @JsonKey(name: 'user_created') String userCreated,
    @Default('') @JsonKey(name: 'date_created') String dateCreated,
    @Default('') @JsonKey(name: 'user_updated') String userUpdated,
    @Default('') @JsonKey(name: 'date_updated') String dateUpdated,
    @Default('') String excerpt,
    @Default('') String title,
    @Default('') String image,
    @Default('') String content,
  }) = _NewsModel;
  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
}
