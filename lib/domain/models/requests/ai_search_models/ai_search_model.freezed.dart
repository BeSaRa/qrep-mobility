// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_search_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AiSearchRequestModel _$AiSearchRequestModelFromJson(Map<String, dynamic> json) {
  return _AiSearchRequestModel.fromJson(json);
}

/// @nodoc
mixin _$AiSearchRequestModel {
  String get facet => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;
  String get sort => throw _privateConstructorUsedError;
  @JsonKey(name: "page_size")
  int get pageSize => throw _privateConstructorUsedError;
  @JsonKey(name: "page_number")
  int get pageNumber => throw _privateConstructorUsedError;

  /// Serializes this AiSearchRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiSearchRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiSearchRequestModelCopyWith<AiSearchRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiSearchRequestModelCopyWith<$Res> {
  factory $AiSearchRequestModelCopyWith(AiSearchRequestModel value,
          $Res Function(AiSearchRequestModel) then) =
      _$AiSearchRequestModelCopyWithImpl<$Res, AiSearchRequestModel>;
  @useResult
  $Res call(
      {String facet,
      String query,
      String sort,
      @JsonKey(name: "page_size") int pageSize,
      @JsonKey(name: "page_number") int pageNumber});
}

/// @nodoc
class _$AiSearchRequestModelCopyWithImpl<$Res,
        $Val extends AiSearchRequestModel>
    implements $AiSearchRequestModelCopyWith<$Res> {
  _$AiSearchRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiSearchRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facet = null,
    Object? query = null,
    Object? sort = null,
    Object? pageSize = null,
    Object? pageNumber = null,
  }) {
    return _then(_value.copyWith(
      facet: null == facet
          ? _value.facet
          : facet // ignore: cast_nullable_to_non_nullable
              as String,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      sort: null == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AiSearchRequestModelImplCopyWith<$Res>
    implements $AiSearchRequestModelCopyWith<$Res> {
  factory _$$AiSearchRequestModelImplCopyWith(_$AiSearchRequestModelImpl value,
          $Res Function(_$AiSearchRequestModelImpl) then) =
      __$$AiSearchRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String facet,
      String query,
      String sort,
      @JsonKey(name: "page_size") int pageSize,
      @JsonKey(name: "page_number") int pageNumber});
}

/// @nodoc
class __$$AiSearchRequestModelImplCopyWithImpl<$Res>
    extends _$AiSearchRequestModelCopyWithImpl<$Res, _$AiSearchRequestModelImpl>
    implements _$$AiSearchRequestModelImplCopyWith<$Res> {
  __$$AiSearchRequestModelImplCopyWithImpl(_$AiSearchRequestModelImpl _value,
      $Res Function(_$AiSearchRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AiSearchRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facet = null,
    Object? query = null,
    Object? sort = null,
    Object? pageSize = null,
    Object? pageNumber = null,
  }) {
    return _then(_$AiSearchRequestModelImpl(
      facet: null == facet
          ? _value.facet
          : facet // ignore: cast_nullable_to_non_nullable
              as String,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      sort: null == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AiSearchRequestModelImpl implements _AiSearchRequestModel {
  _$AiSearchRequestModelImpl(
      {this.facet = "",
      this.query = "",
      this.sort = "",
      @JsonKey(name: "page_size") this.pageSize = 0,
      @JsonKey(name: "page_number") this.pageNumber = 0});

  factory _$AiSearchRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiSearchRequestModelImplFromJson(json);

  @override
  @JsonKey()
  final String facet;
  @override
  @JsonKey()
  final String query;
  @override
  @JsonKey()
  final String sort;
  @override
  @JsonKey(name: "page_size")
  final int pageSize;
  @override
  @JsonKey(name: "page_number")
  final int pageNumber;

  @override
  String toString() {
    return 'AiSearchRequestModel(facet: $facet, query: $query, sort: $sort, pageSize: $pageSize, pageNumber: $pageNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiSearchRequestModelImpl &&
            (identical(other.facet, facet) || other.facet == facet) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, facet, query, sort, pageSize, pageNumber);

  /// Create a copy of AiSearchRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiSearchRequestModelImplCopyWith<_$AiSearchRequestModelImpl>
      get copyWith =>
          __$$AiSearchRequestModelImplCopyWithImpl<_$AiSearchRequestModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AiSearchRequestModelImplToJson(
      this,
    );
  }
}

abstract class _AiSearchRequestModel implements AiSearchRequestModel {
  factory _AiSearchRequestModel(
          {final String facet,
          final String query,
          final String sort,
          @JsonKey(name: "page_size") final int pageSize,
          @JsonKey(name: "page_number") final int pageNumber}) =
      _$AiSearchRequestModelImpl;

  factory _AiSearchRequestModel.fromJson(Map<String, dynamic> json) =
      _$AiSearchRequestModelImpl.fromJson;

  @override
  String get facet;
  @override
  String get query;
  @override
  String get sort;
  @override
  @JsonKey(name: "page_size")
  int get pageSize;
  @override
  @JsonKey(name: "page_number")
  int get pageNumber;

  /// Create a copy of AiSearchRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiSearchRequestModelImplCopyWith<_$AiSearchRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
