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
      @JsonKey(name: "Picture") this.picture = null})
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
  @JsonKey(name: "Id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "MimeType")
  String get mimeType => throw _privateConstructorUsedError;
  @JsonKey(name: "Base64File")
  String get base64File => throw _privateConstructorUsedError;
  @JsonKey(name: "FileName")
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
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "MimeType") String mimeType,
      @JsonKey(name: "Base64File") String base64File,
      @JsonKey(name: "FileName") String fileName});
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
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "MimeType") String mimeType,
      @JsonKey(name: "Base64File") String base64File,
      @JsonKey(name: "FileName") String fileName});
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
      {@JsonKey(name: "Id") this.id = 0,
      @JsonKey(name: "MimeType") this.mimeType = '',
      @JsonKey(name: "Base64File") this.base64File = '',
      @JsonKey(name: "FileName") this.fileName = ''});

  factory _$PictureImpl.fromJson(Map<String, dynamic> json) =>
      _$$PictureImplFromJson(json);

  @override
  @JsonKey(name: "Id")
  final int id;
  @override
  @JsonKey(name: "MimeType")
  final String mimeType;
  @override
  @JsonKey(name: "Base64File")
  final String base64File;
  @override
  @JsonKey(name: "FileName")
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
      {@JsonKey(name: "Id") final int id,
      @JsonKey(name: "MimeType") final String mimeType,
      @JsonKey(name: "Base64File") final String base64File,
      @JsonKey(name: "FileName") final String fileName}) = _$PictureImpl;

  factory _Picture.fromJson(Map<String, dynamic> json) = _$PictureImpl.fromJson;

  @override
  @JsonKey(name: "Id")
  int get id;
  @override
  @JsonKey(name: "MimeType")
  String get mimeType;
  @override
  @JsonKey(name: "Base64File")
  String get base64File;
  @override
  @JsonKey(name: "FileName")
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
  @JsonKey(name: "Id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "StartDate")
  String get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: "EndDate")
  String get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: "Status")
  int get status => throw _privateConstructorUsedError;
  @JsonKey(name: "StatusTranslation")
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
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "StartDate") String startDate,
      @JsonKey(name: "EndDate") String endDate,
      @JsonKey(name: "Status") int status,
      @JsonKey(name: "StatusTranslation")
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
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "StartDate") String startDate,
      @JsonKey(name: "EndDate") String endDate,
      @JsonKey(name: "Status") int status,
      @JsonKey(name: "StatusTranslation")
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
      {@JsonKey(name: "Id") required this.id,
      @JsonKey(name: "StartDate") required this.startDate,
      @JsonKey(name: "EndDate") required this.endDate,
      @JsonKey(name: "Status") this.status = 0,
      @JsonKey(name: "StatusTranslation") required this.statusTranslation});

  factory _$SessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionImplFromJson(json);

  @override
  @JsonKey(name: "Id")
  final int id;
  @override
  @JsonKey(name: "StartDate")
  final String startDate;
  @override
  @JsonKey(name: "EndDate")
  final String endDate;
  @override
  @JsonKey(name: "Status")
  final int status;
  @override
  @JsonKey(name: "StatusTranslation")
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
      {@JsonKey(name: "Id") required final int id,
      @JsonKey(name: "StartDate") required final String startDate,
      @JsonKey(name: "EndDate") required final String endDate,
      @JsonKey(name: "Status") final int status,
      @JsonKey(name: "StatusTranslation")
      required final KeyValueTranslation statusTranslation}) = _$SessionImpl;

  factory _Session.fromJson(Map<String, dynamic> json) = _$SessionImpl.fromJson;

  @override
  @JsonKey(name: "Id")
  int get id;
  @override
  @JsonKey(name: "StartDate")
  String get startDate;
  @override
  @JsonKey(name: "EndDate")
  String get endDate;
  @override
  @JsonKey(name: "Status")
  int get status;
  @override
  @JsonKey(name: "StatusTranslation")
  KeyValueTranslation get statusTranslation;

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionImplCopyWith<_$SessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CourseDetailsResponseModel _$CourseDetailsResponseModelFromJson(
    Map<String, dynamic> json) {
  return _CourseDetailsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$CourseDetailsResponseModel {
  @JsonKey(name: "Code")
  int get code => throw _privateConstructorUsedError;
  @JsonKey(name: "Message")
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: "Result")
  bool get result => throw _privateConstructorUsedError;
  @JsonKey(name: "Data")
  CourseDetailsData? get data => throw _privateConstructorUsedError;

  /// Serializes this CourseDetailsResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourseDetailsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseDetailsResponseModelCopyWith<CourseDetailsResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseDetailsResponseModelCopyWith<$Res> {
  factory $CourseDetailsResponseModelCopyWith(CourseDetailsResponseModel value,
          $Res Function(CourseDetailsResponseModel) then) =
      _$CourseDetailsResponseModelCopyWithImpl<$Res,
          CourseDetailsResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "Code") int code,
      @JsonKey(name: "Message") String message,
      @JsonKey(name: "Result") bool result,
      @JsonKey(name: "Data") CourseDetailsData? data});

  $CourseDetailsDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$CourseDetailsResponseModelCopyWithImpl<$Res,
        $Val extends CourseDetailsResponseModel>
    implements $CourseDetailsResponseModelCopyWith<$Res> {
  _$CourseDetailsResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseDetailsResponseModel
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
              as CourseDetailsData?,
    ) as $Val);
  }

  /// Create a copy of CourseDetailsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CourseDetailsDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $CourseDetailsDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CourseDetailsResponseModelImplCopyWith<$Res>
    implements $CourseDetailsResponseModelCopyWith<$Res> {
  factory _$$CourseDetailsResponseModelImplCopyWith(
          _$CourseDetailsResponseModelImpl value,
          $Res Function(_$CourseDetailsResponseModelImpl) then) =
      __$$CourseDetailsResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Code") int code,
      @JsonKey(name: "Message") String message,
      @JsonKey(name: "Result") bool result,
      @JsonKey(name: "Data") CourseDetailsData? data});

  @override
  $CourseDetailsDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$CourseDetailsResponseModelImplCopyWithImpl<$Res>
    extends _$CourseDetailsResponseModelCopyWithImpl<$Res,
        _$CourseDetailsResponseModelImpl>
    implements _$$CourseDetailsResponseModelImplCopyWith<$Res> {
  __$$CourseDetailsResponseModelImplCopyWithImpl(
      _$CourseDetailsResponseModelImpl _value,
      $Res Function(_$CourseDetailsResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourseDetailsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? result = null,
    Object? data = freezed,
  }) {
    return _then(_$CourseDetailsResponseModelImpl(
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
              as CourseDetailsData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseDetailsResponseModelImpl implements _CourseDetailsResponseModel {
  const _$CourseDetailsResponseModelImpl(
      {@JsonKey(name: "Code") this.code = 0,
      @JsonKey(name: "Message") this.message = '',
      @JsonKey(name: "Result") this.result = true,
      @JsonKey(name: "Data") this.data});

  factory _$CourseDetailsResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CourseDetailsResponseModelImplFromJson(json);

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
  final CourseDetailsData? data;

  @override
  String toString() {
    return 'CourseDetailsResponseModel(code: $code, message: $message, result: $result, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseDetailsResponseModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message, result, data);

  /// Create a copy of CourseDetailsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseDetailsResponseModelImplCopyWith<_$CourseDetailsResponseModelImpl>
      get copyWith => __$$CourseDetailsResponseModelImplCopyWithImpl<
          _$CourseDetailsResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseDetailsResponseModelImplToJson(
      this,
    );
  }
}

abstract class _CourseDetailsResponseModel
    implements CourseDetailsResponseModel {
  const factory _CourseDetailsResponseModel(
          {@JsonKey(name: "Code") final int code,
          @JsonKey(name: "Message") final String message,
          @JsonKey(name: "Result") final bool result,
          @JsonKey(name: "Data") final CourseDetailsData? data}) =
      _$CourseDetailsResponseModelImpl;

  factory _CourseDetailsResponseModel.fromJson(Map<String, dynamic> json) =
      _$CourseDetailsResponseModelImpl.fromJson;

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
  CourseDetailsData? get data;

  /// Create a copy of CourseDetailsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseDetailsResponseModelImplCopyWith<_$CourseDetailsResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CourseDetailsData _$CourseDetailsDataFromJson(Map<String, dynamic> json) {
  return _CourseDetailsData.fromJson(json);
}

/// @nodoc
mixin _$CourseDetailsData {
  @JsonKey(name: "Lookup")
  CourseLookup get lookup => throw _privateConstructorUsedError;
  @JsonKey(name: "Track")
  int get track => throw _privateConstructorUsedError;
  @JsonKey(name: "TrackTranslation")
  TrackTranslation get trackTranslation => throw _privateConstructorUsedError;
  @JsonKey(name: "Translations")
  List<CourseDescriptionTranslation> get translations =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "Categories")
  List<CourseCategory> get categories => throw _privateConstructorUsedError;
  @JsonKey(name: "TrainingCourseRequirements")
  List<CourseRequirement> get trainingCourseRequirements =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "Fee")
  double get fee => throw _privateConstructorUsedError;
  @JsonKey(name: "Link")
  String? get link => throw _privateConstructorUsedError;
  @JsonKey(name: "IsFree")
  bool get isFree => throw _privateConstructorUsedError;
  @JsonKey(name: "CertificateType")
  int get certificateType => throw _privateConstructorUsedError;
  @JsonKey(name: "CertificateTypeTranslation")
  CertificateTypeTranslation get certificateTypeTranslation =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "CourseProvider")
  String? get courseProvider => throw _privateConstructorUsedError;
  @JsonKey(name: "TrainingCourseProvider")
  CourseProvider get trainingCourseProvider =>
      throw _privateConstructorUsedError;

  /// Serializes this CourseDetailsData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourseDetailsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseDetailsDataCopyWith<CourseDetailsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseDetailsDataCopyWith<$Res> {
  factory $CourseDetailsDataCopyWith(
          CourseDetailsData value, $Res Function(CourseDetailsData) then) =
      _$CourseDetailsDataCopyWithImpl<$Res, CourseDetailsData>;
  @useResult
  $Res call(
      {@JsonKey(name: "Lookup") CourseLookup lookup,
      @JsonKey(name: "Track") int track,
      @JsonKey(name: "TrackTranslation") TrackTranslation trackTranslation,
      @JsonKey(name: "Translations")
      List<CourseDescriptionTranslation> translations,
      @JsonKey(name: "Categories") List<CourseCategory> categories,
      @JsonKey(name: "TrainingCourseRequirements")
      List<CourseRequirement> trainingCourseRequirements,
      @JsonKey(name: "Fee") double fee,
      @JsonKey(name: "Link") String? link,
      @JsonKey(name: "IsFree") bool isFree,
      @JsonKey(name: "CertificateType") int certificateType,
      @JsonKey(name: "CertificateTypeTranslation")
      CertificateTypeTranslation certificateTypeTranslation,
      @JsonKey(name: "CourseProvider") String? courseProvider,
      @JsonKey(name: "TrainingCourseProvider")
      CourseProvider trainingCourseProvider});

  $CourseLookupCopyWith<$Res> get lookup;
  $TrackTranslationCopyWith<$Res> get trackTranslation;
  $CertificateTypeTranslationCopyWith<$Res> get certificateTypeTranslation;
  $CourseProviderCopyWith<$Res> get trainingCourseProvider;
}

/// @nodoc
class _$CourseDetailsDataCopyWithImpl<$Res, $Val extends CourseDetailsData>
    implements $CourseDetailsDataCopyWith<$Res> {
  _$CourseDetailsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseDetailsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lookup = null,
    Object? track = null,
    Object? trackTranslation = null,
    Object? translations = null,
    Object? categories = null,
    Object? trainingCourseRequirements = null,
    Object? fee = null,
    Object? link = freezed,
    Object? isFree = null,
    Object? certificateType = null,
    Object? certificateTypeTranslation = null,
    Object? courseProvider = freezed,
    Object? trainingCourseProvider = null,
  }) {
    return _then(_value.copyWith(
      lookup: null == lookup
          ? _value.lookup
          : lookup // ignore: cast_nullable_to_non_nullable
              as CourseLookup,
      track: null == track
          ? _value.track
          : track // ignore: cast_nullable_to_non_nullable
              as int,
      trackTranslation: null == trackTranslation
          ? _value.trackTranslation
          : trackTranslation // ignore: cast_nullable_to_non_nullable
              as TrackTranslation,
      translations: null == translations
          ? _value.translations
          : translations // ignore: cast_nullable_to_non_nullable
              as List<CourseDescriptionTranslation>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CourseCategory>,
      trainingCourseRequirements: null == trainingCourseRequirements
          ? _value.trainingCourseRequirements
          : trainingCourseRequirements // ignore: cast_nullable_to_non_nullable
              as List<CourseRequirement>,
      fee: null == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as CertificateTypeTranslation,
      courseProvider: freezed == courseProvider
          ? _value.courseProvider
          : courseProvider // ignore: cast_nullable_to_non_nullable
              as String?,
      trainingCourseProvider: null == trainingCourseProvider
          ? _value.trainingCourseProvider
          : trainingCourseProvider // ignore: cast_nullable_to_non_nullable
              as CourseProvider,
    ) as $Val);
  }

  /// Create a copy of CourseDetailsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CourseLookupCopyWith<$Res> get lookup {
    return $CourseLookupCopyWith<$Res>(_value.lookup, (value) {
      return _then(_value.copyWith(lookup: value) as $Val);
    });
  }

  /// Create a copy of CourseDetailsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TrackTranslationCopyWith<$Res> get trackTranslation {
    return $TrackTranslationCopyWith<$Res>(_value.trackTranslation, (value) {
      return _then(_value.copyWith(trackTranslation: value) as $Val);
    });
  }

  /// Create a copy of CourseDetailsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CertificateTypeTranslationCopyWith<$Res> get certificateTypeTranslation {
    return $CertificateTypeTranslationCopyWith<$Res>(
        _value.certificateTypeTranslation, (value) {
      return _then(_value.copyWith(certificateTypeTranslation: value) as $Val);
    });
  }

  /// Create a copy of CourseDetailsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CourseProviderCopyWith<$Res> get trainingCourseProvider {
    return $CourseProviderCopyWith<$Res>(_value.trainingCourseProvider,
        (value) {
      return _then(_value.copyWith(trainingCourseProvider: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CourseDetailsDataImplCopyWith<$Res>
    implements $CourseDetailsDataCopyWith<$Res> {
  factory _$$CourseDetailsDataImplCopyWith(_$CourseDetailsDataImpl value,
          $Res Function(_$CourseDetailsDataImpl) then) =
      __$$CourseDetailsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Lookup") CourseLookup lookup,
      @JsonKey(name: "Track") int track,
      @JsonKey(name: "TrackTranslation") TrackTranslation trackTranslation,
      @JsonKey(name: "Translations")
      List<CourseDescriptionTranslation> translations,
      @JsonKey(name: "Categories") List<CourseCategory> categories,
      @JsonKey(name: "TrainingCourseRequirements")
      List<CourseRequirement> trainingCourseRequirements,
      @JsonKey(name: "Fee") double fee,
      @JsonKey(name: "Link") String? link,
      @JsonKey(name: "IsFree") bool isFree,
      @JsonKey(name: "CertificateType") int certificateType,
      @JsonKey(name: "CertificateTypeTranslation")
      CertificateTypeTranslation certificateTypeTranslation,
      @JsonKey(name: "CourseProvider") String? courseProvider,
      @JsonKey(name: "TrainingCourseProvider")
      CourseProvider trainingCourseProvider});

  @override
  $CourseLookupCopyWith<$Res> get lookup;
  @override
  $TrackTranslationCopyWith<$Res> get trackTranslation;
  @override
  $CertificateTypeTranslationCopyWith<$Res> get certificateTypeTranslation;
  @override
  $CourseProviderCopyWith<$Res> get trainingCourseProvider;
}

/// @nodoc
class __$$CourseDetailsDataImplCopyWithImpl<$Res>
    extends _$CourseDetailsDataCopyWithImpl<$Res, _$CourseDetailsDataImpl>
    implements _$$CourseDetailsDataImplCopyWith<$Res> {
  __$$CourseDetailsDataImplCopyWithImpl(_$CourseDetailsDataImpl _value,
      $Res Function(_$CourseDetailsDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourseDetailsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lookup = null,
    Object? track = null,
    Object? trackTranslation = null,
    Object? translations = null,
    Object? categories = null,
    Object? trainingCourseRequirements = null,
    Object? fee = null,
    Object? link = freezed,
    Object? isFree = null,
    Object? certificateType = null,
    Object? certificateTypeTranslation = null,
    Object? courseProvider = freezed,
    Object? trainingCourseProvider = null,
  }) {
    return _then(_$CourseDetailsDataImpl(
      lookup: null == lookup
          ? _value.lookup
          : lookup // ignore: cast_nullable_to_non_nullable
              as CourseLookup,
      track: null == track
          ? _value.track
          : track // ignore: cast_nullable_to_non_nullable
              as int,
      trackTranslation: null == trackTranslation
          ? _value.trackTranslation
          : trackTranslation // ignore: cast_nullable_to_non_nullable
              as TrackTranslation,
      translations: null == translations
          ? _value._translations
          : translations // ignore: cast_nullable_to_non_nullable
              as List<CourseDescriptionTranslation>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CourseCategory>,
      trainingCourseRequirements: null == trainingCourseRequirements
          ? _value._trainingCourseRequirements
          : trainingCourseRequirements // ignore: cast_nullable_to_non_nullable
              as List<CourseRequirement>,
      fee: null == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as CertificateTypeTranslation,
      courseProvider: freezed == courseProvider
          ? _value.courseProvider
          : courseProvider // ignore: cast_nullable_to_non_nullable
              as String?,
      trainingCourseProvider: null == trainingCourseProvider
          ? _value.trainingCourseProvider
          : trainingCourseProvider // ignore: cast_nullable_to_non_nullable
              as CourseProvider,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseDetailsDataImpl implements _CourseDetailsData {
  const _$CourseDetailsDataImpl(
      {@JsonKey(name: "Lookup") required this.lookup,
      @JsonKey(name: "Track") required this.track,
      @JsonKey(name: "TrackTranslation") required this.trackTranslation,
      @JsonKey(name: "Translations")
      final List<CourseDescriptionTranslation> translations = const [],
      @JsonKey(name: "Categories")
      final List<CourseCategory> categories = const [],
      @JsonKey(name: "TrainingCourseRequirements")
      final List<CourseRequirement> trainingCourseRequirements = const [],
      @JsonKey(name: "Fee") this.fee = 0.0,
      @JsonKey(name: "Link") this.link,
      @JsonKey(name: "IsFree") this.isFree = false,
      @JsonKey(name: "CertificateType") this.certificateType = 0,
      @JsonKey(name: "CertificateTypeTranslation")
      required this.certificateTypeTranslation,
      @JsonKey(name: "CourseProvider") this.courseProvider,
      @JsonKey(name: "TrainingCourseProvider")
      required this.trainingCourseProvider})
      : _translations = translations,
        _categories = categories,
        _trainingCourseRequirements = trainingCourseRequirements;

  factory _$CourseDetailsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseDetailsDataImplFromJson(json);

  @override
  @JsonKey(name: "Lookup")
  final CourseLookup lookup;
  @override
  @JsonKey(name: "Track")
  final int track;
  @override
  @JsonKey(name: "TrackTranslation")
  final TrackTranslation trackTranslation;
  final List<CourseDescriptionTranslation> _translations;
  @override
  @JsonKey(name: "Translations")
  List<CourseDescriptionTranslation> get translations {
    if (_translations is EqualUnmodifiableListView) return _translations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_translations);
  }

  final List<CourseCategory> _categories;
  @override
  @JsonKey(name: "Categories")
  List<CourseCategory> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<CourseRequirement> _trainingCourseRequirements;
  @override
  @JsonKey(name: "TrainingCourseRequirements")
  List<CourseRequirement> get trainingCourseRequirements {
    if (_trainingCourseRequirements is EqualUnmodifiableListView)
      return _trainingCourseRequirements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trainingCourseRequirements);
  }

  @override
  @JsonKey(name: "Fee")
  final double fee;
  @override
  @JsonKey(name: "Link")
  final String? link;
  @override
  @JsonKey(name: "IsFree")
  final bool isFree;
  @override
  @JsonKey(name: "CertificateType")
  final int certificateType;
  @override
  @JsonKey(name: "CertificateTypeTranslation")
  final CertificateTypeTranslation certificateTypeTranslation;
  @override
  @JsonKey(name: "CourseProvider")
  final String? courseProvider;
  @override
  @JsonKey(name: "TrainingCourseProvider")
  final CourseProvider trainingCourseProvider;

  @override
  String toString() {
    return 'CourseDetailsData(lookup: $lookup, track: $track, trackTranslation: $trackTranslation, translations: $translations, categories: $categories, trainingCourseRequirements: $trainingCourseRequirements, fee: $fee, link: $link, isFree: $isFree, certificateType: $certificateType, certificateTypeTranslation: $certificateTypeTranslation, courseProvider: $courseProvider, trainingCourseProvider: $trainingCourseProvider)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseDetailsDataImpl &&
            (identical(other.lookup, lookup) || other.lookup == lookup) &&
            (identical(other.track, track) || other.track == track) &&
            (identical(other.trackTranslation, trackTranslation) ||
                other.trackTranslation == trackTranslation) &&
            const DeepCollectionEquality()
                .equals(other._translations, _translations) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(
                other._trainingCourseRequirements,
                _trainingCourseRequirements) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.isFree, isFree) || other.isFree == isFree) &&
            (identical(other.certificateType, certificateType) ||
                other.certificateType == certificateType) &&
            (identical(other.certificateTypeTranslation,
                    certificateTypeTranslation) ||
                other.certificateTypeTranslation ==
                    certificateTypeTranslation) &&
            (identical(other.courseProvider, courseProvider) ||
                other.courseProvider == courseProvider) &&
            (identical(other.trainingCourseProvider, trainingCourseProvider) ||
                other.trainingCourseProvider == trainingCourseProvider));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      lookup,
      track,
      trackTranslation,
      const DeepCollectionEquality().hash(_translations),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_trainingCourseRequirements),
      fee,
      link,
      isFree,
      certificateType,
      certificateTypeTranslation,
      courseProvider,
      trainingCourseProvider);

  /// Create a copy of CourseDetailsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseDetailsDataImplCopyWith<_$CourseDetailsDataImpl> get copyWith =>
      __$$CourseDetailsDataImplCopyWithImpl<_$CourseDetailsDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseDetailsDataImplToJson(
      this,
    );
  }
}

