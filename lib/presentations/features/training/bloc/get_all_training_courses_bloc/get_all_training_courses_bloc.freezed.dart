// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_training_courses_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetAllTrainingCoursesEvent {
  GetAllCoursesRequestModel get request => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GetAllCoursesRequestModel request) started,
    required TResult Function(GetAllCoursesRequestModel request) fetchNextPage,
    required TResult Function(GetAllCoursesRequestModel request) applyFilters,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GetAllCoursesRequestModel request)? started,
    TResult? Function(GetAllCoursesRequestModel request)? fetchNextPage,
    TResult? Function(GetAllCoursesRequestModel request)? applyFilters,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GetAllCoursesRequestModel request)? started,
    TResult Function(GetAllCoursesRequestModel request)? fetchNextPage,
    TResult Function(GetAllCoursesRequestModel request)? applyFilters,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FetchNextPage value) fetchNextPage,
    required TResult Function(_ApplyFilters value) applyFilters,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FetchNextPage value)? fetchNextPage,
    TResult? Function(_ApplyFilters value)? applyFilters,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchNextPage value)? fetchNextPage,
    TResult Function(_ApplyFilters value)? applyFilters,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of GetAllTrainingCoursesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetAllTrainingCoursesEventCopyWith<GetAllTrainingCoursesEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllTrainingCoursesEventCopyWith<$Res> {
  factory $GetAllTrainingCoursesEventCopyWith(GetAllTrainingCoursesEvent value,
          $Res Function(GetAllTrainingCoursesEvent) then) =
      _$GetAllTrainingCoursesEventCopyWithImpl<$Res,
          GetAllTrainingCoursesEvent>;
  @useResult
  $Res call({GetAllCoursesRequestModel request});

  $GetAllCoursesRequestModelCopyWith<$Res> get request;
}

/// @nodoc
class _$GetAllTrainingCoursesEventCopyWithImpl<$Res,
        $Val extends GetAllTrainingCoursesEvent>
    implements $GetAllTrainingCoursesEventCopyWith<$Res> {
  _$GetAllTrainingCoursesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetAllTrainingCoursesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_value.copyWith(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as GetAllCoursesRequestModel,
    ) as $Val);
  }

  /// Create a copy of GetAllTrainingCoursesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GetAllCoursesRequestModelCopyWith<$Res> get request {
    return $GetAllCoursesRequestModelCopyWith<$Res>(_value.request, (value) {
      return _then(_value.copyWith(request: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res>
    implements $GetAllTrainingCoursesEventCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GetAllCoursesRequestModel request});

  @override
  $GetAllCoursesRequestModelCopyWith<$Res> get request;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$GetAllTrainingCoursesEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllTrainingCoursesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$StartedImpl(
      null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as GetAllCoursesRequestModel,
    ));
  }
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl(this.request);

  @override
  final GetAllCoursesRequestModel request;

  @override
  String toString() {
    return 'GetAllTrainingCoursesEvent.started(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartedImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of GetAllTrainingCoursesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      __$$StartedImplCopyWithImpl<_$StartedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GetAllCoursesRequestModel request) started,
    required TResult Function(GetAllCoursesRequestModel request) fetchNextPage,
    required TResult Function(GetAllCoursesRequestModel request) applyFilters,
  }) {
    return started(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GetAllCoursesRequestModel request)? started,
    TResult? Function(GetAllCoursesRequestModel request)? fetchNextPage,
    TResult? Function(GetAllCoursesRequestModel request)? applyFilters,
  }) {
    return started?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GetAllCoursesRequestModel request)? started,
    TResult Function(GetAllCoursesRequestModel request)? fetchNextPage,
    TResult Function(GetAllCoursesRequestModel request)? applyFilters,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FetchNextPage value) fetchNextPage,
    required TResult Function(_ApplyFilters value) applyFilters,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FetchNextPage value)? fetchNextPage,
    TResult? Function(_ApplyFilters value)? applyFilters,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchNextPage value)? fetchNextPage,
    TResult Function(_ApplyFilters value)? applyFilters,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements GetAllTrainingCoursesEvent {
  const factory _Started(final GetAllCoursesRequestModel request) =
      _$StartedImpl;

  @override
  GetAllCoursesRequestModel get request;

  /// Create a copy of GetAllTrainingCoursesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchNextPageImplCopyWith<$Res>
    implements $GetAllTrainingCoursesEventCopyWith<$Res> {
  factory _$$FetchNextPageImplCopyWith(
          _$FetchNextPageImpl value, $Res Function(_$FetchNextPageImpl) then) =
      __$$FetchNextPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GetAllCoursesRequestModel request});

  @override
  $GetAllCoursesRequestModelCopyWith<$Res> get request;
}

