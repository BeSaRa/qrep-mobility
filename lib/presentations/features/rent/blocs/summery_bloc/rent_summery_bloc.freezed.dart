// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rent_summery_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RentSummeryEvent {
  RentRequest get request => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RentRequest request) getRentSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RentRequest request)? getRentSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RentRequest request)? getRentSummary,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RentSummaryEvent value) getRentSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RentSummaryEvent value)? getRentSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RentSummaryEvent value)? getRentSummary,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of RentSummeryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RentSummeryEventCopyWith<RentSummeryEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentSummeryEventCopyWith<$Res> {
  factory $RentSummeryEventCopyWith(
          RentSummeryEvent value, $Res Function(RentSummeryEvent) then) =
      _$RentSummeryEventCopyWithImpl<$Res, RentSummeryEvent>;
  @useResult
  $Res call({RentRequest request});

  $RentRequestCopyWith<$Res> get request;
}

/// @nodoc
class _$RentSummeryEventCopyWithImpl<$Res, $Val extends RentSummeryEvent>
    implements $RentSummeryEventCopyWith<$Res> {
  _$RentSummeryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RentSummeryEvent
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
              as RentRequest,
    ) as $Val);
  }

  /// Create a copy of RentSummeryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RentRequestCopyWith<$Res> get request {
    return $RentRequestCopyWith<$Res>(_value.request, (value) {
      return _then(_value.copyWith(request: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RentSummaryEventImplCopyWith<$Res>
    implements $RentSummeryEventCopyWith<$Res> {
  factory _$$RentSummaryEventImplCopyWith(_$RentSummaryEventImpl value,
          $Res Function(_$RentSummaryEventImpl) then) =
      __$$RentSummaryEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RentRequest request});

  @override
  $RentRequestCopyWith<$Res> get request;
}

/// @nodoc
class __$$RentSummaryEventImplCopyWithImpl<$Res>
    extends _$RentSummeryEventCopyWithImpl<$Res, _$RentSummaryEventImpl>
    implements _$$RentSummaryEventImplCopyWith<$Res> {
  __$$RentSummaryEventImplCopyWithImpl(_$RentSummaryEventImpl _value,
      $Res Function(_$RentSummaryEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of RentSummeryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$RentSummaryEventImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as RentRequest,
    ));
  }
}

/// @nodoc

class _$RentSummaryEventImpl implements _RentSummaryEvent {
  const _$RentSummaryEventImpl({required this.request});

  @override
  final RentRequest request;

  @override
  String toString() {
    return 'RentSummeryEvent.getRentSummary(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RentSummaryEventImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of RentSummeryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RentSummaryEventImplCopyWith<_$RentSummaryEventImpl> get copyWith =>
      __$$RentSummaryEventImplCopyWithImpl<_$RentSummaryEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RentRequest request) getRentSummary,
  }) {
    return getRentSummary(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RentRequest request)? getRentSummary,
  }) {
    return getRentSummary?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RentRequest request)? getRentSummary,
    required TResult orElse(),
  }) {
    if (getRentSummary != null) {
      return getRentSummary(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RentSummaryEvent value) getRentSummary,
  }) {
    return getRentSummary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RentSummaryEvent value)? getRentSummary,
  }) {
    return getRentSummary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RentSummaryEvent value)? getRentSummary,
    required TResult orElse(),
  }) {
    if (getRentSummary != null) {
      return getRentSummary(this);
    }
    return orElse();
  }
}

abstract class _RentSummaryEvent implements RentSummeryEvent {
  const factory _RentSummaryEvent({required final RentRequest request}) =
      _$RentSummaryEventImpl;

  @override
  RentRequest get request;