abstract class _CourseDetailsData implements CourseDetailsData {
  const factory _CourseDetailsData(
          {@JsonKey(name: "Lookup") required final CourseLookup lookup,
          @JsonKey(name: "Track") required final int track,
          @JsonKey(name: "TrackTranslation")
          required final TrackTranslation trackTranslation,
          @JsonKey(name: "Translations")
          final List<CourseDescriptionTranslation> translations,
          @JsonKey(name: "Categories") final List<CourseCategory> categories,
          @JsonKey(name: "TrainingCourseRequirements")
          final List<CourseRequirement> trainingCourseRequirements,
          @JsonKey(name: "Fee") final double fee,
          @JsonKey(name: "Link") final String? link,
          @JsonKey(name: "IsFree") final bool isFree,
          @JsonKey(name: "CertificateType") final int certificateType,
          @JsonKey(name: "CertificateTypeTranslation")
          required final CertificateTypeTranslation certificateTypeTranslation,
          @JsonKey(name: "CourseProvider") final String? courseProvider,
          @JsonKey(name: "TrainingCourseProvider")
          required final CourseProvider trainingCourseProvider}) =
      _$CourseDetailsDataImpl;

  factory _CourseDetailsData.fromJson(Map<String, dynamic> json) =
      _$CourseDetailsDataImpl.fromJson;

  @override
  @JsonKey(name: "Lookup")
  CourseLookup get lookup;
  @override
  @JsonKey(name: "Track")
  int get track;
  @override
  @JsonKey(name: "TrackTranslation")
  TrackTranslation get trackTranslation;
  @override
  @JsonKey(name: "Translations")
  List<CourseDescriptionTranslation> get translations;
  @override
  @JsonKey(name: "Categories")
  List<CourseCategory> get categories;
  @override
  @JsonKey(name: "TrainingCourseRequirements")
  List<CourseRequirement> get trainingCourseRequirements;
  @override
  @JsonKey(name: "Fee")
  double get fee;
  @override
  @JsonKey(name: "Link")
  String? get link;
  @override
  @JsonKey(name: "IsFree")
  bool get isFree;
  @override
  @JsonKey(name: "CertificateType")
  int get certificateType;
  @override
  @JsonKey(name: "CertificateTypeTranslation")
  CertificateTypeTranslation get certificateTypeTranslation;
  @override
  @JsonKey(name: "CourseProvider")
  String? get courseProvider;
  @override
  @JsonKey(name: "TrainingCourseProvider")
  CourseProvider get trainingCourseProvider;

  /// Create a copy of CourseDetailsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseDetailsDataImplCopyWith<_$CourseDetailsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CourseLookup _$CourseLookupFromJson(Map<String, dynamic> json) {
  return _CourseLookup.fromJson(json);
}

/// @nodoc
mixin _$CourseLookup {
  @JsonKey(name: "Translations")
  List<LookupNameTranslation> get translations =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "CanDeleted")
  bool get canDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: "Id")
  int get id => throw _privateConstructorUsedError;

  /// Serializes this CourseLookup to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourseLookup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseLookupCopyWith<CourseLookup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseLookupCopyWith<$Res> {
  factory $CourseLookupCopyWith(
          CourseLookup value, $Res Function(CourseLookup) then) =
      _$CourseLookupCopyWithImpl<$Res, CourseLookup>;
  @useResult
  $Res call(
      {@JsonKey(name: "Translations") List<LookupNameTranslation> translations,
      @JsonKey(name: "CanDeleted") bool canDeleted,
      @JsonKey(name: "Id") int id});
}

/// @nodoc
class _$CourseLookupCopyWithImpl<$Res, $Val extends CourseLookup>
    implements $CourseLookupCopyWith<$Res> {
  _$CourseLookupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseLookup
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
              as List<LookupNameTranslation>,
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
abstract class _$$CourseLookupImplCopyWith<$Res>
    implements $CourseLookupCopyWith<$Res> {
  factory _$$CourseLookupImplCopyWith(
          _$CourseLookupImpl value, $Res Function(_$CourseLookupImpl) then) =
      __$$CourseLookupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Translations") List<LookupNameTranslation> translations,
      @JsonKey(name: "CanDeleted") bool canDeleted,
      @JsonKey(name: "Id") int id});
}

