// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_courses_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetAllCoursesResponseModel _$GetAllCoursesResponseModelFromJson(
    Map<String, dynamic> json) {
  return _GetAllCoursesResponseModel.fromJson(json);
}

/// @nodoc
mixin _$GetAllCoursesResponseModel {
  @JsonKey(name: "Code")
  int get code => throw _privateConstructorUsedError;
  @JsonKey(name: "Message")
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: "Result")
  bool get result => throw _privateConstructorUsedError;
  @JsonKey(name: "Data")
  CourseData? get data => throw _privateConstructorUsedError;

  /// Serializes this GetAllCoursesResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetAllCoursesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetAllCoursesResponseModelCopyWith<GetAllCoursesResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllCoursesResponseModelCopyWith<$Res> {
  factory $GetAllCoursesResponseModelCopyWith(GetAllCoursesResponseModel value,
          $Res Function(GetAllCoursesResponseModel) then) =
      _$GetAllCoursesResponseModelCopyWithImpl<$Res,
          GetAllCoursesResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "Code") int code,
      @JsonKey(name: "Message") String message,
      @JsonKey(name: "Result") bool result,
      @JsonKey(name: "Data") CourseData? data});

  $CourseDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$GetAllCoursesResponseModelCopyWithImpl<$Res,
        $Val extends GetAllCoursesResponseModel>
    implements $GetAllCoursesResponseModelCopyWith<$Res> {
  _$GetAllCoursesResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetAllCoursesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? result = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CourseData?,
    ) as $Val);
  }

  /// Create a copy of GetAllCoursesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CourseDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $CourseDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetAllCoursesResponseModelImplCopyWith<$Res>
    implements $GetAllCoursesResponseModelCopyWith<$Res> {
  factory _$$GetAllCoursesResponseModelImplCopyWith(
          _$GetAllCoursesResponseModelImpl value,
          $Res Function(_$GetAllCoursesResponseModelImpl) then) =
      __$$GetAllCoursesResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Code") int code,
      @JsonKey(name: "Message") String message,
      @JsonKey(name: "Result") bool result,
      @JsonKey(name: "Data") CourseData? data});

  @override
  $CourseDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$GetAllCoursesResponseModelImplCopyWithImpl<$Res>
    extends _$GetAllCoursesResponseModelCopyWithImpl<$Res,
        _$GetAllCoursesResponseModelImpl>
    implements _$$GetAllCoursesResponseModelImplCopyWith<$Res> {
  __$$GetAllCoursesResponseModelImplCopyWithImpl(
      _$GetAllCoursesResponseModelImpl _value,
      $Res Function(_$GetAllCoursesResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllCoursesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? result = null,
    Object? data = freezed,
  }) {
    return _then(_$GetAllCoursesResponseModelImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CourseData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetAllCoursesResponseModelImpl implements _GetAllCoursesResponseModel {
  const _$GetAllCoursesResponseModelImpl(
      {@JsonKey(name: "Code") this.code = 0,
      @JsonKey(name: "Message") this.message = '',
      @JsonKey(name: "Result") this.result = true,
      @JsonKey(name: "Data") this.data});

  factory _$GetAllCoursesResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GetAllCoursesResponseModelImplFromJson(json);

  @override
  @JsonKey(name: "Code")
  final int code;
  @override
  @JsonKey(name: "Message")
  final String message;
  @override
  @JsonKey(name: "Result")
  final bool result;
  @override
  @JsonKey(name: "Data")
  final CourseData? data;

  @override
  String toString() {
    return 'GetAllCoursesResponseModel(code: $code, message: $message, result: $result, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllCoursesResponseModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message, result, data);

  /// Create a copy of GetAllCoursesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllCoursesResponseModelImplCopyWith<_$GetAllCoursesResponseModelImpl>
      get copyWith => __$$GetAllCoursesResponseModelImplCopyWithImpl<
          _$GetAllCoursesResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetAllCoursesResponseModelImplToJson(
      this,
    );
  }
}

abstract class _GetAllCoursesResponseModel
    implements GetAllCoursesResponseModel {
  const factory _GetAllCoursesResponseModel(
          {@JsonKey(name: "Code") final int code,
          @JsonKey(name: "Message") final String message,
          @JsonKey(name: "Result") final bool result,
          @JsonKey(name: "Data") final CourseData? data}) =
      _$GetAllCoursesResponseModelImpl;

  factory _GetAllCoursesResponseModel.fromJson(Map<String, dynamic> json) =
      _$GetAllCoursesResponseModelImpl.fromJson;

  @override
  @JsonKey(name: "Code")
  int get code;
  @override
  @JsonKey(name: "Message")
  String get message;
  @override
  @JsonKey(name: "Result")
  bool get result;
  @override
  @JsonKey(name: "Data")
  CourseData? get data;

  /// Create a copy of GetAllCoursesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetAllCoursesResponseModelImplCopyWith<_$GetAllCoursesResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CourseData _$CourseDataFromJson(Map<String, dynamic> json) {
  return _CourseData.fromJson(json);
}

/// @nodoc
mixin _$CourseData {
  @JsonKey(name: "Pager")
  Pager get pager => throw _privateConstructorUsedError;
  @JsonKey(name: "TrainingCourses")
  List<TrainingCourse> get trainingCourses =>
      throw _privateConstructorUsedError;

  /// Serializes this CourseData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseDataCopyWith<CourseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseDataCopyWith<$Res> {
  factory $CourseDataCopyWith(
          CourseData value, $Res Function(CourseData) then) =
      _$CourseDataCopyWithImpl<$Res, CourseData>;
  @useResult
  $Res call(
      {@JsonKey(name: "Pager") Pager pager,
      @JsonKey(name: "TrainingCourses") List<TrainingCourse> trainingCourses});

  $PagerCopyWith<$Res> get pager;
}

/// @nodoc
class _$CourseDataCopyWithImpl<$Res, $Val extends CourseData>
    implements $CourseDataCopyWith<$Res> {
  _$CourseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pager = null,
    Object? trainingCourses = null,
  }) {
    return _then(_value.copyWith(
      pager: null == pager
          ? _value.pager
          : pager // ignore: cast_nullable_to_non_nullable
              as Pager,
      trainingCourses: null == trainingCourses
          ? _value.trainingCourses
          : trainingCourses // ignore: cast_nullable_to_non_nullable
              as List<TrainingCourse>,
    ) as $Val);
  }

  /// Create a copy of CourseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PagerCopyWith<$Res> get pager {
    return $PagerCopyWith<$Res>(_value.pager, (value) {
      return _then(_value.copyWith(pager: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CourseDataImplCopyWith<$Res>
    implements $CourseDataCopyWith<$Res> {
  factory _$$CourseDataImplCopyWith(
          _$CourseDataImpl value, $Res Function(_$CourseDataImpl) then) =
      __$$CourseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Pager") Pager pager,
      @JsonKey(name: "TrainingCourses") List<TrainingCourse> trainingCourses});

  @override
  $PagerCopyWith<$Res> get pager;
}

/// @nodoc
class __$$CourseDataImplCopyWithImpl<$Res>
    extends _$CourseDataCopyWithImpl<$Res, _$CourseDataImpl>
    implements _$$CourseDataImplCopyWith<$Res> {
  __$$CourseDataImplCopyWithImpl(
      _$CourseDataImpl _value, $Res Function(_$CourseDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pager = null,
    Object? trainingCourses = null,
  }) {
    return _then(_$CourseDataImpl(
      pager: null == pager
          ? _value.pager
          : pager // ignore: cast_nullable_to_non_nullable
              as Pager,
      trainingCourses: null == trainingCourses
          ? _value._trainingCourses
          : trainingCourses // ignore: cast_nullable_to_non_nullable
              as List<TrainingCourse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseDataImpl implements _CourseData {
  const _$CourseDataImpl(
      {@JsonKey(name: "Pager") required this.pager,
      @JsonKey(name: "TrainingCourses")
      final List<TrainingCourse> trainingCourses = const []})
      : _trainingCourses = trainingCourses;

  factory _$CourseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseDataImplFromJson(json);

  @override
  @JsonKey(name: "Pager")
  final Pager pager;
  final List<TrainingCourse> _trainingCourses;
  @override
  @JsonKey(name: "TrainingCourses")
  List<TrainingCourse> get trainingCourses {
    if (_trainingCourses is EqualUnmodifiableListView) return _trainingCourses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trainingCourses);
  }

  @override
  String toString() {
    return 'CourseData(pager: $pager, trainingCourses: $trainingCourses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseDataImpl &&
            (identical(other.pager, pager) || other.pager == pager) &&
            const DeepCollectionEquality()
                .equals(other._trainingCourses, _trainingCourses));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pager,
      const DeepCollectionEquality().hash(_trainingCourses));

  /// Create a copy of CourseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseDataImplCopyWith<_$CourseDataImpl> get copyWith =>
      __$$CourseDataImplCopyWithImpl<_$CourseDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseDataImplToJson(
      this,
    );
  }
}

abstract class _CourseData implements CourseData {
  const factory _CourseData(
      {@JsonKey(name: "Pager") required final Pager pager,
      @JsonKey(name: "TrainingCourses")
      final List<TrainingCourse> trainingCourses}) = _$CourseDataImpl;

  factory _CourseData.fromJson(Map<String, dynamic> json) =
      _$CourseDataImpl.fromJson;

  @override
  @JsonKey(name: "Pager")
  Pager get pager;
  @override
  @JsonKey(name: "TrainingCourses")
  List<TrainingCourse> get trainingCourses;

  /// Create a copy of CourseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseDataImplCopyWith<_$CourseDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Pager _$PagerFromJson(Map<String, dynamic> json) {
  return _Pager.fromJson(json);
}

/// @nodoc
mixin _$Pager {
  @JsonKey(name: "PageIndex")
  int get pageIndex => throw _privateConstructorUsedError;
  @JsonKey(name: "PageSize")
  int get pageSize => throw _privateConstructorUsedError;
  @JsonKey(name: "TotalCount")
  int get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: "TotalPages")
  int get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: "HasPreviousPage")
  bool get hasPreviousPage => throw _privateConstructorUsedError;
  @JsonKey(name: "HasNextPage")
  bool get hasNextPage => throw _privateConstructorUsedError;

  /// Serializes this Pager to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pager
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PagerCopyWith<Pager> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagerCopyWith<$Res> {
  factory $PagerCopyWith(Pager value, $Res Function(Pager) then) =
      _$PagerCopyWithImpl<$Res, Pager>;
  @useResult
  $Res call(
      {@JsonKey(name: "PageIndex") int pageIndex,
      @JsonKey(name: "PageSize") int pageSize,
      @JsonKey(name: "TotalCount") int totalCount,
      @JsonKey(name: "TotalPages") int totalPages,
      @JsonKey(name: "HasPreviousPage") bool hasPreviousPage,
      @JsonKey(name: "HasNextPage") bool hasNextPage});
}

/// @nodoc
class _$PagerCopyWithImpl<$Res, $Val extends Pager>
    implements $PagerCopyWith<$Res> {
  _$PagerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pager
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageIndex = null,
    Object? pageSize = null,
    Object? totalCount = null,
    Object? totalPages = null,
    Object? hasPreviousPage = null,
    Object? hasNextPage = null,
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
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      hasPreviousPage: null == hasPreviousPage
          ? _value.hasPreviousPage
          : hasPreviousPage // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PagerImplCopyWith<$Res> implements $PagerCopyWith<$Res> {
  factory _$$PagerImplCopyWith(
          _$PagerImpl value, $Res Function(_$PagerImpl) then) =
      __$$PagerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "PageIndex") int pageIndex,
      @JsonKey(name: "PageSize") int pageSize,
      @JsonKey(name: "TotalCount") int totalCount,
      @JsonKey(name: "TotalPages") int totalPages,
      @JsonKey(name: "HasPreviousPage") bool hasPreviousPage,
      @JsonKey(name: "HasNextPage") bool hasNextPage});
}

/// @nodoc
class __$$PagerImplCopyWithImpl<$Res>
    extends _$PagerCopyWithImpl<$Res, _$PagerImpl>
    implements _$$PagerImplCopyWith<$Res> {
  __$$PagerImplCopyWithImpl(
      _$PagerImpl _value, $Res Function(_$PagerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Pager
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageIndex = null,
    Object? pageSize = null,
    Object? totalCount = null,
    Object? totalPages = null,
    Object? hasPreviousPage = null,
    Object? hasNextPage = null,
  }) {
    return _then(_$PagerImpl(
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      hasPreviousPage: null == hasPreviousPage
          ? _value.hasPreviousPage
          : hasPreviousPage // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PagerImpl implements _Pager {
  const _$PagerImpl(
      {@JsonKey(name: "PageIndex") this.pageIndex = 0,
      @JsonKey(name: "PageSize") this.pageSize = 0,
      @JsonKey(name: "TotalCount") this.totalCount = 0,
      @JsonKey(name: "TotalPages") this.totalPages = 0,
      @JsonKey(name: "HasPreviousPage") this.hasPreviousPage = false,
      @JsonKey(name: "HasNextPage") this.hasNextPage = false});

  factory _$PagerImpl.fromJson(Map<String, dynamic> json) =>
      _$$PagerImplFromJson(json);

  @override
  @JsonKey(name: "PageIndex")
  final int pageIndex;
  @override
  @JsonKey(name: "PageSize")
  final int pageSize;
  @override
  @JsonKey(name: "TotalCount")
  final int totalCount;
  @override
  @JsonKey(name: "TotalPages")
  final int totalPages;
  @override
  @JsonKey(name: "HasPreviousPage")
  final bool hasPreviousPage;
  @override
  @JsonKey(name: "HasNextPage")
  final bool hasNextPage;

  @override
  String toString() {
    return 'Pager(pageIndex: $pageIndex, pageSize: $pageSize, totalCount: $totalCount, totalPages: $totalPages, hasPreviousPage: $hasPreviousPage, hasNextPage: $hasNextPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PagerImpl &&
            (identical(other.pageIndex, pageIndex) ||
                other.pageIndex == pageIndex) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.hasPreviousPage, hasPreviousPage) ||
                other.hasPreviousPage == hasPreviousPage) &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pageIndex, pageSize, totalCount,
      totalPages, hasPreviousPage, hasNextPage);

  /// Create a copy of Pager
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PagerImplCopyWith<_$PagerImpl> get copyWith =>
      __$$PagerImplCopyWithImpl<_$PagerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PagerImplToJson(
      this,
    );
  }
}

abstract class _Pager implements Pager {
  const factory _Pager(
      {@JsonKey(name: "PageIndex") final int pageIndex,
      @JsonKey(name: "PageSize") final int pageSize,
      @JsonKey(name: "TotalCount") final int totalCount,
      @JsonKey(name: "TotalPages") final int totalPages,
      @JsonKey(name: "HasPreviousPage") final bool hasPreviousPage,
      @JsonKey(name: "HasNextPage") final bool hasNextPage}) = _$PagerImpl;

  factory _Pager.fromJson(Map<String, dynamic> json) = _$PagerImpl.fromJson;

  @override
  @JsonKey(name: "PageIndex")
  int get pageIndex;
  @override
  @JsonKey(name: "PageSize")
  int get pageSize;
  @override
  @JsonKey(name: "TotalCount")
  int get totalCount;
  @override
  @JsonKey(name: "TotalPages")
  int get totalPages;
  @override
  @JsonKey(name: "HasPreviousPage")
  bool get hasPreviousPage;
  @override
  @JsonKey(name: "HasNextPage")
  bool get hasNextPage;

  /// Create a copy of Pager
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PagerImplCopyWith<_$PagerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TrainingCourse _$TrainingCourseFromJson(Map<String, dynamic> json) {
  return _TrainingCourse.fromJson(json);
}

/// @nodoc
mixin _$TrainingCourse {
  @JsonKey(name: "Id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "Lookup")
  Lookup get lookup => throw _privateConstructorUsedError;
  @JsonKey(name: "Translations")
  List<SummaryTranslation> get translations =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "Categories")
  List<Category> get categories => throw _privateConstructorUsedError;
  @JsonKey(name: "Interested")
  bool get interested => throw _privateConstructorUsedError;
  @JsonKey(name: "Fee")
  double get fee => throw _privateConstructorUsedError;
  @JsonKey(name: "IsFree")
  bool get isFree => throw _privateConstructorUsedError;
  @JsonKey(name: "CertificateType")
  int get certificateType => throw _privateConstructorUsedError;
  @JsonKey(name: "CertificateTypeTranslation")
  KeyValueTranslation get certificateTypeTranslation =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "TrainingCourseProvider")
  Provider get trainingCourseProvider => throw _privateConstructorUsedError;
  @JsonKey(name: "Session")
  Session? get session => throw _privateConstructorUsedError;
  @JsonKey(name: "Track")
  int get track => throw _privateConstructorUsedError;
  @JsonKey(name: "TrackTranslation")
  KeyValueTranslation? get trackTranslation =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "Registered")
  bool get registered => throw _privateConstructorUsedError;

  /// Serializes this TrainingCourse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrainingCourse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrainingCourseCopyWith<TrainingCourse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainingCourseCopyWith<$Res> {
  factory $TrainingCourseCopyWith(
          TrainingCourse value, $Res Function(TrainingCourse) then) =
      _$TrainingCourseCopyWithImpl<$Res, TrainingCourse>;
  @useResult
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "Lookup") Lookup lookup,
      @JsonKey(name: "Translations") List<SummaryTranslation> translations,
      @JsonKey(name: "Categories") List<Category> categories,
      @JsonKey(name: "Interested") bool interested,
      @JsonKey(name: "Fee") double fee,
      @JsonKey(name: "IsFree") bool isFree,
      @JsonKey(name: "CertificateType") int certificateType,
      @JsonKey(name: "CertificateTypeTranslation")
      KeyValueTranslation certificateTypeTranslation,
      @JsonKey(name: "TrainingCourseProvider") Provider trainingCourseProvider,
      @JsonKey(name: "Session") Session? session,
      @JsonKey(name: "Track") int track,
      @JsonKey(name: "TrackTranslation") KeyValueTranslation? trackTranslation,
      @JsonKey(name: "Registered") bool registered});

  $LookupCopyWith<$Res> get lookup;
  $KeyValueTranslationCopyWith<$Res> get certificateTypeTranslation;
  $ProviderCopyWith<$Res> get trainingCourseProvider;
  $SessionCopyWith<$Res>? get session;
  $KeyValueTranslationCopyWith<$Res>? get trackTranslation;
}

