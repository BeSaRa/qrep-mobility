// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_courses_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetAllCoursesRequestModel _$GetAllCoursesRequestModelFromJson(
    Map<String, dynamic> json) {
  return _GetAllCoursesRequestModel.fromJson(json);
}

/// @nodoc
mixin _$GetAllCoursesRequestModel {
  @JsonKey(name: "PageIndex")
  int get pageIndex => throw _privateConstructorUsedError;
  @JsonKey(name: "PageSize")
  int get pageSize =>
      throw _privateConstructorUsedError; // @Default([]) List<SortModel> sortList,
  @JsonKey(name: "Name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "Track")
  int? get track => throw _privateConstructorUsedError;
  @JsonKey(name: "IsFree")
  bool? get isFree =>
      throw _privateConstructorUsedError; // @Default('') String link,
// @Default('') String summary,
// @Default('') String description,
  @JsonKey(name: "Categories")
  @JsonKey(name: "Categories")
  List<int>? get categories =>
      throw _privateConstructorUsedError; // @Default(0) int trainingCourseFee,
// @Default('') String trainingCourseRequirements,
// @Default(0) int language,
// String? startDate,
// String? endDate,
// @Default(0) int numberOfHours,
  @JsonKey(name: "IsActive")
  bool? get isActive => throw _privateConstructorUsedError;

  /// Serializes this GetAllCoursesRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetAllCoursesRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetAllCoursesRequestModelCopyWith<GetAllCoursesRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllCoursesRequestModelCopyWith<$Res> {
  factory $GetAllCoursesRequestModelCopyWith(GetAllCoursesRequestModel value,
          $Res Function(GetAllCoursesRequestModel) then) =
      _$GetAllCoursesRequestModelCopyWithImpl<$Res, GetAllCoursesRequestModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "PageIndex") int pageIndex,
      @JsonKey(name: "PageSize") int pageSize,
      @JsonKey(name: "Name") String? name,
      @JsonKey(name: "Track") int? track,
      @JsonKey(name: "IsFree") bool? isFree,
      @JsonKey(name: "Categories")
      @JsonKey(name: "Categories")
      List<int>? categories,
      @JsonKey(name: "IsActive") bool? isActive});
}

/// @nodoc
class _$GetAllCoursesRequestModelCopyWithImpl<$Res,
        $Val extends GetAllCoursesRequestModel>
    implements $GetAllCoursesRequestModelCopyWith<$Res> {
  _$GetAllCoursesRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetAllCoursesRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageIndex = null,
    Object? pageSize = null,
    Object? name = freezed,
    Object? track = freezed,
    Object? isFree = freezed,
    Object? categories = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      track: freezed == track
          ? _value.track
          : track // ignore: cast_nullable_to_non_nullable
              as int?,
      isFree: freezed == isFree
          ? _value.isFree
          : isFree // ignore: cast_nullable_to_non_nullable
              as bool?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetAllCoursesRequestModelImplCopyWith<$Res>
    implements $GetAllCoursesRequestModelCopyWith<$Res> {
  factory _$$GetAllCoursesRequestModelImplCopyWith(
          _$GetAllCoursesRequestModelImpl value,
          $Res Function(_$GetAllCoursesRequestModelImpl) then) =
      __$$GetAllCoursesRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "PageIndex") int pageIndex,
      @JsonKey(name: "PageSize") int pageSize,
      @JsonKey(name: "Name") String? name,
      @JsonKey(name: "Track") int? track,
      @JsonKey(name: "IsFree") bool? isFree,
      @JsonKey(name: "Categories")
      @JsonKey(name: "Categories")
      List<int>? categories,
      @JsonKey(name: "IsActive") bool? isActive});
}

