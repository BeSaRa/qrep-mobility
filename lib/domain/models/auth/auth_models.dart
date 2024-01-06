// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_models.freezed.dart';
part 'auth_models.g.dart';

@freezed
abstract class AuthResponse with _$AuthResponse {
  const factory AuthResponse({@Default(AuthModel()) AuthModel data}) =
      _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}

@freezed
abstract class AuthModel with _$AuthModel {
  const factory AuthModel({
    @Default("") @JsonKey(name: "access_token") String token,
    @Default("") @JsonKey(name: "refresh_token") String refreshToken,
    @Default(0) int expires,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
}

@freezed
abstract class ResetPasswordModel with _$ResetPasswordModel {
  const factory ResetPasswordModel({
    @Default("") @JsonKey(name: "reset_url") String token,
  }) = _ResetPasswordModel;

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordModelFromJson(json);
}
