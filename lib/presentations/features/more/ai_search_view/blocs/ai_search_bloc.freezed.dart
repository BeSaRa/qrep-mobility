// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StartAiSearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AiSearchRequestModel request) makeAiSearch,
    required TResult Function() clearResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AiSearchRequestModel request)? makeAiSearch,
    TResult? Function()? clearResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AiSearchRequestModel request)? makeAiSearch,
    TResult Function()? clearResults,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MakeAiSearch value) makeAiSearch,
    required TResult Function(_ClearAiSearchEvent value) clearResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MakeAiSearch value)? makeAiSearch,
    TResult? Function(_ClearAiSearchEvent value)? clearResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MakeAiSearch value)? makeAiSearch,
    TResult Function(_ClearAiSearchEvent value)? clearResults,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartAiSearchEventCopyWith<$Res> {
  factory $StartAiSearchEventCopyWith(
          StartAiSearchEvent value, $Res Function(StartAiSearchEvent) then) =
      _$StartAiSearchEventCopyWithImpl<$Res, StartAiSearchEvent>;
}

/// @nodoc
class _$StartAiSearchEventCopyWithImpl<$Res, $Val extends StartAiSearchEvent>
    implements $StartAiSearchEventCopyWith<$Res> {
  _$StartAiSearchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StartAiSearchEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$MakeAiSearchImplCopyWith<$Res> {
  factory _$$MakeAiSearchImplCopyWith(
          _$MakeAiSearchImpl value, $Res Function(_$MakeAiSearchImpl) then) =
      __$$MakeAiSearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AiSearchRequestModel request});

  $AiSearchRequestModelCopyWith<$Res> get request;
}

/// @nodoc
class __$$MakeAiSearchImplCopyWithImpl<$Res>
    extends _$StartAiSearchEventCopyWithImpl<$Res, _$MakeAiSearchImpl>
    implements _$$MakeAiSearchImplCopyWith<$Res> {
  __$$MakeAiSearchImplCopyWithImpl(
      _$MakeAiSearchImpl _value, $Res Function(_$MakeAiSearchImpl) _then)
      : super(_value, _then);

  /// Create a copy of StartAiSearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$MakeAiSearchImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as AiSearchRequestModel,
    ));
  }

  /// Create a copy of StartAiSearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AiSearchRequestModelCopyWith<$Res> get request {
    return $AiSearchRequestModelCopyWith<$Res>(_value.request, (value) {
      return _then(_value.copyWith(request: value));
    });
  }
}

/// @nodoc

class _$MakeAiSearchImpl implements _MakeAiSearch {
  const _$MakeAiSearchImpl({required this.request});

  @override
  final AiSearchRequestModel request;

  @override
  String toString() {
    return 'StartAiSearchEvent.makeAiSearch(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MakeAiSearchImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of StartAiSearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MakeAiSearchImplCopyWith<_$MakeAiSearchImpl> get copyWith =>
      __$$MakeAiSearchImplCopyWithImpl<_$MakeAiSearchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AiSearchRequestModel request) makeAiSearch,
    required TResult Function() clearResults,
  }) {
    return makeAiSearch(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AiSearchRequestModel request)? makeAiSearch,
    TResult? Function()? clearResults,
  }) {
    return makeAiSearch?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AiSearchRequestModel request)? makeAiSearch,
    TResult Function()? clearResults,
    required TResult orElse(),
  }) {
    if (makeAiSearch != null) {
      return makeAiSearch(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MakeAiSearch value) makeAiSearch,
    required TResult Function(_ClearAiSearchEvent value) clearResults,
  }) {
    return makeAiSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MakeAiSearch value)? makeAiSearch,
    TResult? Function(_ClearAiSearchEvent value)? clearResults,
  }) {
    return makeAiSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MakeAiSearch value)? makeAiSearch,
    TResult Function(_ClearAiSearchEvent value)? clearResults,
    required TResult orElse(),
  }) {
    if (makeAiSearch != null) {
      return makeAiSearch(this);
    }
    return orElse();
  }
}

abstract class _MakeAiSearch implements StartAiSearchEvent {
  const factory _MakeAiSearch({required final AiSearchRequestModel request}) =
      _$MakeAiSearchImpl;

  AiSearchRequestModel get request;

