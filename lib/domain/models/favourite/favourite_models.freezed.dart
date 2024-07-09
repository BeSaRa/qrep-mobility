// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favourite_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FavouriteResponse _$FavouriteResponseFromJson(Map<String, dynamic> json) {
  return _FavouriteResponse.fromJson(json);
}

/// @nodoc
mixin _$FavouriteResponse {
  String? get creationTime => throw _privateConstructorUsedError;
  String? get criteria => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get lastModifiedTime => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get pageDescription => throw _privateConstructorUsedError;
  Indicators get pageName => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavouriteResponseCopyWith<FavouriteResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouriteResponseCopyWith<$Res> {
  factory $FavouriteResponseCopyWith(
          FavouriteResponse value, $Res Function(FavouriteResponse) then) =
      _$FavouriteResponseCopyWithImpl<$Res, FavouriteResponse>;
  @useResult
  $Res call(
      {String? creationTime,
      String? criteria,
      int? id,
      String? lastModifiedTime,
      String? name,
      String? pageDescription,
      Indicators pageName,
      String? userId});
}

/// @nodoc
class _$FavouriteResponseCopyWithImpl<$Res, $Val extends FavouriteResponse>
    implements $FavouriteResponseCopyWith<$Res> {
  _$FavouriteResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creationTime = freezed,
    Object? criteria = freezed,
    Object? id = freezed,
    Object? lastModifiedTime = freezed,
    Object? name = freezed,
    Object? pageDescription = freezed,
    Object? pageName = null,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      creationTime: freezed == creationTime
          ? _value.creationTime
          : creationTime // ignore: cast_nullable_to_non_nullable
              as String?,
      criteria: freezed == criteria
          ? _value.criteria
          : criteria // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      lastModifiedTime: freezed == lastModifiedTime
          ? _value.lastModifiedTime
          : lastModifiedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      pageDescription: freezed == pageDescription
          ? _value.pageDescription
          : pageDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      pageName: null == pageName
          ? _value.pageName
          : pageName // ignore: cast_nullable_to_non_nullable
              as Indicators,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavouriteResponseImplCopyWith<$Res>
    implements $FavouriteResponseCopyWith<$Res> {
  factory _$$FavouriteResponseImplCopyWith(_$FavouriteResponseImpl value,
          $Res Function(_$FavouriteResponseImpl) then) =
      __$$FavouriteResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? creationTime,
      String? criteria,
      int? id,
      String? lastModifiedTime,
      String? name,
      String? pageDescription,
      Indicators pageName,
      String? userId});
}

/// @nodoc
class __$$FavouriteResponseImplCopyWithImpl<$Res>
    extends _$FavouriteResponseCopyWithImpl<$Res, _$FavouriteResponseImpl>
    implements _$$FavouriteResponseImplCopyWith<$Res> {
  __$$FavouriteResponseImplCopyWithImpl(_$FavouriteResponseImpl _value,
      $Res Function(_$FavouriteResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creationTime = freezed,
    Object? criteria = freezed,
    Object? id = freezed,
    Object? lastModifiedTime = freezed,
    Object? name = freezed,
    Object? pageDescription = freezed,
    Object? pageName = null,
    Object? userId = freezed,
  }) {
    return _then(_$FavouriteResponseImpl(
      creationTime: freezed == creationTime
          ? _value.creationTime
          : creationTime // ignore: cast_nullable_to_non_nullable
              as String?,
      criteria: freezed == criteria
          ? _value.criteria
          : criteria // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      lastModifiedTime: freezed == lastModifiedTime
          ? _value.lastModifiedTime
          : lastModifiedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      pageDescription: freezed == pageDescription
          ? _value.pageDescription
          : pageDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      pageName: null == pageName
          ? _value.pageName
          : pageName // ignore: cast_nullable_to_non_nullable
              as Indicators,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavouriteResponseImpl implements _FavouriteResponse {
  _$FavouriteResponseImpl(
      {this.creationTime = "",
      this.criteria = "",
      this.id = 0,
      this.lastModifiedTime = "",
      this.name = "",
      this.pageDescription = "",
      this.pageName = Indicators.sell,
      this.userId = ""});

  factory _$FavouriteResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavouriteResponseImplFromJson(json);

  @override
  @JsonKey()
  final String? creationTime;
  @override
  @JsonKey()
  final String? criteria;
  @override
  @JsonKey()
  final int? id;
  @override
  @JsonKey()
  final String? lastModifiedTime;
  @override
  @JsonKey()
  final String? name;
  @override
  @JsonKey()
  final String? pageDescription;
  @override
  @JsonKey()
  final Indicators pageName;
  @override
  @JsonKey()
  final String? userId;

  @override
  String toString() {
    return 'FavouriteResponse(creationTime: $creationTime, criteria: $criteria, id: $id, lastModifiedTime: $lastModifiedTime, name: $name, pageDescription: $pageDescription, pageName: $pageName, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavouriteResponseImpl &&
            (identical(other.creationTime, creationTime) ||
                other.creationTime == creationTime) &&
            (identical(other.criteria, criteria) ||
                other.criteria == criteria) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lastModifiedTime, lastModifiedTime) ||
                other.lastModifiedTime == lastModifiedTime) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.pageDescription, pageDescription) ||
                other.pageDescription == pageDescription) &&
            (identical(other.pageName, pageName) ||
                other.pageName == pageName) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, creationTime, criteria, id,
      lastModifiedTime, name, pageDescription, pageName, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavouriteResponseImplCopyWith<_$FavouriteResponseImpl> get copyWith =>
      __$$FavouriteResponseImplCopyWithImpl<_$FavouriteResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavouriteResponseImplToJson(
      this,
    );
  }
}

abstract class _FavouriteResponse implements FavouriteResponse {
  factory _FavouriteResponse(
      {final String? creationTime,
      final String? criteria,
      final int? id,
      final String? lastModifiedTime,
      final String? name,
      final String? pageDescription,
      final Indicators pageName,
      final String? userId}) = _$FavouriteResponseImpl;

  factory _FavouriteResponse.fromJson(Map<String, dynamic> json) =
      _$FavouriteResponseImpl.fromJson;

  @override
  String? get creationTime;
  @override
  String? get criteria;
  @override
  int? get id;
  @override
  String? get lastModifiedTime;
  @override
  String? get name;
  @override
  String? get pageDescription;
  @override
  Indicators get pageName;
  @override
  String? get userId;
  @override
  @JsonKey(ignore: true)
  _$$FavouriteResponseImplCopyWith<_$FavouriteResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
