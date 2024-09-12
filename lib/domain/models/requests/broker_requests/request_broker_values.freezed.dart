// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_broker_values.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestBrokerValues _$RequestBrokerValuesFromJson(Map<String, dynamic> json) {
  return _RequestBrokerValues.fromJson(json);
}

/// @nodoc
mixin _$RequestBrokerValues {
  int? get brokerCategoryId => throw _privateConstructorUsedError;
  int? get limit => throw _privateConstructorUsedError;
  int? get municipalityId => throw _privateConstructorUsedError;
  int? get offset => throw _privateConstructorUsedError;
  String? get brokerName => throw _privateConstructorUsedError;

  /// Serializes this RequestBrokerValues to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestBrokerValues
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestBrokerValuesCopyWith<RequestBrokerValues> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestBrokerValuesCopyWith<$Res> {
  factory $RequestBrokerValuesCopyWith(
          RequestBrokerValues value, $Res Function(RequestBrokerValues) then) =
      _$RequestBrokerValuesCopyWithImpl<$Res, RequestBrokerValues>;
  @useResult
  $Res call(
      {int? brokerCategoryId,
      int? limit,
      int? municipalityId,
      int? offset,
      String? brokerName});
}

/// @nodoc
class _$RequestBrokerValuesCopyWithImpl<$Res, $Val extends RequestBrokerValues>
    implements $RequestBrokerValuesCopyWith<$Res> {
  _$RequestBrokerValuesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestBrokerValues
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brokerCategoryId = freezed,
    Object? limit = freezed,
    Object? municipalityId = freezed,
    Object? offset = freezed,
    Object? brokerName = freezed,
  }) {
    return _then(_value.copyWith(
      brokerCategoryId: freezed == brokerCategoryId
          ? _value.brokerCategoryId
          : brokerCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      municipalityId: freezed == municipalityId
          ? _value.municipalityId
          : municipalityId // ignore: cast_nullable_to_non_nullable
              as int?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      brokerName: freezed == brokerName
          ? _value.brokerName
          : brokerName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestBrokerValuesImplCopyWith<$Res>
    implements $RequestBrokerValuesCopyWith<$Res> {
  factory _$$RequestBrokerValuesImplCopyWith(_$RequestBrokerValuesImpl value,
          $Res Function(_$RequestBrokerValuesImpl) then) =
      __$$RequestBrokerValuesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? brokerCategoryId,
      int? limit,
      int? municipalityId,
      int? offset,
      String? brokerName});
}

/// @nodoc
class __$$RequestBrokerValuesImplCopyWithImpl<$Res>
    extends _$RequestBrokerValuesCopyWithImpl<$Res, _$RequestBrokerValuesImpl>
    implements _$$RequestBrokerValuesImplCopyWith<$Res> {
  __$$RequestBrokerValuesImplCopyWithImpl(_$RequestBrokerValuesImpl _value,
      $Res Function(_$RequestBrokerValuesImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestBrokerValues
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brokerCategoryId = freezed,
    Object? limit = freezed,
    Object? municipalityId = freezed,
    Object? offset = freezed,
    Object? brokerName = freezed,
  }) {
    return _then(_$RequestBrokerValuesImpl(
      brokerCategoryId: freezed == brokerCategoryId
          ? _value.brokerCategoryId
          : brokerCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      municipalityId: freezed == municipalityId
          ? _value.municipalityId
          : municipalityId // ignore: cast_nullable_to_non_nullable
              as int?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      brokerName: freezed == brokerName
          ? _value.brokerName
          : brokerName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$RequestBrokerValuesImpl implements _RequestBrokerValues {
  _$RequestBrokerValuesImpl(
      {this.brokerCategoryId,
      this.limit,
      this.municipalityId,
      this.offset,
      this.brokerName});

  factory _$RequestBrokerValuesImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestBrokerValuesImplFromJson(json);

  @override
  final int? brokerCategoryId;
  @override
  final int? limit;
  @override
  final int? municipalityId;
  @override
  final int? offset;
  @override
  final String? brokerName;

  @override
  String toString() {
    return 'RequestBrokerValues(brokerCategoryId: $brokerCategoryId, limit: $limit, municipalityId: $municipalityId, offset: $offset, brokerName: $brokerName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestBrokerValuesImpl &&
            (identical(other.brokerCategoryId, brokerCategoryId) ||
                other.brokerCategoryId == brokerCategoryId) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.municipalityId, municipalityId) ||
                other.municipalityId == municipalityId) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.brokerName, brokerName) ||
                other.brokerName == brokerName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, brokerCategoryId, limit, municipalityId, offset, brokerName);

  /// Create a copy of RequestBrokerValues
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestBrokerValuesImplCopyWith<_$RequestBrokerValuesImpl> get copyWith =>
      __$$RequestBrokerValuesImplCopyWithImpl<_$RequestBrokerValuesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestBrokerValuesImplToJson(
      this,
    );
  }
}

abstract class _RequestBrokerValues implements RequestBrokerValues {
  factory _RequestBrokerValues(
      {final int? brokerCategoryId,
      final int? limit,
      final int? municipalityId,
      final int? offset,
      final String? brokerName}) = _$RequestBrokerValuesImpl;

  factory _RequestBrokerValues.fromJson(Map<String, dynamic> json) =
      _$RequestBrokerValuesImpl.fromJson;

  @override
  int? get brokerCategoryId;
  @override
  int? get limit;
  @override
  int? get municipalityId;
  @override
  int? get offset;
  @override
  String? get brokerName;

  /// Create a copy of RequestBrokerValues
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestBrokerValuesImplCopyWith<_$RequestBrokerValuesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
