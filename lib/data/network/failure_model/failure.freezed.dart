// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FailureModel _$FailureModelFromJson(Map<String, dynamic> json) {
  return _FailureModel.fromJson(json);
}

/// @nodoc
mixin _$FailureModel {
  List<String> get errorDescription => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;

  /// Serializes this FailureModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FailureModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FailureModelCopyWith<FailureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureModelCopyWith<$Res> {
  factory $FailureModelCopyWith(
          FailureModel value, $Res Function(FailureModel) then) =
      _$FailureModelCopyWithImpl<$Res, FailureModel>;
  @useResult
  $Res call({List<String> errorDescription, String message, int statusCode});
}

/// @nodoc
class _$FailureModelCopyWithImpl<$Res, $Val extends FailureModel>
    implements $FailureModelCopyWith<$Res> {
  _$FailureModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FailureModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorDescription = null,
    Object? message = null,
    Object? statusCode = null,
  }) {
    return _then(_value.copyWith(
      errorDescription: null == errorDescription
          ? _value.errorDescription
          : errorDescription // ignore: cast_nullable_to_non_nullable
              as List<String>,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FailureModelImplCopyWith<$Res>
    implements $FailureModelCopyWith<$Res> {
  factory _$$FailureModelImplCopyWith(
          _$FailureModelImpl value, $Res Function(_$FailureModelImpl) then) =
      __$$FailureModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> errorDescription, String message, int statusCode});
}

/// @nodoc
class __$$FailureModelImplCopyWithImpl<$Res>
    extends _$FailureModelCopyWithImpl<$Res, _$FailureModelImpl>
    implements _$$FailureModelImplCopyWith<$Res> {
  __$$FailureModelImplCopyWithImpl(
      _$FailureModelImpl _value, $Res Function(_$FailureModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FailureModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorDescription = null,
    Object? message = null,
    Object? statusCode = null,
  }) {
    return _then(_$FailureModelImpl(
      errorDescription: null == errorDescription
          ? _value._errorDescription
          : errorDescription // ignore: cast_nullable_to_non_nullable
              as List<String>,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FailureModelImpl implements _FailureModel {
  const _$FailureModelImpl(
      {final List<String> errorDescription = const [],
      this.message = '',
      this.statusCode = 0})
      : _errorDescription = errorDescription;

  factory _$FailureModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FailureModelImplFromJson(json);

  final List<String> _errorDescription;
  @override
  @JsonKey()
  List<String> get errorDescription {
    if (_errorDescription is EqualUnmodifiableListView)
      return _errorDescription;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errorDescription);
  }

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final int statusCode;

  @override
  String toString() {
    return 'FailureModel(errorDescription: $errorDescription, message: $message, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureModelImpl &&
            const DeepCollectionEquality()
                .equals(other._errorDescription, _errorDescription) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_errorDescription),
      message,
      statusCode);

  /// Create a copy of FailureModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureModelImplCopyWith<_$FailureModelImpl> get copyWith =>
      __$$FailureModelImplCopyWithImpl<_$FailureModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FailureModelImplToJson(
      this,
    );
  }
}

abstract class _FailureModel implements FailureModel {
  const factory _FailureModel(
      {final List<String> errorDescription,
      final String message,
      final int statusCode}) = _$FailureModelImpl;

  factory _FailureModel.fromJson(Map<String, dynamic> json) =
      _$FailureModelImpl.fromJson;

  @override
  List<String> get errorDescription;
  @override
  String get message;
  @override
  int get statusCode;

  /// Create a copy of FailureModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureModelImplCopyWith<_$FailureModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FailureResponse _$FailureResponseFromJson(Map<String, dynamic> json) {
  return _FailureResponse.fromJson(json);
}

/// @nodoc
mixin _$FailureResponse {
  List<ErrorModel> get errors => throw _privateConstructorUsedError;

  /// Serializes this FailureResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FailureResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FailureResponseCopyWith<FailureResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureResponseCopyWith<$Res> {
  factory $FailureResponseCopyWith(
          FailureResponse value, $Res Function(FailureResponse) then) =
      _$FailureResponseCopyWithImpl<$Res, FailureResponse>;
  @useResult
  $Res call({List<ErrorModel> errors});
}

/// @nodoc
class _$FailureResponseCopyWithImpl<$Res, $Val extends FailureResponse>
    implements $FailureResponseCopyWith<$Res> {
  _$FailureResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FailureResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errors = null,
  }) {
    return _then(_value.copyWith(
      errors: null == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ErrorModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FailureResponseImplCopyWith<$Res>
    implements $FailureResponseCopyWith<$Res> {
  factory _$$FailureResponseImplCopyWith(_$FailureResponseImpl value,
          $Res Function(_$FailureResponseImpl) then) =
      __$$FailureResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ErrorModel> errors});
}

/// @nodoc
class __$$FailureResponseImplCopyWithImpl<$Res>
    extends _$FailureResponseCopyWithImpl<$Res, _$FailureResponseImpl>
    implements _$$FailureResponseImplCopyWith<$Res> {
  __$$FailureResponseImplCopyWithImpl(
      _$FailureResponseImpl _value, $Res Function(_$FailureResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of FailureResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errors = null,
  }) {
    return _then(_$FailureResponseImpl(
      errors: null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ErrorModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FailureResponseImpl implements _FailureResponse {
  const _$FailureResponseImpl({final List<ErrorModel> errors = const []})
      : _errors = errors;

  factory _$FailureResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FailureResponseImplFromJson(json);

  final List<ErrorModel> _errors;
  @override
  @JsonKey()
  List<ErrorModel> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  @override
  String toString() {
    return 'FailureResponse(errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureResponseImpl &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_errors));

  /// Create a copy of FailureResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureResponseImplCopyWith<_$FailureResponseImpl> get copyWith =>
      __$$FailureResponseImplCopyWithImpl<_$FailureResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FailureResponseImplToJson(
      this,
    );
  }
}

abstract class _FailureResponse implements FailureResponse {
  const factory _FailureResponse({final List<ErrorModel> errors}) =
      _$FailureResponseImpl;

  factory _FailureResponse.fromJson(Map<String, dynamic> json) =
      _$FailureResponseImpl.fromJson;

  @override
  List<ErrorModel> get errors;

  /// Create a copy of FailureResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureResponseImplCopyWith<_$FailureResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) {
  return _ErrorModel.fromJson(json);
}

/// @nodoc
mixin _$ErrorModel {
  String get message => throw _privateConstructorUsedError;

  /// Serializes this ErrorModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ErrorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ErrorModelCopyWith<ErrorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorModelCopyWith<$Res> {
  factory $ErrorModelCopyWith(
          ErrorModel value, $Res Function(ErrorModel) then) =
      _$ErrorModelCopyWithImpl<$Res, ErrorModel>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ErrorModelCopyWithImpl<$Res, $Val extends ErrorModel>
    implements $ErrorModelCopyWith<$Res> {
  _$ErrorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ErrorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ErrorModelImplCopyWith<$Res>
    implements $ErrorModelCopyWith<$Res> {
  factory _$$ErrorModelImplCopyWith(
          _$ErrorModelImpl value, $Res Function(_$ErrorModelImpl) then) =
      __$$ErrorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorModelImplCopyWithImpl<$Res>
    extends _$ErrorModelCopyWithImpl<$Res, _$ErrorModelImpl>
    implements _$$ErrorModelImplCopyWith<$Res> {
  __$$ErrorModelImplCopyWithImpl(
      _$ErrorModelImpl _value, $Res Function(_$ErrorModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ErrorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorModelImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ErrorModelImpl implements _ErrorModel {
  _$ErrorModelImpl({this.message = ""});

  factory _$ErrorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ErrorModelImplFromJson(json);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'ErrorModel(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorModelImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ErrorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorModelImplCopyWith<_$ErrorModelImpl> get copyWith =>
      __$$ErrorModelImplCopyWithImpl<_$ErrorModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorModelImplToJson(
      this,
    );
  }
}

abstract class _ErrorModel implements ErrorModel {
  factory _ErrorModel({final String message}) = _$ErrorModelImpl;

  factory _ErrorModel.fromJson(Map<String, dynamic> json) =
      _$ErrorModelImpl.fromJson;

  @override
  String get message;

  /// Create a copy of ErrorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorModelImplCopyWith<_$ErrorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
