import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_auth.freezed.dart';
part 'request_auth.g.dart';

@freezed
abstract class RequestAuth with _$RequestAuth {
  factory RequestAuth({
    required String email,
    required String mode,
    required String password,
  }) = _RequestAuth;
  factory RequestAuth.fromJson(Map<String, dynamic> json) =>
      _$RequestAuthFromJson(json);
}

@freezed
abstract class RefreshToken with _$RefreshToken {
  factory RefreshToken({
    required String refresh_token,
    required String mode,
  }) = _RefreshToken;
  factory RefreshToken.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenFromJson(json);
}