/// @nodoc
class __$$GetAllCoursesRequestModelImplCopyWithImpl<$Res>
    extends _$GetAllCoursesRequestModelCopyWithImpl<$Res,
        _$GetAllCoursesRequestModelImpl>
    implements _$$GetAllCoursesRequestModelImplCopyWith<$Res> {
  __$$GetAllCoursesRequestModelImplCopyWithImpl(
      _$GetAllCoursesRequestModelImpl _value,
      $Res Function(_$GetAllCoursesRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllCoursesRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageIndex = null,
    Object? pageSize = null,
    Object? name = freezed,
    Object? track = freezed,
    Object? isFree = freezed,
    Object? categories = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$GetAllCoursesRequestModelImpl(
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      track: freezed == track
          ? _value.track
          : track // ignore: cast_nullable_to_non_nullable
              as int?,
      isFree: freezed == isFree
          ? _value.isFree
          : isFree // ignore: cast_nullable_to_non_nullable
              as bool?,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetAllCoursesRequestModelImpl implements _GetAllCoursesRequestModel {
  const _$GetAllCoursesRequestModelImpl(
      {@JsonKey(name: "PageIndex") this.pageIndex = 1,
      @JsonKey(name: "PageSize") this.pageSize = 5,
      @JsonKey(name: "Name") this.name = '',
      @JsonKey(name: "Track") this.track = null,
      @JsonKey(name: "IsFree") this.isFree = null,
      @JsonKey(name: "Categories")
      @JsonKey(name: "Categories")
      final List<int>? categories = null,
      @JsonKey(name: "IsActive") this.isActive = null})
      : _categories = categories;

  factory _$GetAllCoursesRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetAllCoursesRequestModelImplFromJson(json);

  @override
  @JsonKey(name: "PageIndex")
  final int pageIndex;
  @override
  @JsonKey(name: "PageSize")
  final int pageSize;
// @Default([]) List<SortModel> sortList,
  @override
  @JsonKey(name: "Name")
  final String? name;
  @override
  @JsonKey(name: "Track")
  final int? track;
  @override
  @JsonKey(name: "IsFree")
  final bool? isFree;
// @Default('') String link,
// @Default('') String summary,
// @Default('') String description,
  final List<int>? _categories;
// @Default('') String link,
// @Default('') String summary,
// @Default('') String description,
  @override
  @JsonKey(name: "Categories")
  @JsonKey(name: "Categories")
  List<int>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// @Default(0) int trainingCourseFee,
// @Default('') String trainingCourseRequirements,
// @Default(0) int language,
// String? startDate,
// String? endDate,
// @Default(0) int numberOfHours,
  @override
  @JsonKey(name: "IsActive")
  final bool? isActive;

  @override
  String toString() {
    return 'GetAllCoursesRequestModel(pageIndex: $pageIndex, pageSize: $pageSize, name: $name, track: $track, isFree: $isFree, categories: $categories, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllCoursesRequestModelImpl &&
            (identical(other.pageIndex, pageIndex) ||
                other.pageIndex == pageIndex) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.track, track) || other.track == track) &&
            (identical(other.isFree, isFree) || other.isFree == isFree) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pageIndex, pageSize, name, track,
      isFree, const DeepCollectionEquality().hash(_categories), isActive);

  /// Create a copy of GetAllCoursesRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllCoursesRequestModelImplCopyWith<_$GetAllCoursesRequestModelImpl>
      get copyWith => __$$GetAllCoursesRequestModelImplCopyWithImpl<
          _$GetAllCoursesRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetAllCoursesRequestModelImplToJson(
      this,
    );
  }
}

abstract class _GetAllCoursesRequestModel implements GetAllCoursesRequestModel {
  const factory _GetAllCoursesRequestModel(
          {@JsonKey(name: "PageIndex") final int pageIndex,
          @JsonKey(name: "PageSize") final int pageSize,
          @JsonKey(name: "Name") final String? name,
          @JsonKey(name: "Track") final int? track,
          @JsonKey(name: "IsFree") final bool? isFree,
          @JsonKey(name: "Categories")
          @JsonKey(name: "Categories")
          final List<int>? categories,
          @JsonKey(name: "IsActive") final bool? isActive}) =
      _$GetAllCoursesRequestModelImpl;

  factory _GetAllCoursesRequestModel.fromJson(Map<String, dynamic> json) =
      _$GetAllCoursesRequestModelImpl.fromJson;

  @override
  @JsonKey(name: "PageIndex")
  int get pageIndex;
  @override
  @JsonKey(name: "PageSize")
  int get pageSize; // @Default([]) List<SortModel> sortList,
  @override
  @JsonKey(name: "Name")
  String? get name;
  @override
  @JsonKey(name: "Track")
  int? get track;
  @override
  @JsonKey(name: "IsFree")
  bool? get isFree; // @Default('') String link,
// @Default('') String summary,
// @Default('') String description,
  @override
  @JsonKey(name: "Categories")
  @JsonKey(name: "Categories")
  List<int>? get categories; // @Default(0) int trainingCourseFee,
// @Default('') String trainingCourseRequirements,
// @Default(0) int language,
// String? startDate,
// String? endDate,
// @Default(0) int numberOfHours,
  @override
  @JsonKey(name: "IsActive")
  bool? get isActive;

  /// Create a copy of GetAllCoursesRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetAllCoursesRequestModelImplCopyWith<_$GetAllCoursesRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SortModel _$SortModelFromJson(Map<String, dynamic> json) {
  return _SortModel.fromJson(json);
}

/// @nodoc
mixin _$SortModel {
  String get propertyName => throw _privateConstructorUsedError;
  int get sortDirection => throw _privateConstructorUsedError;
  int get languageId => throw _privateConstructorUsedError;

  /// Serializes this SortModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SortModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SortModelCopyWith<SortModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SortModelCopyWith<$Res> {
  factory $SortModelCopyWith(SortModel value, $Res Function(SortModel) then) =
      _$SortModelCopyWithImpl<$Res, SortModel>;
  @useResult
  $Res call({String propertyName, int sortDirection, int languageId});
}

/// @nodoc
class _$SortModelCopyWithImpl<$Res, $Val extends SortModel>
    implements $SortModelCopyWith<$Res> {
  _$SortModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SortModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? propertyName = null,
    Object? sortDirection = null,
    Object? languageId = null,
  }) {
    return _then(_value.copyWith(
      propertyName: null == propertyName
          ? _value.propertyName
          : propertyName // ignore: cast_nullable_to_non_nullable
              as String,
      sortDirection: null == sortDirection
          ? _value.sortDirection
          : sortDirection // ignore: cast_nullable_to_non_nullable
              as int,
      languageId: null == languageId
          ? _value.languageId
          : languageId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SortModelImplCopyWith<$Res>
    implements $SortModelCopyWith<$Res> {
  factory _$$SortModelImplCopyWith(
          _$SortModelImpl value, $Res Function(_$SortModelImpl) then) =
      __$$SortModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String propertyName, int sortDirection, int languageId});
}

/// @nodoc
class __$$SortModelImplCopyWithImpl<$Res>
    extends _$SortModelCopyWithImpl<$Res, _$SortModelImpl>
    implements _$$SortModelImplCopyWith<$Res> {
  __$$SortModelImplCopyWithImpl(
      _$SortModelImpl _value, $Res Function(_$SortModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SortModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? propertyName = null,
    Object? sortDirection = null,
    Object? languageId = null,
  }) {
    return _then(_$SortModelImpl(
      propertyName: null == propertyName
          ? _value.propertyName
          : propertyName // ignore: cast_nullable_to_non_nullable
              as String,
      sortDirection: null == sortDirection
          ? _value.sortDirection
          : sortDirection // ignore: cast_nullable_to_non_nullable
              as int,
      languageId: null == languageId
          ? _value.languageId
          : languageId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SortModelImpl implements _SortModel {
  const _$SortModelImpl(
      {this.propertyName = '', this.sortDirection = 0, this.languageId = 0});

  factory _$SortModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SortModelImplFromJson(json);

  @override
  @JsonKey()
  final String propertyName;
  @override
  @JsonKey()
  final int sortDirection;
  @override
  @JsonKey()
  final int languageId;

  @override
  String toString() {
    return 'SortModel(propertyName: $propertyName, sortDirection: $sortDirection, languageId: $languageId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SortModelImpl &&
            (identical(other.propertyName, propertyName) ||
                other.propertyName == propertyName) &&
            (identical(other.sortDirection, sortDirection) ||
                other.sortDirection == sortDirection) &&
            (identical(other.languageId, languageId) ||
                other.languageId == languageId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, propertyName, sortDirection, languageId);

  /// Create a copy of SortModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SortModelImplCopyWith<_$SortModelImpl> get copyWith =>
      __$$SortModelImplCopyWithImpl<_$SortModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SortModelImplToJson(
      this,
    );
  }
}

abstract class _SortModel implements SortModel {
  const factory _SortModel(
      {final String propertyName,
      final int sortDirection,
      final int languageId}) = _$SortModelImpl;

  factory _SortModel.fromJson(Map<String, dynamic> json) =
      _$SortModelImpl.fromJson;

  @override
  String get propertyName;
  @override
  int get sortDirection;
  @override
  int get languageId;

  /// Create a copy of SortModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SortModelImplCopyWith<_$SortModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetAllCategoriesRequestModel _$GetAllCategoriesRequestModelFromJson(
    Map<String, dynamic> json) {
  return _GetAllCategoriesRequestModel.fromJson(json);
}

/// @nodoc
mixin _$GetAllCategoriesRequestModel {
  @JsonKey(name: "PageIndex")
  int get pageIndex => throw _privateConstructorUsedError;
  @JsonKey(name: "PageSize")
  int get pageSize => throw _privateConstructorUsedError;
  @JsonKey(name: "UserType")
  int get userType => throw _privateConstructorUsedError;

  /// Serializes this GetAllCategoriesRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetAllCategoriesRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetAllCategoriesRequestModelCopyWith<GetAllCategoriesRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllCategoriesRequestModelCopyWith<$Res> {
  factory $GetAllCategoriesRequestModelCopyWith(
          GetAllCategoriesRequestModel value,
          $Res Function(GetAllCategoriesRequestModel) then) =
      _$GetAllCategoriesRequestModelCopyWithImpl<$Res,
          GetAllCategoriesRequestModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "PageIndex") int pageIndex,
      @JsonKey(name: "PageSize") int pageSize,
      @JsonKey(name: "UserType") int userType});
}

/// @nodoc
class _$GetAllCategoriesRequestModelCopyWithImpl<$Res,
        $Val extends GetAllCategoriesRequestModel>
    implements $GetAllCategoriesRequestModelCopyWith<$Res> {
  _$GetAllCategoriesRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetAllCategoriesRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageIndex = null,
    Object? pageSize = null,
    Object? userType = null,
  }) {
    return _then(_value.copyWith(
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetAllCategoriesRequestModelImplCopyWith<$Res>
    implements $GetAllCategoriesRequestModelCopyWith<$Res> {
  factory _$$GetAllCategoriesRequestModelImplCopyWith(
          _$GetAllCategoriesRequestModelImpl value,
          $Res Function(_$GetAllCategoriesRequestModelImpl) then) =
      __$$GetAllCategoriesRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "PageIndex") int pageIndex,
      @JsonKey(name: "PageSize") int pageSize,
      @JsonKey(name: "UserType") int userType});
}

/// @nodoc
class __$$GetAllCategoriesRequestModelImplCopyWithImpl<$Res>
    extends _$GetAllCategoriesRequestModelCopyWithImpl<$Res,
        _$GetAllCategoriesRequestModelImpl>
    implements _$$GetAllCategoriesRequestModelImplCopyWith<$Res> {
  __$$GetAllCategoriesRequestModelImplCopyWithImpl(
      _$GetAllCategoriesRequestModelImpl _value,
      $Res Function(_$GetAllCategoriesRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllCategoriesRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageIndex = null,
    Object? pageSize = null,
    Object? userType = null,
  }) {
    return _then(_$GetAllCategoriesRequestModelImpl(
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetAllCategoriesRequestModelImpl
    implements _GetAllCategoriesRequestModel {
  const _$GetAllCategoriesRequestModelImpl(
      {@JsonKey(name: "PageIndex") this.pageIndex = 0,
      @JsonKey(name: "PageSize") this.pageSize = 0,
      @JsonKey(name: "UserType") this.userType = 1});

  factory _$GetAllCategoriesRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GetAllCategoriesRequestModelImplFromJson(json);

  @override
  @JsonKey(name: "PageIndex")
  final int pageIndex;
  @override
  @JsonKey(name: "PageSize")
  final int pageSize;
  @override
  @JsonKey(name: "UserType")
  final int userType;

  @override
  String toString() {
    return 'GetAllCategoriesRequestModel(pageIndex: $pageIndex, pageSize: $pageSize, userType: $userType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllCategoriesRequestModelImpl &&
            (identical(other.pageIndex, pageIndex) ||
                other.pageIndex == pageIndex) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.userType, userType) ||
                other.userType == userType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pageIndex, pageSize, userType);

  /// Create a copy of GetAllCategoriesRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllCategoriesRequestModelImplCopyWith<
          _$GetAllCategoriesRequestModelImpl>
      get copyWith => __$$GetAllCategoriesRequestModelImplCopyWithImpl<
          _$GetAllCategoriesRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetAllCategoriesRequestModelImplToJson(
      this,
    );
  }
}

abstract class _GetAllCategoriesRequestModel
    implements GetAllCategoriesRequestModel {
  const factory _GetAllCategoriesRequestModel(
          {@JsonKey(name: "PageIndex") final int pageIndex,
          @JsonKey(name: "PageSize") final int pageSize,
          @JsonKey(name: "UserType") final int userType}) =
      _$GetAllCategoriesRequestModelImpl;

  factory _GetAllCategoriesRequestModel.fromJson(Map<String, dynamic> json) =
      _$GetAllCategoriesRequestModelImpl.fromJson;

  @override
  @JsonKey(name: "PageIndex")
  int get pageIndex;
  @override
  @JsonKey(name: "PageSize")
  int get pageSize;
  @override
  @JsonKey(name: "UserType")
  int get userType;

  /// Create a copy of GetAllCategoriesRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetAllCategoriesRequestModelImplCopyWith<
          _$GetAllCategoriesRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