/// @nodoc
class __$$FetchNextPageImplCopyWithImpl<$Res>
    extends _$GetAllTrainingCoursesEventCopyWithImpl<$Res, _$FetchNextPageImpl>
    implements _$$FetchNextPageImplCopyWith<$Res> {
  __$$FetchNextPageImplCopyWithImpl(
      _$FetchNextPageImpl _value, $Res Function(_$FetchNextPageImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllTrainingCoursesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$FetchNextPageImpl(
      null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as GetAllCoursesRequestModel,
    ));
  }
}

/// @nodoc

class _$FetchNextPageImpl implements _FetchNextPage {
  const _$FetchNextPageImpl(this.request);

  @override
  final GetAllCoursesRequestModel request;

  @override
  String toString() {
    return 'GetAllTrainingCoursesEvent.fetchNextPage(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchNextPageImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of GetAllTrainingCoursesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchNextPageImplCopyWith<_$FetchNextPageImpl> get copyWith =>
      __$$FetchNextPageImplCopyWithImpl<_$FetchNextPageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GetAllCoursesRequestModel request) started,
    required TResult Function(GetAllCoursesRequestModel request) fetchNextPage,
    required TResult Function(GetAllCoursesRequestModel request) applyFilters,
  }) {
    return fetchNextPage(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GetAllCoursesRequestModel request)? started,
    TResult? Function(GetAllCoursesRequestModel request)? fetchNextPage,
    TResult? Function(GetAllCoursesRequestModel request)? applyFilters,
  }) {
    return fetchNextPage?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GetAllCoursesRequestModel request)? started,
    TResult Function(GetAllCoursesRequestModel request)? fetchNextPage,
    TResult Function(GetAllCoursesRequestModel request)? applyFilters,
    required TResult orElse(),
  }) {
    if (fetchNextPage != null) {
      return fetchNextPage(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FetchNextPage value) fetchNextPage,
    required TResult Function(_ApplyFilters value) applyFilters,
  }) {
    return fetchNextPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FetchNextPage value)? fetchNextPage,
    TResult? Function(_ApplyFilters value)? applyFilters,
  }) {
    return fetchNextPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchNextPage value)? fetchNextPage,
    TResult Function(_ApplyFilters value)? applyFilters,
    required TResult orElse(),
  }) {
    if (fetchNextPage != null) {
      return fetchNextPage(this);
    }
    return orElse();
  }
}

abstract class _FetchNextPage implements GetAllTrainingCoursesEvent {
  const factory _FetchNextPage(final GetAllCoursesRequestModel request) =
      _$FetchNextPageImpl;

  @override
  GetAllCoursesRequestModel get request;

  /// Create a copy of GetAllTrainingCoursesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchNextPageImplCopyWith<_$FetchNextPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApplyFiltersImplCopyWith<$Res>
    implements $GetAllTrainingCoursesEventCopyWith<$Res> {
  factory _$$ApplyFiltersImplCopyWith(
          _$ApplyFiltersImpl value, $Res Function(_$ApplyFiltersImpl) then) =
      __$$ApplyFiltersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GetAllCoursesRequestModel request});

  @override
  $GetAllCoursesRequestModelCopyWith<$Res> get request;
}

/// @nodoc
class __$$ApplyFiltersImplCopyWithImpl<$Res>
    extends _$GetAllTrainingCoursesEventCopyWithImpl<$Res, _$ApplyFiltersImpl>
    implements _$$ApplyFiltersImplCopyWith<$Res> {
  __$$ApplyFiltersImplCopyWithImpl(
      _$ApplyFiltersImpl _value, $Res Function(_$ApplyFiltersImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllTrainingCoursesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$ApplyFiltersImpl(
      null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as GetAllCoursesRequestModel,
    ));
  }
}