/// @nodoc
class __$$CourseLookupImplCopyWithImpl<$Res>
    extends _$CourseLookupCopyWithImpl<$Res, _$CourseLookupImpl>
    implements _$$CourseLookupImplCopyWith<$Res> {
  __$$CourseLookupImplCopyWithImpl(
      _$CourseLookupImpl _value, $Res Function(_$CourseLookupImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourseLookup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? translations = null,
    Object? canDeleted = null,
    Object? id = null,
  }) {
    return _then(_$CourseLookupImpl(
      translations: null == translations
          ? _value._translations
          : translations // ignore: cast_nullable_to_non_nullable
              as List<LookupNameTranslation>,
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
class _$CourseLookupImpl implements _CourseLookup {
  const _$CourseLookupImpl(
      {@JsonKey(name: "Translations")
      final List<LookupNameTranslation> translations = const [],
      @JsonKey(name: "CanDeleted") this.canDeleted = false,
      @JsonKey(name: "Id") required this.id})
      : _translations = translations;

  factory _$CourseLookupImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseLookupImplFromJson(json);

  final List<LookupNameTranslation> _translations;
  @override
  @JsonKey(name: "Translations")
  List<LookupNameTranslation> get translations {
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
    return 'CourseLookup(translations: $translations, canDeleted: $canDeleted, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseLookupImpl &&
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

  /// Create a copy of CourseLookup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseLookupImplCopyWith<_$CourseLookupImpl> get copyWith =>
      __$$CourseLookupImplCopyWithImpl<_$CourseLookupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseLookupImplToJson(
      this,
    );
  }
}

abstract class _CourseLookup implements CourseLookup {
  const factory _CourseLookup(
      {@JsonKey(name: "Translations")
      final List<LookupNameTranslation> translations,
      @JsonKey(name: "CanDeleted") final bool canDeleted,
      @JsonKey(name: "Id") required final int id}) = _$CourseLookupImpl;

  factory _CourseLookup.fromJson(Map<String, dynamic> json) =
      _$CourseLookupImpl.fromJson;

  @override
  @JsonKey(name: "Translations")
  List<LookupNameTranslation> get translations;
  @override
  @JsonKey(name: "CanDeleted")
  bool get canDeleted;
  @override
  @JsonKey(name: "Id")
  int get id;

  /// Create a copy of CourseLookup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseLookupImplCopyWith<_$CourseLookupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LookupNameTranslation _$LookupNameTranslationFromJson(
    Map<String, dynamic> json) {
  return _LookupNameTranslation.fromJson(json);
}

/// @nodoc
mixin _$LookupNameTranslation {
  @JsonKey(name: "LanguageId")
  int get languageId => throw _privateConstructorUsedError;
  @JsonKey(name: "Name")
  String get name => throw _privateConstructorUsedError;

  /// Serializes this LookupNameTranslation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LookupNameTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LookupNameTranslationCopyWith<LookupNameTranslation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LookupNameTranslationCopyWith<$Res> {
  factory $LookupNameTranslationCopyWith(LookupNameTranslation value,
          $Res Function(LookupNameTranslation) then) =
      _$LookupNameTranslationCopyWithImpl<$Res, LookupNameTranslation>;
  @useResult
  $Res call(
      {@JsonKey(name: "LanguageId") int languageId,
      @JsonKey(name: "Name") String name});
}

/// @nodoc
class _$LookupNameTranslationCopyWithImpl<$Res,
        $Val extends LookupNameTranslation>
    implements $LookupNameTranslationCopyWith<$Res> {
  _$LookupNameTranslationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LookupNameTranslation
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
abstract class _$$LookupNameTranslationImplCopyWith<$Res>
    implements $LookupNameTranslationCopyWith<$Res> {
  factory _$$LookupNameTranslationImplCopyWith(
          _$LookupNameTranslationImpl value,
          $Res Function(_$LookupNameTranslationImpl) then) =
      __$$LookupNameTranslationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "LanguageId") int languageId,
      @JsonKey(name: "Name") String name});
}

/// @nodoc
class __$$LookupNameTranslationImplCopyWithImpl<$Res>
    extends _$LookupNameTranslationCopyWithImpl<$Res,
        _$LookupNameTranslationImpl>
    implements _$$LookupNameTranslationImplCopyWith<$Res> {
  __$$LookupNameTranslationImplCopyWithImpl(_$LookupNameTranslationImpl _value,
      $Res Function(_$LookupNameTranslationImpl) _then)
      : super(_value, _then);

  /// Create a copy of LookupNameTranslation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageId = null,
    Object? name = null,
  }) {
    return _then(_$LookupNameTranslationImpl(
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
class _$LookupNameTranslationImpl implements _LookupNameTranslation {
  const _$LookupNameTranslationImpl(
      {@JsonKey(name: "LanguageId") this.languageId = 0,
      @JsonKey(name: "Name") this.name = ''});

  factory _$LookupNameTranslationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LookupNameTranslationImplFromJson(json);

  @override
  @JsonKey(name: "LanguageId")
  final int languageId;
  @override
  @JsonKey(name: "Name")
  final String name;

  @override
  String toString() {
    return 'LookupNameTranslation(languageId: $languageId, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LookupNameTranslationImpl &&
            (identical(other.languageId, languageId) ||
                other.languageId == languageId) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, languageId, name);

  /// Create a copy of LookupNameTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LookupNameTranslationImplCopyWith<_$LookupNameTranslationImpl>
      get copyWith => __$$LookupNameTranslationImplCopyWithImpl<
          _$LookupNameTranslationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LookupNameTranslationImplToJson(
      this,
    );
  }
}

abstract class _LookupNameTranslation implements LookupNameTranslation {
  const factory _LookupNameTranslation(
      {@JsonKey(name: "LanguageId") final int languageId,
      @JsonKey(name: "Name") final String name}) = _$LookupNameTranslationImpl;

  factory _LookupNameTranslation.fromJson(Map<String, dynamic> json) =
      _$LookupNameTranslationImpl.fromJson;

  @override
  @JsonKey(name: "LanguageId")
  int get languageId;
  @override
  @JsonKey(name: "Name")
  String get name;

  /// Create a copy of LookupNameTranslation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LookupNameTranslationImplCopyWith<_$LookupNameTranslationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TrackTranslation _$TrackTranslationFromJson(Map<String, dynamic> json) {
  return _TrackTranslation.fromJson(json);
}

/// @nodoc
mixin _$TrackTranslation {
  @JsonKey(name: "Key")
  List<TrackNameTranslation> get key => throw _privateConstructorUsedError;
  @JsonKey(name: "Value")
  int get value => throw _privateConstructorUsedError;

  /// Serializes this TrackTranslation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrackTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrackTranslationCopyWith<TrackTranslation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackTranslationCopyWith<$Res> {
  factory $TrackTranslationCopyWith(
          TrackTranslation value, $Res Function(TrackTranslation) then) =
      _$TrackTranslationCopyWithImpl<$Res, TrackTranslation>;
  @useResult
  $Res call(
      {@JsonKey(name: "Key") List<TrackNameTranslation> key,
      @JsonKey(name: "Value") int value});
}

/// @nodoc
class _$TrackTranslationCopyWithImpl<$Res, $Val extends TrackTranslation>
    implements $TrackTranslationCopyWith<$Res> {
  _$TrackTranslationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrackTranslation
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
              as List<TrackNameTranslation>,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrackTranslationImplCopyWith<$Res>
    implements $TrackTranslationCopyWith<$Res> {
  factory _$$TrackTranslationImplCopyWith(_$TrackTranslationImpl value,
          $Res Function(_$TrackTranslationImpl) then) =
      __$$TrackTranslationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Key") List<TrackNameTranslation> key,
      @JsonKey(name: "Value") int value});
}

/// @nodoc
class __$$TrackTranslationImplCopyWithImpl<$Res>
    extends _$TrackTranslationCopyWithImpl<$Res, _$TrackTranslationImpl>
    implements _$$TrackTranslationImplCopyWith<$Res> {
  __$$TrackTranslationImplCopyWithImpl(_$TrackTranslationImpl _value,
      $Res Function(_$TrackTranslationImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrackTranslation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? value = null,
  }) {
    return _then(_$TrackTranslationImpl(
      key: null == key
          ? _value._key
          : key // ignore: cast_nullable_to_non_nullable
              as List<TrackNameTranslation>,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackTranslationImpl implements _TrackTranslation {
  const _$TrackTranslationImpl(
      {@JsonKey(name: "Key") final List<TrackNameTranslation> key = const [],
      @JsonKey(name: "Value") required this.value})
      : _key = key;

  factory _$TrackTranslationImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackTranslationImplFromJson(json);

  final List<TrackNameTranslation> _key;
  @override
  @JsonKey(name: "Key")
  List<TrackNameTranslation> get key {
    if (_key is EqualUnmodifiableListView) return _key;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_key);
  }

  @override
  @JsonKey(name: "Value")
  final int value;

  @override
  String toString() {
    return 'TrackTranslation(key: $key, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackTranslationImpl &&
            const DeepCollectionEquality().equals(other._key, _key) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_key), value);

  /// Create a copy of TrackTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackTranslationImplCopyWith<_$TrackTranslationImpl> get copyWith =>
      __$$TrackTranslationImplCopyWithImpl<_$TrackTranslationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackTranslationImplToJson(
      this,
    );
  }
}

abstract class _TrackTranslation implements TrackTranslation {
  const factory _TrackTranslation(
          {@JsonKey(name: "Key") final List<TrackNameTranslation> key,
          @JsonKey(name: "Value") required final int value}) =
      _$TrackTranslationImpl;

  factory _TrackTranslation.fromJson(Map<String, dynamic> json) =
      _$TrackTranslationImpl.fromJson;

  @override
  @JsonKey(name: "Key")
  List<TrackNameTranslation> get key;
  @override
  @JsonKey(name: "Value")
  int get value;

  /// Create a copy of TrackTranslation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrackTranslationImplCopyWith<_$TrackTranslationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TrackNameTranslation _$TrackNameTranslationFromJson(Map<String, dynamic> json) {
  return _TrackNameTranslation.fromJson(json);
}

/// @nodoc
mixin _$TrackNameTranslation {
  @JsonKey(name: "LanguageId")
  int get languageId => throw _privateConstructorUsedError;
  @JsonKey(name: "Name")
  String get name => throw _privateConstructorUsedError;

  /// Serializes this TrackNameTranslation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrackNameTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrackNameTranslationCopyWith<TrackNameTranslation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackNameTranslationCopyWith<$Res> {
  factory $TrackNameTranslationCopyWith(TrackNameTranslation value,
          $Res Function(TrackNameTranslation) then) =
      _$TrackNameTranslationCopyWithImpl<$Res, TrackNameTranslation>;
  @useResult
  $Res call(
      {@JsonKey(name: "LanguageId") int languageId,
      @JsonKey(name: "Name") String name});
}

/// @nodoc
class _$TrackNameTranslationCopyWithImpl<$Res,
        $Val extends TrackNameTranslation>
    implements $TrackNameTranslationCopyWith<$Res> {
  _$TrackNameTranslationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrackNameTranslation
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
abstract class _$$TrackNameTranslationImplCopyWith<$Res>
    implements $TrackNameTranslationCopyWith<$Res> {
  factory _$$TrackNameTranslationImplCopyWith(_$TrackNameTranslationImpl value,
          $Res Function(_$TrackNameTranslationImpl) then) =
      __$$TrackNameTranslationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "LanguageId") int languageId,
      @JsonKey(name: "Name") String name});
}

/// @nodoc
class __$$TrackNameTranslationImplCopyWithImpl<$Res>
    extends _$TrackNameTranslationCopyWithImpl<$Res, _$TrackNameTranslationImpl>
    implements _$$TrackNameTranslationImplCopyWith<$Res> {
  __$$TrackNameTranslationImplCopyWithImpl(_$TrackNameTranslationImpl _value,
      $Res Function(_$TrackNameTranslationImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrackNameTranslation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageId = null,
    Object? name = null,
  }) {
    return _then(_$TrackNameTranslationImpl(
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
class _$TrackNameTranslationImpl implements _TrackNameTranslation {
  const _$TrackNameTranslationImpl(
      {@JsonKey(name: "LanguageId") this.languageId = 0,
      @JsonKey(name: "Name") this.name = ''});

  factory _$TrackNameTranslationImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackNameTranslationImplFromJson(json);

  @override
  @JsonKey(name: "LanguageId")
  final int languageId;
  @override
  @JsonKey(name: "Name")
  final String name;

  @override
  String toString() {
    return 'TrackNameTranslation(languageId: $languageId, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackNameTranslationImpl &&
            (identical(other.languageId, languageId) ||
                other.languageId == languageId) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, languageId, name);

  /// Create a copy of TrackNameTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackNameTranslationImplCopyWith<_$TrackNameTranslationImpl>
      get copyWith =>
          __$$TrackNameTranslationImplCopyWithImpl<_$TrackNameTranslationImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackNameTranslationImplToJson(
      this,
    );
  }
}

abstract class _TrackNameTranslation implements TrackNameTranslation {
  const factory _TrackNameTranslation(
      {@JsonKey(name: "LanguageId") final int languageId,
      @JsonKey(name: "Name") final String name}) = _$TrackNameTranslationImpl;

  factory _TrackNameTranslation.fromJson(Map<String, dynamic> json) =
      _$TrackNameTranslationImpl.fromJson;

  @override
  @JsonKey(name: "LanguageId")
  int get languageId;
  @override
  @JsonKey(name: "Name")
  String get name;

  /// Create a copy of TrackNameTranslation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrackNameTranslationImplCopyWith<_$TrackNameTranslationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CourseDescriptionTranslation _$CourseDescriptionTranslationFromJson(
    Map<String, dynamic> json) {
  return _CourseDescriptionTranslation.fromJson(json);
}

/// @nodoc
mixin _$CourseDescriptionTranslation {
  @JsonKey(name: "Description")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "LanguageId")
  int get languageId => throw _privateConstructorUsedError;
  @JsonKey(name: "Summary")
  String get summary => throw _privateConstructorUsedError;

  /// Serializes this CourseDescriptionTranslation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourseDescriptionTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseDescriptionTranslationCopyWith<CourseDescriptionTranslation>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseDescriptionTranslationCopyWith<$Res> {
  factory $CourseDescriptionTranslationCopyWith(
          CourseDescriptionTranslation value,
          $Res Function(CourseDescriptionTranslation) then) =
      _$CourseDescriptionTranslationCopyWithImpl<$Res,
          CourseDescriptionTranslation>;
  @useResult
  $Res call(
      {@JsonKey(name: "Description") String description,
      @JsonKey(name: "LanguageId") int languageId,
      @JsonKey(name: "Summary") String summary});
}

/// @nodoc
class _$CourseDescriptionTranslationCopyWithImpl<$Res,
        $Val extends CourseDescriptionTranslation>
    implements $CourseDescriptionTranslationCopyWith<$Res> {
  _$CourseDescriptionTranslationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseDescriptionTranslation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? languageId = null,
    Object? summary = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$CourseDescriptionTranslationImplCopyWith<$Res>
    implements $CourseDescriptionTranslationCopyWith<$Res> {
  factory _$$CourseDescriptionTranslationImplCopyWith(
          _$CourseDescriptionTranslationImpl value,
          $Res Function(_$CourseDescriptionTranslationImpl) then) =
      __$$CourseDescriptionTranslationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Description") String description,
      @JsonKey(name: "LanguageId") int languageId,
      @JsonKey(name: "Summary") String summary});
}

/// @nodoc
class __$$CourseDescriptionTranslationImplCopyWithImpl<$Res>
    extends _$CourseDescriptionTranslationCopyWithImpl<$Res,
        _$CourseDescriptionTranslationImpl>
    implements _$$CourseDescriptionTranslationImplCopyWith<$Res> {
  __$$CourseDescriptionTranslationImplCopyWithImpl(
      _$CourseDescriptionTranslationImpl _value,
      $Res Function(_$CourseDescriptionTranslationImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourseDescriptionTranslation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? languageId = null,
    Object? summary = null,
  }) {
    return _then(_$CourseDescriptionTranslationImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$CourseDescriptionTranslationImpl
    implements _CourseDescriptionTranslation {
  const _$CourseDescriptionTranslationImpl(
      {@JsonKey(name: "Description") this.description = '',
      @JsonKey(name: "LanguageId") this.languageId = 0,
      @JsonKey(name: "Summary") this.summary = ''});

  factory _$CourseDescriptionTranslationImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CourseDescriptionTranslationImplFromJson(json);

  @override
  @JsonKey(name: "Description")
  final String description;
  @override
  @JsonKey(name: "LanguageId")
  final int languageId;
  @override
  @JsonKey(name: "Summary")
  final String summary;

  @override
  String toString() {
    return 'CourseDescriptionTranslation(description: $description, languageId: $languageId, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseDescriptionTranslationImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.languageId, languageId) ||
                other.languageId == languageId) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, description, languageId, summary);

  /// Create a copy of CourseDescriptionTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseDescriptionTranslationImplCopyWith<
          _$CourseDescriptionTranslationImpl>
      get copyWith => __$$CourseDescriptionTranslationImplCopyWithImpl<
          _$CourseDescriptionTranslationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseDescriptionTranslationImplToJson(
      this,
    );
  }
}

abstract class _CourseDescriptionTranslation
    implements CourseDescriptionTranslation {
  const factory _CourseDescriptionTranslation(
          {@JsonKey(name: "Description") final String description,
          @JsonKey(name: "LanguageId") final int languageId,
          @JsonKey(name: "Summary") final String summary}) =
      _$CourseDescriptionTranslationImpl;

  factory _CourseDescriptionTranslation.fromJson(Map<String, dynamic> json) =
      _$CourseDescriptionTranslationImpl.fromJson;

  @override
  @JsonKey(name: "Description")
  String get description;
  @override
  @JsonKey(name: "LanguageId")
  int get languageId;
  @override
  @JsonKey(name: "Summary")
  String get summary;

  /// Create a copy of CourseDescriptionTranslation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseDescriptionTranslationImplCopyWith<
          _$CourseDescriptionTranslationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CourseCategory _$CourseCategoryFromJson(Map<String, dynamic> json) {
  return _CourseCategory.fromJson(json);
}

/// @nodoc
mixin _$CourseCategory {
  @JsonKey(name: "Translations")
  List<CategoryNameTranslation> get translations =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "ShowInHeader")
  bool get showInHeader => throw _privateConstructorUsedError;
  @JsonKey(name: "IsDefault")
  bool get isDefault => throw _privateConstructorUsedError;
  @JsonKey(name: "IsAutoSelected")
  bool get isAutoSelected => throw _privateConstructorUsedError;
  @JsonKey(name: "Picture")
  CategoryPicture? get picture => throw _privateConstructorUsedError;
  @JsonKey(name: "Id")
  int get id => throw _privateConstructorUsedError;

  /// Serializes this CourseCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourseCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseCategoryCopyWith<CourseCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseCategoryCopyWith<$Res> {
  factory $CourseCategoryCopyWith(
          CourseCategory value, $Res Function(CourseCategory) then) =
      _$CourseCategoryCopyWithImpl<$Res, CourseCategory>;
  @useResult
  $Res call(
      {@JsonKey(name: "Translations")
      List<CategoryNameTranslation> translations,
      @JsonKey(name: "ShowInHeader") bool showInHeader,
      @JsonKey(name: "IsDefault") bool isDefault,
      @JsonKey(name: "IsAutoSelected") bool isAutoSelected,
      @JsonKey(name: "Picture") CategoryPicture? picture,
      @JsonKey(name: "Id") int id});

  $CategoryPictureCopyWith<$Res>? get picture;
}

/// @nodoc
class _$CourseCategoryCopyWithImpl<$Res, $Val extends CourseCategory>
    implements $CourseCategoryCopyWith<$Res> {
  _$CourseCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? translations = null,
    Object? showInHeader = null,
    Object? isDefault = null,
    Object? isAutoSelected = null,
    Object? picture = freezed,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      translations: null == translations
          ? _value.translations
          : translations // ignore: cast_nullable_to_non_nullable
              as List<CategoryNameTranslation>,
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
              as CategoryPicture?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of CourseCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryPictureCopyWith<$Res>? get picture {
    if (_value.picture == null) {
      return null;
    }

    return $CategoryPictureCopyWith<$Res>(_value.picture!, (value) {
      return _then(_value.copyWith(picture: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CourseCategoryImplCopyWith<$Res>
    implements $CourseCategoryCopyWith<$Res> {
  factory _$$CourseCategoryImplCopyWith(_$CourseCategoryImpl value,
          $Res Function(_$CourseCategoryImpl) then) =
      __$$CourseCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Translations")
      List<CategoryNameTranslation> translations,
      @JsonKey(name: "ShowInHeader") bool showInHeader,
      @JsonKey(name: "IsDefault") bool isDefault,
      @JsonKey(name: "IsAutoSelected") bool isAutoSelected,
      @JsonKey(name: "Picture") CategoryPicture? picture,
      @JsonKey(name: "Id") int id});

  @override
  $CategoryPictureCopyWith<$Res>? get picture;
}

/// @nodoc
class __$$CourseCategoryImplCopyWithImpl<$Res>
    extends _$CourseCategoryCopyWithImpl<$Res, _$CourseCategoryImpl>
    implements _$$CourseCategoryImplCopyWith<$Res> {
  __$$CourseCategoryImplCopyWithImpl(
      _$CourseCategoryImpl _value, $Res Function(_$CourseCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourseCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? translations = null,
    Object? showInHeader = null,
    Object? isDefault = null,
    Object? isAutoSelected = null,
    Object? picture = freezed,
    Object? id = null,
  }) {
    return _then(_$CourseCategoryImpl(
      translations: null == translations
          ? _value._translations
          : translations // ignore: cast_nullable_to_non_nullable
              as List<CategoryNameTranslation>,
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
              as CategoryPicture?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseCategoryImpl implements _CourseCategory {
  const _$CourseCategoryImpl(
      {@JsonKey(name: "Translations")
      final List<CategoryNameTranslation> translations = const [],
      @JsonKey(name: "ShowInHeader") this.showInHeader = false,
      @JsonKey(name: "IsDefault") this.isDefault = false,
      @JsonKey(name: "IsAutoSelected") this.isAutoSelected = false,
      @JsonKey(name: "Picture") this.picture,
      @JsonKey(name: "Id") required this.id})
      : _translations = translations;

  factory _$CourseCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseCategoryImplFromJson(json);

  final List<CategoryNameTranslation> _translations;
  @override
  @JsonKey(name: "Translations")
  List<CategoryNameTranslation> get translations {
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
  final CategoryPicture? picture;
  @override
  @JsonKey(name: "Id")
  final int id;

  @override
  String toString() {
    return 'CourseCategory(translations: $translations, showInHeader: $showInHeader, isDefault: $isDefault, isAutoSelected: $isAutoSelected, picture: $picture, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseCategoryImpl &&
            const DeepCollectionEquality()
                .equals(other._translations, _translations) &&
            (identical(other.showInHeader, showInHeader) ||
                other.showInHeader == showInHeader) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.isAutoSelected, isAutoSelected) ||
                other.isAutoSelected == isAutoSelected) &&
            (identical(other.picture, picture) || other.picture == picture) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_translations),
      showInHeader,
      isDefault,
      isAutoSelected,
      picture,
      id);

  /// Create a copy of CourseCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseCategoryImplCopyWith<_$CourseCategoryImpl> get copyWith =>
      __$$CourseCategoryImplCopyWithImpl<_$CourseCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseCategoryImplToJson(
      this,
    );
  }
}

abstract class _CourseCategory implements CourseCategory {
  const factory _CourseCategory(
      {@JsonKey(name: "Translations")
      final List<CategoryNameTranslation> translations,
      @JsonKey(name: "ShowInHeader") final bool showInHeader,
      @JsonKey(name: "IsDefault") final bool isDefault,
      @JsonKey(name: "IsAutoSelected") final bool isAutoSelected,
      @JsonKey(name: "Picture") final CategoryPicture? picture,
      @JsonKey(name: "Id") required final int id}) = _$CourseCategoryImpl;

  factory _CourseCategory.fromJson(Map<String, dynamic> json) =
      _$CourseCategoryImpl.fromJson;

  @override
  @JsonKey(name: "Translations")
  List<CategoryNameTranslation> get translations;
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
  CategoryPicture? get picture;
  @override
  @JsonKey(name: "Id")
  int get id;

  /// Create a copy of CourseCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseCategoryImplCopyWith<_$CourseCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryNameTranslation _$CategoryNameTranslationFromJson(
    Map<String, dynamic> json) {
  return _CategoryNameTranslation.fromJson(json);
}

/// @nodoc
mixin _$CategoryNameTranslation {
  @JsonKey(name: "Description")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "LanguageId")
  int get languageId => throw _privateConstructorUsedError;
  @JsonKey(name: "Name")
  String get name => throw _privateConstructorUsedError;

  /// Serializes this CategoryNameTranslation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryNameTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryNameTranslationCopyWith<CategoryNameTranslation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryNameTranslationCopyWith<$Res> {
  factory $CategoryNameTranslationCopyWith(CategoryNameTranslation value,
          $Res Function(CategoryNameTranslation) then) =
      _$CategoryNameTranslationCopyWithImpl<$Res, CategoryNameTranslation>;
  @useResult
  $Res call(
      {@JsonKey(name: "Description") String description,
      @JsonKey(name: "LanguageId") int languageId,
      @JsonKey(name: "Name") String name});
}

/// @nodoc
class _$CategoryNameTranslationCopyWithImpl<$Res,
        $Val extends CategoryNameTranslation>
    implements $CategoryNameTranslationCopyWith<$Res> {
  _$CategoryNameTranslationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryNameTranslation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? languageId = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$CategoryNameTranslationImplCopyWith<$Res>
    implements $CategoryNameTranslationCopyWith<$Res> {
  factory _$$CategoryNameTranslationImplCopyWith(
          _$CategoryNameTranslationImpl value,
          $Res Function(_$CategoryNameTranslationImpl) then) =
      __$$CategoryNameTranslationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Description") String description,
      @JsonKey(name: "LanguageId") int languageId,
      @JsonKey(name: "Name") String name});
}

/// @nodoc
class __$$CategoryNameTranslationImplCopyWithImpl<$Res>
    extends _$CategoryNameTranslationCopyWithImpl<$Res,
        _$CategoryNameTranslationImpl>
    implements _$$CategoryNameTranslationImplCopyWith<$Res> {
  __$$CategoryNameTranslationImplCopyWithImpl(
      _$CategoryNameTranslationImpl _value,
      $Res Function(_$CategoryNameTranslationImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryNameTranslation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? languageId = null,
    Object? name = null,
  }) {
    return _then(_$CategoryNameTranslationImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$CategoryNameTranslationImpl implements _CategoryNameTranslation {
  const _$CategoryNameTranslationImpl(
      {@JsonKey(name: "Description") this.description = '',
      @JsonKey(name: "LanguageId") this.languageId = 0,
      @JsonKey(name: "Name") this.name = ''});

  factory _$CategoryNameTranslationImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryNameTranslationImplFromJson(json);

  @override
  @JsonKey(name: "Description")
  final String description;
  @override
  @JsonKey(name: "LanguageId")
  final int languageId;
  @override
  @JsonKey(name: "Name")
  final String name;

  @override
  String toString() {
    return 'CategoryNameTranslation(description: $description, languageId: $languageId, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryNameTranslationImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.languageId, languageId) ||
                other.languageId == languageId) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, description, languageId, name);

  /// Create a copy of CategoryNameTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryNameTranslationImplCopyWith<_$CategoryNameTranslationImpl>
      get copyWith => __$$CategoryNameTranslationImplCopyWithImpl<
          _$CategoryNameTranslationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryNameTranslationImplToJson(
      this,
    );
  }
}

abstract class _CategoryNameTranslation implements CategoryNameTranslation {
  const factory _CategoryNameTranslation(
          {@JsonKey(name: "Description") final String description,
          @JsonKey(name: "LanguageId") final int languageId,
          @JsonKey(name: "Name") final String name}) =
      _$CategoryNameTranslationImpl;

  factory _CategoryNameTranslation.fromJson(Map<String, dynamic> json) =
      _$CategoryNameTranslationImpl.fromJson;

  @override
  @JsonKey(name: "Description")
  String get description;
  @override
  @JsonKey(name: "LanguageId")
  int get languageId;
  @override
  @JsonKey(name: "Name")
  String get name;

  /// Create a copy of CategoryNameTranslation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryNameTranslationImplCopyWith<_$CategoryNameTranslationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CategoryPicture _$CategoryPictureFromJson(Map<String, dynamic> json) {
  return _CategoryPicture.fromJson(json);
}

/// @nodoc
mixin _$CategoryPicture {
  int? get id => throw _privateConstructorUsedError;
  String? get mimeType => throw _privateConstructorUsedError;
  String? get base64File => throw _privateConstructorUsedError;
  String? get fileName => throw _privateConstructorUsedError;

  /// Serializes this CategoryPicture to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryPicture
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryPictureCopyWith<CategoryPicture> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryPictureCopyWith<$Res> {
  factory $CategoryPictureCopyWith(
          CategoryPicture value, $Res Function(CategoryPicture) then) =
      _$CategoryPictureCopyWithImpl<$Res, CategoryPicture>;
  @useResult
  $Res call({int? id, String? mimeType, String? base64File, String? fileName});
}

/// @nodoc
class _$CategoryPictureCopyWithImpl<$Res, $Val extends CategoryPicture>
    implements $CategoryPictureCopyWith<$Res> {
  _$CategoryPictureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryPicture
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? mimeType = freezed,
    Object? base64File = freezed,
    Object? fileName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      mimeType: freezed == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      base64File: freezed == base64File
          ? _value.base64File
          : base64File // ignore: cast_nullable_to_non_nullable
              as String?,
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryPictureImplCopyWith<$Res>
    implements $CategoryPictureCopyWith<$Res> {
  factory _$$CategoryPictureImplCopyWith(_$CategoryPictureImpl value,
          $Res Function(_$CategoryPictureImpl) then) =
      __$$CategoryPictureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? mimeType, String? base64File, String? fileName});
}

/// @nodoc
class __$$CategoryPictureImplCopyWithImpl<$Res>
    extends _$CategoryPictureCopyWithImpl<$Res, _$CategoryPictureImpl>
    implements _$$CategoryPictureImplCopyWith<$Res> {
  __$$CategoryPictureImplCopyWithImpl(
      _$CategoryPictureImpl _value, $Res Function(_$CategoryPictureImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryPicture
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? mimeType = freezed,
    Object? base64File = freezed,
    Object? fileName = freezed,
  }) {
    return _then(_$CategoryPictureImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      mimeType: freezed == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      base64File: freezed == base64File
          ? _value.base64File
          : base64File // ignore: cast_nullable_to_non_nullable
              as String?,
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryPictureImpl implements _CategoryPicture {
  const _$CategoryPictureImpl(
      {this.id = null,
      this.mimeType = null,
      this.base64File = null,
      this.fileName = null});

  factory _$CategoryPictureImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryPictureImplFromJson(json);

  @override
  @JsonKey()
  final int? id;
  @override
  @JsonKey()
  final String? mimeType;
  @override
  @JsonKey()
  final String? base64File;
  @override
  @JsonKey()
  final String? fileName;

  @override
  String toString() {
    return 'CategoryPicture(id: $id, mimeType: $mimeType, base64File: $base64File, fileName: $fileName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryPictureImpl &&
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

  /// Create a copy of CategoryPicture
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryPictureImplCopyWith<_$CategoryPictureImpl> get copyWith =>
      __$$CategoryPictureImplCopyWithImpl<_$CategoryPictureImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryPictureImplToJson(
      this,
    );
  }
}

abstract class _CategoryPicture implements CategoryPicture {
  const factory _CategoryPicture(
      {final int? id,
      final String? mimeType,
      final String? base64File,
      final String? fileName}) = _$CategoryPictureImpl;

  factory _CategoryPicture.fromJson(Map<String, dynamic> json) =
      _$CategoryPictureImpl.fromJson;

  @override
  int? get id;
  @override
  String? get mimeType;
  @override
  String? get base64File;
  @override
  String? get fileName;

  /// Create a copy of CategoryPicture
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryPictureImplCopyWith<_$CategoryPictureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CourseRequirement _$CourseRequirementFromJson(Map<String, dynamic> json) {
  return _CourseRequirement.fromJson(json);
}

/// @nodoc
mixin _$CourseRequirement {
  @JsonKey(name: "Translations")
  List<RequirementTitleTranslation> get translations =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "Id")
  int get id => throw _privateConstructorUsedError;

  /// Serializes this CourseRequirement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourseRequirement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseRequirementCopyWith<CourseRequirement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseRequirementCopyWith<$Res> {
  factory $CourseRequirementCopyWith(
          CourseRequirement value, $Res Function(CourseRequirement) then) =
      _$CourseRequirementCopyWithImpl<$Res, CourseRequirement>;
  @useResult
  $Res call(
      {@JsonKey(name: "Translations")
      List<RequirementTitleTranslation> translations,
      @JsonKey(name: "Id") int id});
}

/// @nodoc
class _$CourseRequirementCopyWithImpl<$Res, $Val extends CourseRequirement>
    implements $CourseRequirementCopyWith<$Res> {
  _$CourseRequirementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseRequirement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? translations = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      translations: null == translations
          ? _value.translations
          : translations // ignore: cast_nullable_to_non_nullable
              as List<RequirementTitleTranslation>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourseRequirementImplCopyWith<$Res>
    implements $CourseRequirementCopyWith<$Res> {
  factory _$$CourseRequirementImplCopyWith(_$CourseRequirementImpl value,
          $Res Function(_$CourseRequirementImpl) then) =
      __$$CourseRequirementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Translations")
      List<RequirementTitleTranslation> translations,
      @JsonKey(name: "Id") int id});
}

/// @nodoc
class __$$CourseRequirementImplCopyWithImpl<$Res>
    extends _$CourseRequirementCopyWithImpl<$Res, _$CourseRequirementImpl>
    implements _$$CourseRequirementImplCopyWith<$Res> {
  __$$CourseRequirementImplCopyWithImpl(_$CourseRequirementImpl _value,
      $Res Function(_$CourseRequirementImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourseRequirement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? translations = null,
    Object? id = null,
  }) {
    return _then(_$CourseRequirementImpl(
      translations: null == translations
          ? _value._translations
          : translations // ignore: cast_nullable_to_non_nullable
              as List<RequirementTitleTranslation>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseRequirementImpl implements _CourseRequirement {
  const _$CourseRequirementImpl(
      {@JsonKey(name: "Translations")
      final List<RequirementTitleTranslation> translations = const [],
      @JsonKey(name: "Id") required this.id})
      : _translations = translations;

  factory _$CourseRequirementImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseRequirementImplFromJson(json);

  final List<RequirementTitleTranslation> _translations;
  @override
  @JsonKey(name: "Translations")
  List<RequirementTitleTranslation> get translations {
    if (_translations is EqualUnmodifiableListView) return _translations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_translations);
  }

  @override
  @JsonKey(name: "Id")
  final int id;

  @override
  String toString() {
    return 'CourseRequirement(translations: $translations, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseRequirementImpl &&
            const DeepCollectionEquality()
                .equals(other._translations, _translations) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_translations), id);

  /// Create a copy of CourseRequirement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseRequirementImplCopyWith<_$CourseRequirementImpl> get copyWith =>
      __$$CourseRequirementImplCopyWithImpl<_$CourseRequirementImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseRequirementImplToJson(
      this,
    );
  }
}

abstract class _CourseRequirement implements CourseRequirement {
  const factory _CourseRequirement(
      {@JsonKey(name: "Translations")
      final List<RequirementTitleTranslation> translations,
      @JsonKey(name: "Id") required final int id}) = _$CourseRequirementImpl;

  factory _CourseRequirement.fromJson(Map<String, dynamic> json) =
      _$CourseRequirementImpl.fromJson;

  @override
  @JsonKey(name: "Translations")
  List<RequirementTitleTranslation> get translations;
  @override
  @JsonKey(name: "Id")
  int get id;

  /// Create a copy of CourseRequirement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseRequirementImplCopyWith<_$CourseRequirementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RequirementTitleTranslation _$RequirementTitleTranslationFromJson(
    Map<String, dynamic> json) {
  return _RequirementTitleTranslation.fromJson(json);
}

/// @nodoc
mixin _$RequirementTitleTranslation {
  @JsonKey(name: "LanguageId")
  int get languageId => throw _privateConstructorUsedError;
  @JsonKey(name: "Title")
  String get title => throw _privateConstructorUsedError;

  /// Serializes this RequirementTitleTranslation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequirementTitleTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequirementTitleTranslationCopyWith<RequirementTitleTranslation>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequirementTitleTranslationCopyWith<$Res> {
  factory $RequirementTitleTranslationCopyWith(
          RequirementTitleTranslation value,
          $Res Function(RequirementTitleTranslation) then) =
      _$RequirementTitleTranslationCopyWithImpl<$Res,
          RequirementTitleTranslation>;
  @useResult
  $Res call(
      {@JsonKey(name: "LanguageId") int languageId,
      @JsonKey(name: "Title") String title});
}

/// @nodoc
class _$RequirementTitleTranslationCopyWithImpl<$Res,
        $Val extends RequirementTitleTranslation>
    implements $RequirementTitleTranslationCopyWith<$Res> {
  _$RequirementTitleTranslationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequirementTitleTranslation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageId = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      languageId: null == languageId
          ? _value.languageId
          : languageId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequirementTitleTranslationImplCopyWith<$Res>
    implements $RequirementTitleTranslationCopyWith<$Res> {
  factory _$$RequirementTitleTranslationImplCopyWith(
          _$RequirementTitleTranslationImpl value,
          $Res Function(_$RequirementTitleTranslationImpl) then) =
      __$$RequirementTitleTranslationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "LanguageId") int languageId,
      @JsonKey(name: "Title") String title});
}

/// @nodoc
class __$$RequirementTitleTranslationImplCopyWithImpl<$Res>
    extends _$RequirementTitleTranslationCopyWithImpl<$Res,
        _$RequirementTitleTranslationImpl>
    implements _$$RequirementTitleTranslationImplCopyWith<$Res> {
  __$$RequirementTitleTranslationImplCopyWithImpl(
      _$RequirementTitleTranslationImpl _value,
      $Res Function(_$RequirementTitleTranslationImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequirementTitleTranslation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageId = null,
    Object? title = null,
  }) {
    return _then(_$RequirementTitleTranslationImpl(
      languageId: null == languageId
          ? _value.languageId
          : languageId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequirementTitleTranslationImpl
    implements _RequirementTitleTranslation {
  const _$RequirementTitleTranslationImpl(
      {@JsonKey(name: "LanguageId") this.languageId = 0,
      @JsonKey(name: "Title") this.title = ''});

  factory _$RequirementTitleTranslationImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RequirementTitleTranslationImplFromJson(json);

  @override
  @JsonKey(name: "LanguageId")
  final int languageId;
  @override
  @JsonKey(name: "Title")
  final String title;

  @override
  String toString() {
    return 'RequirementTitleTranslation(languageId: $languageId, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequirementTitleTranslationImpl &&
            (identical(other.languageId, languageId) ||
                other.languageId == languageId) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, languageId, title);

  /// Create a copy of RequirementTitleTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequirementTitleTranslationImplCopyWith<_$RequirementTitleTranslationImpl>
      get copyWith => __$$RequirementTitleTranslationImplCopyWithImpl<
          _$RequirementTitleTranslationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequirementTitleTranslationImplToJson(
      this,
    );
  }
}

abstract class _RequirementTitleTranslation
    implements RequirementTitleTranslation {
  const factory _RequirementTitleTranslation(
          {@JsonKey(name: "LanguageId") final int languageId,
          @JsonKey(name: "Title") final String title}) =
      _$RequirementTitleTranslationImpl;

  factory _RequirementTitleTranslation.fromJson(Map<String, dynamic> json) =
      _$RequirementTitleTranslationImpl.fromJson;

  @override
  @JsonKey(name: "LanguageId")
  int get languageId;
  @override
  @JsonKey(name: "Title")
  String get title;

  /// Create a copy of RequirementTitleTranslation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequirementTitleTranslationImplCopyWith<_$RequirementTitleTranslationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CertificateTypeTranslation _$CertificateTypeTranslationFromJson(
    Map<String, dynamic> json) {
  return _CertificateTypeTranslation.fromJson(json);
}

/// @nodoc
mixin _$CertificateTypeTranslation {
  @JsonKey(name: "Key")
  List<CertificateNameTranslation> get key =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "Value")
  int get value => throw _privateConstructorUsedError;

  /// Serializes this CertificateTypeTranslation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CertificateTypeTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CertificateTypeTranslationCopyWith<CertificateTypeTranslation>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CertificateTypeTranslationCopyWith<$Res> {
  factory $CertificateTypeTranslationCopyWith(CertificateTypeTranslation value,
          $Res Function(CertificateTypeTranslation) then) =
      _$CertificateTypeTranslationCopyWithImpl<$Res,
          CertificateTypeTranslation>;
  @useResult
  $Res call(
      {@JsonKey(name: "Key") List<CertificateNameTranslation> key,
      @JsonKey(name: "Value") int value});
}

/// @nodoc
class _$CertificateTypeTranslationCopyWithImpl<$Res,
        $Val extends CertificateTypeTranslation>
    implements $CertificateTypeTranslationCopyWith<$Res> {
  _$CertificateTypeTranslationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CertificateTypeTranslation
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
              as List<CertificateNameTranslation>,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CertificateTypeTranslationImplCopyWith<$Res>
    implements $CertificateTypeTranslationCopyWith<$Res> {
  factory _$$CertificateTypeTranslationImplCopyWith(
          _$CertificateTypeTranslationImpl value,
          $Res Function(_$CertificateTypeTranslationImpl) then) =
      __$$CertificateTypeTranslationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Key") List<CertificateNameTranslation> key,
      @JsonKey(name: "Value") int value});
}

/// @nodoc
class __$$CertificateTypeTranslationImplCopyWithImpl<$Res>
    extends _$CertificateTypeTranslationCopyWithImpl<$Res,
        _$CertificateTypeTranslationImpl>
    implements _$$CertificateTypeTranslationImplCopyWith<$Res> {
  __$$CertificateTypeTranslationImplCopyWithImpl(
      _$CertificateTypeTranslationImpl _value,
      $Res Function(_$CertificateTypeTranslationImpl) _then)
      : super(_value, _then);

  /// Create a copy of CertificateTypeTranslation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? value = null,
  }) {
    return _then(_$CertificateTypeTranslationImpl(
      key: null == key
          ? _value._key
          : key // ignore: cast_nullable_to_non_nullable
              as List<CertificateNameTranslation>,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CertificateTypeTranslationImpl implements _CertificateTypeTranslation {
  const _$CertificateTypeTranslationImpl(
      {@JsonKey(name: "Key")
      final List<CertificateNameTranslation> key = const [],
      @JsonKey(name: "Value") required this.value})
      : _key = key;

  factory _$CertificateTypeTranslationImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CertificateTypeTranslationImplFromJson(json);

  final List<CertificateNameTranslation> _key;
  @override
  @JsonKey(name: "Key")
  List<CertificateNameTranslation> get key {
    if (_key is EqualUnmodifiableListView) return _key;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_key);
  }

  @override
  @JsonKey(name: "Value")
  final int value;

  @override
  String toString() {
    return 'CertificateTypeTranslation(key: $key, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CertificateTypeTranslationImpl &&
            const DeepCollectionEquality().equals(other._key, _key) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_key), value);

  /// Create a copy of CertificateTypeTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CertificateTypeTranslationImplCopyWith<_$CertificateTypeTranslationImpl>
      get copyWith => __$$CertificateTypeTranslationImplCopyWithImpl<
          _$CertificateTypeTranslationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CertificateTypeTranslationImplToJson(
      this,
    );
  }
}

abstract class _CertificateTypeTranslation
    implements CertificateTypeTranslation {
  const factory _CertificateTypeTranslation(
          {@JsonKey(name: "Key") final List<CertificateNameTranslation> key,
          @JsonKey(name: "Value") required final int value}) =
      _$CertificateTypeTranslationImpl;

  factory _CertificateTypeTranslation.fromJson(Map<String, dynamic> json) =
      _$CertificateTypeTranslationImpl.fromJson;

  @override
  @JsonKey(name: "Key")
  List<CertificateNameTranslation> get key;
  @override
  @JsonKey(name: "Value")
  int get value;

  /// Create a copy of CertificateTypeTranslation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CertificateTypeTranslationImplCopyWith<_$CertificateTypeTranslationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CertificateNameTranslation _$CertificateNameTranslationFromJson(
    Map<String, dynamic> json) {
  return _CertificateNameTranslation.fromJson(json);
}

/// @nodoc
mixin _$CertificateNameTranslation {
  @JsonKey(name: "LanguageId")
  int get languageId => throw _privateConstructorUsedError;
  @JsonKey(name: "Name")
  String get name => throw _privateConstructorUsedError;

  /// Serializes this CertificateNameTranslation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CertificateNameTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CertificateNameTranslationCopyWith<CertificateNameTranslation>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CertificateNameTranslationCopyWith<$Res> {
  factory $CertificateNameTranslationCopyWith(CertificateNameTranslation value,
          $Res Function(CertificateNameTranslation) then) =
      _$CertificateNameTranslationCopyWithImpl<$Res,
          CertificateNameTranslation>;
  @useResult
  $Res call(
      {@JsonKey(name: "LanguageId") int languageId,
      @JsonKey(name: "Name") String name});
}

/// @nodoc
class _$CertificateNameTranslationCopyWithImpl<$Res,
        $Val extends CertificateNameTranslation>
    implements $CertificateNameTranslationCopyWith<$Res> {
  _$CertificateNameTranslationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CertificateNameTranslation
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
abstract class _$$CertificateNameTranslationImplCopyWith<$Res>
    implements $CertificateNameTranslationCopyWith<$Res> {
  factory _$$CertificateNameTranslationImplCopyWith(
          _$CertificateNameTranslationImpl value,
          $Res Function(_$CertificateNameTranslationImpl) then) =
      __$$CertificateNameTranslationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "LanguageId") int languageId,
      @JsonKey(name: "Name") String name});
}

/// @nodoc
class __$$CertificateNameTranslationImplCopyWithImpl<$Res>
    extends _$CertificateNameTranslationCopyWithImpl<$Res,
        _$CertificateNameTranslationImpl>
    implements _$$CertificateNameTranslationImplCopyWith<$Res> {
  __$$CertificateNameTranslationImplCopyWithImpl(
      _$CertificateNameTranslationImpl _value,
      $Res Function(_$CertificateNameTranslationImpl) _then)
      : super(_value, _then);

  /// Create a copy of CertificateNameTranslation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageId = null,
    Object? name = null,
  }) {
    return _then(_$CertificateNameTranslationImpl(
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
class _$CertificateNameTranslationImpl implements _CertificateNameTranslation {
  const _$CertificateNameTranslationImpl(
      {@JsonKey(name: "LanguageId") this.languageId = 0,
      @JsonKey(name: "Name") this.name = ''});

  factory _$CertificateNameTranslationImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CertificateNameTranslationImplFromJson(json);

  @override
  @JsonKey(name: "LanguageId")
  final int languageId;
  @override
  @JsonKey(name: "Name")
  final String name;

  @override
  String toString() {
    return 'CertificateNameTranslation(languageId: $languageId, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CertificateNameTranslationImpl &&
            (identical(other.languageId, languageId) ||
                other.languageId == languageId) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, languageId, name);

  /// Create a copy of CertificateNameTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CertificateNameTranslationImplCopyWith<_$CertificateNameTranslationImpl>
      get copyWith => __$$CertificateNameTranslationImplCopyWithImpl<
          _$CertificateNameTranslationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CertificateNameTranslationImplToJson(
      this,
    );
  }
}

abstract class _CertificateNameTranslation
    implements CertificateNameTranslation {
  const factory _CertificateNameTranslation(
          {@JsonKey(name: "LanguageId") final int languageId,
          @JsonKey(name: "Name") final String name}) =
      _$CertificateNameTranslationImpl;

  factory _CertificateNameTranslation.fromJson(Map<String, dynamic> json) =
      _$CertificateNameTranslationImpl.fromJson;

  @override
  @JsonKey(name: "LanguageId")
  int get languageId;
  @override
  @JsonKey(name: "Name")
  String get name;

  /// Create a copy of CertificateNameTranslation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CertificateNameTranslationImplCopyWith<_$CertificateNameTranslationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CourseProvider _$CourseProviderFromJson(Map<String, dynamic> json) {
  return _CourseProvider.fromJson(json);
}

/// @nodoc
mixin _$CourseProvider {
  @JsonKey(name: "IsActive")
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: "Translations")
  List<ProviderNameTranslation> get translations =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "CanDeleted")
  bool get canDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: "Id")
  int get id => throw _privateConstructorUsedError;

  /// Serializes this CourseProvider to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourseProvider
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseProviderCopyWith<CourseProvider> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseProviderCopyWith<$Res> {
  factory $CourseProviderCopyWith(
          CourseProvider value, $Res Function(CourseProvider) then) =
      _$CourseProviderCopyWithImpl<$Res, CourseProvider>;
  @useResult
  $Res call(
      {@JsonKey(name: "IsActive") bool isActive,
      @JsonKey(name: "Translations") List<ProviderNameTranslation> translations,
      @JsonKey(name: "CanDeleted") bool canDeleted,
      @JsonKey(name: "Id") int id});
}

/// @nodoc
class _$CourseProviderCopyWithImpl<$Res, $Val extends CourseProvider>
    implements $CourseProviderCopyWith<$Res> {
  _$CourseProviderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseProvider
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isActive = null,
    Object? translations = null,
    Object? canDeleted = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      translations: null == translations
          ? _value.translations
          : translations // ignore: cast_nullable_to_non_nullable
              as List<ProviderNameTranslation>,
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
abstract class _$$CourseProviderImplCopyWith<$Res>
    implements $CourseProviderCopyWith<$Res> {
  factory _$$CourseProviderImplCopyWith(_$CourseProviderImpl value,
          $Res Function(_$CourseProviderImpl) then) =
      __$$CourseProviderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "IsActive") bool isActive,
      @JsonKey(name: "Translations") List<ProviderNameTranslation> translations,
      @JsonKey(name: "CanDeleted") bool canDeleted,
      @JsonKey(name: "Id") int id});
}

/// @nodoc
class __$$CourseProviderImplCopyWithImpl<$Res>
    extends _$CourseProviderCopyWithImpl<$Res, _$CourseProviderImpl>
    implements _$$CourseProviderImplCopyWith<$Res> {
  __$$CourseProviderImplCopyWithImpl(
      _$CourseProviderImpl _value, $Res Function(_$CourseProviderImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourseProvider
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isActive = null,
    Object? translations = null,
    Object? canDeleted = null,
    Object? id = null,
  }) {
    return _then(_$CourseProviderImpl(
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      translations: null == translations
          ? _value._translations
          : translations // ignore: cast_nullable_to_non_nullable
              as List<ProviderNameTranslation>,
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
class _$CourseProviderImpl implements _CourseProvider {
  const _$CourseProviderImpl(
      {@JsonKey(name: "IsActive") this.isActive = false,
      @JsonKey(name: "Translations")
      final List<ProviderNameTranslation> translations = const [],
      @JsonKey(name: "CanDeleted") this.canDeleted = false,
      @JsonKey(name: "Id") required this.id})
      : _translations = translations;

  factory _$CourseProviderImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseProviderImplFromJson(json);

  @override
  @JsonKey(name: "IsActive")
  final bool isActive;
  final List<ProviderNameTranslation> _translations;
  @override
  @JsonKey(name: "Translations")
  List<ProviderNameTranslation> get translations {
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
    return 'CourseProvider(isActive: $isActive, translations: $translations, canDeleted: $canDeleted, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseProviderImpl &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other._translations, _translations) &&
            (identical(other.canDeleted, canDeleted) ||
                other.canDeleted == canDeleted) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isActive,
      const DeepCollectionEquality().hash(_translations), canDeleted, id);

  /// Create a copy of CourseProvider
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseProviderImplCopyWith<_$CourseProviderImpl> get copyWith =>
      __$$CourseProviderImplCopyWithImpl<_$CourseProviderImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseProviderImplToJson(
      this,
    );
  }
}

abstract class _CourseProvider implements CourseProvider {
  const factory _CourseProvider(
      {@JsonKey(name: "IsActive") final bool isActive,
      @JsonKey(name: "Translations")
      final List<ProviderNameTranslation> translations,
      @JsonKey(name: "CanDeleted") final bool canDeleted,
      @JsonKey(name: "Id") required final int id}) = _$CourseProviderImpl;

  factory _CourseProvider.fromJson(Map<String, dynamic> json) =
      _$CourseProviderImpl.fromJson;

  @override
  @JsonKey(name: "IsActive")
  bool get isActive;
  @override
  @JsonKey(name: "Translations")
  List<ProviderNameTranslation> get translations;
  @override
  @JsonKey(name: "CanDeleted")
  bool get canDeleted;
  @override
  @JsonKey(name: "Id")
  int get id;

  /// Create a copy of CourseProvider
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseProviderImplCopyWith<_$CourseProviderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProviderNameTranslation _$ProviderNameTranslationFromJson(
    Map<String, dynamic> json) {
  return _ProviderNameTranslation.fromJson(json);
}

/// @nodoc
mixin _$ProviderNameTranslation {
  @JsonKey(name: "LanguageId")
  int get languageId => throw _privateConstructorUsedError;
  @JsonKey(name: "Name")
  String get name => throw _privateConstructorUsedError;

  /// Serializes this ProviderNameTranslation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProviderNameTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProviderNameTranslationCopyWith<ProviderNameTranslation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProviderNameTranslationCopyWith<$Res> {
  factory $ProviderNameTranslationCopyWith(ProviderNameTranslation value,
          $Res Function(ProviderNameTranslation) then) =
      _$ProviderNameTranslationCopyWithImpl<$Res, ProviderNameTranslation>;
  @useResult
  $Res call(
      {@JsonKey(name: "LanguageId") int languageId,
      @JsonKey(name: "Name") String name});
}

/// @nodoc
class _$ProviderNameTranslationCopyWithImpl<$Res,
        $Val extends ProviderNameTranslation>
    implements $ProviderNameTranslationCopyWith<$Res> {
  _$ProviderNameTranslationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProviderNameTranslation
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
abstract class _$$ProviderNameTranslationImplCopyWith<$Res>
    implements $ProviderNameTranslationCopyWith<$Res> {
  factory _$$ProviderNameTranslationImplCopyWith(
          _$ProviderNameTranslationImpl value,
          $Res Function(_$ProviderNameTranslationImpl) then) =
      __$$ProviderNameTranslationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "LanguageId") int languageId,
      @JsonKey(name: "Name") String name});
}

/// @nodoc
class __$$ProviderNameTranslationImplCopyWithImpl<$Res>
    extends _$ProviderNameTranslationCopyWithImpl<$Res,
        _$ProviderNameTranslationImpl>
    implements _$$ProviderNameTranslationImplCopyWith<$Res> {
  __$$ProviderNameTranslationImplCopyWithImpl(
      _$ProviderNameTranslationImpl _value,
      $Res Function(_$ProviderNameTranslationImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProviderNameTranslation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageId = null,
    Object? name = null,
  }) {
    return _then(_$ProviderNameTranslationImpl(
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
class _$ProviderNameTranslationImpl implements _ProviderNameTranslation {
  const _$ProviderNameTranslationImpl(
      {@JsonKey(name: "LanguageId") this.languageId = 0,
      @JsonKey(name: "Name") this.name = ''});

  factory _$ProviderNameTranslationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProviderNameTranslationImplFromJson(json);

  @override
  @JsonKey(name: "LanguageId")
  final int languageId;
  @override
  @JsonKey(name: "Name")
  final String name;

  @override
  String toString() {
    return 'ProviderNameTranslation(languageId: $languageId, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProviderNameTranslationImpl &&
            (identical(other.languageId, languageId) ||
                other.languageId == languageId) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, languageId, name);

  /// Create a copy of ProviderNameTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProviderNameTranslationImplCopyWith<_$ProviderNameTranslationImpl>
      get copyWith => __$$ProviderNameTranslationImplCopyWithImpl<
          _$ProviderNameTranslationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProviderNameTranslationImplToJson(
      this,
    );
  }
}

abstract class _ProviderNameTranslation implements ProviderNameTranslation {
  const factory _ProviderNameTranslation(
          {@JsonKey(name: "LanguageId") final int languageId,
          @JsonKey(name: "Name") final String name}) =
      _$ProviderNameTranslationImpl;

  factory _ProviderNameTranslation.fromJson(Map<String, dynamic> json) =
      _$ProviderNameTranslationImpl.fromJson;

  @override
  @JsonKey(name: "LanguageId")
  int get languageId;
  @override
  @JsonKey(name: "Name")
  String get name;

  /// Create a copy of ProviderNameTranslation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProviderNameTranslationImplCopyWith<_$ProviderNameTranslationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GetTrainingCourseAttachmentResponseModel
    _$GetTrainingCourseAttachmentResponseModelFromJson(
        Map<String, dynamic> json) {
  return _GetTrainingCourseAttachmentResponseModel.fromJson(json);
}

/// @nodoc
mixin _$GetTrainingCourseAttachmentResponseModel {
  @JsonKey(name: "Code")
  int get code => throw _privateConstructorUsedError;
  @JsonKey(name: "Message")
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: "Result")
  bool get result => throw _privateConstructorUsedError;
  @JsonKey(name: "Data")
  List<AttachmentModel> get data => throw _privateConstructorUsedError;

  /// Serializes this GetTrainingCourseAttachmentResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetTrainingCourseAttachmentResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetTrainingCourseAttachmentResponseModelCopyWith<
          GetTrainingCourseAttachmentResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetTrainingCourseAttachmentResponseModelCopyWith<$Res> {
  factory $GetTrainingCourseAttachmentResponseModelCopyWith(
          GetTrainingCourseAttachmentResponseModel value,
          $Res Function(GetTrainingCourseAttachmentResponseModel) then) =
      _$GetTrainingCourseAttachmentResponseModelCopyWithImpl<$Res,
          GetTrainingCourseAttachmentResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "Code") int code,
      @JsonKey(name: "Message") String message,
      @JsonKey(name: "Result") bool result,
      @JsonKey(name: "Data") List<AttachmentModel> data});
}

/// @nodoc
class _$GetTrainingCourseAttachmentResponseModelCopyWithImpl<$Res,
        $Val extends GetTrainingCourseAttachmentResponseModel>
    implements $GetTrainingCourseAttachmentResponseModelCopyWith<$Res> {
  _$GetTrainingCourseAttachmentResponseModelCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetTrainingCourseAttachmentResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? result = null,
    Object? data = null,
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
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AttachmentModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetTrainingCourseAttachmentResponseModelImplCopyWith<$Res>
    implements $GetTrainingCourseAttachmentResponseModelCopyWith<$Res> {
  factory _$$GetTrainingCourseAttachmentResponseModelImplCopyWith(
          _$GetTrainingCourseAttachmentResponseModelImpl value,
          $Res Function(_$GetTrainingCourseAttachmentResponseModelImpl) then) =
      __$$GetTrainingCourseAttachmentResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Code") int code,
      @JsonKey(name: "Message") String message,
      @JsonKey(name: "Result") bool result,
      @JsonKey(name: "Data") List<AttachmentModel> data});
}

/// @nodoc
class __$$GetTrainingCourseAttachmentResponseModelImplCopyWithImpl<$Res>
    extends _$GetTrainingCourseAttachmentResponseModelCopyWithImpl<$Res,
        _$GetTrainingCourseAttachmentResponseModelImpl>
    implements _$$GetTrainingCourseAttachmentResponseModelImplCopyWith<$Res> {
  __$$GetTrainingCourseAttachmentResponseModelImplCopyWithImpl(
      _$GetTrainingCourseAttachmentResponseModelImpl _value,
      $Res Function(_$GetTrainingCourseAttachmentResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetTrainingCourseAttachmentResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? result = null,
    Object? data = null,
  }) {
    return _then(_$GetTrainingCourseAttachmentResponseModelImpl(
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
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AttachmentModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetTrainingCourseAttachmentResponseModelImpl
    implements _GetTrainingCourseAttachmentResponseModel {
  _$GetTrainingCourseAttachmentResponseModelImpl(
      {@JsonKey(name: "Code") required this.code,
      @JsonKey(name: "Message") required this.message,
      @JsonKey(name: "Result") required this.result,
      @JsonKey(name: "Data") required final List<AttachmentModel> data})
      : _data = data;

  factory _$GetTrainingCourseAttachmentResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GetTrainingCourseAttachmentResponseModelImplFromJson(json);

  @override
  @JsonKey(name: "Code")
  final int code;
  @override
  @JsonKey(name: "Message")
  final String message;
  @override
  @JsonKey(name: "Result")
  final bool result;
  final List<AttachmentModel> _data;
  @override
  @JsonKey(name: "Data")
  List<AttachmentModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'GetTrainingCourseAttachmentResponseModel(code: $code, message: $message, result: $result, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTrainingCourseAttachmentResponseModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.result, result) || other.result == result) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message, result,
      const DeepCollectionEquality().hash(_data));

  /// Create a copy of GetTrainingCourseAttachmentResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTrainingCourseAttachmentResponseModelImplCopyWith<
          _$GetTrainingCourseAttachmentResponseModelImpl>
      get copyWith =>
          __$$GetTrainingCourseAttachmentResponseModelImplCopyWithImpl<
              _$GetTrainingCourseAttachmentResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetTrainingCourseAttachmentResponseModelImplToJson(
      this,
    );
  }
}

abstract class _GetTrainingCourseAttachmentResponseModel
    implements GetTrainingCourseAttachmentResponseModel {
  factory _GetTrainingCourseAttachmentResponseModel(
          {@JsonKey(name: "Code") required final int code,
          @JsonKey(name: "Message") required final String message,
          @JsonKey(name: "Result") required final bool result,
          @JsonKey(name: "Data") required final List<AttachmentModel> data}) =
      _$GetTrainingCourseAttachmentResponseModelImpl;

  factory _GetTrainingCourseAttachmentResponseModel.fromJson(
          Map<String, dynamic> json) =
      _$GetTrainingCourseAttachmentResponseModelImpl.fromJson;

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
  List<AttachmentModel> get data;

  /// Create a copy of GetTrainingCourseAttachmentResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetTrainingCourseAttachmentResponseModelImplCopyWith<
          _$GetTrainingCourseAttachmentResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AttachmentModel _$AttachmentModelFromJson(Map<String, dynamic> json) {
  return _AttachmentModel.fromJson(json);
}

/// @nodoc
mixin _$AttachmentModel {
  @JsonKey(name: "Id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "MimeType")
  String get mimeType => throw _privateConstructorUsedError;
  @JsonKey(name: "Base64File")
  String get base64File => throw _privateConstructorUsedError;
  @JsonKey(name: "FileName")
  String get fileName => throw _privateConstructorUsedError;

  /// Serializes this AttachmentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AttachmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttachmentModelCopyWith<AttachmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttachmentModelCopyWith<$Res> {
  factory $AttachmentModelCopyWith(
          AttachmentModel value, $Res Function(AttachmentModel) then) =
      _$AttachmentModelCopyWithImpl<$Res, AttachmentModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "MimeType") String mimeType,
      @JsonKey(name: "Base64File") String base64File,
      @JsonKey(name: "FileName") String fileName});
}

/// @nodoc
class _$AttachmentModelCopyWithImpl<$Res, $Val extends AttachmentModel>
    implements $AttachmentModelCopyWith<$Res> {
  _$AttachmentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttachmentModel
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
abstract class _$$AttachmentModelImplCopyWith<$Res>
    implements $AttachmentModelCopyWith<$Res> {
  factory _$$AttachmentModelImplCopyWith(_$AttachmentModelImpl value,
          $Res Function(_$AttachmentModelImpl) then) =
      __$$AttachmentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "MimeType") String mimeType,
      @JsonKey(name: "Base64File") String base64File,
      @JsonKey(name: "FileName") String fileName});
}

/// @nodoc
class __$$AttachmentModelImplCopyWithImpl<$Res>
    extends _$AttachmentModelCopyWithImpl<$Res, _$AttachmentModelImpl>
    implements _$$AttachmentModelImplCopyWith<$Res> {
  __$$AttachmentModelImplCopyWithImpl(
      _$AttachmentModelImpl _value, $Res Function(_$AttachmentModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttachmentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mimeType = null,
    Object? base64File = null,
    Object? fileName = null,
  }) {
    return _then(_$AttachmentModelImpl(
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
class _$AttachmentModelImpl implements _AttachmentModel {
  _$AttachmentModelImpl(
      {@JsonKey(name: "Id") required this.id,
      @JsonKey(name: "MimeType") required this.mimeType,
      @JsonKey(name: "Base64File") required this.base64File,
      @JsonKey(name: "FileName") required this.fileName});

  factory _$AttachmentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttachmentModelImplFromJson(json);

  @override
  @JsonKey(name: "Id")
  final int id;
  @override
  @JsonKey(name: "MimeType")
  final String mimeType;
  @override
  @JsonKey(name: "Base64File")
  final String base64File;
  @override
  @JsonKey(name: "FileName")
  final String fileName;

  @override
  String toString() {
    return 'AttachmentModel(id: $id, mimeType: $mimeType, base64File: $base64File, fileName: $fileName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttachmentModelImpl &&
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

  /// Create a copy of AttachmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttachmentModelImplCopyWith<_$AttachmentModelImpl> get copyWith =>
      __$$AttachmentModelImplCopyWithImpl<_$AttachmentModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttachmentModelImplToJson(
      this,
    );
  }
}

abstract class _AttachmentModel implements AttachmentModel {
  factory _AttachmentModel(
          {@JsonKey(name: "Id") required final int id,
          @JsonKey(name: "MimeType") required final String mimeType,
          @JsonKey(name: "Base64File") required final String base64File,
          @JsonKey(name: "FileName") required final String fileName}) =
      _$AttachmentModelImpl;

  factory _AttachmentModel.fromJson(Map<String, dynamic> json) =
      _$AttachmentModelImpl.fromJson;

  @override
  @JsonKey(name: "Id")
  int get id;
  @override
  @JsonKey(name: "MimeType")
  String get mimeType;
  @override
  @JsonKey(name: "Base64File")
  String get base64File;
  @override
  @JsonKey(name: "FileName")
  String get fileName;

  /// Create a copy of AttachmentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttachmentModelImplCopyWith<_$AttachmentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetTrainingCourseSessionsResponseModel
    _$GetTrainingCourseSessionsResponseModelFromJson(
        Map<String, dynamic> json) {
  return _GetTrainingCourseSessionsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$GetTrainingCourseSessionsResponseModel {
  @JsonKey(name: "Code")
  int get code => throw _privateConstructorUsedError;
  @JsonKey(name: "Message")
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: "Result")
  bool get result => throw _privateConstructorUsedError;
  @JsonKey(name: "Data")
  TrainingSessionsDataModel get data => throw _privateConstructorUsedError;

  /// Serializes this GetTrainingCourseSessionsResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetTrainingCourseSessionsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetTrainingCourseSessionsResponseModelCopyWith<
          GetTrainingCourseSessionsResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetTrainingCourseSessionsResponseModelCopyWith<$Res> {
  factory $GetTrainingCourseSessionsResponseModelCopyWith(
          GetTrainingCourseSessionsResponseModel value,
          $Res Function(GetTrainingCourseSessionsResponseModel) then) =
      _$GetTrainingCourseSessionsResponseModelCopyWithImpl<$Res,
          GetTrainingCourseSessionsResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "Code") int code,
      @JsonKey(name: "Message") String message,
      @JsonKey(name: "Result") bool result,
      @JsonKey(name: "Data") TrainingSessionsDataModel data});

  $TrainingSessionsDataModelCopyWith<$Res> get data;
}

/// @nodoc
class _$GetTrainingCourseSessionsResponseModelCopyWithImpl<$Res,
        $Val extends GetTrainingCourseSessionsResponseModel>
    implements $GetTrainingCourseSessionsResponseModelCopyWith<$Res> {
  _$GetTrainingCourseSessionsResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetTrainingCourseSessionsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? result = null,
    Object? data = null,
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
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TrainingSessionsDataModel,
    ) as $Val);
  }

  /// Create a copy of GetTrainingCourseSessionsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TrainingSessionsDataModelCopyWith<$Res> get data {
    return $TrainingSessionsDataModelCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetTrainingCourseSessionsResponseModelImplCopyWith<$Res>
    implements $GetTrainingCourseSessionsResponseModelCopyWith<$Res> {
  factory _$$GetTrainingCourseSessionsResponseModelImplCopyWith(
          _$GetTrainingCourseSessionsResponseModelImpl value,
          $Res Function(_$GetTrainingCourseSessionsResponseModelImpl) then) =
      __$$GetTrainingCourseSessionsResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Code") int code,
      @JsonKey(name: "Message") String message,
      @JsonKey(name: "Result") bool result,
      @JsonKey(name: "Data") TrainingSessionsDataModel data});

  @override
  $TrainingSessionsDataModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$GetTrainingCourseSessionsResponseModelImplCopyWithImpl<$Res>
    extends _$GetTrainingCourseSessionsResponseModelCopyWithImpl<$Res,
        _$GetTrainingCourseSessionsResponseModelImpl>
    implements _$$GetTrainingCourseSessionsResponseModelImplCopyWith<$Res> {
  __$$GetTrainingCourseSessionsResponseModelImplCopyWithImpl(
      _$GetTrainingCourseSessionsResponseModelImpl _value,
      $Res Function(_$GetTrainingCourseSessionsResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetTrainingCourseSessionsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? result = null,
    Object? data = null,
  }) {
    return _then(_$GetTrainingCourseSessionsResponseModelImpl(
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
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TrainingSessionsDataModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetTrainingCourseSessionsResponseModelImpl
    implements _GetTrainingCourseSessionsResponseModel {
  _$GetTrainingCourseSessionsResponseModelImpl(
      {@JsonKey(name: "Code") required this.code,
      @JsonKey(name: "Message") required this.message,
      @JsonKey(name: "Result") required this.result,
      @JsonKey(name: "Data") required this.data});

  factory _$GetTrainingCourseSessionsResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GetTrainingCourseSessionsResponseModelImplFromJson(json);

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
  final TrainingSessionsDataModel data;

  @override
  String toString() {
    return 'GetTrainingCourseSessionsResponseModel(code: $code, message: $message, result: $result, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTrainingCourseSessionsResponseModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message, result, data);

  /// Create a copy of GetTrainingCourseSessionsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTrainingCourseSessionsResponseModelImplCopyWith<
          _$GetTrainingCourseSessionsResponseModelImpl>
      get copyWith =>
          __$$GetTrainingCourseSessionsResponseModelImplCopyWithImpl<
              _$GetTrainingCourseSessionsResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetTrainingCourseSessionsResponseModelImplToJson(
      this,
    );
  }
}

abstract class _GetTrainingCourseSessionsResponseModel
    implements GetTrainingCourseSessionsResponseModel {
  factory _GetTrainingCourseSessionsResponseModel(
          {@JsonKey(name: "Code") required final int code,
          @JsonKey(name: "Message") required final String message,
          @JsonKey(name: "Result") required final bool result,
          @JsonKey(name: "Data")
          required final TrainingSessionsDataModel data}) =
      _$GetTrainingCourseSessionsResponseModelImpl;

  factory _GetTrainingCourseSessionsResponseModel.fromJson(
          Map<String, dynamic> json) =
      _$GetTrainingCourseSessionsResponseModelImpl.fromJson;

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
  TrainingSessionsDataModel get data;

  /// Create a copy of GetTrainingCourseSessionsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetTrainingCourseSessionsResponseModelImplCopyWith<
          _$GetTrainingCourseSessionsResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TrainingSessionsDataModel _$TrainingSessionsDataModelFromJson(
    Map<String, dynamic> json) {
  return _TrainingSessionsDataModel.fromJson(json);
}

/// @nodoc
mixin _$TrainingSessionsDataModel {
  @JsonKey(name: "Sessions")
  List<TrainingSessionModel> get sessions => throw _privateConstructorUsedError;
  @JsonKey(name: "Pager")
  Pager get pager => throw _privateConstructorUsedError;

  /// Serializes this TrainingSessionsDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrainingSessionsDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrainingSessionsDataModelCopyWith<TrainingSessionsDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainingSessionsDataModelCopyWith<$Res> {
  factory $TrainingSessionsDataModelCopyWith(TrainingSessionsDataModel value,
          $Res Function(TrainingSessionsDataModel) then) =
      _$TrainingSessionsDataModelCopyWithImpl<$Res, TrainingSessionsDataModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "Sessions") List<TrainingSessionModel> sessions,
      @JsonKey(name: "Pager") Pager pager});

  $PagerCopyWith<$Res> get pager;
}

/// @nodoc
class _$TrainingSessionsDataModelCopyWithImpl<$Res,
        $Val extends TrainingSessionsDataModel>
    implements $TrainingSessionsDataModelCopyWith<$Res> {
  _$TrainingSessionsDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrainingSessionsDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessions = null,
    Object? pager = null,
  }) {
    return _then(_value.copyWith(
      sessions: null == sessions
          ? _value.sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<TrainingSessionModel>,
      pager: null == pager
          ? _value.pager
          : pager // ignore: cast_nullable_to_non_nullable
              as Pager,
    ) as $Val);
  }

  /// Create a copy of TrainingSessionsDataModel
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
abstract class _$$TrainingSessionsDataModelImplCopyWith<$Res>
    implements $TrainingSessionsDataModelCopyWith<$Res> {
  factory _$$TrainingSessionsDataModelImplCopyWith(
          _$TrainingSessionsDataModelImpl value,
          $Res Function(_$TrainingSessionsDataModelImpl) then) =
      __$$TrainingSessionsDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Sessions") List<TrainingSessionModel> sessions,
      @JsonKey(name: "Pager") Pager pager});

  @override
  $PagerCopyWith<$Res> get pager;
}

/// @nodoc
class __$$TrainingSessionsDataModelImplCopyWithImpl<$Res>
    extends _$TrainingSessionsDataModelCopyWithImpl<$Res,
        _$TrainingSessionsDataModelImpl>
    implements _$$TrainingSessionsDataModelImplCopyWith<$Res> {
  __$$TrainingSessionsDataModelImplCopyWithImpl(
      _$TrainingSessionsDataModelImpl _value,
      $Res Function(_$TrainingSessionsDataModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrainingSessionsDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessions = null,
    Object? pager = null,
  }) {
    return _then(_$TrainingSessionsDataModelImpl(
      sessions: null == sessions
          ? _value._sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<TrainingSessionModel>,
      pager: null == pager
          ? _value.pager
          : pager // ignore: cast_nullable_to_non_nullable
              as Pager,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrainingSessionsDataModelImpl implements _TrainingSessionsDataModel {
  _$TrainingSessionsDataModelImpl(
      {@JsonKey(name: "Sessions")
      required final List<TrainingSessionModel> sessions,
      @JsonKey(name: "Pager") required this.pager})
      : _sessions = sessions;

  factory _$TrainingSessionsDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrainingSessionsDataModelImplFromJson(json);

  final List<TrainingSessionModel> _sessions;
  @override
  @JsonKey(name: "Sessions")
  List<TrainingSessionModel> get sessions {
    if (_sessions is EqualUnmodifiableListView) return _sessions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sessions);
  }

  @override
  @JsonKey(name: "Pager")
  final Pager pager;

  @override
  String toString() {
    return 'TrainingSessionsDataModel(sessions: $sessions, pager: $pager)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrainingSessionsDataModelImpl &&
            const DeepCollectionEquality().equals(other._sessions, _sessions) &&
            (identical(other.pager, pager) || other.pager == pager));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_sessions), pager);

  /// Create a copy of TrainingSessionsDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrainingSessionsDataModelImplCopyWith<_$TrainingSessionsDataModelImpl>
      get copyWith => __$$TrainingSessionsDataModelImplCopyWithImpl<
          _$TrainingSessionsDataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrainingSessionsDataModelImplToJson(
      this,
    );
  }
}

abstract class _TrainingSessionsDataModel implements TrainingSessionsDataModel {
  factory _TrainingSessionsDataModel(
          {@JsonKey(name: "Sessions")
          required final List<TrainingSessionModel> sessions,
          @JsonKey(name: "Pager") required final Pager pager}) =
      _$TrainingSessionsDataModelImpl;

  factory _TrainingSessionsDataModel.fromJson(Map<String, dynamic> json) =
      _$TrainingSessionsDataModelImpl.fromJson;

  @override
  @JsonKey(name: "Sessions")
  List<TrainingSessionModel> get sessions;
  @override
  @JsonKey(name: "Pager")
  Pager get pager;

  /// Create a copy of TrainingSessionsDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrainingSessionsDataModelImplCopyWith<_$TrainingSessionsDataModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TrainingSessionModel _$TrainingSessionModelFromJson(Map<String, dynamic> json) {
  return _TrainingSessionModel.fromJson(json);
}

/// @nodoc
mixin _$TrainingSessionModel {
  @JsonKey(name: "StartDate")
  String get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: "EndDate")
  String get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: "RegistrationDeadline")
  String get registrationDeadline => throw _privateConstructorUsedError;
  @JsonKey(name: "TimeFrom")
  String get timeFrom => throw _privateConstructorUsedError;
  @JsonKey(name: "TimeTo")
  String get timeTo => throw _privateConstructorUsedError;
  @JsonKey(name: "NumberOfHours")
  int get numberOfHours => throw _privateConstructorUsedError;
  @JsonKey(name: "NumberOfDays")
  int get numberOfDays => throw _privateConstructorUsedError;
  @JsonKey(name: "Language")
  int get language => throw _privateConstructorUsedError;
  @JsonKey(name: "LanguageTranslation")
  TranslationModel get languageTranslation =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "Latitude")
  double get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: "Longitude")
  double get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: "Location")
  int get location => throw _privateConstructorUsedError;
  @JsonKey(name: "LocationTranslation")
  TranslationModel get locationTranslation =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "Address")
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: "Link")
  String get link => throw _privateConstructorUsedError;
  @JsonKey(name: "Status")
  int get status => throw _privateConstructorUsedError;
  @JsonKey(name: "StatusTranslation")
  TranslationModel get statusTranslation => throw _privateConstructorUsedError;
  @JsonKey(name: "TrainingCourseId")
  int get trainingCourseId => throw _privateConstructorUsedError;
  @JsonKey(name: "Registered")
  bool get registered => throw _privateConstructorUsedError;
  @JsonKey(name: "Id")
  int get id => throw _privateConstructorUsedError;

  /// Serializes this TrainingSessionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrainingSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrainingSessionModelCopyWith<TrainingSessionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainingSessionModelCopyWith<$Res> {
  factory $TrainingSessionModelCopyWith(TrainingSessionModel value,
          $Res Function(TrainingSessionModel) then) =
      _$TrainingSessionModelCopyWithImpl<$Res, TrainingSessionModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "StartDate") String startDate,
      @JsonKey(name: "EndDate") String endDate,
      @JsonKey(name: "RegistrationDeadline") String registrationDeadline,
      @JsonKey(name: "TimeFrom") String timeFrom,
      @JsonKey(name: "TimeTo") String timeTo,
      @JsonKey(name: "NumberOfHours") int numberOfHours,
      @JsonKey(name: "NumberOfDays") int numberOfDays,
      @JsonKey(name: "Language") int language,
      @JsonKey(name: "LanguageTranslation")
      TranslationModel languageTranslation,
      @JsonKey(name: "Latitude") double latitude,
      @JsonKey(name: "Longitude") double longitude,
      @JsonKey(name: "Location") int location,
      @JsonKey(name: "LocationTranslation")
      TranslationModel locationTranslation,
      @JsonKey(name: "Address") String address,
      @JsonKey(name: "Link") String link,
      @JsonKey(name: "Status") int status,
      @JsonKey(name: "StatusTranslation") TranslationModel statusTranslation,
      @JsonKey(name: "TrainingCourseId") int trainingCourseId,
      @JsonKey(name: "Registered") bool registered,
      @JsonKey(name: "Id") int id});

  $TranslationModelCopyWith<$Res> get languageTranslation;
  $TranslationModelCopyWith<$Res> get locationTranslation;
  $TranslationModelCopyWith<$Res> get statusTranslation;
}

