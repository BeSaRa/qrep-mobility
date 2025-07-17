// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_chatbot_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FullNewChatbotResponseModelImpl _$$FullNewChatbotResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FullNewChatbotResponseModelImpl(
      data: NewChatbotResponseModel.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FullNewChatbotResponseModelImplToJson(
        _$FullNewChatbotResponseModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$NewChatbotResponseModelImpl _$$NewChatbotResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NewChatbotResponseModelImpl(
      event: json['event'] as String,
      data: DataResponseModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NewChatbotResponseModelImplToJson(
        _$NewChatbotResponseModelImpl instance) =>
    <String, dynamic>{
      'event': instance.event,
      'data': instance.data,
    };

_$DataResponseModelImpl _$$DataResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DataResponseModelImpl(
      content: json['content'] as String? ?? '',
      citations: (json['citations'] as List<dynamic>?)
              ?.map((e) => DocumentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      conversationId: json['conversation_id'] as String? ?? '',
      streamId: json['stream_id'] as String? ?? '',
      userId: json['user_id'] as String? ?? '',
      actionResults: (json['action_results'] as List<dynamic>?)
              ?.map((e) => ActionResult.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DataResponseModelImplToJson(
        _$DataResponseModelImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'citations': instance.citations,
      'conversation_id': instance.conversationId,
      'stream_id': instance.streamId,
      'user_id': instance.userId,
      'action_results': instance.actionResults,
    };

_$ActionResultImpl _$$ActionResultImplFromJson(Map<String, dynamic> json) =>
    _$ActionResultImpl(
      retrieveDocuments: (json['retrieve_documents'] as List<dynamic>?)
              ?.map((e) => DocumentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ActionResultImplToJson(_$ActionResultImpl instance) =>
    <String, dynamic>{
      'retrieve_documents': instance.retrieveDocuments,
    };

_$DocumentModelImpl _$$DocumentModelImplFromJson(Map<String, dynamic> json) =>
    _$DocumentModelImpl(
      parentId: json['parent_id'] as String? ?? '',
      chunkId: json['chunk_id'] as String? ?? '',
      chunk: json['chunk'] as String? ?? '',
      refUrl: json['ref_url'] as String? ?? '',
      url: json['url'] as String? ?? '',
      baseUrl: json['base_url'] as String? ?? '',
      title: json['title'] as String? ?? '',
      indexDate: json['index_date'] as String? ?? '',
      newsDate: json['news_date'] as String? ?? '',
      language: json['language'] as String? ?? '',
      sentiment: json['sentiment'] as String? ?? '',
      keyphrases: json['keyphrases'] as String? ?? '',
      people: json['people'] as String? ?? '',
      organizations: json['organizations'] as String? ?? '',
      locations: json['locations'] as String? ?? '',
      dateTime: json['dateTime'] as String? ?? '',
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$$DocumentModelImplToJson(_$DocumentModelImpl instance) =>
    <String, dynamic>{
      'parent_id': instance.parentId,
      'chunk_id': instance.chunkId,
      'chunk': instance.chunk,
      'ref_url': instance.refUrl,
      'url': instance.url,
      'base_url': instance.baseUrl,
      'title': instance.title,
      'index_date': instance.indexDate,
      'news_date': instance.newsDate,
      'language': instance.language,
      'sentiment': instance.sentiment,
      'keyphrases': instance.keyphrases,
      'people': instance.people,
      'organizations': instance.organizations,
      'locations': instance.locations,
      'dateTime': instance.dateTime,
      'type': instance.type,
    };