/// @nodoc

class _$ApplyFiltersImpl implements _ApplyFilters {
  const _$ApplyFiltersImpl(this.request);

  @override
  final GetAllCoursesRequestModel request;

  @override
  String toString() {
    return 'GetAllTrainingCoursesEvent.applyFilters(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplyFiltersImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of GetAllTrainingCoursesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplyFiltersImplCopyWith<_$ApplyFiltersImpl> get copyWith =>
      __$$ApplyFiltersImplCopyWithImpl<_$ApplyFiltersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GetAllCoursesRequestModel request) started,
    required TResult Function(GetAllCoursesRequestModel request) fetchNextPage,
    required TResult Function(GetAllCoursesRequestModel request) applyFilters,
  }) {
    return applyFilters(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GetAllCoursesRequestModel request)? started,
    TResult? Function(GetAllCoursesRequestModel request)? fetchNextPage,
    TResult? Function(GetAllCoursesRequestModel request)? applyFilters,
  }) {
    return applyFilters?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GetAllCoursesRequestModel request)? started,
    TResult Function(GetAllCoursesRequestModel request)? fetchNextPage,
    TResult Function(GetAllCoursesRequestModel request)? applyFilters,
    required TResult orElse(),
  }) {
    if (applyFilters != null) {
      return applyFilters(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FetchNextPage value) fetchNextPage,
    required TResult Function(_ApplyFilters value) applyFilters,
  }) {
    return applyFilters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FetchNextPage value)? fetchNextPage,
    TResult? Function(_ApplyFilters value)? applyFilters,
  }) {
    return applyFilters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchNextPage value)? fetchNextPage,
    TResult Function(_ApplyFilters value)? applyFilters,
    required TResult orElse(),
  }) {
    if (applyFilters != null) {
      return applyFilters(this);
    }
    return orElse();
  }
}

abstract class _ApplyFilters implements GetAllTrainingCoursesEvent {
  const factory _ApplyFilters(final GetAllCoursesRequestModel request) =
      _$ApplyFiltersImpl;

  @override
  GetAllCoursesRequestModel get request;

  /// Create a copy of GetAllTrainingCoursesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplyFiltersImplCopyWith<_$ApplyFiltersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetAllTrainingCoursesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            GetAllCoursesResponseModel coursesResponse,
            GetAllCategoriesResponseModel categoriesResponse,
            GetTrainingCourseProvidersResponseModel providersResponse,
            bool isApplyFilterLoading)
        done,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            GetAllCoursesResponseModel coursesResponse,
            GetAllCategoriesResponseModel categoriesResponse,
            GetTrainingCourseProvidersResponseModel providersResponse,
            bool isApplyFilterLoading)?
        done,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            GetAllCoursesResponseModel coursesResponse,
            GetAllCategoriesResponseModel categoriesResponse,
            GetTrainingCourseProvidersResponseModel providersResponse,
            bool isApplyFilterLoading)?
        done,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Done value) done,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Done value)? done,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Done value)? done,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllTrainingCoursesStateCopyWith<$Res> {
  factory $GetAllTrainingCoursesStateCopyWith(GetAllTrainingCoursesState value,
          $Res Function(GetAllTrainingCoursesState) then) =
      _$GetAllTrainingCoursesStateCopyWithImpl<$Res,
          GetAllTrainingCoursesState>;
}

