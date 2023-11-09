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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestAuth _$RequestAuthFromJson(Map<String, dynamic> json) {
  return _RequestAuth.fromJson(json);
}

/// @nodoc
mixin _$RequestAuth {
  String get identifier => throw _privateConstructorUsedError;
  String get json => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestAuthCopyWith<RequestAuth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestAuthCopyWith<$Res> {
  factory $RequestAuthCopyWith(
          RequestAuth value, $Res Function(RequestAuth) then) =
      _$RequestAuthCopyWithImpl<$Res, RequestAuth>;
  @useResult
  $Res call({String identifier, String json, String password});
}

/// @nodoc
class _$RequestAuthCopyWithImpl<$Res, $Val extends RequestAuth>
    implements $RequestAuthCopyWith<$Res> {
  _$RequestAuthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? json = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      json: null == json
          ? _value.json
          : json // ignore: cast_nullable_to_non_nullable
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
  $Res call({String identifier, String json, String password});
}

/// @nodoc
class __$$RequestAuthImplCopyWithImpl<$Res>
    extends _$RequestAuthCopyWithImpl<$Res, _$RequestAuthImpl>
    implements _$$RequestAuthImplCopyWith<$Res> {
  __$$RequestAuthImplCopyWithImpl(
      _$RequestAuthImpl _value, $Res Function(_$RequestAuthImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? json = null,
    Object? password = null,
  }) {
    return _then(_$RequestAuthImpl(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      json: null == json
          ? _value.json
          : json // ignore: cast_nullable_to_non_nullable
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
      {required this.identifier, required this.json, required this.password});

  factory _$RequestAuthImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestAuthImplFromJson(json);

  @override
  final String identifier;
  @override
  final String json;
  @override
  final String password;

  @override
  String toString() {
    return 'RequestAuth(identifier: $identifier, json: $json, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestAuthImpl &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.json, json) || other.json == json) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, identifier, json, password);

  @JsonKey(ignore: true)
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
      {required final String identifier,
      required final String json,
      required final String password}) = _$RequestAuthImpl;

  factory _RequestAuth.fromJson(Map<String, dynamic> json) =
      _$RequestAuthImpl.fromJson;

  @override
  String get identifier;
  @override
  String get json;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$RequestAuthImplCopyWith<_$RequestAuthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