/// @nodoc
class _$TrainingSessionModelCopyWithImpl<$Res,
        $Val extends TrainingSessionModel>
    implements $TrainingSessionModelCopyWith<$Res> {
  _$TrainingSessionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrainingSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? registrationDeadline = null,
    Object? timeFrom = null,
    Object? timeTo = null,
    Object? numberOfHours = null,
    Object? numberOfDays = null,
    Object? language = null,
    Object? languageTranslation = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? location = null,
    Object? locationTranslation = null,
    Object? address = null,
    Object? link = null,
    Object? status = null,
    Object? statusTranslation = null,
    Object? trainingCourseId = null,
    Object? registered = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      registrationDeadline: null == registrationDeadline
          ? _value.registrationDeadline
          : registrationDeadline // ignore: cast_nullable_to_non_nullable
              as String,
      timeFrom: null == timeFrom
          ? _value.timeFrom
          : timeFrom // ignore: cast_nullable_to_non_nullable
              as String,
      timeTo: null == timeTo
          ? _value.timeTo
          : timeTo // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfHours: null == numberOfHours
          ? _value.numberOfHours
          : numberOfHours // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfDays: null == numberOfDays
          ? _value.numberOfDays
          : numberOfDays // ignore: cast_nullable_to_non_nullable
              as int,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as int,
      languageTranslation: null == languageTranslation
          ? _value.languageTranslation
          : languageTranslation // ignore: cast_nullable_to_non_nullable
              as TranslationModel,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as int,
      locationTranslation: null == locationTranslation
          ? _value.locationTranslation
          : locationTranslation // ignore: cast_nullable_to_non_nullable
              as TranslationModel,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      statusTranslation: null == statusTranslation
          ? _value.statusTranslation
          : statusTranslation // ignore: cast_nullable_to_non_nullable
              as TranslationModel,
      trainingCourseId: null == trainingCourseId
          ? _value.trainingCourseId
          : trainingCourseId // ignore: cast_nullable_to_non_nullable
              as int,
      registered: null == registered
          ? _value.registered
          : registered // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of TrainingSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TranslationModelCopyWith<$Res> get languageTranslation {
    return $TranslationModelCopyWith<$Res>(_value.languageTranslation, (value) {
      return _then(_value.copyWith(languageTranslation: value) as $Val);
    });
  }

  /// Create a copy of TrainingSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TranslationModelCopyWith<$Res> get locationTranslation {
    return $TranslationModelCopyWith<$Res>(_value.locationTranslation, (value) {
      return _then(_value.copyWith(locationTranslation: value) as $Val);
    });
  }

  /// Create a copy of TrainingSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TranslationModelCopyWith<$Res> get statusTranslation {
    return $TranslationModelCopyWith<$Res>(_value.statusTranslation, (value) {
      return _then(_value.copyWith(statusTranslation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TrainingSessionModelImplCopyWith<$Res>
    implements $TrainingSessionModelCopyWith<$Res> {
  factory _$$TrainingSessionModelImplCopyWith(_$TrainingSessionModelImpl value,
          $Res Function(_$TrainingSessionModelImpl) then) =
      __$$TrainingSessionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "StartDate") String startDate,
      @JsonKey(name: "EndDate") String endDate,
      @JsonKey(name: "RegistrationDeadline") String registrationDeadline,
      @JsonKey(name: "TimeFrom") String timeFrom,
      @JsonKey(name: "TimeTo") String timeTo,
      @JsonKey(name: "NumberOfHours") int numberOfHours,
      @JsonKey(name: "NumberOfDays") int numberOfDays,
      @JsonKey(name: "Language") int language,
      @JsonKey(name: "LanguageTranslation")
      TranslationModel languageTranslation,
      @JsonKey(name: "Latitude") double latitude,
      @JsonKey(name: "Longitude") double longitude,
      @JsonKey(name: "Location") int location,
      @JsonKey(name: "LocationTranslation")
      TranslationModel locationTranslation,
      @JsonKey(name: "Address") String address,
      @JsonKey(name: "Link") String link,
      @JsonKey(name: "Status") int status,
      @JsonKey(name: "StatusTranslation") TranslationModel statusTranslation,
      @JsonKey(name: "TrainingCourseId") int trainingCourseId,
      @JsonKey(name: "Registered") bool registered,
      @JsonKey(name: "Id") int id});

  @override
  $TranslationModelCopyWith<$Res> get languageTranslation;
  @override
  $TranslationModelCopyWith<$Res> get locationTranslation;
  @override
  $TranslationModelCopyWith<$Res> get statusTranslation;
}

/// @nodoc
class __$$TrainingSessionModelImplCopyWithImpl<$Res>
    extends _$TrainingSessionModelCopyWithImpl<$Res, _$TrainingSessionModelImpl>
    implements _$$TrainingSessionModelImplCopyWith<$Res> {
  __$$TrainingSessionModelImplCopyWithImpl(_$TrainingSessionModelImpl _value,
      $Res Function(_$TrainingSessionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrainingSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? registrationDeadline = null,
    Object? timeFrom = null,
    Object? timeTo = null,
    Object? numberOfHours = null,
    Object? numberOfDays = null,
    Object? language = null,
    Object? languageTranslation = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? location = null,
    Object? locationTranslation = null,
    Object? address = null,
    Object? link = null,
    Object? status = null,
    Object? statusTranslation = null,
    Object? trainingCourseId = null,
    Object? registered = null,
    Object? id = null,
  }) {
    return _then(_$TrainingSessionModelImpl(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      registrationDeadline: null == registrationDeadline
          ? _value.registrationDeadline
          : registrationDeadline // ignore: cast_nullable_to_non_nullable
              as String,
      timeFrom: null == timeFrom
          ? _value.timeFrom
          : timeFrom // ignore: cast_nullable_to_non_nullable
              as String,
      timeTo: null == timeTo
          ? _value.timeTo
          : timeTo // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfHours: null == numberOfHours
          ? _value.numberOfHours
          : numberOfHours // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfDays: null == numberOfDays
          ? _value.numberOfDays
          : numberOfDays // ignore: cast_nullable_to_non_nullable
              as int,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as int,
      languageTranslation: null == languageTranslation
          ? _value.languageTranslation
          : languageTranslation // ignore: cast_nullable_to_non_nullable
              as TranslationModel,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as int,
      locationTranslation: null == locationTranslation
          ? _value.locationTranslation
          : locationTranslation // ignore: cast_nullable_to_non_nullable
              as TranslationModel,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      statusTranslation: null == statusTranslation
          ? _value.statusTranslation
          : statusTranslation // ignore: cast_nullable_to_non_nullable
              as TranslationModel,
      trainingCourseId: null == trainingCourseId
          ? _value.trainingCourseId
          : trainingCourseId // ignore: cast_nullable_to_non_nullable
              as int,
      registered: null == registered
          ? _value.registered
          : registered // ignore: cast_nullable_to_non_nullable
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
class _$TrainingSessionModelImpl implements _TrainingSessionModel {
  _$TrainingSessionModelImpl(
      {@JsonKey(name: "StartDate") required this.startDate,
      @JsonKey(name: "EndDate") required this.endDate,
      @JsonKey(name: "RegistrationDeadline") required this.registrationDeadline,
      @JsonKey(name: "TimeFrom") required this.timeFrom,
      @JsonKey(name: "TimeTo") required this.timeTo,
      @JsonKey(name: "NumberOfHours") required this.numberOfHours,
      @JsonKey(name: "NumberOfDays") required this.numberOfDays,
      @JsonKey(name: "Language") required this.language,
      @JsonKey(name: "LanguageTranslation") required this.languageTranslation,
      @JsonKey(name: "Latitude") required this.latitude,
      @JsonKey(name: "Longitude") required this.longitude,
      @JsonKey(name: "Location") required this.location,
      @JsonKey(name: "LocationTranslation") required this.locationTranslation,
      @JsonKey(name: "Address") required this.address,
      @JsonKey(name: "Link") required this.link,
      @JsonKey(name: "Status") required this.status,
      @JsonKey(name: "StatusTranslation") required this.statusTranslation,
      @JsonKey(name: "TrainingCourseId") required this.trainingCourseId,
      @JsonKey(name: "Registered") required this.registered,
      @JsonKey(name: "Id") required this.id});

  factory _$TrainingSessionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrainingSessionModelImplFromJson(json);

  @override
  @JsonKey(name: "StartDate")
  final String startDate;
  @override
  @JsonKey(name: "EndDate")
  final String endDate;
  @override
  @JsonKey(name: "RegistrationDeadline")
  final String registrationDeadline;
  @override
  @JsonKey(name: "TimeFrom")
  final String timeFrom;
  @override
  @JsonKey(name: "TimeTo")
  final String timeTo;
  @override
  @JsonKey(name: "NumberOfHours")
  final int numberOfHours;
  @override
  @JsonKey(name: "NumberOfDays")
  final int numberOfDays;
  @override
  @JsonKey(name: "Language")
  final int language;
  @override
  @JsonKey(name: "LanguageTranslation")
  final TranslationModel languageTranslation;
  @override
  @JsonKey(name: "Latitude")
  final double latitude;
  @override
  @JsonKey(name: "Longitude")
  final double longitude;
  @override
  @JsonKey(name: "Location")
  final int location;
  @override
  @JsonKey(name: "LocationTranslation")
  final TranslationModel locationTranslation;
  @override
  @JsonKey(name: "Address")
  final String address;
  @override
  @JsonKey(name: "Link")
  final String link;
  @override
  @JsonKey(name: "Status")
  final int status;
  @override
  @JsonKey(name: "StatusTranslation")
  final TranslationModel statusTranslation;
  @override
  @JsonKey(name: "TrainingCourseId")
  final int trainingCourseId;
  @override
  @JsonKey(name: "Registered")
  final bool registered;
  @override
  @JsonKey(name: "Id")
  final int id;

  @override
  String toString() {
    return 'TrainingSessionModel(startDate: $startDate, endDate: $endDate, registrationDeadline: $registrationDeadline, timeFrom: $timeFrom, timeTo: $timeTo, numberOfHours: $numberOfHours, numberOfDays: $numberOfDays, language: $language, languageTranslation: $languageTranslation, latitude: $latitude, longitude: $longitude, location: $location, locationTranslation: $locationTranslation, address: $address, link: $link, status: $status, statusTranslation: $statusTranslation, trainingCourseId: $trainingCourseId, registered: $registered, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrainingSessionModelImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.registrationDeadline, registrationDeadline) ||
                other.registrationDeadline == registrationDeadline) &&
            (identical(other.timeFrom, timeFrom) ||
                other.timeFrom == timeFrom) &&
            (identical(other.timeTo, timeTo) || other.timeTo == timeTo) &&
            (identical(other.numberOfHours, numberOfHours) ||
                other.numberOfHours == numberOfHours) &&
            (identical(other.numberOfDays, numberOfDays) ||
                other.numberOfDays == numberOfDays) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.languageTranslation, languageTranslation) ||
                other.languageTranslation == languageTranslation) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.locationTranslation, locationTranslation) ||
                other.locationTranslation == locationTranslation) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusTranslation, statusTranslation) ||
                other.statusTranslation == statusTranslation) &&
            (identical(other.trainingCourseId, trainingCourseId) ||
                other.trainingCourseId == trainingCourseId) &&
            (identical(other.registered, registered) ||
                other.registered == registered) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        startDate,
        endDate,
        registrationDeadline,
        timeFrom,
        timeTo,
        numberOfHours,
        numberOfDays,
        language,
        languageTranslation,
        latitude,
        longitude,
        location,
        locationTranslation,
        address,
        link,
        status,
        statusTranslation,
        trainingCourseId,
        registered,
        id
      ]);

  /// Create a copy of TrainingSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrainingSessionModelImplCopyWith<_$TrainingSessionModelImpl>
      get copyWith =>
          __$$TrainingSessionModelImplCopyWithImpl<_$TrainingSessionModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrainingSessionModelImplToJson(
      this,
    );
  }
}