/// @nodoc
class _$GetAllTrainingCoursesStateCopyWithImpl<$Res,
        $Val extends GetAllTrainingCoursesState>
    implements $GetAllTrainingCoursesStateCopyWith<$Res> {
  _$GetAllTrainingCoursesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetAllTrainingCoursesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$GetAllTrainingCoursesStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllTrainingCoursesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'GetAllTrainingCoursesState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            GetAllCoursesResponseModel coursesResponse,
            GetAllCategoriesResponseModel categoriesResponse,
            GetTrainingCourseProvidersResponseModel providersResponse,
            bool isApplyFilterLoading)
        done,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            GetAllCoursesResponseModel coursesResponse,
            GetAllCategoriesResponseModel categoriesResponse,
            GetTrainingCourseProvidersResponseModel providersResponse,
            bool isApplyFilterLoading)?
        done,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            GetAllCoursesResponseModel coursesResponse,
            GetAllCategoriesResponseModel categoriesResponse,
            GetTrainingCourseProvidersResponseModel providersResponse,
            bool isApplyFilterLoading)?
        done,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Done value) done,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Done value)? done,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Done value)? done,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements GetAllTrainingCoursesState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$GetAllTrainingCoursesStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllTrainingCoursesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'GetAllTrainingCoursesState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            GetAllCoursesResponseModel coursesResponse,
            GetAllCategoriesResponseModel categoriesResponse,
            GetTrainingCourseProvidersResponseModel providersResponse,
            bool isApplyFilterLoading)
        done,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            GetAllCoursesResponseModel coursesResponse,
            GetAllCategoriesResponseModel categoriesResponse,
            GetTrainingCourseProvidersResponseModel providersResponse,
            bool isApplyFilterLoading)?
        done,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            GetAllCoursesResponseModel coursesResponse,
            GetAllCategoriesResponseModel categoriesResponse,
            GetTrainingCourseProvidersResponseModel providersResponse,
            bool isApplyFilterLoading)?
        done,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Done value) done,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Done value)? done,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Done value)? done,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements GetAllTrainingCoursesState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$DoneImplCopyWith<$Res> {
  factory _$$DoneImplCopyWith(
          _$DoneImpl value, $Res Function(_$DoneImpl) then) =
      __$$DoneImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {GetAllCoursesResponseModel coursesResponse,
      GetAllCategoriesResponseModel categoriesResponse,
      GetTrainingCourseProvidersResponseModel providersResponse,
      bool isApplyFilterLoading});

  $GetAllCoursesResponseModelCopyWith<$Res> get coursesResponse;
  $GetAllCategoriesResponseModelCopyWith<$Res> get categoriesResponse;
  $GetTrainingCourseProvidersResponseModelCopyWith<$Res> get providersResponse;
}