/// @nodoc
class _$TrainingCourseCopyWithImpl<$Res, $Val extends TrainingCourse>
    implements $TrainingCourseCopyWith<$Res> {
  _$TrainingCourseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrainingCourse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lookup = null,
    Object? translations = null,
    Object? categories = null,
    Object? interested = null,
    Object? fee = null,
    Object? isFree = null,
    Object? certificateType = null,
    Object? certificateTypeTranslation = null,
    Object? trainingCourseProvider = null,
    Object? session = freezed,
    Object? track = null,
    Object? trackTranslation = freezed,
    Object? registered = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lookup: null == lookup
          ? _value.lookup
          : lookup // ignore: cast_nullable_to_non_nullable
              as Lookup,
      translations: null == translations
          ? _value.translations
          : translations // ignore: cast_nullable_to_non_nullable
              as List<SummaryTranslation>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      interested: null == interested
          ? _value.interested
          : interested // ignore: cast_nullable_to_non_nullable
              as bool,
      fee: null == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double,
      isFree: null == isFree
          ? _value.isFree
          : isFree // ignore: cast_nullable_to_non_nullable
              as bool,
      certificateType: null == certificateType
          ? _value.certificateType
          : certificateType // ignore: cast_nullable_to_non_nullable
              as int,
      certificateTypeTranslation: null == certificateTypeTranslation
          ? _value.certificateTypeTranslation
          : certificateTypeTranslation // ignore: cast_nullable_to_non_nullable
              as KeyValueTranslation,
      trainingCourseProvider: null == trainingCourseProvider
          ? _value.trainingCourseProvider
          : trainingCourseProvider // ignore: cast_nullable_to_non_nullable
              as Provider,
      session: freezed == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as Session?,
      track: null == track
          ? _value.track
          : track // ignore: cast_nullable_to_non_nullable
              as int,
      trackTranslation: freezed == trackTranslation
          ? _value.trackTranslation
          : trackTranslation // ignore: cast_nullable_to_non_nullable
              as KeyValueTranslation?,
      registered: null == registered
          ? _value.registered
          : registered // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of TrainingCourse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LookupCopyWith<$Res> get lookup {
    return $LookupCopyWith<$Res>(_value.lookup, (value) {
      return _then(_value.copyWith(lookup: value) as $Val);
    });
  }

  /// Create a copy of TrainingCourse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KeyValueTranslationCopyWith<$Res> get certificateTypeTranslation {
    return $KeyValueTranslationCopyWith<$Res>(_value.certificateTypeTranslation,
        (value) {
      return _then(_value.copyWith(certificateTypeTranslation: value) as $Val);
    });
  }

  /// Create a copy of TrainingCourse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProviderCopyWith<$Res> get trainingCourseProvider {
    return $ProviderCopyWith<$Res>(_value.trainingCourseProvider, (value) {
      return _then(_value.copyWith(trainingCourseProvider: value) as $Val);
    });
  }

  /// Create a copy of TrainingCourse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionCopyWith<$Res>? get session {
    if (_value.session == null) {
      return null;
    }

    return $SessionCopyWith<$Res>(_value.session!, (value) {
      return _then(_value.copyWith(session: value) as $Val);
    });
  }

  /// Create a copy of TrainingCourse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KeyValueTranslationCopyWith<$Res>? get trackTranslation {
    if (_value.trackTranslation == null) {
      return null;
    }

    return $KeyValueTranslationCopyWith<$Res>(_value.trackTranslation!,
        (value) {
      return _then(_value.copyWith(trackTranslation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TrainingCourseImplCopyWith<$Res>
    implements $TrainingCourseCopyWith<$Res> {
  factory _$$TrainingCourseImplCopyWith(_$TrainingCourseImpl value,
          $Res Function(_$TrainingCourseImpl) then) =
      __$$TrainingCourseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "Lookup") Lookup lookup,
      @JsonKey(name: "Translations") List<SummaryTranslation> translations,
      @JsonKey(name: "Categories") List<Category> categories,
      @JsonKey(name: "Interested") bool interested,
      @JsonKey(name: "Fee") double fee,
      @JsonKey(name: "IsFree") bool isFree,
      @JsonKey(name: "CertificateType") int certificateType,
      @JsonKey(name: "CertificateTypeTranslation")
      KeyValueTranslation certificateTypeTranslation,
      @JsonKey(name: "TrainingCourseProvider") Provider trainingCourseProvider,
      @JsonKey(name: "Session") Session? session,
      @JsonKey(name: "Track") int track,
      @JsonKey(name: "TrackTranslation") KeyValueTranslation? trackTranslation,
      @JsonKey(name: "Registered") bool registered});

  @override
  $LookupCopyWith<$Res> get lookup;
  @override
  $KeyValueTranslationCopyWith<$Res> get certificateTypeTranslation;
  @override
  $ProviderCopyWith<$Res> get trainingCourseProvider;
  @override
  $SessionCopyWith<$Res>? get session;
  @override
  $KeyValueTranslationCopyWith<$Res>? get trackTranslation;
}

/// @nodoc
class __$$TrainingCourseImplCopyWithImpl<$Res>
    extends _$TrainingCourseCopyWithImpl<$Res, _$TrainingCourseImpl>
    implements _$$TrainingCourseImplCopyWith<$Res> {
  __$$TrainingCourseImplCopyWithImpl(
      _$TrainingCourseImpl _value, $Res Function(_$TrainingCourseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrainingCourse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lookup = null,
    Object? translations = null,
    Object? categories = null,
    Object? interested = null,
    Object? fee = null,
    Object? isFree = null,
    Object? certificateType = null,
    Object? certificateTypeTranslation = null,
    Object? trainingCourseProvider = null,
    Object? session = freezed,
    Object? track = null,
    Object? trackTranslation = freezed,
    Object? registered = null,
  }) {
    return _then(_$TrainingCourseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lookup: null == lookup
          ? _value.lookup
          : lookup // ignore: cast_nullable_to_non_nullable
              as Lookup,
      translations: null == translations
          ? _value._translations
          : translations // ignore: cast_nullable_to_non_nullable
              as List<SummaryTranslation>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      interested: null == interested
          ? _value.interested
          : interested // ignore: cast_nullable_to_non_nullable
              as bool,
      fee: null == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double,
      isFree: null == isFree
          ? _value.isFree
          : isFree // ignore: cast_nullable_to_non_nullable
              as bool,
      certificateType: null == certificateType
          ? _value.certificateType
          : certificateType // ignore: cast_nullable_to_non_nullable
              as int,
      certificateTypeTranslation: null == certificateTypeTranslation
          ? _value.certificateTypeTranslation
          : certificateTypeTranslation // ignore: cast_nullable_to_non_nullable
              as KeyValueTranslation,
      trainingCourseProvider: null == trainingCourseProvider
          ? _value.trainingCourseProvider
          : trainingCourseProvider // ignore: cast_nullable_to_non_nullable
              as Provider,
      session: freezed == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as Session?,
      track: null == track
          ? _value.track
          : track // ignore: cast_nullable_to_non_nullable
              as int,
      trackTranslation: freezed == trackTranslation
          ? _value.trackTranslation
          : trackTranslation // ignore: cast_nullable_to_non_nullable
              as KeyValueTranslation?,
      registered: null == registered
          ? _value.registered
          : registered // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrainingCourseImpl implements _TrainingCourse {
  const _$TrainingCourseImpl(
      {@JsonKey(name: "Id") required this.id,
      @JsonKey(name: "Lookup") required this.lookup,
      @JsonKey(name: "Translations")
      final List<SummaryTranslation> translations = const [],
      @JsonKey(name: "Categories") final List<Category> categories = const [],
      @JsonKey(name: "Interested") this.interested = false,
      @JsonKey(name: "Fee") this.fee = 0.0,
      @JsonKey(name: "IsFree") this.isFree = false,
      @JsonKey(name: "CertificateType") this.certificateType = 0,
      @JsonKey(name: "CertificateTypeTranslation")
      required this.certificateTypeTranslation,
      @JsonKey(name: "TrainingCourseProvider")
      required this.trainingCourseProvider,
      @JsonKey(name: "Session") this.session,
      @JsonKey(name: "Track") this.track = 0,
      @JsonKey(name: "TrackTranslation") this.trackTranslation,
      @JsonKey(name: "Registered") this.registered = false})
      : _translations = translations,
        _categories = categories;

  factory _$TrainingCourseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrainingCourseImplFromJson(json);

  @override
  @JsonKey(name: "Id")
  final int id;
  @override
  @JsonKey(name: "Lookup")
  final Lookup lookup;
  final List<SummaryTranslation> _translations;
  @override
  @JsonKey(name: "Translations")
  List<SummaryTranslation> get translations {
    if (_translations is EqualUnmodifiableListView) return _translations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_translations);
  }

  final List<Category> _categories;
  @override
  @JsonKey(name: "Categories")
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  @JsonKey(name: "Interested")
  final bool interested;
  @override
  @JsonKey(name: "Fee")
  final double fee;
  @override
  @JsonKey(name: "IsFree")
  final bool isFree;
  @override
  @JsonKey(name: "CertificateType")
  final int certificateType;
  @override
  @JsonKey(name: "CertificateTypeTranslation")
  final KeyValueTranslation certificateTypeTranslation;
  @override
  @JsonKey(name: "TrainingCourseProvider")
  final Provider trainingCourseProvider;
  @override
  @JsonKey(name: "Session")
  final Session? session;
  @override
  @JsonKey(name: "Track")
  final int track;
  @override
  @JsonKey(name: "TrackTranslation")
  final KeyValueTranslation? trackTranslation;
  @override
  @JsonKey(name: "Registered")
  final bool registered;

  @override
  String toString() {
    return 'TrainingCourse(id: $id, lookup: $lookup, translations: $translations, categories: $categories, interested: $interested, fee: $fee, isFree: $isFree, certificateType: $certificateType, certificateTypeTranslation: $certificateTypeTranslation, trainingCourseProvider: $trainingCourseProvider, session: $session, track: $track, trackTranslation: $trackTranslation, registered: $registered)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrainingCourseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lookup, lookup) || other.lookup == lookup) &&
            const DeepCollectionEquality()
                .equals(other._translations, _translations) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.interested, interested) ||
                other.interested == interested) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.isFree, isFree) || other.isFree == isFree) &&
            (identical(other.certificateType, certificateType) ||
                other.certificateType == certificateType) &&
            (identical(other.certificateTypeTranslation,
                    certificateTypeTranslation) ||
                other.certificateTypeTranslation ==
                    certificateTypeTranslation) &&
            (identical(other.trainingCourseProvider, trainingCourseProvider) ||
                other.trainingCourseProvider == trainingCourseProvider) &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.track, track) || other.track == track) &&
            (identical(other.trackTranslation, trackTranslation) ||
                other.trackTranslation == trackTranslation) &&
            (identical(other.registered, registered) ||
                other.registered == registered));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      lookup,
      const DeepCollectionEquality().hash(_translations),
      const DeepCollectionEquality().hash(_categories),
      interested,
      fee,
      isFree,
      certificateType,
      certificateTypeTranslation,
      trainingCourseProvider,
      session,
      track,
      trackTranslation,
      registered);

  /// Create a copy of TrainingCourse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrainingCourseImplCopyWith<_$TrainingCourseImpl> get copyWith =>
      __$$TrainingCourseImplCopyWithImpl<_$TrainingCourseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrainingCourseImplToJson(
      this,
    );
  }
}