abstract class _TrainingSessionModel implements TrainingSessionModel {
  factory _TrainingSessionModel(
      {@JsonKey(name: "StartDate") required final String startDate,
      @JsonKey(name: "EndDate") required final String endDate,
      @JsonKey(name: "RegistrationDeadline")
      required final String registrationDeadline,
      @JsonKey(name: "TimeFrom") required final String timeFrom,
      @JsonKey(name: "TimeTo") required final String timeTo,
      @JsonKey(name: "NumberOfHours") required final int numberOfHours,
      @JsonKey(name: "NumberOfDays") required final int numberOfDays,
      @JsonKey(name: "Language") required final int language,
      @JsonKey(name: "LanguageTranslation")
      required final TranslationModel languageTranslation,
      @JsonKey(name: "Latitude") required final double latitude,
      @JsonKey(name: "Longitude") required final double longitude,
      @JsonKey(name: "Location") required final int location,
      @JsonKey(name: "LocationTranslation")
      required final TranslationModel locationTranslation,
      @JsonKey(name: "Address") required final String address,
      @JsonKey(name: "Link") required final String link,
      @JsonKey(name: "Status") required final int status,
      @JsonKey(name: "StatusTranslation")
      required final TranslationModel statusTranslation,
      @JsonKey(name: "TrainingCourseId") required final int trainingCourseId,
      @JsonKey(name: "Registered") required final bool registered,
      @JsonKey(name: "Id") required final int id}) = _$TrainingSessionModelImpl;

