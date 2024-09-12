// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestAuth _$RequestAuthFromJson(Map<String, dynamic> json) {
  return _RequestAuth.fromJson(json);
}

/// @nodoc
mixin _$RequestAuth {
  String get email => throw _privateConstructorUsedError;
  String get mode => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Serializes this RequestAuth to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestAuth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestAuthCopyWith<RequestAuth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestAuthCopyWith<$Res> {
  factory $RequestAuthCopyWith(
          RequestAuth value, $Res Function(RequestAuth) then) =
      _$RequestAuthCopyWithImpl<$Res, RequestAuth>;
  @useResult
  $Res call({String email, String mode, String password});
}

/// @nodoc
class _$RequestAuthCopyWithImpl<$Res, $Val extends RequestAuth>
    implements $RequestAuthCopyWith<$Res> {
  _$RequestAuthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestAuth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? mode = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestAuthImplCopyWith<$Res>
    implements $RequestAuthCopyWith<$Res> {
  factory _$$RequestAuthImplCopyWith(
          _$RequestAuthImpl value, $Res Function(_$RequestAuthImpl) then) =
      __$$RequestAuthImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String mode, String password});
}

/// @nodoc
class __$$RequestAuthImplCopyWithImpl<$Res>
    extends _$RequestAuthCopyWithImpl<$Res, _$RequestAuthImpl>
    implements _$$RequestAuthImplCopyWith<$Res> {
  __$$RequestAuthImplCopyWithImpl(
      _$RequestAuthImpl _value, $Res Function(_$RequestAuthImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestAuth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? mode = null,
    Object? password = null,
  }) {
    return _then(_$RequestAuthImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestAuthImpl implements _RequestAuth {
  _$RequestAuthImpl(
      {required this.email, required this.mode, required this.password});

  factory _$RequestAuthImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestAuthImplFromJson(json);

  @override
  final String email;
  @override
  final String mode;
  @override
  final String password;

  @override
  String toString() {
    return 'RequestAuth(email: $email, mode: $mode, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestAuthImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, mode, password);

  /// Create a copy of RequestAuth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestAuthImplCopyWith<_$RequestAuthImpl> get copyWith =>
      __$$RequestAuthImplCopyWithImpl<_$RequestAuthImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestAuthImplToJson(
      this,
    );
  }
}

abstract class _RequestAuth implements RequestAuth {
  factory _RequestAuth(
      {required final String email,
      required final String mode,
      required final String password}) = _$RequestAuthImpl;

  factory _RequestAuth.fromJson(Map<String, dynamic> json) =
      _$RequestAuthImpl.fromJson;

  @override
  String get email;
  @override
  String get mode;
  @override
  String get password;

  /// Create a copy of RequestAuth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestAuthImplCopyWith<_$RequestAuthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RefreshToken _$RefreshTokenFromJson(Map<String, dynamic> json) {
  return _RefreshToken.fromJson(json);
}

/// @nodoc
mixin _$RefreshToken {
  String get refresh_token => throw _privateConstructorUsedError;
  String get mode => throw _privateConstructorUsedError;

  /// Serializes this RefreshToken to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RefreshToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefreshTokenCopyWith<RefreshToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshTokenCopyWith<$Res> {
  factory $RefreshTokenCopyWith(
          RefreshToken value, $Res Function(RefreshToken) then) =
      _$RefreshTokenCopyWithImpl<$Res, RefreshToken>;
  @useResult
  $Res call({String refresh_token, String mode});
}

/// @nodoc
class _$RefreshTokenCopyWithImpl<$Res, $Val extends RefreshToken>
    implements $RefreshTokenCopyWith<$Res> {
  _$RefreshTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefreshToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refresh_token = null,
    Object? mode = null,
  }) {
    return _then(_value.copyWith(
      refresh_token: null == refresh_token
          ? _value.refresh_token
          : refresh_token // ignore: cast_nullable_to_non_nullable
              as String,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RefreshTokenImplCopyWith<$Res>
    implements $RefreshTokenCopyWith<$Res> {
  factory _$$RefreshTokenImplCopyWith(
          _$RefreshTokenImpl value, $Res Function(_$RefreshTokenImpl) then) =
      __$$RefreshTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String refresh_token, String mode});
}

/// @nodoc
class __$$RefreshTokenImplCopyWithImpl<$Res>
    extends _$RefreshTokenCopyWithImpl<$Res, _$RefreshTokenImpl>
    implements _$$RefreshTokenImplCopyWith<$Res> {
  __$$RefreshTokenImplCopyWithImpl(
      _$RefreshTokenImpl _value, $Res Function(_$RefreshTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefreshToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refresh_token = null,
    Object? mode = null,
  }) {
    return _then(_$RefreshTokenImpl(
      refresh_token: null == refresh_token
          ? _value.refresh_token
          : refresh_token // ignore: cast_nullable_to_non_nullable
              as String,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RefreshTokenImpl implements _RefreshToken {
  _$RefreshTokenImpl({required this.refresh_token, required this.mode});

  factory _$RefreshTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefreshTokenImplFromJson(json);

  @override
  final String refresh_token;
  @override
  final String mode;

  @override
  String toString() {
    return 'RefreshToken(refresh_token: $refresh_token, mode: $mode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTokenImpl &&
            (identical(other.refresh_token, refresh_token) ||
                other.refresh_token == refresh_token) &&
            (identical(other.mode, mode) || other.mode == mode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, refresh_token, mode);

  /// Create a copy of RefreshToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshTokenImplCopyWith<_$RefreshTokenImpl> get copyWith =>
      __$$RefreshTokenImplCopyWithImpl<_$RefreshTokenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefreshTokenImplToJson(
      this,
    );
  }
}

abstract class _RefreshToken implements RefreshToken {
  factory _RefreshToken(
      {required final String refresh_token,
      required final String mode}) = _$RefreshTokenImpl;

  factory _RefreshToken.fromJson(Map<String, dynamic> json) =
      _$RefreshTokenImpl.fromJson;

  @override
  String get refresh_token;
  @override
  String get mode;

  /// Create a copy of RefreshToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshTokenImplCopyWith<_$RefreshTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
