// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'about_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AboutResponse _$AboutResponseFromJson(Map<String, dynamic> json) {
  return _AboutResponse.fromJson(json);
}

/// @nodoc
mixin _$AboutResponse {
  AboutModels get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AboutResponseCopyWith<AboutResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboutResponseCopyWith<$Res> {
  factory $AboutResponseCopyWith(
          AboutResponse value, $Res Function(AboutResponse) then) =
      _$AboutResponseCopyWithImpl<$Res, AboutResponse>;
  @useResult
  $Res call({AboutModels data});

  $AboutModelsCopyWith<$Res> get data;
}

/// @nodoc
class _$AboutResponseCopyWithImpl<$Res, $Val extends AboutResponse>
    implements $AboutResponseCopyWith<$Res> {
  _$AboutResponseCopyWithImpl(this._value, this._then);

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
              as AboutModels,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AboutModelsCopyWith<$Res> get data {
    return $AboutModelsCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AboutResponseImplCopyWith<$Res>
    implements $AboutResponseCopyWith<$Res> {
  factory _$$AboutResponseImplCopyWith(
          _$AboutResponseImpl value, $Res Function(_$AboutResponseImpl) then) =
      __$$AboutResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AboutModels data});

  @override
  $AboutModelsCopyWith<$Res> get data;
}

/// @nodoc
class __$$AboutResponseImplCopyWithImpl<$Res>
    extends _$AboutResponseCopyWithImpl<$Res, _$AboutResponseImpl>
    implements _$$AboutResponseImplCopyWith<$Res> {
  __$$AboutResponseImplCopyWithImpl(
      _$AboutResponseImpl _value, $Res Function(_$AboutResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$AboutResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AboutModels,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AboutResponseImpl implements _AboutResponse {
  _$AboutResponseImpl({this.data = const AboutModels()});

  factory _$AboutResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AboutResponseImplFromJson(json);

  @override
  @JsonKey()
  final AboutModels data;

  @override
  String toString() {
    return 'AboutResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AboutResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AboutResponseImplCopyWith<_$AboutResponseImpl> get copyWith =>
      __$$AboutResponseImplCopyWithImpl<_$AboutResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AboutResponseImplToJson(
      this,
    );
  }
}

abstract class _AboutResponse implements AboutResponse {
  factory _AboutResponse({final AboutModels data}) = _$AboutResponseImpl;

  factory _AboutResponse.fromJson(Map<String, dynamic> json) =
      _$AboutResponseImpl.fromJson;

  @override
  AboutModels get data;
  @override
  @JsonKey(ignore: true)
  _$$AboutResponseImplCopyWith<_$AboutResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AboutModels _$AboutModelsFromJson(Map<String, dynamic> json) {
  return _AboutModels.fromJson(json);
}

/// @nodoc
mixin _$AboutModels {
  int get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AboutModelsCopyWith<AboutModels> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboutModelsCopyWith<$Res> {
  factory $AboutModelsCopyWith(
          AboutModels value, $Res Function(AboutModels) then) =
      _$AboutModelsCopyWithImpl<$Res, AboutModels>;
  @useResult
  $Res call({int id, String status, String title, String content});
}

/// @nodoc
class _$AboutModelsCopyWithImpl<$Res, $Val extends AboutModels>
    implements $AboutModelsCopyWith<$Res> {
  _$AboutModelsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AboutModelsImplCopyWith<$Res>
    implements $AboutModelsCopyWith<$Res> {
  factory _$$AboutModelsImplCopyWith(
          _$AboutModelsImpl value, $Res Function(_$AboutModelsImpl) then) =
      __$$AboutModelsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String status, String title, String content});
}

/// @nodoc
class __$$AboutModelsImplCopyWithImpl<$Res>
    extends _$AboutModelsCopyWithImpl<$Res, _$AboutModelsImpl>
    implements _$$AboutModelsImplCopyWith<$Res> {
  __$$AboutModelsImplCopyWithImpl(
      _$AboutModelsImpl _value, $Res Function(_$AboutModelsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_$AboutModelsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AboutModelsImpl implements _AboutModels {
  const _$AboutModelsImpl(
      {this.id = 0, this.status = '', this.title = '', this.content = ''});

  factory _$AboutModelsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AboutModelsImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String content;

  @override
  String toString() {
    return 'AboutModels(id: $id, status: $status, title: $title, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AboutModelsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, title, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AboutModelsImplCopyWith<_$AboutModelsImpl> get copyWith =>
      __$$AboutModelsImplCopyWithImpl<_$AboutModelsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AboutModelsImplToJson(
      this,
    );
  }
}

abstract class _AboutModels implements AboutModels {
  const factory _AboutModels(
      {final int id,
      final String status,
      final String title,
      final String content}) = _$AboutModelsImpl;

  factory _AboutModels.fromJson(Map<String, dynamic> json) =
      _$AboutModelsImpl.fromJson;

  @override
  int get id;
  @override
  String get status;
  @override
  String get title;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$AboutModelsImplCopyWith<_$AboutModelsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