  /// Create a copy of RentSummeryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RentSummaryEventImplCopyWith<_$RentSummaryEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RentSummeryState {
  bool get isLoadingRentSummery => throw _privateConstructorUsedError;
  bool get isHasErrorRentSummery => throw _privateConstructorUsedError;
  bool get isEmptyRentSummery => throw _privateConstructorUsedError;
  String get errorMessageRentSummery => throw _privateConstructorUsedError;
  RentListSummary get rentSummery => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoadingRentSummery,
            bool isHasErrorRentSummery,
            bool isEmptyRentSummery,
            String errorMessageRentSummery,
            RentListSummary rentSummery)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool isLoadingRentSummery,
            bool isHasErrorRentSummery,
            bool isEmptyRentSummery,
            String errorMessageRentSummery,
            RentListSummary rentSummery)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isLoadingRentSummery,
            bool isHasErrorRentSummery,
            bool isEmptyRentSummery,
            String errorMessageRentSummery,
            RentListSummary rentSummery)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of RentSummeryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RentSummeryStateCopyWith<RentSummeryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentSummeryStateCopyWith<$Res> {
  factory $RentSummeryStateCopyWith(
          RentSummeryState value, $Res Function(RentSummeryState) then) =
      _$RentSummeryStateCopyWithImpl<$Res, RentSummeryState>;
  @useResult
  $Res call(
      {bool isLoadingRentSummery,
      bool isHasErrorRentSummery,
      bool isEmptyRentSummery,
      String errorMessageRentSummery,
      RentListSummary rentSummery});

  $RentListSummaryCopyWith<$Res> get rentSummery;
}