abstract class _TrainingCourse implements TrainingCourse {
  const factory _TrainingCourse(
          {@JsonKey(name: "Id") required final int id,
          @JsonKey(name: "Lookup") required final Lookup lookup,
          @JsonKey(name: "Translations")
          final List<SummaryTranslation> translations,
          @JsonKey(name: "Categories") final List<Category> categories,
          @JsonKey(name: "Interested") final bool interested,
          @JsonKey(name: "Fee") final double fee,
          @JsonKey(name: "IsFree") final bool isFree,
          @JsonKey(name: "CertificateType") final int certificateType,
          @JsonKey(name: "CertificateTypeTranslation")
          required final KeyValueTranslation certificateTypeTranslation,
          @JsonKey(name: "TrainingCourseProvider")
          required final Provider trainingCourseProvider,
          @JsonKey(name: "Session") final Session? session,
          @JsonKey(name: "Track") final int track,
          @JsonKey(name: "TrackTranslation")
          final KeyValueTranslation? trackTranslation,
          @JsonKey(name: "Registered") final bool registered}) =
      _$TrainingCourseImpl;

  factory _TrainingCourse.fromJson(Map<String, dynamic> json) =
      _$TrainingCourseImpl.fromJson;

  @override
  @JsonKey(name: "Id")
  int get id;
  @override
  @JsonKey(name: "Lookup")
  Lookup get lookup;
  @override
  @JsonKey(name: "Translations")
  List<SummaryTranslation> get translations;
  @override
  @JsonKey(name: "Categories")
  List<Category> get categories;
  @override
  @JsonKey(name: "Interested")
  bool get interested;
  @override
  @JsonKey(name: "Fee")
  double get fee;
  @override
  @JsonKey(name: "IsFree")
  bool get isFree;
  @override
  @JsonKey(name: "CertificateType")
  int get certificateType;
  @override
  @JsonKey(name: "CertificateTypeTranslation")
  KeyValueTranslation get certificateTypeTranslation;
  @override
  @JsonKey(name: "TrainingCourseProvider")
  Provider get trainingCourseProvider;
  @override
  @JsonKey(name: "Session")
  Session? get session;
  @override
  @JsonKey(name: "Track")
  int get track;
  @override
  @JsonKey(name: "TrackTranslation")
  KeyValueTranslation? get trackTranslation;
  @override
  @JsonKey(name: "Registered")
  bool get registered;

