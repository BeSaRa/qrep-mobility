import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_chatbot_response_model.freezed.dart';
part 'new_chatbot_response_model.g.dart';

@freezed
class FullNewChatbotResponseModel with _$FullNewChatbotResponseModel {
  const factory FullNewChatbotResponseModel({
    required NewChatbotResponseModel data,
  }) = _FullNewChatbotResponseModel;

  factory FullNewChatbotResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FullNewChatbotResponseModelFromJson(json);
}
@freezed
class NewChatbotResponseModel with _$NewChatbotResponseModel {
  const factory NewChatbotResponseModel({
    required String event,
    required DataResponseModel data,
  }) = _NewChatbotResponseModel;

  factory NewChatbotResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NewChatbotResponseModelFromJson(json);
}

@freezed
class DataResponseModel with _$DataResponseModel {
  const factory DataResponseModel({
    @Default('') String content,
    @Default([]) List<DocumentModel>? citations,
    @JsonKey(name: "conversation_id") @Default('') String conversationId,
    @JsonKey(name: "stream_id") @Default('') String streamId,
    @JsonKey(name: "user_id") @Default('') String userId,
    @JsonKey(name: "action_results") @Default([]) List<ActionResult> actionResults,
  }) = _DataResponseModel;

  factory DataResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DataResponseModelFromJson(json);
}

@freezed
class ActionResult with _$ActionResult {
  const factory ActionResult({
    @JsonKey(name: "retrieve_documents") @Default([]) List<DocumentModel> retrieveDocuments,
  }) = _ActionResult;

  factory ActionResult.fromJson(Map<String, dynamic> json) =>
      _$ActionResultFromJson(json);
}

@freezed
class DocumentModel with _$DocumentModel {
  const factory DocumentModel({
    @JsonKey(name: "parent_id") @Default('') String parentId,
    @JsonKey(name: "chunk_id") @Default('') String chunkId,
    @Default('') String chunk,
    @JsonKey(name: "ref_url") @Default('') String refUrl,
    @Default('') String url,
    @JsonKey(name: "base_url") @Default('') String? baseUrl,
    @Default('') String title,
    @JsonKey(name: "index_date") @Default('') String? indexDate,
    @JsonKey(name: "news_date") @Default('') String? newsDate,
    @JsonKey(name: "language") @Default('') String? language,
    @JsonKey(name: "sentiment") @Default('') String? sentiment,
    @JsonKey(name: "keyphrases") @Default('') String? keyphrases,
    @JsonKey(name: "people") @Default('') String? people,
    @JsonKey(name: "organizations") @Default('') String? organizations,
    @JsonKey(name: "locations") @Default('') String? locations,
    @JsonKey(name: "dateTime") @Default('') String? dateTime,
    @Default('') String? type,
  }) = _DocumentModel;

  factory DocumentModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentModelFromJson(json);
}