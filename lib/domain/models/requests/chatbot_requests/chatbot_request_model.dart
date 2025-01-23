
import 'package:freezed_annotation/freezed_annotation.dart';
part 'chatbot_request_model.g.dart';
part 'chatbot_request_model.freezed.dart';
@freezed
abstract class ChatbotRequestModel with _$ChatbotRequestModel {
  const factory ChatbotRequestModel({
    @Default('') String? streamId,
    @Default([]) List<MessageRequestModel> messages,
  }) = _ChatbotRequestModel;

  factory ChatbotRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ChatbotRequestModelFromJson(json);
}
@freezed
abstract class MessageRequestModel with _$MessageRequestModel {
  const factory MessageRequestModel({
    @Default('') String role,
    @Default('') String content,
  }) = _MessageRequestModel;

  factory MessageRequestModel.fromJson(Map<String, dynamic> json) =>
      _$MessageRequestModelFromJson(json);
}