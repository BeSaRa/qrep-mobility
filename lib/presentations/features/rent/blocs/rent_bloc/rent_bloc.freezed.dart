// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rent_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getRentLookupEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getRentLookupEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getRentLookupEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetRentLookupEvent value) getRentLookupEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetRentLookupEvent value)? getRentLookupEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetRentLookupEvent value)? getRentLookupEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentEventCopyWith<$Res> {
  factory $RentEventCopyWith(RentEvent value, $Res Function(RentEvent) then) =
      _$RentEventCopyWithImpl<$Res, RentEvent>;
}

/// @nodoc
class _$RentEventCopyWithImpl<$Res, $Val extends RentEvent>
    implements $RentEventCopyWith<$Res> {
  _$RentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RentEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetRentLookupEventImplCopyWith<$Res> {
  factory _$$GetRentLookupEventImplCopyWith(_$GetRentLookupEventImpl value,
          $Res Function(_$GetRentLookupEventImpl) then) =
      __$$GetRentLookupEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetRentLookupEventImplCopyWithImpl<$Res>
    extends _$RentEventCopyWithImpl<$Res, _$GetRentLookupEventImpl>
    implements _$$GetRentLookupEventImplCopyWith<$Res> {
  __$$GetRentLookupEventImplCopyWithImpl(_$GetRentLookupEventImpl _value,
      $Res Function(_$GetRentLookupEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of RentEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetRentLookupEventImpl implements _GetRentLookupEvent {
  const _$GetRentLookupEventImpl();

  @override
  String toString() {
    return 'RentEvent.getRentLookupEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetRentLookupEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getRentLookupEvent,
  }) {
    return getRentLookupEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getRentLookupEvent,
  }) {
    return getRentLookupEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getRentLookupEvent,
    required TResult orElse(),
  }) {
    if (getRentLookupEvent != null) {
      return getRentLookupEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetRentLookupEvent value) getRentLookupEvent,
  }) {
    return getRentLookupEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetRentLookupEvent value)? getRentLookupEvent,
  }) {
    return getRentLookupEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetRentLookupEvent value)? getRentLookupEvent,
    required TResult orElse(),
  }) {
    if (getRentLookupEvent != null) {
      return getRentLookupEvent(this);
    }
    return orElse();
  }
}

abstract class _GetRentLookupEvent implements RentEvent {
  const factory _GetRentLookupEvent() = _$GetRentLookupEventImpl;
}

/// @nodoc
mixin _$RentState {
  bool get isLoadingRentLookup => throw _privateConstructorUsedError;
  bool get isHasErrorRentLookup => throw _privateConstructorUsedError;
  String get errorMessageRentLookup => throw _privateConstructorUsedError;
  LookupResponse get rentLookup => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoadingRentLookup,
            bool isHasErrorRentLookup,
            String errorMessageRentLookup,
            LookupResponse rentLookup)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoadingRentLookup, bool isHasErrorRentLookup,
            String errorMessageRentLookup, LookupResponse rentLookup)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoadingRentLookup, bool isHasErrorRentLookup,
            String errorMessageRentLookup, LookupResponse rentLookup)?
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

  /// Create a copy of RentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RentStateCopyWith<RentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentStateCopyWith<$Res> {
  factory $RentStateCopyWith(RentState value, $Res Function(RentState) then) =
      _$RentStateCopyWithImpl<$Res, RentState>;
  @useResult
  $Res call(
      {bool isLoadingRentLookup,
      bool isHasErrorRentLookup,
      String errorMessageRentLookup,
      LookupResponse rentLookup});

  $LookupResponseCopyWith<$Res> get rentLookup;
}

