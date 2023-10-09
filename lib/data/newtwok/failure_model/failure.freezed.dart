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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FailureModel _$FailureModelFromJson(Map<String, dynamic> json) {
  return _FailureModel.fromJson(json);
}

/// @nodoc
mixin _$FailureModel {
  List<String> get errorDescription => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureModelImpl &&
            const DeepCollectionEquality()
                .equals(other._errorDescription, _errorDescription) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_errorDescription),
      message,
      statusCode);

  @JsonKey(ignore: true)
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
  @override
  @JsonKey(ignore: true)
  _$$FailureModelImplCopyWith<_$FailureModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
