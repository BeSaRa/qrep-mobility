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
      conversationId: json['conversation_id'] as String? ?? '',
      role: json['role'] as String? ?? '',
      endTurn: json['endTurn'] as bool? ?? false,
      contextModel: json['context'] == null
          ? null
          : ContextModel.fromJson(json['context'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MessageResponseModelImplToJson(
        _$MessageResponseModelImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'conversation_id': instance.conversationId,
      'role': instance.role,
      'endTurn': instance.endTurn,
      'context': instance.contextModel,
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
      chunkId: json['chunk_id'] as String? ?? '',
    );

Map<String, dynamic> _$$CitationImplToJson(_$CitationImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'title': instance.title,
      'url': instance.url,
      'filepath': instance.filepath,
      'chunk_id': instance.chunkId,
    };

_$StartStreamModelImpl _$$StartStreamModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StartStreamModelImpl(
      statusCode: (json['statusCode'] as num?)?.toInt() ?? 200,
      status: json['status'] as String? ?? '',
      message: json['message'] as String? ?? '',
      data: json['data'] == null
          ? null
          : WebRTCDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StartStreamModelImplToJson(
        _$StartStreamModelImpl instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$WebRTCDataModelImpl _$$WebRTCDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WebRTCDataModelImpl(
      id: json['id'] as String? ?? '',
      webrtcData: json['webrtcData'] == null
          ? null
          : WebRTCDetailsModel.fromJson(
              json['webrtcData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WebRTCDataModelImplToJson(
        _$WebRTCDataModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'webrtcData': instance.webrtcData,
    };

_$WebRTCDetailsModelImpl _$$WebRTCDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WebRTCDetailsModelImpl(
      offer: json['offer'] == null
          ? null
          : OfferModel.fromJson(json['offer'] as Map<String, dynamic>),
      iceServers: (json['iceServers'] as List<dynamic>?)
              ?.map((e) => ICEServerModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$WebRTCDetailsModelImplToJson(
        _$WebRTCDetailsModelImpl instance) =>
    <String, dynamic>{
      'offer': instance.offer,
      'iceServers': instance.iceServers,
    };

_$OfferModelImpl _$$OfferModelImplFromJson(Map<String, dynamic> json) =>
    _$OfferModelImpl(
      type: json['type'] as String? ?? '',
      sdp: json['sdp'] as String? ?? '',
    );

Map<String, dynamic> _$$OfferModelImplToJson(_$OfferModelImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'sdp': instance.sdp,
    };

_$ICEServerModelImpl _$$ICEServerModelImplFromJson(Map<String, dynamic> json) =>
    _$ICEServerModelImpl(
      urls: json['urls'] as String? ?? '',
      username: json['username'] as String? ?? '',
      credential: json['credential'] as String? ?? '',
    );

Map<String, dynamic> _$$ICEServerModelImplToJson(
        _$ICEServerModelImpl instance) =>
    <String, dynamic>{
      'urls': instance.urls,
      'username': instance.username,
      'credential': instance.credential,
    };

_$SendAnswerResponseModelImpl _$$SendAnswerResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SendAnswerResponseModelImpl(
      statusCode: (json['status_code'] as num?)?.toInt() ?? 0,
      status: json['status'] as String? ?? '',
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$$SendAnswerResponseModelImplToJson(
        _$SendAnswerResponseModelImpl instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status': instance.status,
      'message': instance.message,
    };

_$FailureCloseStreamModelImpl _$$FailureCloseStreamModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FailureCloseStreamModelImpl(
      errorDescription: (json['errorDescription'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      message: json['message'] as String? ?? null,
      detail: json['detail'] as String? ?? null,
      statusCode: (json['statusCode'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$FailureCloseStreamModelImplToJson(
        _$FailureCloseStreamModelImpl instance) =>
    <String, dynamic>{
      'errorDescription': instance.errorDescription,
      'message': instance.message,
      'detail': instance.detail,
      'statusCode': instance.statusCode,
    };

_$PlatformChatbotResponseModelImpl _$$PlatformChatbotResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PlatformChatbotResponseModelImpl(
      conversationId: json['conversationId'] as String? ?? null,
      response: json['response'] as List<dynamic>? ?? const [],
      responseFormat: json['responseFormat'] as String? ?? "",
    );

Map<String, dynamic> _$$PlatformChatbotResponseModelImplToJson(
        _$PlatformChatbotResponseModelImpl instance) =>
    <String, dynamic>{
      'conversationId': instance.conversationId,
      'response': instance.response,
      'responseFormat': instance.responseFormat,
    };