/// @nodoc
class __$$DoneImplCopyWithImpl<$Res>
    extends _$GetAllTrainingCoursesStateCopyWithImpl<$Res, _$DoneImpl>
    implements _$$DoneImplCopyWith<$Res> {
  __$$DoneImplCopyWithImpl(_$DoneImpl _value, $Res Function(_$DoneImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllTrainingCoursesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coursesResponse = null,
    Object? categoriesResponse = null,
    Object? providersResponse = null,
    Object? isApplyFilterLoading = null,
  }) {
    return _then(_$DoneImpl(
      null == coursesResponse
          ? _value.coursesResponse
          : coursesResponse // ignore: cast_nullable_to_non_nullable
              as GetAllCoursesResponseModel,
      null == categoriesResponse
          ? _value.categoriesResponse
          : categoriesResponse // ignore: cast_nullable_to_non_nullable
              as GetAllCategoriesResponseModel,
      null == providersResponse
          ? _value.providersResponse
          : providersResponse // ignore: cast_nullable_to_non_nullable
              as GetTrainingCourseProvidersResponseModel,
      null == isApplyFilterLoading
          ? _value.isApplyFilterLoading
          : isApplyFilterLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of GetAllTrainingCoursesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GetAllCoursesResponseModelCopyWith<$Res> get coursesResponse {
    return $GetAllCoursesResponseModelCopyWith<$Res>(_value.coursesResponse,
        (value) {
      return _then(_value.copyWith(coursesResponse: value));
    });
  }

  /// Create a copy of GetAllTrainingCoursesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GetAllCategoriesResponseModelCopyWith<$Res> get categoriesResponse {
    return $GetAllCategoriesResponseModelCopyWith<$Res>(
        _value.categoriesResponse, (value) {
      return _then(_value.copyWith(categoriesResponse: value));
    });
  }

  /// Create a copy of GetAllTrainingCoursesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GetTrainingCourseProvidersResponseModelCopyWith<$Res> get providersResponse {
    return $GetTrainingCourseProvidersResponseModelCopyWith<$Res>(
        _value.providersResponse, (value) {
      return _then(_value.copyWith(providersResponse: value));
    });
  }
}

/// @nodoc

class _$DoneImpl implements _Done {
  const _$DoneImpl(this.coursesResponse, this.categoriesResponse,
      this.providersResponse, this.isApplyFilterLoading);

  @override
  final GetAllCoursesResponseModel coursesResponse;
  @override
  final GetAllCategoriesResponseModel categoriesResponse;
  @override
  final GetTrainingCourseProvidersResponseModel providersResponse;
  @override
  final bool isApplyFilterLoading;

  @override
  String toString() {
    return 'GetAllTrainingCoursesState.done(coursesResponse: $coursesResponse, categoriesResponse: $categoriesResponse, providersResponse: $providersResponse, isApplyFilterLoading: $isApplyFilterLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoneImpl &&
            (identical(other.coursesResponse, coursesResponse) ||
                other.coursesResponse == coursesResponse) &&
            (identical(other.categoriesResponse, categoriesResponse) ||
                other.categoriesResponse == categoriesResponse) &&
            (identical(other.providersResponse, providersResponse) ||
                other.providersResponse == providersResponse) &&
            (identical(other.isApplyFilterLoading, isApplyFilterLoading) ||
                other.isApplyFilterLoading == isApplyFilterLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, coursesResponse,
      categoriesResponse, providersResponse, isApplyFilterLoading);

  /// Create a copy of GetAllTrainingCoursesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoneImplCopyWith<_$DoneImpl> get copyWith =>
      __$$DoneImplCopyWithImpl<_$DoneImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            GetAllCoursesResponseModel coursesResponse,
            GetAllCategoriesResponseModel categoriesResponse,
            GetTrainingCourseProvidersResponseModel providersResponse,
            bool isApplyFilterLoading)
        done,
    required TResult Function(String message) error,
  }) {
    return done(coursesResponse, categoriesResponse, providersResponse,
        isApplyFilterLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            GetAllCoursesResponseModel coursesResponse,
            GetAllCategoriesResponseModel categoriesResponse,
            GetTrainingCourseProvidersResponseModel providersResponse,
            bool isApplyFilterLoading)?
        done,
    TResult? Function(String message)? error,
  }) {
    return done?.call(coursesResponse, categoriesResponse, providersResponse,
        isApplyFilterLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            GetAllCoursesResponseModel coursesResponse,
            GetAllCategoriesResponseModel categoriesResponse,
            GetTrainingCourseProvidersResponseModel providersResponse,
            bool isApplyFilterLoading)?
        done,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(coursesResponse, categoriesResponse, providersResponse,
          isApplyFilterLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Done value) done,
    required TResult Function(_Error value) error,
  }) {
    return done(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Done value)? done,
    TResult? Function(_Error value)? error,
  }) {
    return done?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Done value)? done,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(this);
    }
    return orElse();
  }
}

abstract class _Done implements GetAllTrainingCoursesState {
  const factory _Done(
      final GetAllCoursesResponseModel coursesResponse,
      final GetAllCategoriesResponseModel categoriesResponse,
      final GetTrainingCourseProvidersResponseModel providersResponse,
      final bool isApplyFilterLoading) = _$DoneImpl;

  GetAllCoursesResponseModel get coursesResponse;
  GetAllCategoriesResponseModel get categoriesResponse;
  GetTrainingCourseProvidersResponseModel get providersResponse;
  bool get isApplyFilterLoading;

  /// Create a copy of GetAllTrainingCoursesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoneImplCopyWith<_$DoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$GetAllTrainingCoursesStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllTrainingCoursesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'GetAllTrainingCoursesState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of GetAllTrainingCoursesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            GetAllCoursesResponseModel coursesResponse,
            GetAllCategoriesResponseModel categoriesResponse,
            GetTrainingCourseProvidersResponseModel providersResponse,
            bool isApplyFilterLoading)
        done,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            GetAllCoursesResponseModel coursesResponse,
            GetAllCategoriesResponseModel categoriesResponse,
            GetTrainingCourseProvidersResponseModel providersResponse,
            bool isApplyFilterLoading)?
        done,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            GetAllCoursesResponseModel coursesResponse,
            GetAllCategoriesResponseModel categoriesResponse,
            GetTrainingCourseProvidersResponseModel providersResponse,
            bool isApplyFilterLoading)?
        done,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Done value) done,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Done value)? done,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Done value)? done,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements GetAllTrainingCoursesState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of GetAllTrainingCoursesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