  factory _TrainingSessionModel.fromJson(Map<String, dynamic> json) =
      _$TrainingSessionModelImpl.fromJson;

  @override
  @JsonKey(name: "StartDate")
  String get startDate;
  @override
  @JsonKey(name: "EndDate")
  String get endDate;
  @override
  @JsonKey(name: "RegistrationDeadline")
  String get registrationDeadline;
  @override
  @JsonKey(name: "TimeFrom")
  String get timeFrom;
  @override
  @JsonKey(name: "TimeTo")
  String get timeTo;
  @override
  @JsonKey(name: "NumberOfHours")
  int get numberOfHours;
  @override
  @JsonKey(name: "NumberOfDays")
  int get numberOfDays;
  @override
  @JsonKey(name: "Language")
  int get language;
  @override
  @JsonKey(name: "LanguageTranslation")
  TranslationModel get languageTranslation;
  @override
  @JsonKey(name: "Latitude")
  double get latitude;
  @override
  @JsonKey(name: "Longitude")
  double get longitude;
  @override
  @JsonKey(name: "Location")
  int get location;
  @override
  @JsonKey(name: "LocationTranslation")
  TranslationModel get locationTranslation;
  @override
  @JsonKey(name: "Address")
  String get address;
  @override
  @JsonKey(name: "Link")
  String get link;
  @override
  @JsonKey(name: "Status")
  int get status;
  @override
  @JsonKey(name: "StatusTranslation")
  TranslationModel get statusTranslation;
  @override
  @JsonKey(name: "TrainingCourseId")
  int get trainingCourseId;
  @override
  @JsonKey(name: "Registered")
  bool get registered;
  @override
  @JsonKey(name: "Id")
  int get id;

