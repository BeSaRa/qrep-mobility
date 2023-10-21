import 'package:freezed_annotation/freezed_annotation.dart';

part 'translations_model.freezed.dart';
part 'translations_model.g.dart';

@freezed
abstract class TranslationsModel with _$TranslationsModel {
  factory TranslationsModel({@Default([]) List<TranslationDataItem> data}) =
      _TranslationsModel;

  factory TranslationsModel.fromJson(Map<String, dynamic> json) =>
      _$TranslationsModelFromJson(json);
}

@freezed
abstract class TranslationDataItem with _$TranslationDataItem {
  factory TranslationDataItem({
    @Default('') String? id,
    @Default('') String? language,
    @Default('') String? key,
    @Default('') String? value,
  }) = _TranslationDataItem;

  factory TranslationDataItem.fromJson(Map<String, dynamic> json) =>
      _$TranslationDataItemFromJson(json);
}
