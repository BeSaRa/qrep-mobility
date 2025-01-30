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

_$MainSendAnswerRequestModelImpl _$$MainSendAnswerRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MainSendAnswerRequestModelImpl(
      answer: json['answer'] == null
          ? const SendAnswerRequestModel()
          : SendAnswerRequestModel.fromJson(
              json['answer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MainSendAnswerRequestModelImplToJson(
        _$MainSendAnswerRequestModelImpl instance) =>
    <String, dynamic>{
      'answer': instance.answer,
    };

_$SendAnswerRequestModelImpl _$$SendAnswerRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SendAnswerRequestModelImpl(
      sdp: json['sdp'] as String? ?? '',
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$$SendAnswerRequestModelImplToJson(
        _$SendAnswerRequestModelImpl instance) =>
    <String, dynamic>{
      'sdp': instance.sdp,
      'type': instance.type,
    };

_$MainSendCandidateRequestModelImpl
    _$$MainSendCandidateRequestModelImplFromJson(Map<String, dynamic> json) =>
        _$MainSendCandidateRequestModelImpl(
          candidate: json['candidate'] ?? const SendCandidateRequestModel(),
        );

Map<String, dynamic> _$$MainSendCandidateRequestModelImplToJson(
        _$MainSendCandidateRequestModelImpl instance) =>
    <String, dynamic>{
      'candidate': instance.candidate,
    };

_$SendCandidateRequestModelImpl _$$SendCandidateRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SendCandidateRequestModelImpl(
      candidate: json['candidate'] as String? ?? '',
      sdpMLineIndex: (json['sdpMLineIndex'] as num?)?.toInt() ?? 0,
      sdpMid: json['sdpMid'] as String? ?? '',
      usernameFragment: json['usernameFragment'] as String? ?? '',
    );

Map<String, dynamic> _$$SendCandidateRequestModelImplToJson(
        _$SendCandidateRequestModelImpl instance) =>
    <String, dynamic>{
      'candidate': instance.candidate,
      'sdpMLineIndex': instance.sdpMLineIndex,
      'sdpMid': instance.sdpMid,
      'usernameFragment': instance.usernameFragment,
    };
