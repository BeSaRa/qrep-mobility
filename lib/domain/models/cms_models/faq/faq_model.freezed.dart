// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FaqResponse _$FaqResponseFromJson(Map<String, dynamic> json) {
  return _FaqResponse.fromJson(json);
}

/// @nodoc
mixin _$FaqResponse {
  List<FaqItemModel> get data => throw _privateConstructorUsedError;

  /// Serializes this FaqResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FaqResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FaqResponseCopyWith<FaqResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqResponseCopyWith<$Res> {
  factory $FaqResponseCopyWith(
          FaqResponse value, $Res Function(FaqResponse) then) =
      _$FaqResponseCopyWithImpl<$Res, FaqResponse>;
  @useResult
  $Res call({List<FaqItemModel> data});
}

/// @nodoc
class _$FaqResponseCopyWithImpl<$Res, $Val extends FaqResponse>
    implements $FaqResponseCopyWith<$Res> {
  _$FaqResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FaqResponse
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
              as List<FaqItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FaqResponseImplCopyWith<$Res>
    implements $FaqResponseCopyWith<$Res> {
  factory _$$FaqResponseImplCopyWith(
          _$FaqResponseImpl value, $Res Function(_$FaqResponseImpl) then) =
      __$$FaqResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FaqItemModel> data});
}

/// @nodoc
class __$$FaqResponseImplCopyWithImpl<$Res>
    extends _$FaqResponseCopyWithImpl<$Res, _$FaqResponseImpl>
    implements _$$FaqResponseImplCopyWith<$Res> {
  __$$FaqResponseImplCopyWithImpl(
      _$FaqResponseImpl _value, $Res Function(_$FaqResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of FaqResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$FaqResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FaqItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FaqResponseImpl implements _FaqResponse {
  const _$FaqResponseImpl({final List<FaqItemModel> data = const []})
      : _data = data;

  factory _$FaqResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FaqResponseImplFromJson(json);

  final List<FaqItemModel> _data;
  @override
  @JsonKey()
  List<FaqItemModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'FaqResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaqResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of FaqResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FaqResponseImplCopyWith<_$FaqResponseImpl> get copyWith =>
      __$$FaqResponseImplCopyWithImpl<_$FaqResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FaqResponseImplToJson(
      this,
    );
  }
}

abstract class _FaqResponse implements FaqResponse {
  const factory _FaqResponse({final List<FaqItemModel> data}) =
      _$FaqResponseImpl;

  factory _FaqResponse.fromJson(Map<String, dynamic> json) =
      _$FaqResponseImpl.fromJson;

  @override
  List<FaqItemModel> get data;

  /// Create a copy of FaqResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FaqResponseImplCopyWith<_$FaqResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FaqItemModel _$FaqItemModelFromJson(Map<String, dynamic> json) {
  return _FaqItemModel.fromJson(json);
}

/// @nodoc
mixin _$FaqItemModel {
  String get answer => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;

  /// Serializes this FaqItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FaqItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FaqItemModelCopyWith<FaqItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqItemModelCopyWith<$Res> {
  factory $FaqItemModelCopyWith(
          FaqItemModel value, $Res Function(FaqItemModel) then) =
      _$FaqItemModelCopyWithImpl<$Res, FaqItemModel>;
  @useResult
  $Res call({String answer, int id, String question});
}

/// @nodoc
class _$FaqItemModelCopyWithImpl<$Res, $Val extends FaqItemModel>
    implements $FaqItemModelCopyWith<$Res> {
  _$FaqItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FaqItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answer = null,
    Object? id = null,
    Object? question = null,
  }) {
    return _then(_value.copyWith(
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FaqItemModelImplCopyWith<$Res>
    implements $FaqItemModelCopyWith<$Res> {
  factory _$$FaqItemModelImplCopyWith(
          _$FaqItemModelImpl value, $Res Function(_$FaqItemModelImpl) then) =
      __$$FaqItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String answer, int id, String question});
}

/// @nodoc
class __$$FaqItemModelImplCopyWithImpl<$Res>
    extends _$FaqItemModelCopyWithImpl<$Res, _$FaqItemModelImpl>
    implements _$$FaqItemModelImplCopyWith<$Res> {
  __$$FaqItemModelImplCopyWithImpl(
      _$FaqItemModelImpl _value, $Res Function(_$FaqItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FaqItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answer = null,
    Object? id = null,
    Object? question = null,
  }) {
    return _then(_$FaqItemModelImpl(
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FaqItemModelImpl implements _FaqItemModel {
  const _$FaqItemModelImpl({this.answer = '', this.id = 0, this.question = ''});

  factory _$FaqItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FaqItemModelImplFromJson(json);

  @override
  @JsonKey()
  final String answer;
  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String question;

  @override
  String toString() {
    return 'FaqItemModel(answer: $answer, id: $id, question: $question)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaqItemModelImpl &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, answer, id, question);

  /// Create a copy of FaqItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FaqItemModelImplCopyWith<_$FaqItemModelImpl> get copyWith =>
      __$$FaqItemModelImplCopyWithImpl<_$FaqItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FaqItemModelImplToJson(
      this,
    );
  }
}

abstract class _FaqItemModel implements FaqItemModel {
  const factory _FaqItemModel(
      {final String answer,
      final int id,
      final String question}) = _$FaqItemModelImpl;

  factory _FaqItemModel.fromJson(Map<String, dynamic> json) =
      _$FaqItemModelImpl.fromJson;

  @override
  String get answer;
  @override
  int get id;
  @override
  String get question;

  /// Create a copy of FaqItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FaqItemModelImplCopyWith<_$FaqItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
