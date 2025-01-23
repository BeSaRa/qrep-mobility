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
    @Default("") String date, //==
    @Default("") String modified, //==
    @Default('') String status,
    @Default(TitleModel()) TitleModel title,
    @Default(ContentModel()) ContentModel content,
    @Default([]) @JsonKey(name: 'og_image')List<OgImageModel> ogImage,
    @Default('') @JsonKey(name: 'user_created') String? userCreated,
    @Default('') @JsonKey(name: 'date_created') String? dateCreated,
    @Default('') @JsonKey(name: 'user_updated') String? userUpdated,
    @Default('') @JsonKey(name: 'date_updated') String? dateUpdated,
    // @Default('') String? excerpt,
  }) = _NewsModel;
  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
}

@freezed
abstract class TitleModel with _$TitleModel {
  const factory TitleModel({
    @Default("") String rendered,
  }) = _TitleModel;
  factory TitleModel.fromJson(Map<String, dynamic> json) =>
      _$TitleModelFromJson(json);
}

@freezed
abstract class ContentModel with _$ContentModel {
  const factory ContentModel({
    @Default("") String rendered,
  }) = _ContentModel;
  factory ContentModel.fromJson(Map<String, dynamic> json) =>
      _$ContentModelFromJson(json);
}

@freezed
abstract class OgImageModel with _$OgImageModel {
  const factory OgImageModel({
    @Default("") String url,
    @Default(0) int width,
  }) = _OgImageModel;
  factory OgImageModel.fromJson(Map<String, dynamic> json) =>
      _$OgImageModelFromJson(json);
}
// // ignore_for_file: invalid_annotation_target
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'news_model.freezed.dart';
// part 'news_model.g.dart';

// @freezed
// abstract class NewsResponse with _$NewsResponse {
//   factory NewsResponse({@Default([]) List<NewsModel> data}) = _NewsResponse;
//   factory NewsResponse.fromJson(Map<String, dynamic> json) =>
//       _$NewsResponseFromJson(json);
// }

// @freezed
// abstract class NewsByIdResponse with _$NewsByIdResponse {
//   factory NewsByIdResponse({@Default(NewsModel()) NewsModel data}) =
//       _NewsByIdResponse;
//   factory NewsByIdResponse.fromJson(Map<String, dynamic> json) =>
//       _$NewsByIdResponseFromJson(json);
// }

// @freezed
// abstract class NewsModel with _$NewsModel {
//   const factory NewsModel({
//     @Default(0) int id,
//     @Default('') String status,
//     @Default('') @JsonKey(name: 'user_created') String userCreated,
//     @Default('') @JsonKey(name: 'date_created') String dateCreated,
//     @Default('') @JsonKey(name: 'user_updated') String userUpdated,
//     @Default('') @JsonKey(name: 'date_updated') String dateUpdated,
//     @Default('') String excerpt,
//     @Default('') String title,
//     @Default('') String image,
//     @Default('') String content,
//   }) = _NewsModel;
//   factory NewsModel.fromJson(Map<String, dynamic> json) =>
//       _$NewsModelFromJson(json);
// }
