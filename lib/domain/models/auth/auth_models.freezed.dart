// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) {
  return _AuthResponse.fromJson(json);
}

/// @nodoc
mixin _$AuthResponse {
  AuthModel get data => throw _privateConstructorUsedError;

  /// Serializes this AuthResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthResponseCopyWith<AuthResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResponseCopyWith<$Res> {
  factory $AuthResponseCopyWith(
          AuthResponse value, $Res Function(AuthResponse) then) =
      _$AuthResponseCopyWithImpl<$Res, AuthResponse>;
  @useResult
  $Res call({AuthModel data});

  $AuthModelCopyWith<$Res> get data;
}

/// @nodoc
class _$AuthResponseCopyWithImpl<$Res, $Val extends AuthResponse>
    implements $AuthResponseCopyWith<$Res> {
  _$AuthResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AuthModel,
    ) as $Val);
  }

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthModelCopyWith<$Res> get data {
    return $AuthModelCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthResponseImplCopyWith<$Res>
    implements $AuthResponseCopyWith<$Res> {
  factory _$$AuthResponseImplCopyWith(
          _$AuthResponseImpl value, $Res Function(_$AuthResponseImpl) then) =
      __$$AuthResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthModel data});

  @override
  $AuthModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$AuthResponseImplCopyWithImpl<$Res>
    extends _$AuthResponseCopyWithImpl<$Res, _$AuthResponseImpl>
    implements _$$AuthResponseImplCopyWith<$Res> {
  __$$AuthResponseImplCopyWithImpl(
      _$AuthResponseImpl _value, $Res Function(_$AuthResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$AuthResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AuthModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthResponseImpl implements _AuthResponse {
  const _$AuthResponseImpl({this.data = const AuthModel()});

  factory _$AuthResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthResponseImplFromJson(json);

  @override
  @JsonKey()
  final AuthModel data;

  @override
  String toString() {
    return 'AuthResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthResponseImplCopyWith<_$AuthResponseImpl> get copyWith =>
      __$$AuthResponseImplCopyWithImpl<_$AuthResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthResponseImplToJson(
      this,
    );
  }
}

abstract class _AuthResponse implements AuthResponse {
  const factory _AuthResponse({final AuthModel data}) = _$AuthResponseImpl;

  factory _AuthResponse.fromJson(Map<String, dynamic> json) =
      _$AuthResponseImpl.fromJson;

  @override
  AuthModel get data;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthResponseImplCopyWith<_$AuthResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) {
  return _AuthModel.fromJson(json);
}

/// @nodoc
mixin _$AuthModel {
  @JsonKey(name: "access_token")
  String get token => throw _privateConstructorUsedError;
  @JsonKey(name: "refresh_token")
  String get refreshToken => throw _privateConstructorUsedError;
  int get expires => throw _privateConstructorUsedError;

  /// Serializes this AuthModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthModelCopyWith<AuthModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthModelCopyWith<$Res> {
  factory $AuthModelCopyWith(AuthModel value, $Res Function(AuthModel) then) =
      _$AuthModelCopyWithImpl<$Res, AuthModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "access_token") String token,
      @JsonKey(name: "refresh_token") String refreshToken,
      int expires});
}

/// @nodoc
class _$AuthModelCopyWithImpl<$Res, $Val extends AuthModel>
    implements $AuthModelCopyWith<$Res> {
  _$AuthModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? refreshToken = null,
    Object? expires = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      expires: null == expires
          ? _value.expires
          : expires // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthModelImplCopyWith<$Res>
    implements $AuthModelCopyWith<$Res> {
  factory _$$AuthModelImplCopyWith(
          _$AuthModelImpl value, $Res Function(_$AuthModelImpl) then) =
      __$$AuthModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "access_token") String token,
      @JsonKey(name: "refresh_token") String refreshToken,
      int expires});
}

