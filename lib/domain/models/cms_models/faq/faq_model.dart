// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_model.freezed.dart';
part 'faq_model.g.dart';

@freezed
abstract class FaqResponse with _$FaqResponse {
  const factory FaqResponse({@Default([]) List<FaqItemModel> data}) =
      _FaqResponse;
  factory FaqResponse.fromJson(Map<String, dynamic> json) =>
      _$FaqResponseFromJson(json);
}

@freezed
abstract class FaqItemModel with _$FaqItemModel {
  const factory FaqItemModel({
    @Default('') String answer,
    @Default(0) int id,
    @Default('') String question,
  }) = _FaqItemModel;
  factory FaqItemModel.fromJson(Map<String, dynamic> json) =>
      _$FaqItemModelFromJson(json);
}