/// @nodoc
class _$RentStateCopyWithImpl<$Res, $Val extends RentState>
    implements $RentStateCopyWith<$Res> {
  _$RentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingRentLookup = null,
    Object? isHasErrorRentLookup = null,
    Object? errorMessageRentLookup = null,
    Object? rentLookup = null,
  }) {
    return _then(_value.copyWith(
      isLoadingRentLookup: null == isLoadingRentLookup
          ? _value.isLoadingRentLookup
          : isLoadingRentLookup // ignore: cast_nullable_to_non_nullable
              as bool,
      isHasErrorRentLookup: null == isHasErrorRentLookup
          ? _value.isHasErrorRentLookup
          : isHasErrorRentLookup // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessageRentLookup: null == errorMessageRentLookup
          ? _value.errorMessageRentLookup
          : errorMessageRentLookup // ignore: cast_nullable_to_non_nullable
              as String,
      rentLookup: null == rentLookup
          ? _value.rentLookup
          : rentLookup // ignore: cast_nullable_to_non_nullable
              as LookupResponse,
    ) as $Val);
  }

  /// Create a copy of RentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LookupResponseCopyWith<$Res> get rentLookup {
    return $LookupResponseCopyWith<$Res>(_value.rentLookup, (value) {
      return _then(_value.copyWith(rentLookup: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $RentStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoadingRentLookup,
      bool isHasErrorRentLookup,
      String errorMessageRentLookup,
      LookupResponse rentLookup});

  @override
  $LookupResponseCopyWith<$Res> get rentLookup;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$RentStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of RentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingRentLookup = null,
    Object? isHasErrorRentLookup = null,
    Object? errorMessageRentLookup = null,
    Object? rentLookup = null,
  }) {
    return _then(_$InitialImpl(
      isLoadingRentLookup: null == isLoadingRentLookup
          ? _value.isLoadingRentLookup
          : isLoadingRentLookup // ignore: cast_nullable_to_non_nullable
              as bool,
      isHasErrorRentLookup: null == isHasErrorRentLookup
          ? _value.isHasErrorRentLookup
          : isHasErrorRentLookup // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessageRentLookup: null == errorMessageRentLookup
          ? _value.errorMessageRentLookup
          : errorMessageRentLookup // ignore: cast_nullable_to_non_nullable
              as String,
      rentLookup: null == rentLookup
          ? _value.rentLookup
          : rentLookup // ignore: cast_nullable_to_non_nullable
              as LookupResponse,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.isLoadingRentLookup = false,
      this.isHasErrorRentLookup = false,
      this.errorMessageRentLookup = '',
      this.rentLookup = const LookupResponse()});

  @override
  @JsonKey()
  final bool isLoadingRentLookup;
  @override
  @JsonKey()
  final bool isHasErrorRentLookup;
  @override
  @JsonKey()
  final String errorMessageRentLookup;
  @override
  @JsonKey()
  final LookupResponse rentLookup;

  @override
  String toString() {
    return 'RentState.initial(isLoadingRentLookup: $isLoadingRentLookup, isHasErrorRentLookup: $isHasErrorRentLookup, errorMessageRentLookup: $errorMessageRentLookup, rentLookup: $rentLookup)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoadingRentLookup, isLoadingRentLookup) ||
                other.isLoadingRentLookup == isLoadingRentLookup) &&
            (identical(other.isHasErrorRentLookup, isHasErrorRentLookup) ||
                other.isHasErrorRentLookup == isHasErrorRentLookup) &&
            (identical(other.errorMessageRentLookup, errorMessageRentLookup) ||
                other.errorMessageRentLookup == errorMessageRentLookup) &&
            (identical(other.rentLookup, rentLookup) ||
                other.rentLookup == rentLookup));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoadingRentLookup,
      isHasErrorRentLookup, errorMessageRentLookup, rentLookup);

  /// Create a copy of RentState
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
            bool isLoadingRentLookup,
            bool isHasErrorRentLookup,
            String errorMessageRentLookup,
            LookupResponse rentLookup)
        initial,
  }) {
    return initial(isLoadingRentLookup, isHasErrorRentLookup,
        errorMessageRentLookup, rentLookup);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoadingRentLookup, bool isHasErrorRentLookup,
            String errorMessageRentLookup, LookupResponse rentLookup)?
        initial,
  }) {
    return initial?.call(isLoadingRentLookup, isHasErrorRentLookup,
        errorMessageRentLookup, rentLookup);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoadingRentLookup, bool isHasErrorRentLookup,
            String errorMessageRentLookup, LookupResponse rentLookup)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isLoadingRentLookup, isHasErrorRentLookup,
          errorMessageRentLookup, rentLookup);
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

abstract class _Initial implements RentState {
  const factory _Initial(
      {final bool isLoadingRentLookup,
      final bool isHasErrorRentLookup,
      final String errorMessageRentLookup,
      final LookupResponse rentLookup}) = _$InitialImpl;

  @override
  bool get isLoadingRentLookup;
  @override
  bool get isHasErrorRentLookup;
  @override
  String get errorMessageRentLookup;
  @override
  LookupResponse get rentLookup;

  /// Create a copy of RentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