  /// Create a copy of TrainingSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrainingSessionModelImplCopyWith<_$TrainingSessionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TranslationModel _$TranslationModelFromJson(Map<String, dynamic> json) {
  return _TranslationModel.fromJson(json);
}

/// @nodoc
mixin _$TranslationModel {
  @JsonKey(name: "Key")
  List<TranslationItemModel> get key => throw _privateConstructorUsedError;
  @JsonKey(name: "Value")
  int get value => throw _privateConstructorUsedError;

  /// Serializes this TranslationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TranslationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TranslationModelCopyWith<TranslationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranslationModelCopyWith<$Res> {
  factory $TranslationModelCopyWith(
          TranslationModel value, $Res Function(TranslationModel) then) =
      _$TranslationModelCopyWithImpl<$Res, TranslationModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "Key") List<TranslationItemModel> key,
      @JsonKey(name: "Value") int value});
}

/// @nodoc
class _$TranslationModelCopyWithImpl<$Res, $Val extends TranslationModel>
    implements $TranslationModelCopyWith<$Res> {
  _$TranslationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TranslationModel
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
              as List<TranslationItemModel>,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TranslationModelImplCopyWith<$Res>
    implements $TranslationModelCopyWith<$Res> {
  factory _$$TranslationModelImplCopyWith(_$TranslationModelImpl value,
          $Res Function(_$TranslationModelImpl) then) =
      __$$TranslationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Key") List<TranslationItemModel> key,
      @JsonKey(name: "Value") int value});
}

