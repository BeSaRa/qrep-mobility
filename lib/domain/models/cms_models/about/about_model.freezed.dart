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
  _$AboutModelsImpl(
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
  factory _AboutModels(
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
