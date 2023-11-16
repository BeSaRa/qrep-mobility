// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserResponse with _$UserResponse {
  const factory UserResponse({@Default(UserModel()) UserModel data}) =
      _UserResponse;
  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    @Default("") String id,
    @Default("") @JsonKey(name: "first_name") String firstName,
    @Default("") @JsonKey(name: "last_name") String lastName,
    @Default("") String email,
    @Default("") String title,
  }) = _UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
