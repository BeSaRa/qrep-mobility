// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FaqResponseImpl _$$FaqResponseImplFromJson(Map<String, dynamic> json) =>
    _$FaqResponseImpl(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => FaqItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$FaqResponseImplToJson(_$FaqResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$FaqItemModelImpl _$$FaqItemModelImplFromJson(Map<String, dynamic> json) =>
    _$FaqItemModelImpl(
      answer: json['answer'] as String? ?? '',
      id: (json['id'] as num?)?.toInt() ?? 0,
      question: json['question'] as String? ?? '',
    );

Map<String, dynamic> _$$FaqItemModelImplToJson(_$FaqItemModelImpl instance) =>
    <String, dynamic>{
      'answer': instance.answer,
      'id': instance.id,
      'question': instance.question,
    };
