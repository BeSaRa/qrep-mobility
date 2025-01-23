// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatbot_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatbotRequestModelImpl _$$ChatbotRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatbotRequestModelImpl(
      streamId: json['streamId'] as String? ?? '',
      messages: (json['messages'] as List<dynamic>?)
              ?.map((e) =>
                  MessageRequestModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ChatbotRequestModelImplToJson(
        _$ChatbotRequestModelImpl instance) =>
    <String, dynamic>{
      'streamId': instance.streamId,
      'messages': instance.messages,
    };

_$MessageRequestModelImpl _$$MessageRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageRequestModelImpl(
      role: json['role'] as String? ?? '',
      content: json['content'] as String? ?? '',
    );

Map<String, dynamic> _$$MessageRequestModelImplToJson(
        _$MessageRequestModelImpl instance) =>
    <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
    };
