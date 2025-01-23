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
    @Default('') String conversationId,
    @Default('') String role,
    @Default(false) bool endTurn,
    @Default(null) ContextModel? contextModel,
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
    @Default([]) List<String> intent,
  }) = _ContextModel;

  factory ContextModel.fromJson(Map<String, dynamic> json) => _$ContextModelFromJson(json);
}

@freezed
abstract class Citation with _$Citation {
  const factory Citation({
    @Default('') String content,
    @Default('') String title,
    @Default('') String url,
    @Default('') String? filepath,
    @Default('') String chunkId,
  }) = _Citation;

  factory Citation.fromJson(Map<String, dynamic> json) =>
      _$CitationFromJson(json);
}

