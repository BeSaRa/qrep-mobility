// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatbot_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatbotResponseModelImpl _$$ChatbotResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatbotResponseModelImpl(
      finishReason: json['finishReason'] as String? ?? '',
      index: (json['index'] as num?)?.toInt() ?? 0,
      message: MessageResponseModel.fromJson(
          json['message'] as Map<String, dynamic>),
      usage: Usage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChatbotResponseModelImplToJson(
        _$ChatbotResponseModelImpl instance) =>
    <String, dynamic>{
      'finishReason': instance.finishReason,
      'index': instance.index,
      'message': instance.message,
      'usage': instance.usage,
    };

_$MessageResponseModelImpl _$$MessageResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageResponseModelImpl(
      content: json['content'] as String? ?? '',
      conversationId: json['conversationId'] as String? ?? '',
      role: json['role'] as String? ?? '',
      endTurn: json['endTurn'] as bool? ?? false,
      contextModel: json['contextModel'] == null
          ? null
          : ContextModel.fromJson(json['contextModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MessageResponseModelImplToJson(
        _$MessageResponseModelImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'conversationId': instance.conversationId,
      'role': instance.role,
      'endTurn': instance.endTurn,
      'contextModel': instance.contextModel,
    };

_$UsageImpl _$$UsageImplFromJson(Map<String, dynamic> json) => _$UsageImpl(
      completionTokens: (json['completionTokens'] as num?)?.toInt() ?? 0,
      promptTokens: (json['promptTokens'] as num?)?.toInt() ?? 0,
      totalTokens: (json['totalTokens'] as num?)?.toInt() ?? 0,
      completionTokensDetails: json['completionTokensDetails'] as String? ?? "",
      promptTokensDetails: json['promptTokensDetails'] as String? ?? "",
    );

Map<String, dynamic> _$$UsageImplToJson(_$UsageImpl instance) =>
    <String, dynamic>{
      'completionTokens': instance.completionTokens,
      'promptTokens': instance.promptTokens,
      'totalTokens': instance.totalTokens,
      'completionTokensDetails': instance.completionTokensDetails,
      'promptTokensDetails': instance.promptTokensDetails,
    };

_$ContextModelImpl _$$ContextModelImplFromJson(Map<String, dynamic> json) =>
    _$ContextModelImpl(
      citations: (json['citations'] as List<dynamic>?)
              ?.map((e) => Citation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      intent: (json['intent'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ContextModelImplToJson(_$ContextModelImpl instance) =>
    <String, dynamic>{
      'citations': instance.citations,
      'intent': instance.intent,
    };

_$CitationImpl _$$CitationImplFromJson(Map<String, dynamic> json) =>
    _$CitationImpl(
      content: json['content'] as String? ?? '',
      title: json['title'] as String? ?? '',
      url: json['url'] as String? ?? '',
      filepath: json['filepath'] as String? ?? '',
      chunkId: json['chunkId'] as String? ?? '',
    );

Map<String, dynamic> _$$CitationImplToJson(_$CitationImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'title': instance.title,
      'url': instance.url,
      'filepath': instance.filepath,
      'chunkId': instance.chunkId,
    };