  /// Create a copy of StartAiSearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MakeAiSearchImplCopyWith<_$MakeAiSearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearAiSearchEventImplCopyWith<$Res> {
  factory _$$ClearAiSearchEventImplCopyWith(_$ClearAiSearchEventImpl value,
          $Res Function(_$ClearAiSearchEventImpl) then) =
      __$$ClearAiSearchEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearAiSearchEventImplCopyWithImpl<$Res>
    extends _$StartAiSearchEventCopyWithImpl<$Res, _$ClearAiSearchEventImpl>
    implements _$$ClearAiSearchEventImplCopyWith<$Res> {
  __$$ClearAiSearchEventImplCopyWithImpl(_$ClearAiSearchEventImpl _value,
      $Res Function(_$ClearAiSearchEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of StartAiSearchEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearAiSearchEventImpl implements _ClearAiSearchEvent {
  const _$ClearAiSearchEventImpl();

  @override
  String toString() {
    return 'StartAiSearchEvent.clearResults()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearAiSearchEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AiSearchRequestModel request) makeAiSearch,
    required TResult Function() clearResults,
  }) {
    return clearResults();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AiSearchRequestModel request)? makeAiSearch,
    TResult? Function()? clearResults,
  }) {
    return clearResults?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AiSearchRequestModel request)? makeAiSearch,
    TResult Function()? clearResults,
    required TResult orElse(),
  }) {
    if (clearResults != null) {
      return clearResults();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MakeAiSearch value) makeAiSearch,
    required TResult Function(_ClearAiSearchEvent value) clearResults,
  }) {
    return clearResults(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MakeAiSearch value)? makeAiSearch,
    TResult? Function(_ClearAiSearchEvent value)? clearResults,
  }) {
    return clearResults?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MakeAiSearch value)? makeAiSearch,
    TResult Function(_ClearAiSearchEvent value)? clearResults,
    required TResult orElse(),
  }) {
    if (clearResults != null) {
      return clearResults(this);
    }
    return orElse();
  }
}

abstract class _ClearAiSearchEvent implements StartAiSearchEvent {
  const factory _ClearAiSearchEvent() = _$ClearAiSearchEventImpl;
}

/// @nodoc
mixin _$AiSearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isPagination) loading,
    required TResult Function(AiSearchResponseModel response,
            List<AiSearchItemModel> previousResults)
        done,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isPagination)? loading,
    TResult? Function(AiSearchResponseModel response,
            List<AiSearchItemModel> previousResults)?
        done,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isPagination)? loading,
    TResult Function(AiSearchResponseModel response,
            List<AiSearchItemModel> previousResults)?
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
abstract class $AiSearchStateCopyWith<$Res> {
  factory $AiSearchStateCopyWith(
          AiSearchState value, $Res Function(AiSearchState) then) =
      _$AiSearchStateCopyWithImpl<$Res, AiSearchState>;
}

/// @nodoc
class _$AiSearchStateCopyWithImpl<$Res, $Val extends AiSearchState>
    implements $AiSearchStateCopyWith<$Res> {
  _$AiSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiSearchState
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
    extends _$AiSearchStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AiSearchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AiSearchState.initial()';
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
    required TResult Function(bool isPagination) loading,
    required TResult Function(AiSearchResponseModel response,
            List<AiSearchItemModel> previousResults)
        done,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isPagination)? loading,
    TResult? Function(AiSearchResponseModel response,
            List<AiSearchItemModel> previousResults)?
        done,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isPagination)? loading,
    TResult Function(AiSearchResponseModel response,
            List<AiSearchItemModel> previousResults)?
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

abstract class _Initial implements AiSearchState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isPagination});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AiSearchStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AiSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPagination = null,
  }) {
    return _then(_$LoadingImpl(
      isPagination: null == isPagination
          ? _value.isPagination
          : isPagination // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl({required this.isPagination});

  @override
  final bool isPagination;

  @override
  String toString() {
    return 'AiSearchState.loading(isPagination: $isPagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.isPagination, isPagination) ||
                other.isPagination == isPagination));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isPagination);

  /// Create a copy of AiSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isPagination) loading,
    required TResult Function(AiSearchResponseModel response,
            List<AiSearchItemModel> previousResults)
        done,
    required TResult Function(String message) error,
  }) {
    return loading(isPagination);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isPagination)? loading,
    TResult? Function(AiSearchResponseModel response,
            List<AiSearchItemModel> previousResults)?
        done,
    TResult? Function(String message)? error,
  }) {
    return loading?.call(isPagination);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isPagination)? loading,
    TResult Function(AiSearchResponseModel response,
            List<AiSearchItemModel> previousResults)?
        done,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(isPagination);
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