  /// Create a copy of TrainingCourse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrainingCourseImplCopyWith<_$TrainingCourseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Lookup _$LookupFromJson(Map<String, dynamic> json) {
  return _Lookup.fromJson(json);
}

/// @nodoc
mixin _$Lookup {
  @JsonKey(name: "Translations")
  List<NameTranslation> get translations => throw _privateConstructorUsedError;
  @JsonKey(name: "CanDeleted")
  bool get canDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: "Id")
  int get id => throw _privateConstructorUsedError;

  /// Serializes this Lookup to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Lookup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LookupCopyWith<Lookup> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LookupCopyWith<$Res> {
  factory $LookupCopyWith(Lookup value, $Res Function(Lookup) then) =
      _$LookupCopyWithImpl<$Res, Lookup>;
  @useResult
  $Res call(
      {@JsonKey(name: "Translations") List<NameTranslation> translations,
      @JsonKey(name: "CanDeleted") bool canDeleted,
      @JsonKey(name: "Id") int id});
}

/// @nodoc
class _$LookupCopyWithImpl<$Res, $Val extends Lookup>
    implements $LookupCopyWith<$Res> {
  _$LookupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Lookup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? translations = null,
    Object? canDeleted = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      translations: null == translations
          ? _value.translations
          : translations // ignore: cast_nullable_to_non_nullable
              as List<NameTranslation>,
      canDeleted: null == canDeleted
          ? _value.canDeleted
          : canDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LookupImplCopyWith<$Res> implements $LookupCopyWith<$Res> {
  factory _$$LookupImplCopyWith(
          _$LookupImpl value, $Res Function(_$LookupImpl) then) =
      __$$LookupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Translations") List<NameTranslation> translations,
      @JsonKey(name: "CanDeleted") bool canDeleted,
      @JsonKey(name: "Id") int id});
}