/// @nodoc
class __$$TranslationModelImplCopyWithImpl<$Res>
    extends _$TranslationModelCopyWithImpl<$Res, _$TranslationModelImpl>
    implements _$$TranslationModelImplCopyWith<$Res> {
  __$$TranslationModelImplCopyWithImpl(_$TranslationModelImpl _value,
      $Res Function(_$TranslationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranslationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? value = null,
  }) {
    return _then(_$TranslationModelImpl(
      key: null == key
          ? _value._key
          : key // ignore: cast_nullable_to_non_nullable
              as List<TranslationItemModel>,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TranslationModelImpl implements _TranslationModel {
  _$TranslationModelImpl(
      {@JsonKey(name: "Key") required final List<TranslationItemModel> key,
      @JsonKey(name: "Value") required this.value})
      : _key = key;

  factory _$TranslationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TranslationModelImplFromJson(json);

  final List<TranslationItemModel> _key;
  @override
  @JsonKey(name: "Key")
  List<TranslationItemModel> get key {
    if (_key is EqualUnmodifiableListView) return _key;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_key);
  }

  @override
  @JsonKey(name: "Value")
  final int value;

  @override
  String toString() {
    return 'TranslationModel(key: $key, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranslationModelImpl &&
            const DeepCollectionEquality().equals(other._key, _key) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_key), value);

  /// Create a copy of TranslationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranslationModelImplCopyWith<_$TranslationModelImpl> get copyWith =>
      __$$TranslationModelImplCopyWithImpl<_$TranslationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TranslationModelImplToJson(
      this,
    );
  }
}

abstract class _TranslationModel implements TranslationModel {
  factory _TranslationModel(
          {@JsonKey(name: "Key") required final List<TranslationItemModel> key,
          @JsonKey(name: "Value") required final int value}) =
      _$TranslationModelImpl;

  factory _TranslationModel.fromJson(Map<String, dynamic> json) =
      _$TranslationModelImpl.fromJson;

  @override
  @JsonKey(name: "Key")
  List<TranslationItemModel> get key;
  @override
  @JsonKey(name: "Value")
  int get value;

  /// Create a copy of TranslationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranslationModelImplCopyWith<_$TranslationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TranslationItemModel _$TranslationItemModelFromJson(Map<String, dynamic> json) {
  return _TranslationItemModel.fromJson(json);
}

/// @nodoc
mixin _$TranslationItemModel {
  @JsonKey(name: "LanguageId")
  int get languageId => throw _privateConstructorUsedError;
  @JsonKey(name: "Name")
  String get name => throw _privateConstructorUsedError;

  /// Serializes this TranslationItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TranslationItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TranslationItemModelCopyWith<TranslationItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranslationItemModelCopyWith<$Res> {
  factory $TranslationItemModelCopyWith(TranslationItemModel value,
          $Res Function(TranslationItemModel) then) =
      _$TranslationItemModelCopyWithImpl<$Res, TranslationItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "LanguageId") int languageId,
      @JsonKey(name: "Name") String name});
}

/// @nodoc
class _$TranslationItemModelCopyWithImpl<$Res,
        $Val extends TranslationItemModel>
    implements $TranslationItemModelCopyWith<$Res> {
  _$TranslationItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TranslationItemModel
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
abstract class _$$TranslationItemModelImplCopyWith<$Res>
    implements $TranslationItemModelCopyWith<$Res> {
  factory _$$TranslationItemModelImplCopyWith(_$TranslationItemModelImpl value,
          $Res Function(_$TranslationItemModelImpl) then) =
      __$$TranslationItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "LanguageId") int languageId,
      @JsonKey(name: "Name") String name});
}

/// @nodoc
class __$$TranslationItemModelImplCopyWithImpl<$Res>
    extends _$TranslationItemModelCopyWithImpl<$Res, _$TranslationItemModelImpl>
    implements _$$TranslationItemModelImplCopyWith<$Res> {
  __$$TranslationItemModelImplCopyWithImpl(_$TranslationItemModelImpl _value,
      $Res Function(_$TranslationItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranslationItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageId = null,
    Object? name = null,
  }) {
    return _then(_$TranslationItemModelImpl(
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
class _$TranslationItemModelImpl implements _TranslationItemModel {
  _$TranslationItemModelImpl(
      {@JsonKey(name: "LanguageId") required this.languageId,
      @JsonKey(name: "Name") required this.name});

  factory _$TranslationItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TranslationItemModelImplFromJson(json);

  @override
  @JsonKey(name: "LanguageId")
  final int languageId;
  @override
  @JsonKey(name: "Name")
  final String name;

  @override
  String toString() {
    return 'TranslationItemModel(languageId: $languageId, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranslationItemModelImpl &&
            (identical(other.languageId, languageId) ||
                other.languageId == languageId) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, languageId, name);

  /// Create a copy of TranslationItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranslationItemModelImplCopyWith<_$TranslationItemModelImpl>
      get copyWith =>
          __$$TranslationItemModelImplCopyWithImpl<_$TranslationItemModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TranslationItemModelImplToJson(
      this,
    );
  }
}

abstract class _TranslationItemModel implements TranslationItemModel {
  factory _TranslationItemModel(
          {@JsonKey(name: "LanguageId") required final int languageId,
          @JsonKey(name: "Name") required final String name}) =
      _$TranslationItemModelImpl;

  factory _TranslationItemModel.fromJson(Map<String, dynamic> json) =
      _$TranslationItemModelImpl.fromJson;

  @override
  @JsonKey(name: "LanguageId")
  int get languageId;
  @override
  @JsonKey(name: "Name")
  String get name;

  /// Create a copy of TranslationItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranslationItemModelImplCopyWith<_$TranslationItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
