// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppSettingsResponse _$AppSettingsResponseFromJson(Map<String, dynamic> json) {
  return _AppSettingsResponse.fromJson(json);
}

/// @nodoc
mixin _$AppSettingsResponse {
  ProjectResponse get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppSettingsResponseCopyWith<AppSettingsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsResponseCopyWith<$Res> {
  factory $AppSettingsResponseCopyWith(
          AppSettingsResponse value, $Res Function(AppSettingsResponse) then) =
      _$AppSettingsResponseCopyWithImpl<$Res, AppSettingsResponse>;
  @useResult
  $Res call({ProjectResponse data});

  $ProjectResponseCopyWith<$Res> get data;
}

/// @nodoc
class _$AppSettingsResponseCopyWithImpl<$Res, $Val extends AppSettingsResponse>
    implements $AppSettingsResponseCopyWith<$Res> {
  _$AppSettingsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ProjectResponse,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectResponseCopyWith<$Res> get data {
    return $ProjectResponseCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppSettingsResponseImplCopyWith<$Res>
    implements $AppSettingsResponseCopyWith<$Res> {
  factory _$$AppSettingsResponseImplCopyWith(_$AppSettingsResponseImpl value,
          $Res Function(_$AppSettingsResponseImpl) then) =
      __$$AppSettingsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProjectResponse data});

  @override
  $ProjectResponseCopyWith<$Res> get data;
}

/// @nodoc
class __$$AppSettingsResponseImplCopyWithImpl<$Res>
    extends _$AppSettingsResponseCopyWithImpl<$Res, _$AppSettingsResponseImpl>
    implements _$$AppSettingsResponseImplCopyWith<$Res> {
  __$$AppSettingsResponseImplCopyWithImpl(_$AppSettingsResponseImpl _value,
      $Res Function(_$AppSettingsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$AppSettingsResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ProjectResponse,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppSettingsResponseImpl implements _AppSettingsResponse {
  _$AppSettingsResponseImpl({this.data = const ProjectResponse()});

  factory _$AppSettingsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppSettingsResponseImplFromJson(json);

  @override
  @JsonKey()
  final ProjectResponse data;

  @override
  String toString() {
    return 'AppSettingsResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSettingsResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSettingsResponseImplCopyWith<_$AppSettingsResponseImpl> get copyWith =>
      __$$AppSettingsResponseImplCopyWithImpl<_$AppSettingsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppSettingsResponseImplToJson(
      this,
    );
  }
}

abstract class _AppSettingsResponse implements AppSettingsResponse {
  factory _AppSettingsResponse({final ProjectResponse data}) =
      _$AppSettingsResponseImpl;

  factory _AppSettingsResponse.fromJson(Map<String, dynamic> json) =
      _$AppSettingsResponseImpl.fromJson;

  @override
  ProjectResponse get data;
  @override
  @JsonKey(ignore: true)
  _$$AppSettingsResponseImplCopyWith<_$AppSettingsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectResponse _$ProjectResponseFromJson(Map<String, dynamic> json) {
  return _ProjectResponse.fromJson(json);
}

/// @nodoc
mixin _$ProjectResponse {
  String get ios_version => throw _privateConstructorUsedError;
  double get android_version => throw _privateConstructorUsedError;
  bool get force_update => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectResponseCopyWith<ProjectResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectResponseCopyWith<$Res> {
  factory $ProjectResponseCopyWith(
          ProjectResponse value, $Res Function(ProjectResponse) then) =
      _$ProjectResponseCopyWithImpl<$Res, ProjectResponse>;
  @useResult
  $Res call({String ios_version, double android_version, bool force_update});
}

/// @nodoc
class _$ProjectResponseCopyWithImpl<$Res, $Val extends ProjectResponse>
    implements $ProjectResponseCopyWith<$Res> {
  _$ProjectResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ios_version = null,
    Object? android_version = null,
    Object? force_update = null,
  }) {
    return _then(_value.copyWith(
      ios_version: null == ios_version
          ? _value.ios_version
          : ios_version // ignore: cast_nullable_to_non_nullable
              as String,
      android_version: null == android_version
          ? _value.android_version
          : android_version // ignore: cast_nullable_to_non_nullable
              as double,
      force_update: null == force_update
          ? _value.force_update
          : force_update // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectResponseImplCopyWith<$Res>
    implements $ProjectResponseCopyWith<$Res> {
  factory _$$ProjectResponseImplCopyWith(_$ProjectResponseImpl value,
          $Res Function(_$ProjectResponseImpl) then) =
      __$$ProjectResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String ios_version, double android_version, bool force_update});
}

/// @nodoc
class __$$ProjectResponseImplCopyWithImpl<$Res>
    extends _$ProjectResponseCopyWithImpl<$Res, _$ProjectResponseImpl>
    implements _$$ProjectResponseImplCopyWith<$Res> {
  __$$ProjectResponseImplCopyWithImpl(
      _$ProjectResponseImpl _value, $Res Function(_$ProjectResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ios_version = null,
    Object? android_version = null,
    Object? force_update = null,
  }) {
    return _then(_$ProjectResponseImpl(
      ios_version: null == ios_version
          ? _value.ios_version
          : ios_version // ignore: cast_nullable_to_non_nullable
              as String,
      android_version: null == android_version
          ? _value.android_version
          : android_version // ignore: cast_nullable_to_non_nullable
              as double,
      force_update: null == force_update
          ? _value.force_update
          : force_update // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectResponseImpl implements _ProjectResponse {
  const _$ProjectResponseImpl(
      {this.ios_version = '',
      this.android_version = 0,
      this.force_update = false});

  factory _$ProjectResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectResponseImplFromJson(json);

  @override
  @JsonKey()
  final String ios_version;
  @override
  @JsonKey()
  final double android_version;
  @override
  @JsonKey()
  final bool force_update;

  @override
  String toString() {
    return 'ProjectResponse(ios_version: $ios_version, android_version: $android_version, force_update: $force_update)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectResponseImpl &&
            (identical(other.ios_version, ios_version) ||
                other.ios_version == ios_version) &&
            (identical(other.android_version, android_version) ||
                other.android_version == android_version) &&
            (identical(other.force_update, force_update) ||
                other.force_update == force_update));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, ios_version, android_version, force_update);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectResponseImplCopyWith<_$ProjectResponseImpl> get copyWith =>
      __$$ProjectResponseImplCopyWithImpl<_$ProjectResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectResponseImplToJson(
      this,
    );
  }
}

abstract class _ProjectResponse implements ProjectResponse {
  const factory _ProjectResponse(
      {final String ios_version,
      final double android_version,
      final bool force_update}) = _$ProjectResponseImpl;

  factory _ProjectResponse.fromJson(Map<String, dynamic> json) =
      _$ProjectResponseImpl.fromJson;

  @override
  String get ios_version;
  @override
  double get android_version;
  @override
  bool get force_update;
  @override
  @JsonKey(ignore: true)
  _$$ProjectResponseImplCopyWith<_$ProjectResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