/// @nodoc
class __$$LookupImplCopyWithImpl<$Res>
    extends _$LookupCopyWithImpl<$Res, _$LookupImpl>
    implements _$$LookupImplCopyWith<$Res> {
  __$$LookupImplCopyWithImpl(
      _$LookupImpl _value, $Res Function(_$LookupImpl) _then)
      : super(_value, _then);

  /// Create a copy of Lookup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? translations = null,
    Object? canDeleted = null,
    Object? id = null,
  }) {
    return _then(_$LookupImpl(
      translations: null == translations
          ? _value._translations
          : translations // ignore: cast_nullable_to_non_nullable
              as List<NameTranslation>,
      canDeleted: null == canDeleted
          ? _value.canDeleted
          : canDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LookupImpl implements _Lookup {
  const _$LookupImpl(
      {@JsonKey(name: "Translations")
      final List<NameTranslation> translations = const [],
      @JsonKey(name: "CanDeleted") this.canDeleted = false,
      @JsonKey(name: "Id") required this.id})
      : _translations = translations;

  factory _$LookupImpl.fromJson(Map<String, dynamic> json) =>
      _$$LookupImplFromJson(json);

  final List<NameTranslation> _translations;
  @override
  @JsonKey(name: "Translations")
  List<NameTranslation> get translations {
    if (_translations is EqualUnmodifiableListView) return _translations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_translations);
  }

  @override
  @JsonKey(name: "CanDeleted")
  final bool canDeleted;
  @override
  @JsonKey(name: "Id")
  final int id;

  @override
  String toString() {
    return 'Lookup(translations: $translations, canDeleted: $canDeleted, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LookupImpl &&
            const DeepCollectionEquality()
                .equals(other._translations, _translations) &&
            (identical(other.canDeleted, canDeleted) ||
                other.canDeleted == canDeleted) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_translations), canDeleted, id);

  /// Create a copy of Lookup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LookupImplCopyWith<_$LookupImpl> get copyWith =>
      __$$LookupImplCopyWithImpl<_$LookupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LookupImplToJson(
      this,
    );
  }
}

abstract class _Lookup implements Lookup {
  const factory _Lookup(
      {@JsonKey(name: "Translations") final List<NameTranslation> translations,
      @JsonKey(name: "CanDeleted") final bool canDeleted,
      @JsonKey(name: "Id") required final int id}) = _$LookupImpl;

  factory _Lookup.fromJson(Map<String, dynamic> json) = _$LookupImpl.fromJson;

  @override
  @JsonKey(name: "Translations")
  List<NameTranslation> get translations;
  @override
  @JsonKey(name: "CanDeleted")
  bool get canDeleted;
  @override
  @JsonKey(name: "Id")
  int get id;

  /// Create a copy of Lookup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LookupImplCopyWith<_$LookupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NameTranslation _$NameTranslationFromJson(Map<String, dynamic> json) {
  return _NameTranslation.fromJson(json);
}

/// @nodoc
mixin _$NameTranslation {
  @JsonKey(name: "LanguageId")
  int get languageId => throw _privateConstructorUsedError;
  @JsonKey(name: "Name")
  String get name => throw _privateConstructorUsedError;

  /// Serializes this NameTranslation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NameTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NameTranslationCopyWith<NameTranslation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NameTranslationCopyWith<$Res> {
  factory $NameTranslationCopyWith(
          NameTranslation value, $Res Function(NameTranslation) then) =
      _$NameTranslationCopyWithImpl<$Res, NameTranslation>;
  @useResult
  $Res call(
      {@JsonKey(name: "LanguageId") int languageId,
      @JsonKey(name: "Name") String name});
}

/// @nodoc
class _$NameTranslationCopyWithImpl<$Res, $Val extends NameTranslation>
    implements $NameTranslationCopyWith<$Res> {
  _$NameTranslationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NameTranslation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageId = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      languageId: null == languageId
          ? _value.languageId
          : languageId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NameTranslationImplCopyWith<$Res>
    implements $NameTranslationCopyWith<$Res> {
  factory _$$NameTranslationImplCopyWith(_$NameTranslationImpl value,
          $Res Function(_$NameTranslationImpl) then) =
      __$$NameTranslationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "LanguageId") int languageId,
      @JsonKey(name: "Name") String name});
}