/// @nodoc
class __$$AuthModelImplCopyWithImpl<$Res>
    extends _$AuthModelCopyWithImpl<$Res, _$AuthModelImpl>
    implements _$$AuthModelImplCopyWith<$Res> {
  __$$AuthModelImplCopyWithImpl(
      _$AuthModelImpl _value, $Res Function(_$AuthModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? refreshToken = null,
    Object? expires = null,
  }) {
    return _then(_$AuthModelImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      expires: null == expires
          ? _value.expires
          : expires // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthModelImpl implements _AuthModel {
  const _$AuthModelImpl(
      {@JsonKey(name: "access_token") this.token = "",
      @JsonKey(name: "refresh_token") this.refreshToken = "",
      this.expires = 0});

  factory _$AuthModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthModelImplFromJson(json);

  @override
  @JsonKey(name: "access_token")
  final String token;
  @override
  @JsonKey(name: "refresh_token")
  final String refreshToken;
  @override
  @JsonKey()
  final int expires;

  @override
  String toString() {
    return 'AuthModel(token: $token, refreshToken: $refreshToken, expires: $expires)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthModelImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expires, expires) || other.expires == expires));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, refreshToken, expires);

  /// Create a copy of AuthModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthModelImplCopyWith<_$AuthModelImpl> get copyWith =>
      __$$AuthModelImplCopyWithImpl<_$AuthModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthModelImplToJson(
      this,
    );
  }
}

abstract class _AuthModel implements AuthModel {
  const factory _AuthModel(
      {@JsonKey(name: "access_token") final String token,
      @JsonKey(name: "refresh_token") final String refreshToken,
      final int expires}) = _$AuthModelImpl;

  factory _AuthModel.fromJson(Map<String, dynamic> json) =
      _$AuthModelImpl.fromJson;

  @override
  @JsonKey(name: "access_token")
  String get token;
  @override
  @JsonKey(name: "refresh_token")
  String get refreshToken;
  @override
  int get expires;

  /// Create a copy of AuthModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthModelImplCopyWith<_$AuthModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResetPasswordModel _$ResetPasswordModelFromJson(Map<String, dynamic> json) {
  return _ResetPasswordModel.fromJson(json);
}

/// @nodoc
mixin _$ResetPasswordModel {
  @JsonKey(name: "reset_url")
  String get token => throw _privateConstructorUsedError;

  /// Serializes this ResetPasswordModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResetPasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResetPasswordModelCopyWith<ResetPasswordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordModelCopyWith<$Res> {
  factory $ResetPasswordModelCopyWith(
          ResetPasswordModel value, $Res Function(ResetPasswordModel) then) =
      _$ResetPasswordModelCopyWithImpl<$Res, ResetPasswordModel>;
  @useResult
  $Res call({@JsonKey(name: "reset_url") String token});
}

/// @nodoc
class _$ResetPasswordModelCopyWithImpl<$Res, $Val extends ResetPasswordModel>
    implements $ResetPasswordModelCopyWith<$Res> {
  _$ResetPasswordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResetPasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResetPasswordModelImplCopyWith<$Res>
    implements $ResetPasswordModelCopyWith<$Res> {
  factory _$$ResetPasswordModelImplCopyWith(_$ResetPasswordModelImpl value,
          $Res Function(_$ResetPasswordModelImpl) then) =
      __$$ResetPasswordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "reset_url") String token});
}

