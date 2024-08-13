// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_info_model.freezed.dart';
part 'update_info_model.g.dart';

@freezed
abstract class RequestUpdateInfoModel with _$RequestUpdateInfoModel {
  factory RequestUpdateInfoModel({
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "fcm_token") String? fcmToken,
    @JsonKey(name: "email_notifications") bool? emailNotifications,
    @JsonKey(name: "title") String? title,
  }) = _RequestUpdateInfoModel;
  factory RequestUpdateInfoModel.fromJson(Map<String, dynamic> json) =>
      _$RequestUpdateInfoModelFromJson(json);
}