/// @nodoc
class __$$NameTranslationImplCopyWithImpl<$Res>
    extends _$NameTranslationCopyWithImpl<$Res, _$NameTranslationImpl>
    implements _$$NameTranslationImplCopyWith<$Res> {
  __$$NameTranslationImplCopyWithImpl(
      _$NameTranslationImpl _value, $Res Function(_$NameTranslationImpl) _then)
      : super(_value, _then);

  /// Create a copy of NameTranslation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageId = null,
    Object? name = null,
  }) {
    return _then(_$NameTranslationImpl(
      languageId: null == languageId
          ? _value.languageId
          : languageId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NameTranslationImpl implements _NameTranslation {
  const _$NameTranslationImpl(
      {@JsonKey(name: "LanguageId") this.languageId = 0,
      @JsonKey(name: "Name") this.name = ''});

  factory _$NameTranslationImpl.fromJson(Map<String, dynamic> json) =>
      _$$NameTranslationImplFromJson(json);

  @override
  @JsonKey(name: "LanguageId")
  final int languageId;
  @override
  @JsonKey(name: "Name")
  final String name;

  @override
  String toString() {
    return 'NameTranslation(languageId: $languageId, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NameTranslationImpl &&
            (identical(other.languageId, languageId) ||
                other.languageId == languageId) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, languageId, name);

  /// Create a copy of NameTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NameTranslationImplCopyWith<_$NameTranslationImpl> get copyWith =>
      __$$NameTranslationImplCopyWithImpl<_$NameTranslationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NameTranslationImplToJson(
      this,
    );
  }
}

abstract class _NameTranslation implements NameTranslation {
  const factory _NameTranslation(
      {@JsonKey(name: "LanguageId") final int languageId,
      @JsonKey(name: "Name") final String name}) = _$NameTranslationImpl;

  factory _NameTranslation.fromJson(Map<String, dynamic> json) =
      _$NameTranslationImpl.fromJson;

  @override
  @JsonKey(name: "LanguageId")
  int get languageId;
  @override
  @JsonKey(name: "Name")
  String get name;

  /// Create a copy of NameTranslation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NameTranslationImplCopyWith<_$NameTranslationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SummaryTranslation _$SummaryTranslationFromJson(Map<String, dynamic> json) {
  return _SummaryTranslation.fromJson(json);
}

/// @nodoc
mixin _$SummaryTranslation {
  @JsonKey(name: "LanguageId")
  int get languageId => throw _privateConstructorUsedError;
  @JsonKey(name: "Summary")
  String get summary => throw _privateConstructorUsedError;

  /// Serializes this SummaryTranslation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SummaryTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SummaryTranslationCopyWith<SummaryTranslation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryTranslationCopyWith<$Res> {
  factory $SummaryTranslationCopyWith(
          SummaryTranslation value, $Res Function(SummaryTranslation) then) =
      _$SummaryTranslationCopyWithImpl<$Res, SummaryTranslation>;
  @useResult
  $Res call(
      {@JsonKey(name: "LanguageId") int languageId,
      @JsonKey(name: "Summary") String summary});
}

/// @nodoc
class _$SummaryTranslationCopyWithImpl<$Res, $Val extends SummaryTranslation>
    implements $SummaryTranslationCopyWith<$Res> {
  _$SummaryTranslationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SummaryTranslation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageId = null,
    Object? summary = null,
  }) {
    return _then(_value.copyWith(
      languageId: null == languageId
          ? _value.languageId
          : languageId // ignore: cast_nullable_to_non_nullable
              as int,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SummaryTranslationImplCopyWith<$Res>
    implements $SummaryTranslationCopyWith<$Res> {
  factory _$$SummaryTranslationImplCopyWith(_$SummaryTranslationImpl value,
          $Res Function(_$SummaryTranslationImpl) then) =
      __$$SummaryTranslationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "LanguageId") int languageId,
      @JsonKey(name: "Summary") String summary});
}

/// @nodoc
class __$$SummaryTranslationImplCopyWithImpl<$Res>
    extends _$SummaryTranslationCopyWithImpl<$Res, _$SummaryTranslationImpl>
    implements _$$SummaryTranslationImplCopyWith<$Res> {
  __$$SummaryTranslationImplCopyWithImpl(_$SummaryTranslationImpl _value,
      $Res Function(_$SummaryTranslationImpl) _then)
      : super(_value, _then);

  /// Create a copy of SummaryTranslation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageId = null,
    Object? summary = null,
  }) {
    return _then(_$SummaryTranslationImpl(
      languageId: null == languageId
          ? _value.languageId
          : languageId // ignore: cast_nullable_to_non_nullable
              as int,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SummaryTranslationImpl implements _SummaryTranslation {
  const _$SummaryTranslationImpl(
      {@JsonKey(name: "LanguageId") this.languageId = 0,
      @JsonKey(name: "Summary") this.summary = ''});

  factory _$SummaryTranslationImpl.fromJson(Map<String, dynamic> json) =>
      _$$SummaryTranslationImplFromJson(json);

  @override
  @JsonKey(name: "LanguageId")
  final int languageId;
  @override
  @JsonKey(name: "Summary")
  final String summary;

  @override
  String toString() {
    return 'SummaryTranslation(languageId: $languageId, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryTranslationImpl &&
            (identical(other.languageId, languageId) ||
                other.languageId == languageId) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, languageId, summary);

  /// Create a copy of SummaryTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SummaryTranslationImplCopyWith<_$SummaryTranslationImpl> get copyWith =>
      __$$SummaryTranslationImplCopyWithImpl<_$SummaryTranslationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SummaryTranslationImplToJson(
      this,
    );
  }
}

abstract class _SummaryTranslation implements SummaryTranslation {
  const factory _SummaryTranslation(
          {@JsonKey(name: "LanguageId") final int languageId,
          @JsonKey(name: "Summary") final String summary}) =
      _$SummaryTranslationImpl;

  factory _SummaryTranslation.fromJson(Map<String, dynamic> json) =
      _$SummaryTranslationImpl.fromJson;

  @override
  @JsonKey(name: "LanguageId")
  int get languageId;
  @override
  @JsonKey(name: "Summary")
  String get summary;

  /// Create a copy of SummaryTranslation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SummaryTranslationImplCopyWith<_$SummaryTranslationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  @JsonKey(name: "Id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "Translations")
  List<CategoryTranslation> get translations =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "ShowInHeader")
  bool get showInHeader => throw _privateConstructorUsedError;
  @JsonKey(name: "IsDefault")
  bool get isDefault => throw _privateConstructorUsedError;
  @JsonKey(name: "IsAutoSelected")
  bool get isAutoSelected => throw _privateConstructorUsedError;
  @JsonKey(name: "Picture")
  Picture? get picture => throw _privateConstructorUsedError;

  /// Serializes this Category to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "Translations") List<CategoryTranslation> translations,
      @JsonKey(name: "ShowInHeader") bool showInHeader,
      @JsonKey(name: "IsDefault") bool isDefault,
      @JsonKey(name: "IsAutoSelected") bool isAutoSelected,
      @JsonKey(name: "Picture") Picture? picture});

  $PictureCopyWith<$Res>? get picture;
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? translations = null,
    Object? showInHeader = null,
    Object? isDefault = null,
    Object? isAutoSelected = null,
    Object? picture = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      translations: null == translations
          ? _value.translations
          : translations // ignore: cast_nullable_to_non_nullable
              as List<CategoryTranslation>,
      showInHeader: null == showInHeader
          ? _value.showInHeader
          : showInHeader // ignore: cast_nullable_to_non_nullable
              as bool,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      isAutoSelected: null == isAutoSelected
          ? _value.isAutoSelected
          : isAutoSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as Picture?,
    ) as $Val);
  }

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PictureCopyWith<$Res>? get picture {
    if (_value.picture == null) {
      return null;
    }

    return $PictureCopyWith<$Res>(_value.picture!, (value) {
      return _then(_value.copyWith(picture: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CategoryImplCopyWith<$Res>
    implements $CategoryCopyWith<$Res> {
  factory _$$CategoryImplCopyWith(
          _$CategoryImpl value, $Res Function(_$CategoryImpl) then) =
      __$$CategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "Translations") List<CategoryTranslation> translations,
      @JsonKey(name: "ShowInHeader") bool showInHeader,
      @JsonKey(name: "IsDefault") bool isDefault,
      @JsonKey(name: "IsAutoSelected") bool isAutoSelected,
      @JsonKey(name: "Picture") Picture? picture});

  @override
  $PictureCopyWith<$Res>? get picture;
}

/// @nodoc
class __$$CategoryImplCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$CategoryImpl>
    implements _$$CategoryImplCopyWith<$Res> {
  __$$CategoryImplCopyWithImpl(
      _$CategoryImpl _value, $Res Function(_$CategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? translations = null,
    Object? showInHeader = null,
    Object? isDefault = null,
    Object? isAutoSelected = null,
    Object? picture = freezed,
  }) {
    return _then(_$CategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      translations: null == translations
          ? _value._translations
          : translations // ignore: cast_nullable_to_non_nullable
              as List<CategoryTranslation>,
      showInHeader: null == showInHeader
          ? _value.showInHeader
          : showInHeader // ignore: cast_nullable_to_non_nullable
              as bool,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      isAutoSelected: null == isAutoSelected
          ? _value.isAutoSelected
          : isAutoSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as Picture?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryImpl implements _Category {
  const _$CategoryImpl(
      {@JsonKey(name: "Id") required this.id,
      @JsonKey(name: "Translations")
      final List<CategoryTranslation> translations = const [],
      @JsonKey(name: "ShowInHeader") this.showInHeader = false,
      @JsonKey(name: "IsDefault") this.isDefault = false,
      @JsonKey(name: "IsAutoSelected") this.isAutoSelected = false,
      @JsonKey(name: "Picture") this.picture})
      : _translations = translations;

  factory _$CategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImplFromJson(json);

  @override
  @JsonKey(name: "Id")
  final int id;
  final List<CategoryTranslation> _translations;
  @override
  @JsonKey(name: "Translations")
  List<CategoryTranslation> get translations {
    if (_translations is EqualUnmodifiableListView) return _translations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_translations);
  }

  @override
  @JsonKey(name: "ShowInHeader")
  final bool showInHeader;
  @override
  @JsonKey(name: "IsDefault")
  final bool isDefault;
  @override
  @JsonKey(name: "IsAutoSelected")
  final bool isAutoSelected;
  @override
  @JsonKey(name: "Picture")
  final Picture? picture;

  @override
  String toString() {
    return 'Category(id: $id, translations: $translations, showInHeader: $showInHeader, isDefault: $isDefault, isAutoSelected: $isAutoSelected, picture: $picture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._translations, _translations) &&
            (identical(other.showInHeader, showInHeader) ||
                other.showInHeader == showInHeader) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.isAutoSelected, isAutoSelected) ||
                other.isAutoSelected == isAutoSelected) &&
            (identical(other.picture, picture) || other.picture == picture));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_translations),
      showInHeader,
      isDefault,
      isAutoSelected,
      picture);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      __$$CategoryImplCopyWithImpl<_$CategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryImplToJson(
      this,
    );
  }
}

abstract class _Category implements Category {
  const factory _Category(
      {@JsonKey(name: "Id") required final int id,
      @JsonKey(name: "Translations")
      final List<CategoryTranslation> translations,
      @JsonKey(name: "ShowInHeader") final bool showInHeader,
      @JsonKey(name: "IsDefault") final bool isDefault,
      @JsonKey(name: "IsAutoSelected") final bool isAutoSelected,
      @JsonKey(name: "Picture") final Picture? picture}) = _$CategoryImpl;

  factory _Category.fromJson(Map<String, dynamic> json) =
      _$CategoryImpl.fromJson;

  @override
  @JsonKey(name: "Id")
  int get id;
  @override
  @JsonKey(name: "Translations")
  List<CategoryTranslation> get translations;
  @override
  @JsonKey(name: "ShowInHeader")
  bool get showInHeader;
  @override
  @JsonKey(name: "IsDefault")
  bool get isDefault;
  @override
  @JsonKey(name: "IsAutoSelected")
  bool get isAutoSelected;
  @override
  @JsonKey(name: "Picture")
  Picture? get picture;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryTranslation _$CategoryTranslationFromJson(Map<String, dynamic> json) {
  return _CategoryTranslation.fromJson(json);
}

/// @nodoc
mixin _$CategoryTranslation {
  @JsonKey(name: "LanguageId")
  int get languageId => throw _privateConstructorUsedError;
  @JsonKey(name: "Name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "Description")
  String get description => throw _privateConstructorUsedError;

  /// Serializes this CategoryTranslation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryTranslationCopyWith<CategoryTranslation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryTranslationCopyWith<$Res> {
  factory $CategoryTranslationCopyWith(
          CategoryTranslation value, $Res Function(CategoryTranslation) then) =
      _$CategoryTranslationCopyWithImpl<$Res, CategoryTranslation>;
  @useResult
  $Res call(
      {@JsonKey(name: "LanguageId") int languageId,
      @JsonKey(name: "Name") String name,
      @JsonKey(name: "Description") String description});
}

/// @nodoc
class _$CategoryTranslationCopyWithImpl<$Res, $Val extends CategoryTranslation>
    implements $CategoryTranslationCopyWith<$Res> {
  _$CategoryTranslationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryTranslation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageId = null,
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      languageId: null == languageId
          ? _value.languageId
          : languageId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryTranslationImplCopyWith<$Res>
    implements $CategoryTranslationCopyWith<$Res> {
  factory _$$CategoryTranslationImplCopyWith(_$CategoryTranslationImpl value,
          $Res Function(_$CategoryTranslationImpl) then) =
      __$$CategoryTranslationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "LanguageId") int languageId,
      @JsonKey(name: "Name") String name,
      @JsonKey(name: "Description") String description});
}

