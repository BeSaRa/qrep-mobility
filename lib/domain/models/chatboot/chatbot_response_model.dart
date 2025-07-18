import 'package:freezed_annotation/freezed_annotation.dart';

part 'chatbot_response_model.freezed.dart';
part 'chatbot_response_model.g.dart';

@freezed
abstract class ChatbotResponseModel with _$ChatbotResponseModel {
  const factory ChatbotResponseModel({
    @Default('') String finishReason,
    @Default(0) int index,
    required MessageResponseModel message,
    required Usage usage,
  }) = _ChatbotResponseModel;

  factory ChatbotResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChatbotResponseModelFromJson(json);
}

@freezed
abstract class MessageResponseModel with _$MessageResponseModel {
  const factory MessageResponseModel({
    @Default('') String content,
    @Default('') @JsonKey(name: "conversation_id") String conversationId,
    @Default('') String role,
    @Default(false) bool endTurn,
    @Default(null) @JsonKey(name: "context") ContextModel? contextModel,
  }) = _MessageResponseModel;

  factory MessageResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseModelFromJson(json);
}

@freezed
abstract class Usage with _$Usage {
  const factory Usage({
    @Default(0) int completionTokens,
    @Default(0) int promptTokens,
    @Default(0) int totalTokens,
    @Default("") String? completionTokensDetails,
    @Default("") String? promptTokensDetails,
  }) = _Usage;

  factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);
}

@freezed
abstract class ContextModel with _$ContextModel {
  const factory ContextModel({
    @Default([]) List<Citation> citations,
    @Default("") String intent,
  }) = _ContextModel;

  factory ContextModel.fromJson(Map<String, dynamic> json) =>
      _$ContextModelFromJson(json);
}

@freezed
abstract class Citation with _$Citation {
  const factory Citation({
    @Default('') String content,
    @Default('') String title,
    @Default('') String url,
    @Default('') String? filepath,
    @Default('') @JsonKey(name: "chunk_id") String chunkId,
  }) = _Citation;

  factory Citation.fromJson(Map<String, dynamic> json) =>
      _$CitationFromJson(json);
}

/*================================Start Stream Response============================ */
@freezed
abstract class StartStreamModel with _$StartStreamModel {
  const factory StartStreamModel({
    @Default(200) int statusCode,
    @Default('') String status,
    @Default('') String message,
    WebRTCDataModel? data,
  }) = _StartStreamModel;

  factory StartStreamModel.fromJson(Map<String, dynamic> json) =>
      _$StartStreamModelFromJson(json);
}

@freezed
abstract class WebRTCDataModel with _$WebRTCDataModel {
  const factory WebRTCDataModel({
    @Default('') String id,
    WebRTCDetailsModel? webrtcData,
  }) = _WebRTCDataModel;

  factory WebRTCDataModel.fromJson(Map<String, dynamic> json) =>
      _$WebRTCDataModelFromJson(json);
}

@freezed
abstract class WebRTCDetailsModel with _$WebRTCDetailsModel {
  const factory WebRTCDetailsModel({
    OfferModel? offer,
    @Default([]) List<ICEServerModel> iceServers,
  }) = _WebRTCDetailsModel;

  factory WebRTCDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$WebRTCDetailsModelFromJson(json);
}

@freezed
abstract class OfferModel with _$OfferModel {
  const factory OfferModel({
    @Default('') String type,
    @Default('') String sdp,
  }) = _OfferModel;

  factory OfferModel.fromJson(Map<String, dynamic> json) =>
      _$OfferModelFromJson(json);
}

@freezed
abstract class ICEServerModel with _$ICEServerModel {
  const factory ICEServerModel({
    @Default('') String urls,
    @Default('') String username,
    @Default('') String credential,
  }) = _ICEServerModel;

  factory ICEServerModel.fromJson(Map<String, dynamic> json) =>
      _$ICEServerModelFromJson(json);
}
/*================================== send answer========================== */

@freezed
abstract class MainChatbotResponseModel with _$MainChatbotResponseModel {
  const factory MainChatbotResponseModel({
    @Default(0) @JsonKey(name: "status_code") int statusCode,
    @Default('') String status,
    @Default('') String message,

    // @Default('') Null data,
  }) = _MainChatbotResponseModel;

  factory MainChatbotResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MainChatbotResponseModelFromJson(json);
}

@freezed
abstract class FailureAIModel with _$FailureAIModel {
  const factory FailureAIModel({
    @Default([]) List<String>? errorDescription,
    @Default(null) String? message,
    @Default(null) String? detail,
    @Default(0) int? statusCode,
  }) = _FailureAIModel;

  factory FailureAIModel.fromJson(Map<String, dynamic> json) =>
      _$FailureAIModelFromJson(json);
}

//--------------------------- platform chatbot models----------------------
@freezed
abstract class PlatformChatbotResponseModel
    with _$PlatformChatbotResponseModel {
  const factory PlatformChatbotResponseModel({
    @Default(null) String? conversationId,
    @Default([]) List<dynamic> response,
    @Default("") String? responseFormat,
  }) = _PlatformChatbotResponseModel;

  factory PlatformChatbotResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PlatformChatbotResponseModelFromJson(json);
}

@freezed
class ChatbotFAQResponseModel with _$ChatbotFAQResponseModel {
  const factory ChatbotFAQResponseModel({
    @JsonKey(name: 'PartitionKey') required String partitionKey,
    @JsonKey(name: 'RowKey') required String rowKey,
    @JsonKey(name: 'ActualQuestion') required String actualQuestion,
    @JsonKey(name: 'SimilarQuestions') required String similarQuestions,
    @JsonKey(name: 'TotalCount') required int totalCount,
    required String botname,
  }) = _ChatbotFAQResponseModel;

  factory ChatbotFAQResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChatbotFAQResponseModelFromJson(json);
}