/// @nodoc
class _$RentSummeryStateCopyWithImpl<$Res, $Val extends RentSummeryState>
    implements $RentSummeryStateCopyWith<$Res> {
  _$RentSummeryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RentSummeryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingRentSummery = null,
    Object? isHasErrorRentSummery = null,
    Object? isEmptyRentSummery = null,
    Object? errorMessageRentSummery = null,
    Object? rentSummery = null,
  }) {
    return _then(_value.copyWith(
      isLoadingRentSummery: null == isLoadingRentSummery
          ? _value.isLoadingRentSummery
          : isLoadingRentSummery // ignore: cast_nullable_to_non_nullable
              as bool,
      isHasErrorRentSummery: null == isHasErrorRentSummery
          ? _value.isHasErrorRentSummery
          : isHasErrorRentSummery // ignore: cast_nullable_to_non_nullable
              as bool,
      isEmptyRentSummery: null == isEmptyRentSummery
          ? _value.isEmptyRentSummery
          : isEmptyRentSummery // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessageRentSummery: null == errorMessageRentSummery
          ? _value.errorMessageRentSummery
          : errorMessageRentSummery // ignore: cast_nullable_to_non_nullable
              as String,
      rentSummery: null == rentSummery
          ? _value.rentSummery
          : rentSummery // ignore: cast_nullable_to_non_nullable
              as RentListSummary,
    ) as $Val);
  }

  /// Create a copy of RentSummeryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RentListSummaryCopyWith<$Res> get rentSummery {
    return $RentListSummaryCopyWith<$Res>(_value.rentSummery, (value) {
      return _then(_value.copyWith(rentSummery: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $RentSummeryStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoadingRentSummery,
      bool isHasErrorRentSummery,
      bool isEmptyRentSummery,
      String errorMessageRentSummery,
      RentListSummary rentSummery});

  @override
  $RentListSummaryCopyWith<$Res> get rentSummery;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$RentSummeryStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of RentSummeryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingRentSummery = null,
    Object? isHasErrorRentSummery = null,
    Object? isEmptyRentSummery = null,
    Object? errorMessageRentSummery = null,
    Object? rentSummery = null,
  }) {
    return _then(_$InitialImpl(
      isLoadingRentSummery: null == isLoadingRentSummery
          ? _value.isLoadingRentSummery
          : isLoadingRentSummery // ignore: cast_nullable_to_non_nullable
              as bool,
      isHasErrorRentSummery: null == isHasErrorRentSummery
          ? _value.isHasErrorRentSummery
          : isHasErrorRentSummery // ignore: cast_nullable_to_non_nullable
              as bool,
      isEmptyRentSummery: null == isEmptyRentSummery
          ? _value.isEmptyRentSummery
          : isEmptyRentSummery // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessageRentSummery: null == errorMessageRentSummery
          ? _value.errorMessageRentSummery
          : errorMessageRentSummery // ignore: cast_nullable_to_non_nullable
              as String,
      rentSummery: null == rentSummery
          ? _value.rentSummery
          : rentSummery // ignore: cast_nullable_to_non_nullable
              as RentListSummary,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.isLoadingRentSummery = false,
      this.isHasErrorRentSummery = false,
      this.isEmptyRentSummery = false,
      this.errorMessageRentSummery = '',
      this.rentSummery = const RentListSummary()});

  @override
  @JsonKey()
  final bool isLoadingRentSummery;
  @override
  @JsonKey()
  final bool isHasErrorRentSummery;
  @override
  @JsonKey()
  final bool isEmptyRentSummery;
  @override
  @JsonKey()
  final String errorMessageRentSummery;
  @override
  @JsonKey()
  final RentListSummary rentSummery;

  @override
  String toString() {
    return 'RentSummeryState.initial(isLoadingRentSummery: $isLoadingRentSummery, isHasErrorRentSummery: $isHasErrorRentSummery, isEmptyRentSummery: $isEmptyRentSummery, errorMessageRentSummery: $errorMessageRentSummery, rentSummery: $rentSummery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoadingRentSummery, isLoadingRentSummery) ||
                other.isLoadingRentSummery == isLoadingRentSummery) &&
            (identical(other.isHasErrorRentSummery, isHasErrorRentSummery) ||
                other.isHasErrorRentSummery == isHasErrorRentSummery) &&
            (identical(other.isEmptyRentSummery, isEmptyRentSummery) ||
                other.isEmptyRentSummery == isEmptyRentSummery) &&
            (identical(
                    other.errorMessageRentSummery, errorMessageRentSummery) ||
                other.errorMessageRentSummery == errorMessageRentSummery) &&
            (identical(other.rentSummery, rentSummery) ||
                other.rentSummery == rentSummery));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoadingRentSummery,
      isHasErrorRentSummery,
      isEmptyRentSummery,
      errorMessageRentSummery,
      rentSummery);

  /// Create a copy of RentSummeryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoadingRentSummery,
            bool isHasErrorRentSummery,
            bool isEmptyRentSummery,
            String errorMessageRentSummery,
            RentListSummary rentSummery)
        initial,
  }) {
    return initial(isLoadingRentSummery, isHasErrorRentSummery,
        isEmptyRentSummery, errorMessageRentSummery, rentSummery);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool isLoadingRentSummery,
            bool isHasErrorRentSummery,
            bool isEmptyRentSummery,
            String errorMessageRentSummery,
            RentListSummary rentSummery)?
        initial,
  }) {
    return initial?.call(isLoadingRentSummery, isHasErrorRentSummery,
        isEmptyRentSummery, errorMessageRentSummery, rentSummery);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isLoadingRentSummery,
            bool isHasErrorRentSummery,
            bool isEmptyRentSummery,
            String errorMessageRentSummery,
            RentListSummary rentSummery)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isLoadingRentSummery, isHasErrorRentSummery,
          isEmptyRentSummery, errorMessageRentSummery, rentSummery);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RentSummeryState {
  const factory _Initial(
      {final bool isLoadingRentSummery,
      final bool isHasErrorRentSummery,
      final bool isEmptyRentSummery,
      final String errorMessageRentSummery,
      final RentListSummary rentSummery}) = _$InitialImpl;

  @override
  bool get isLoadingRentSummery;
  @override
  bool get isHasErrorRentSummery;
  @override
  bool get isEmptyRentSummery;
  @override
  String get errorMessageRentSummery;
  @override
  RentListSummary get rentSummery;

  /// Create a copy of RentSummeryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
