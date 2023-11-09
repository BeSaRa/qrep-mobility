import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_auth.freezed.dart';
part 'request_auth.g.dart';

@freezed
abstract class RequestAuth with _$RequestAuth {
  factory RequestAuth({
    required String identifier,
    required String json,
    required String password,
  }) = _RequestAuth;
  factory RequestAuth.fromJson(Map<String, dynamic> json) =>
      _$RequestAuthFromJson(json);
}
