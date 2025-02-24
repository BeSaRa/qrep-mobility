import 'package:freezed_annotation/freezed_annotation.dart';
part 'chatbot_request_model.g.dart';
part 'chatbot_request_model.freezed.dart';

@freezed
abstract class ChatbotRequestModel with _$ChatbotRequestModel {
  const factory ChatbotRequestModel({
    @Default('') @JsonKey(name: "stream_id") String? streamId,
    @Default([]) List<MessageRequestModel> messages,
  }) = _ChatbotRequestModel;

  factory ChatbotRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ChatbotRequestModelFromJson(json);
}

@freezed
abstract class MessageRequestModel with _$MessageRequestModel {
  const factory MessageRequestModel({
    @Default('') String role,
    //it' dynamic for the platform chat
    @Default('') dynamic content,
  }) = _MessageRequestModel;

  factory MessageRequestModel.fromJson(Map<String, dynamic> json) =>
      _$MessageRequestModelFromJson(json);
}

//----------------------------- send answer -------------------------------------
@freezed
abstract class MainSendAnswerRequestModel with _$MainSendAnswerRequestModel {
  const factory MainSendAnswerRequestModel(
          {@Default(SendAnswerRequestModel()) SendAnswerRequestModel answer}) =
      _MainSendAnswerRequestModel;

  factory MainSendAnswerRequestModel.fromJson(Map<String, dynamic> json) =>
      _$MainSendAnswerRequestModelFromJson(json);
}

@freezed
abstract class SendAnswerRequestModel with _$SendAnswerRequestModel {
  const factory SendAnswerRequestModel({
    @Default('') String sdp,
    @Default('') String type,
  }) = _SendAnswerRequestModel;

  factory SendAnswerRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SendAnswerRequestModelFromJson(json);
}

//----------------------------- send Candidate -------------------------------------
@freezed
abstract class MainSendCandidateRequestModel
    with _$MainSendCandidateRequestModel {
  const factory MainSendCandidateRequestModel(
      {@Default(SendCandidateRequestModel())
      SendCandidateRequestModel candidate}) = _MainSendCandidateRequestModel;

  factory MainSendCandidateRequestModel.fromJson(Map<String, dynamic> json) =>
      _$MainSendCandidateRequestModelFromJson(json);
}

@freezed
abstract class SendCandidateRequestModel with _$SendCandidateRequestModel {
  const factory SendCandidateRequestModel({
    @Default('') String candidate,
    @Default(0) int sdpMLineIndex,
    @Default('') String sdpMid,
    @Default('') String usernameFragment,
  }) = _SendCandidateRequestModel;

  factory SendCandidateRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SendCandidateRequestModelFromJson(json);
}

//----------- platform chatbot ------------------
@freezed
abstract class PlatformChatbotRequestModel with _$PlatformChatbotRequestModel {
  const factory PlatformChatbotRequestModel({
    @Default(0) int? lang,
    @Default('') String? question,
  }) = _PlatformChatbotRequestModel;

  factory PlatformChatbotRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PlatformChatbotRequestModelFromJson(json);
}