/// @nodoc
class __$$CategoryTranslationImplCopyWithImpl<$Res>
    extends _$CategoryTranslationCopyWithImpl<$Res, _$CategoryTranslationImpl>
    implements _$$CategoryTranslationImplCopyWith<$Res> {
  __$$CategoryTranslationImplCopyWithImpl(_$CategoryTranslationImpl _value,
      $Res Function(_$CategoryTranslationImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryTranslation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageId = null,
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_$CategoryTranslationImpl(
      languageId: null == languageId
          ? _value.languageId
          : languageId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryTranslationImpl implements _CategoryTranslation {
  const _$CategoryTranslationImpl(
      {@JsonKey(name: "LanguageId") this.languageId = 0,
      @JsonKey(name: "Name") this.name = '',
      @JsonKey(name: "Description") this.description = ''});

  factory _$CategoryTranslationImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryTranslationImplFromJson(json);

  @override
  @JsonKey(name: "LanguageId")
  final int languageId;
  @override
  @JsonKey(name: "Name")
  final String name;
  @override
  @JsonKey(name: "Description")
  final String description;

  @override
  String toString() {
    return 'CategoryTranslation(languageId: $languageId, name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryTranslationImpl &&
            (identical(other.languageId, languageId) ||
                other.languageId == languageId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, languageId, name, description);

  /// Create a copy of CategoryTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryTranslationImplCopyWith<_$CategoryTranslationImpl> get copyWith =>
      __$$CategoryTranslationImplCopyWithImpl<_$CategoryTranslationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryTranslationImplToJson(
      this,
    );
  }
}

abstract class _CategoryTranslation implements CategoryTranslation {
  const factory _CategoryTranslation(
          {@JsonKey(name: "LanguageId") final int languageId,
          @JsonKey(name: "Name") final String name,
          @JsonKey(name: "Description") final String description}) =
      _$CategoryTranslationImpl;

  factory _CategoryTranslation.fromJson(Map<String, dynamic> json) =
      _$CategoryTranslationImpl.fromJson;

  @override
  @JsonKey(name: "LanguageId")
  int get languageId;
  @override
  @JsonKey(name: "Name")
  String get name;
  @override
  @JsonKey(name: "Description")
  String get description;

  /// Create a copy of CategoryTranslation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryTranslationImplCopyWith<_$CategoryTranslationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Picture _$PictureFromJson(Map<String, dynamic> json) {
  return _Picture.fromJson(json);
}

/// @nodoc
mixin _$Picture {
  int get id => throw _privateConstructorUsedError;
  String get mimeType => throw _privateConstructorUsedError;
  String get base64File => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;

  /// Serializes this Picture to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Picture
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PictureCopyWith<Picture> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PictureCopyWith<$Res> {
  factory $PictureCopyWith(Picture value, $Res Function(Picture) then) =
      _$PictureCopyWithImpl<$Res, Picture>;
  @useResult
  $Res call({int id, String mimeType, String base64File, String fileName});
}

/// @nodoc
class _$PictureCopyWithImpl<$Res, $Val extends Picture>
    implements $PictureCopyWith<$Res> {
  _$PictureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Picture
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mimeType = null,
    Object? base64File = null,
    Object? fileName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      base64File: null == base64File
          ? _value.base64File
          : base64File // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PictureImplCopyWith<$Res> implements $PictureCopyWith<$Res> {
  factory _$$PictureImplCopyWith(
          _$PictureImpl value, $Res Function(_$PictureImpl) then) =
      __$$PictureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String mimeType, String base64File, String fileName});
}

/// @nodoc
class __$$PictureImplCopyWithImpl<$Res>
    extends _$PictureCopyWithImpl<$Res, _$PictureImpl>
    implements _$$PictureImplCopyWith<$Res> {
  __$$PictureImplCopyWithImpl(
      _$PictureImpl _value, $Res Function(_$PictureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Picture
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mimeType = null,
    Object? base64File = null,
    Object? fileName = null,
  }) {
    return _then(_$PictureImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      base64File: null == base64File
          ? _value.base64File
          : base64File // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PictureImpl implements _Picture {
  const _$PictureImpl(
      {this.id = 0,
      this.mimeType = '',
      this.base64File = '',
      this.fileName = ''});

  factory _$PictureImpl.fromJson(Map<String, dynamic> json) =>
      _$$PictureImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String mimeType;
  @override
  @JsonKey()
  final String base64File;
  @override
  @JsonKey()
  final String fileName;

  @override
  String toString() {
    return 'Picture(id: $id, mimeType: $mimeType, base64File: $base64File, fileName: $fileName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PictureImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.base64File, base64File) ||
                other.base64File == base64File) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, mimeType, base64File, fileName);

  /// Create a copy of Picture
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PictureImplCopyWith<_$PictureImpl> get copyWith =>
      __$$PictureImplCopyWithImpl<_$PictureImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PictureImplToJson(
      this,
    );
  }
}

abstract class _Picture implements Picture {
  const factory _Picture(
      {final int id,
      final String mimeType,
      final String base64File,
      final String fileName}) = _$PictureImpl;

  factory _Picture.fromJson(Map<String, dynamic> json) = _$PictureImpl.fromJson;

  @override
  int get id;
  @override
  String get mimeType;
  @override
  String get base64File;
  @override
  String get fileName;

  /// Create a copy of Picture
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PictureImplCopyWith<_$PictureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KeyValueTranslation _$KeyValueTranslationFromJson(Map<String, dynamic> json) {
  return _KeyValueTranslation.fromJson(json);
}

/// @nodoc
mixin _$KeyValueTranslation {
  @JsonKey(name: "Key")
  List<NameTranslation> get key => throw _privateConstructorUsedError;
  @JsonKey(name: "Value")
  int get value => throw _privateConstructorUsedError;

  /// Serializes this KeyValueTranslation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KeyValueTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KeyValueTranslationCopyWith<KeyValueTranslation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeyValueTranslationCopyWith<$Res> {
  factory $KeyValueTranslationCopyWith(
          KeyValueTranslation value, $Res Function(KeyValueTranslation) then) =
      _$KeyValueTranslationCopyWithImpl<$Res, KeyValueTranslation>;
  @useResult
  $Res call(
      {@JsonKey(name: "Key") List<NameTranslation> key,
      @JsonKey(name: "Value") int value});
}

/// @nodoc
class _$KeyValueTranslationCopyWithImpl<$Res, $Val extends KeyValueTranslation>
    implements $KeyValueTranslationCopyWith<$Res> {
  _$KeyValueTranslationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KeyValueTranslation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as List<NameTranslation>,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KeyValueTranslationImplCopyWith<$Res>
    implements $KeyValueTranslationCopyWith<$Res> {
  factory _$$KeyValueTranslationImplCopyWith(_$KeyValueTranslationImpl value,
          $Res Function(_$KeyValueTranslationImpl) then) =
      __$$KeyValueTranslationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Key") List<NameTranslation> key,
      @JsonKey(name: "Value") int value});
}

/// @nodoc
class __$$KeyValueTranslationImplCopyWithImpl<$Res>
    extends _$KeyValueTranslationCopyWithImpl<$Res, _$KeyValueTranslationImpl>
    implements _$$KeyValueTranslationImplCopyWith<$Res> {
  __$$KeyValueTranslationImplCopyWithImpl(_$KeyValueTranslationImpl _value,
      $Res Function(_$KeyValueTranslationImpl) _then)
      : super(_value, _then);

  /// Create a copy of KeyValueTranslation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? value = null,
  }) {
    return _then(_$KeyValueTranslationImpl(
      key: null == key
          ? _value._key
          : key // ignore: cast_nullable_to_non_nullable
              as List<NameTranslation>,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KeyValueTranslationImpl implements _KeyValueTranslation {
  const _$KeyValueTranslationImpl(
      {@JsonKey(name: "Key") final List<NameTranslation> key = const [],
      @JsonKey(name: "Value") required this.value})
      : _key = key;

  factory _$KeyValueTranslationImpl.fromJson(Map<String, dynamic> json) =>
      _$$KeyValueTranslationImplFromJson(json);

  final List<NameTranslation> _key;
  @override
  @JsonKey(name: "Key")
  List<NameTranslation> get key {
    if (_key is EqualUnmodifiableListView) return _key;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_key);
  }

  @override
  @JsonKey(name: "Value")
  final int value;

  @override
  String toString() {
    return 'KeyValueTranslation(key: $key, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeyValueTranslationImpl &&
            const DeepCollectionEquality().equals(other._key, _key) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_key), value);

  /// Create a copy of KeyValueTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KeyValueTranslationImplCopyWith<_$KeyValueTranslationImpl> get copyWith =>
      __$$KeyValueTranslationImplCopyWithImpl<_$KeyValueTranslationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KeyValueTranslationImplToJson(
      this,
    );
  }
}

abstract class _KeyValueTranslation implements KeyValueTranslation {
  const factory _KeyValueTranslation(
          {@JsonKey(name: "Key") final List<NameTranslation> key,
          @JsonKey(name: "Value") required final int value}) =
      _$KeyValueTranslationImpl;

  factory _KeyValueTranslation.fromJson(Map<String, dynamic> json) =
      _$KeyValueTranslationImpl.fromJson;

  @override
  @JsonKey(name: "Key")
  List<NameTranslation> get key;
  @override
  @JsonKey(name: "Value")
  int get value;

  /// Create a copy of KeyValueTranslation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KeyValueTranslationImplCopyWith<_$KeyValueTranslationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Provider _$ProviderFromJson(Map<String, dynamic> json) {
  return _Provider.fromJson(json);
}

/// @nodoc
mixin _$Provider {
  @JsonKey(name: "Id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "IsActive")
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: "Translations")
  List<NameTranslation> get translations => throw _privateConstructorUsedError;
  @JsonKey(name: "CanDeleted")
  bool get canDeleted => throw _privateConstructorUsedError;

  /// Serializes this Provider to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Provider
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProviderCopyWith<Provider> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProviderCopyWith<$Res> {
  factory $ProviderCopyWith(Provider value, $Res Function(Provider) then) =
      _$ProviderCopyWithImpl<$Res, Provider>;
  @useResult
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "IsActive") bool isActive,
      @JsonKey(name: "Translations") List<NameTranslation> translations,
      @JsonKey(name: "CanDeleted") bool canDeleted});
}