/// @nodoc
class __$$ResetPasswordModelImplCopyWithImpl<$Res>
    extends _$ResetPasswordModelCopyWithImpl<$Res, _$ResetPasswordModelImpl>
    implements _$$ResetPasswordModelImplCopyWith<$Res> {
  __$$ResetPasswordModelImplCopyWithImpl(_$ResetPasswordModelImpl _value,
      $Res Function(_$ResetPasswordModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResetPasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_$ResetPasswordModelImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResetPasswordModelImpl implements _ResetPasswordModel {
  const _$ResetPasswordModelImpl({@JsonKey(name: "reset_url") this.token = ""});

  factory _$ResetPasswordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResetPasswordModelImplFromJson(json);

  @override
  @JsonKey(name: "reset_url")
  final String token;

  @override
  String toString() {
    return 'ResetPasswordModel(token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordModelImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token);

  /// Create a copy of ResetPasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordModelImplCopyWith<_$ResetPasswordModelImpl> get copyWith =>
      __$$ResetPasswordModelImplCopyWithImpl<_$ResetPasswordModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResetPasswordModelImplToJson(
      this,
    );
  }
}

abstract class _ResetPasswordModel implements ResetPasswordModel {
  const factory _ResetPasswordModel(
          {@JsonKey(name: "reset_url") final String token}) =
      _$ResetPasswordModelImpl;

  factory _ResetPasswordModel.fromJson(Map<String, dynamic> json) =
      _$ResetPasswordModelImpl.fromJson;

  @override
  @JsonKey(name: "reset_url")
  String get token;

  /// Create a copy of ResetPasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResetPasswordModelImplCopyWith<_$ResetPasswordModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TheRequestLoginModel _$TheRequestLoginModelFromJson(Map<String, dynamic> json) {
  return _TheRequestLoginModel.fromJson(json);
}

/// @nodoc
mixin _$TheRequestLoginModel {
  @JsonKey(name: "Code")
  int? get code => throw _privateConstructorUsedError;
  @JsonKey(name: "Message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "Result")
  bool? get result => throw _privateConstructorUsedError;
  @JsonKey(name: "Data")
  RequestLoginModel? get data => throw _privateConstructorUsedError;

  /// Serializes this TheRequestLoginModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TheRequestLoginModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TheRequestLoginModelCopyWith<TheRequestLoginModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TheRequestLoginModelCopyWith<$Res> {
  factory $TheRequestLoginModelCopyWith(TheRequestLoginModel value,
          $Res Function(TheRequestLoginModel) then) =
      _$TheRequestLoginModelCopyWithImpl<$Res, TheRequestLoginModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "Code") int? code,
      @JsonKey(name: "Message") String? message,
      @JsonKey(name: "Result") bool? result,
      @JsonKey(name: "Data") RequestLoginModel? data});

  $RequestLoginModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$TheRequestLoginModelCopyWithImpl<$Res,
        $Val extends TheRequestLoginModel>
    implements $TheRequestLoginModelCopyWith<$Res> {
  _$TheRequestLoginModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TheRequestLoginModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? result = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as RequestLoginModel?,
    ) as $Val);
  }

  /// Create a copy of TheRequestLoginModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RequestLoginModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $RequestLoginModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TheRequestLoginModelImplCopyWith<$Res>
    implements $TheRequestLoginModelCopyWith<$Res> {
  factory _$$TheRequestLoginModelImplCopyWith(_$TheRequestLoginModelImpl value,
          $Res Function(_$TheRequestLoginModelImpl) then) =
      __$$TheRequestLoginModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Code") int? code,
      @JsonKey(name: "Message") String? message,
      @JsonKey(name: "Result") bool? result,
      @JsonKey(name: "Data") RequestLoginModel? data});

  @override
  $RequestLoginModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$TheRequestLoginModelImplCopyWithImpl<$Res>
    extends _$TheRequestLoginModelCopyWithImpl<$Res, _$TheRequestLoginModelImpl>
    implements _$$TheRequestLoginModelImplCopyWith<$Res> {
  __$$TheRequestLoginModelImplCopyWithImpl(_$TheRequestLoginModelImpl _value,
      $Res Function(_$TheRequestLoginModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TheRequestLoginModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? result = freezed,
    Object? data = freezed,
  }) {
    return _then(_$TheRequestLoginModelImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as RequestLoginModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TheRequestLoginModelImpl implements _TheRequestLoginModel {
  const _$TheRequestLoginModelImpl(
      {@JsonKey(name: "Code") this.code,
      @JsonKey(name: "Message") this.message,
      @JsonKey(name: "Result") this.result,
      @JsonKey(name: "Data") this.data});

  factory _$TheRequestLoginModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TheRequestLoginModelImplFromJson(json);

  @override
  @JsonKey(name: "Code")
  final int? code;
  @override
  @JsonKey(name: "Message")
  final String? message;
  @override
  @JsonKey(name: "Result")
  final bool? result;
  @override
  @JsonKey(name: "Data")
  final RequestLoginModel? data;

  @override
  String toString() {
    return 'TheRequestLoginModel(code: $code, message: $message, result: $result, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TheRequestLoginModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message, result, data);

  /// Create a copy of TheRequestLoginModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TheRequestLoginModelImplCopyWith<_$TheRequestLoginModelImpl>
      get copyWith =>
          __$$TheRequestLoginModelImplCopyWithImpl<_$TheRequestLoginModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TheRequestLoginModelImplToJson(
      this,
    );
  }
}

abstract class _TheRequestLoginModel implements TheRequestLoginModel {
  const factory _TheRequestLoginModel(
          {@JsonKey(name: "Code") final int? code,
          @JsonKey(name: "Message") final String? message,
          @JsonKey(name: "Result") final bool? result,
          @JsonKey(name: "Data") final RequestLoginModel? data}) =
      _$TheRequestLoginModelImpl;

  factory _TheRequestLoginModel.fromJson(Map<String, dynamic> json) =
      _$TheRequestLoginModelImpl.fromJson;

  @override
  @JsonKey(name: "Code")
  int? get code;
  @override
  @JsonKey(name: "Message")
  String? get message;
  @override
  @JsonKey(name: "Result")
  bool? get result;
  @override
  @JsonKey(name: "Data")
  RequestLoginModel? get data;

  /// Create a copy of TheRequestLoginModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TheRequestLoginModelImplCopyWith<_$TheRequestLoginModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RequestLoginModel _$RequestLoginModelFromJson(Map<String, dynamic> json) {
  return _RequestLoginModel.fromJson(json);
}

/// @nodoc
mixin _$RequestLoginModel {
  @JsonKey(name: "RedirectUrl")
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: "State")
  String? get state => throw _privateConstructorUsedError;

  /// Serializes this RequestLoginModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestLoginModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestLoginModelCopyWith<RequestLoginModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestLoginModelCopyWith<$Res> {
  factory $RequestLoginModelCopyWith(
          RequestLoginModel value, $Res Function(RequestLoginModel) then) =
      _$RequestLoginModelCopyWithImpl<$Res, RequestLoginModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "RedirectUrl") String? url,
      @JsonKey(name: "State") String? state});
}

