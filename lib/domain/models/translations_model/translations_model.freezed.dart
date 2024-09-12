// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'translations_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TranslationsModel _$TranslationsModelFromJson(Map<String, dynamic> json) {
  return _TranslationsModel.fromJson(json);
}

/// @nodoc
mixin _$TranslationsModel {
  List<TranslationDataItem> get data => throw _privateConstructorUsedError;

  /// Serializes this TranslationsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TranslationsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TranslationsModelCopyWith<TranslationsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranslationsModelCopyWith<$Res> {
  factory $TranslationsModelCopyWith(
          TranslationsModel value, $Res Function(TranslationsModel) then) =
      _$TranslationsModelCopyWithImpl<$Res, TranslationsModel>;
  @useResult
  $Res call({List<TranslationDataItem> data});
}

/// @nodoc
class _$TranslationsModelCopyWithImpl<$Res, $Val extends TranslationsModel>
    implements $TranslationsModelCopyWith<$Res> {
  _$TranslationsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TranslationsModel
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
              as List<TranslationDataItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TranslationsModelImplCopyWith<$Res>
    implements $TranslationsModelCopyWith<$Res> {
  factory _$$TranslationsModelImplCopyWith(_$TranslationsModelImpl value,
          $Res Function(_$TranslationsModelImpl) then) =
      __$$TranslationsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TranslationDataItem> data});
}

/// @nodoc
class __$$TranslationsModelImplCopyWithImpl<$Res>
    extends _$TranslationsModelCopyWithImpl<$Res, _$TranslationsModelImpl>
    implements _$$TranslationsModelImplCopyWith<$Res> {
  __$$TranslationsModelImplCopyWithImpl(_$TranslationsModelImpl _value,
      $Res Function(_$TranslationsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranslationsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$TranslationsModelImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TranslationDataItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TranslationsModelImpl implements _TranslationsModel {
  _$TranslationsModelImpl({final List<TranslationDataItem> data = const []})
      : _data = data;

  factory _$TranslationsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TranslationsModelImplFromJson(json);

  final List<TranslationDataItem> _data;
  @override
  @JsonKey()
  List<TranslationDataItem> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'TranslationsModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranslationsModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of TranslationsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranslationsModelImplCopyWith<_$TranslationsModelImpl> get copyWith =>
      __$$TranslationsModelImplCopyWithImpl<_$TranslationsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TranslationsModelImplToJson(
      this,
    );
  }
}

abstract class _TranslationsModel implements TranslationsModel {
  factory _TranslationsModel({final List<TranslationDataItem> data}) =
      _$TranslationsModelImpl;

  factory _TranslationsModel.fromJson(Map<String, dynamic> json) =
      _$TranslationsModelImpl.fromJson;

  @override
  List<TranslationDataItem> get data;

  /// Create a copy of TranslationsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranslationsModelImplCopyWith<_$TranslationsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TranslationDataItem _$TranslationDataItemFromJson(Map<String, dynamic> json) {
  return _TranslationDataItem.fromJson(json);
}

/// @nodoc
mixin _$TranslationDataItem {
  String? get id => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  String? get key => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;

  /// Serializes this TranslationDataItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TranslationDataItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TranslationDataItemCopyWith<TranslationDataItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranslationDataItemCopyWith<$Res> {
  factory $TranslationDataItemCopyWith(
          TranslationDataItem value, $Res Function(TranslationDataItem) then) =
      _$TranslationDataItemCopyWithImpl<$Res, TranslationDataItem>;
  @useResult
  $Res call({String? id, String? language, String? key, String? value});
}

/// @nodoc
class _$TranslationDataItemCopyWithImpl<$Res, $Val extends TranslationDataItem>
    implements $TranslationDataItemCopyWith<$Res> {
  _$TranslationDataItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TranslationDataItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? language = freezed,
    Object? key = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TranslationDataItemImplCopyWith<$Res>
    implements $TranslationDataItemCopyWith<$Res> {
  factory _$$TranslationDataItemImplCopyWith(_$TranslationDataItemImpl value,
          $Res Function(_$TranslationDataItemImpl) then) =
      __$$TranslationDataItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? language, String? key, String? value});
}

/// @nodoc
class __$$TranslationDataItemImplCopyWithImpl<$Res>
    extends _$TranslationDataItemCopyWithImpl<$Res, _$TranslationDataItemImpl>
    implements _$$TranslationDataItemImplCopyWith<$Res> {
  __$$TranslationDataItemImplCopyWithImpl(_$TranslationDataItemImpl _value,
      $Res Function(_$TranslationDataItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranslationDataItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? language = freezed,
    Object? key = freezed,
    Object? value = freezed,
  }) {
    return _then(_$TranslationDataItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TranslationDataItemImpl implements _TranslationDataItem {
  _$TranslationDataItemImpl(
      {this.id = '', this.language = '', this.key = '', this.value = ''});

  factory _$TranslationDataItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$TranslationDataItemImplFromJson(json);

  @override
  @JsonKey()
  final String? id;
  @override
  @JsonKey()
  final String? language;
  @override
  @JsonKey()
  final String? key;
  @override
  @JsonKey()
  final String? value;

  @override
  String toString() {
    return 'TranslationDataItem(id: $id, language: $language, key: $key, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranslationDataItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, language, key, value);

  /// Create a copy of TranslationDataItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranslationDataItemImplCopyWith<_$TranslationDataItemImpl> get copyWith =>
      __$$TranslationDataItemImplCopyWithImpl<_$TranslationDataItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TranslationDataItemImplToJson(
      this,
    );
  }
}

abstract class _TranslationDataItem implements TranslationDataItem {
  factory _TranslationDataItem(
      {final String? id,
      final String? language,
      final String? key,
      final String? value}) = _$TranslationDataItemImpl;

  factory _TranslationDataItem.fromJson(Map<String, dynamic> json) =
      _$TranslationDataItemImpl.fromJson;

  @override
  String? get id;
  @override
  String? get language;
  @override
  String? get key;
  @override
  String? get value;

  /// Create a copy of TranslationDataItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranslationDataItemImplCopyWith<_$TranslationDataItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