/// @nodoc
class _$ProviderCopyWithImpl<$Res, $Val extends Provider>
    implements $ProviderCopyWith<$Res> {
  _$ProviderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Provider
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isActive = null,
    Object? translations = null,
    Object? canDeleted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      translations: null == translations
          ? _value.translations
          : translations // ignore: cast_nullable_to_non_nullable
              as List<NameTranslation>,
      canDeleted: null == canDeleted
          ? _value.canDeleted
          : canDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProviderImplCopyWith<$Res>
    implements $ProviderCopyWith<$Res> {
  factory _$$ProviderImplCopyWith(
          _$ProviderImpl value, $Res Function(_$ProviderImpl) then) =
      __$$ProviderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "IsActive") bool isActive,
      @JsonKey(name: "Translations") List<NameTranslation> translations,
      @JsonKey(name: "CanDeleted") bool canDeleted});
}

/// @nodoc
class __$$ProviderImplCopyWithImpl<$Res>
    extends _$ProviderCopyWithImpl<$Res, _$ProviderImpl>
    implements _$$ProviderImplCopyWith<$Res> {
  __$$ProviderImplCopyWithImpl(
      _$ProviderImpl _value, $Res Function(_$ProviderImpl) _then)
      : super(_value, _then);

  /// Create a copy of Provider
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isActive = null,
    Object? translations = null,
    Object? canDeleted = null,
  }) {
    return _then(_$ProviderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      translations: null == translations
          ? _value._translations
          : translations // ignore: cast_nullable_to_non_nullable
              as List<NameTranslation>,
      canDeleted: null == canDeleted
          ? _value.canDeleted
          : canDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProviderImpl implements _Provider {
  const _$ProviderImpl(
      {@JsonKey(name: "Id") required this.id,
      @JsonKey(name: "IsActive") this.isActive = false,
      @JsonKey(name: "Translations")
      final List<NameTranslation> translations = const [],
      @JsonKey(name: "CanDeleted") this.canDeleted = false})
      : _translations = translations;

  factory _$ProviderImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProviderImplFromJson(json);

  @override
  @JsonKey(name: "Id")
  final int id;
  @override
  @JsonKey(name: "IsActive")
  final bool isActive;
  final List<NameTranslation> _translations;
  @override
  @JsonKey(name: "Translations")
  List<NameTranslation> get translations {
    if (_translations is EqualUnmodifiableListView) return _translations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_translations);
  }

  @override
  @JsonKey(name: "CanDeleted")
  final bool canDeleted;

  @override
  String toString() {
    return 'Provider(id: $id, isActive: $isActive, translations: $translations, canDeleted: $canDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProviderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other._translations, _translations) &&
            (identical(other.canDeleted, canDeleted) ||
                other.canDeleted == canDeleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, isActive,
      const DeepCollectionEquality().hash(_translations), canDeleted);

  /// Create a copy of Provider
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProviderImplCopyWith<_$ProviderImpl> get copyWith =>
      __$$ProviderImplCopyWithImpl<_$ProviderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProviderImplToJson(
      this,
    );
  }
}

abstract class _Provider implements Provider {
  const factory _Provider(
      {@JsonKey(name: "Id") required final int id,
      @JsonKey(name: "IsActive") final bool isActive,
      @JsonKey(name: "Translations") final List<NameTranslation> translations,
      @JsonKey(name: "CanDeleted") final bool canDeleted}) = _$ProviderImpl;

  factory _Provider.fromJson(Map<String, dynamic> json) =
      _$ProviderImpl.fromJson;

  @override
  @JsonKey(name: "Id")
  int get id;
  @override
  @JsonKey(name: "IsActive")
  bool get isActive;
  @override
  @JsonKey(name: "Translations")
  List<NameTranslation> get translations;
  @override
  @JsonKey(name: "CanDeleted")
  bool get canDeleted;

  /// Create a copy of Provider
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProviderImplCopyWith<_$ProviderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Session _$SessionFromJson(Map<String, dynamic> json) {
  return _Session.fromJson(json);
}

/// @nodoc
mixin _$Session {
  int get id => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  KeyValueTranslation get statusTranslation =>
      throw _privateConstructorUsedError;

  /// Serializes this Session to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionCopyWith<Session> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionCopyWith<$Res> {
  factory $SessionCopyWith(Session value, $Res Function(Session) then) =
      _$SessionCopyWithImpl<$Res, Session>;
  @useResult
  $Res call(
      {int id,
      String startDate,
      String endDate,
      int status,
      KeyValueTranslation statusTranslation});

  $KeyValueTranslationCopyWith<$Res> get statusTranslation;
}

/// @nodoc
class _$SessionCopyWithImpl<$Res, $Val extends Session>
    implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? status = null,
    Object? statusTranslation = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      statusTranslation: null == statusTranslation
          ? _value.statusTranslation
          : statusTranslation // ignore: cast_nullable_to_non_nullable
              as KeyValueTranslation,
    ) as $Val);
  }

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KeyValueTranslationCopyWith<$Res> get statusTranslation {
    return $KeyValueTranslationCopyWith<$Res>(_value.statusTranslation,
        (value) {
      return _then(_value.copyWith(statusTranslation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SessionImplCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$$SessionImplCopyWith(
          _$SessionImpl value, $Res Function(_$SessionImpl) then) =
      __$$SessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String startDate,
      String endDate,
      int status,
      KeyValueTranslation statusTranslation});

  @override
  $KeyValueTranslationCopyWith<$Res> get statusTranslation;
}

/// @nodoc
class __$$SessionImplCopyWithImpl<$Res>
    extends _$SessionCopyWithImpl<$Res, _$SessionImpl>
    implements _$$SessionImplCopyWith<$Res> {
  __$$SessionImplCopyWithImpl(
      _$SessionImpl _value, $Res Function(_$SessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? status = null,
    Object? statusTranslation = null,
  }) {
    return _then(_$SessionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      statusTranslation: null == statusTranslation
          ? _value.statusTranslation
          : statusTranslation // ignore: cast_nullable_to_non_nullable
              as KeyValueTranslation,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionImpl implements _Session {
  const _$SessionImpl(
      {required this.id,
      required this.startDate,
      required this.endDate,
      this.status = 0,
      required this.statusTranslation});

  factory _$SessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionImplFromJson(json);

  @override
  final int id;
  @override
  final String startDate;
  @override
  final String endDate;
  @override
  @JsonKey()
  final int status;
  @override
  final KeyValueTranslation statusTranslation;

  @override
  String toString() {
    return 'Session(id: $id, startDate: $startDate, endDate: $endDate, status: $status, statusTranslation: $statusTranslation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusTranslation, statusTranslation) ||
                other.statusTranslation == statusTranslation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, startDate, endDate, status, statusTranslation);

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionImplCopyWith<_$SessionImpl> get copyWith =>
      __$$SessionImplCopyWithImpl<_$SessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionImplToJson(
      this,
    );
  }
}

abstract class _Session implements Session {
  const factory _Session(
      {required final int id,
      required final String startDate,
      required final String endDate,
      final int status,
      required final KeyValueTranslation statusTranslation}) = _$SessionImpl;

  factory _Session.fromJson(Map<String, dynamic> json) = _$SessionImpl.fromJson;

  @override
  int get id;
  @override
  String get startDate;
  @override
  String get endDate;
  @override
  int get status;
  @override
  KeyValueTranslation get statusTranslation;

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionImplCopyWith<_$SessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