/// @nodoc
class _$RequestLoginModelCopyWithImpl<$Res, $Val extends RequestLoginModel>
    implements $RequestLoginModelCopyWith<$Res> {
  _$RequestLoginModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestLoginModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? state = freezed,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestLoginModelImplCopyWith<$Res>
    implements $RequestLoginModelCopyWith<$Res> {
  factory _$$RequestLoginModelImplCopyWith(_$RequestLoginModelImpl value,
          $Res Function(_$RequestLoginModelImpl) then) =
      __$$RequestLoginModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "RedirectUrl") String? url,
      @JsonKey(name: "State") String? state});
}

/// @nodoc
class __$$RequestLoginModelImplCopyWithImpl<$Res>
    extends _$RequestLoginModelCopyWithImpl<$Res, _$RequestLoginModelImpl>
    implements _$$RequestLoginModelImplCopyWith<$Res> {
  __$$RequestLoginModelImplCopyWithImpl(_$RequestLoginModelImpl _value,
      $Res Function(_$RequestLoginModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestLoginModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? state = freezed,
  }) {
    return _then(_$RequestLoginModelImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestLoginModelImpl implements _RequestLoginModel {
  const _$RequestLoginModelImpl(
      {@JsonKey(name: "RedirectUrl") this.url,
      @JsonKey(name: "State") this.state});

  factory _$RequestLoginModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestLoginModelImplFromJson(json);

  @override
  @JsonKey(name: "RedirectUrl")
  final String? url;
  @override
  @JsonKey(name: "State")
  final String? state;

  @override
  String toString() {
    return 'RequestLoginModel(url: $url, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestLoginModelImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, state);

  /// Create a copy of RequestLoginModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestLoginModelImplCopyWith<_$RequestLoginModelImpl> get copyWith =>
      __$$RequestLoginModelImplCopyWithImpl<_$RequestLoginModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestLoginModelImplToJson(
      this,
    );
  }
}

abstract class _RequestLoginModel implements RequestLoginModel {
  const factory _RequestLoginModel(
      {@JsonKey(name: "RedirectUrl") final String? url,
      @JsonKey(name: "State") final String? state}) = _$RequestLoginModelImpl;

  factory _RequestLoginModel.fromJson(Map<String, dynamic> json) =
      _$RequestLoginModelImpl.fromJson;

  @override
  @JsonKey(name: "RedirectUrl")
  String? get url;
  @override
  @JsonKey(name: "State")
  String? get state;

  /// Create a copy of RequestLoginModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestLoginModelImplCopyWith<_$RequestLoginModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