abstract class _Loading implements AiSearchState {
  const factory _Loading({required final bool isPagination}) = _$LoadingImpl;

  bool get isPagination;

  /// Create a copy of AiSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DoneImplCopyWith<$Res> {
  factory _$$DoneImplCopyWith(
          _$DoneImpl value, $Res Function(_$DoneImpl) then) =
      __$$DoneImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {AiSearchResponseModel response,
      List<AiSearchItemModel> previousResults});

  $AiSearchResponseModelCopyWith<$Res> get response;
}

/// @nodoc
class __$$DoneImplCopyWithImpl<$Res>
    extends _$AiSearchStateCopyWithImpl<$Res, _$DoneImpl>
    implements _$$DoneImplCopyWith<$Res> {
  __$$DoneImplCopyWithImpl(_$DoneImpl _value, $Res Function(_$DoneImpl) _then)
      : super(_value, _then);

  /// Create a copy of AiSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
    Object? previousResults = null,
  }) {
    return _then(_$DoneImpl(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as AiSearchResponseModel,
      previousResults: null == previousResults
          ? _value._previousResults
          : previousResults // ignore: cast_nullable_to_non_nullable
              as List<AiSearchItemModel>,
    ));
  }

  /// Create a copy of AiSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AiSearchResponseModelCopyWith<$Res> get response {
    return $AiSearchResponseModelCopyWith<$Res>(_value.response, (value) {
      return _then(_value.copyWith(response: value));
    });
  }
}

/// @nodoc

class _$DoneImpl implements _Done {
  const _$DoneImpl(
      {required this.response,
      final List<AiSearchItemModel> previousResults = const []})
      : _previousResults = previousResults;

  @override
  final AiSearchResponseModel response;
  final List<AiSearchItemModel> _previousResults;
  @override
  @JsonKey()
  List<AiSearchItemModel> get previousResults {
    if (_previousResults is EqualUnmodifiableListView) return _previousResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_previousResults);
  }

  @override
  String toString() {
    return 'AiSearchState.done(response: $response, previousResults: $previousResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoneImpl &&
            (identical(other.response, response) ||
                other.response == response) &&
            const DeepCollectionEquality()
                .equals(other._previousResults, _previousResults));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response,
      const DeepCollectionEquality().hash(_previousResults));

  /// Create a copy of AiSearchState
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
    required TResult Function(bool isPagination) loading,
    required TResult Function(AiSearchResponseModel response,
            List<AiSearchItemModel> previousResults)
        done,
    required TResult Function(String message) error,
  }) {
    return done(response, previousResults);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isPagination)? loading,
    TResult? Function(AiSearchResponseModel response,
            List<AiSearchItemModel> previousResults)?
        done,
    TResult? Function(String message)? error,
  }) {
    return done?.call(response, previousResults);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isPagination)? loading,
    TResult Function(AiSearchResponseModel response,
            List<AiSearchItemModel> previousResults)?
        done,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(response, previousResults);
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

abstract class _Done implements AiSearchState {
  const factory _Done(
      {required final AiSearchResponseModel response,
      final List<AiSearchItemModel> previousResults}) = _$DoneImpl;

  AiSearchResponseModel get response;
  List<AiSearchItemModel> get previousResults;

  /// Create a copy of AiSearchState
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
    extends _$AiSearchStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AiSearchState
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
    return 'AiSearchState.error(message: $message)';
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

  /// Create a copy of AiSearchState
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
    required TResult Function(bool isPagination) loading,
    required TResult Function(AiSearchResponseModel response,
            List<AiSearchItemModel> previousResults)
        done,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isPagination)? loading,
    TResult? Function(AiSearchResponseModel response,
            List<AiSearchItemModel> previousResults)?
        done,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isPagination)? loading,
    TResult Function(AiSearchResponseModel response,
            List<AiSearchItemModel> previousResults)?
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

abstract class _Error implements AiSearchState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of AiSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
