// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mean_value_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MeanValueEvent {
  RequestMeanValue get request => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RequestMeanValue request) getMeanValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RequestMeanValue request)? getMeanValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RequestMeanValue request)? getMeanValue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetMeanValueEvent value) getMeanValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetMeanValueEvent value)? getMeanValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetMeanValueEvent value)? getMeanValue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MeanValueEventCopyWith<MeanValueEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeanValueEventCopyWith<$Res> {
  factory $MeanValueEventCopyWith(
          MeanValueEvent value, $Res Function(MeanValueEvent) then) =
      _$MeanValueEventCopyWithImpl<$Res, MeanValueEvent>;
  @useResult
  $Res call({RequestMeanValue request});

  $RequestMeanValueCopyWith<$Res> get request;
}

/// @nodoc
class _$MeanValueEventCopyWithImpl<$Res, $Val extends MeanValueEvent>
    implements $MeanValueEventCopyWith<$Res> {
  _$MeanValueEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_value.copyWith(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as RequestMeanValue,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RequestMeanValueCopyWith<$Res> get request {
    return $RequestMeanValueCopyWith<$Res>(_value.request, (value) {
      return _then(_value.copyWith(request: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetMeanValueEventImplCopyWith<$Res>
    implements $MeanValueEventCopyWith<$Res> {
  factory _$$GetMeanValueEventImplCopyWith(_$GetMeanValueEventImpl value,
          $Res Function(_$GetMeanValueEventImpl) then) =
      __$$GetMeanValueEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RequestMeanValue request});

  @override
  $RequestMeanValueCopyWith<$Res> get request;
}

/// @nodoc
class __$$GetMeanValueEventImplCopyWithImpl<$Res>
    extends _$MeanValueEventCopyWithImpl<$Res, _$GetMeanValueEventImpl>
    implements _$$GetMeanValueEventImplCopyWith<$Res> {
  __$$GetMeanValueEventImplCopyWithImpl(_$GetMeanValueEventImpl _value,
      $Res Function(_$GetMeanValueEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$GetMeanValueEventImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as RequestMeanValue,
    ));
  }
}

/// @nodoc

class _$GetMeanValueEventImpl implements _GetMeanValueEvent {
  const _$GetMeanValueEventImpl({required this.request});

  @override
  final RequestMeanValue request;

  @override
  String toString() {
    return 'MeanValueEvent.getMeanValue(request: $request)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMeanValueEventImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetMeanValueEventImplCopyWith<_$GetMeanValueEventImpl> get copyWith =>
      __$$GetMeanValueEventImplCopyWithImpl<_$GetMeanValueEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RequestMeanValue request) getMeanValue,
  }) {
    return getMeanValue(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RequestMeanValue request)? getMeanValue,
  }) {
    return getMeanValue?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RequestMeanValue request)? getMeanValue,
    required TResult orElse(),
  }) {
    if (getMeanValue != null) {
      return getMeanValue(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetMeanValueEvent value) getMeanValue,
  }) {
    return getMeanValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetMeanValueEvent value)? getMeanValue,
  }) {
    return getMeanValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetMeanValueEvent value)? getMeanValue,
    required TResult orElse(),
  }) {
    if (getMeanValue != null) {
      return getMeanValue(this);
    }
    return orElse();
  }
}

abstract class _GetMeanValueEvent implements MeanValueEvent {
  const factory _GetMeanValueEvent({required final RequestMeanValue request}) =
      _$GetMeanValueEventImpl;

  @override
  RequestMeanValue get request;
  @override
  @JsonKey(ignore: true)
  _$$GetMeanValueEventImplCopyWith<_$GetMeanValueEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MeanValueState {
  bool get isLoadingMeanValue => throw _privateConstructorUsedError;
  bool get isHasErrorMeanValue => throw _privateConstructorUsedError;
  String get errorMessageMeanValue => throw _privateConstructorUsedError;
  List<BaseRentResponse> get meanValueResponse =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoadingMeanValue,
            bool isHasErrorMeanValue,
            String errorMessageMeanValue,
            List<BaseRentResponse> meanValueResponse)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool isLoadingMeanValue,
            bool isHasErrorMeanValue,
            String errorMessageMeanValue,
            List<BaseRentResponse> meanValueResponse)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isLoadingMeanValue,
            bool isHasErrorMeanValue,
            String errorMessageMeanValue,
            List<BaseRentResponse> meanValueResponse)?
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

  @JsonKey(ignore: true)
  $MeanValueStateCopyWith<MeanValueState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeanValueStateCopyWith<$Res> {
  factory $MeanValueStateCopyWith(
          MeanValueState value, $Res Function(MeanValueState) then) =
      _$MeanValueStateCopyWithImpl<$Res, MeanValueState>;
  @useResult
  $Res call(
      {bool isLoadingMeanValue,
      bool isHasErrorMeanValue,
      String errorMessageMeanValue,
      List<BaseRentResponse> meanValueResponse});
}

/// @nodoc
class _$MeanValueStateCopyWithImpl<$Res, $Val extends MeanValueState>
    implements $MeanValueStateCopyWith<$Res> {
  _$MeanValueStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingMeanValue = null,
    Object? isHasErrorMeanValue = null,
    Object? errorMessageMeanValue = null,
    Object? meanValueResponse = null,
  }) {
    return _then(_value.copyWith(
      isLoadingMeanValue: null == isLoadingMeanValue
          ? _value.isLoadingMeanValue
          : isLoadingMeanValue // ignore: cast_nullable_to_non_nullable
              as bool,
      isHasErrorMeanValue: null == isHasErrorMeanValue
          ? _value.isHasErrorMeanValue
          : isHasErrorMeanValue // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessageMeanValue: null == errorMessageMeanValue
          ? _value.errorMessageMeanValue
          : errorMessageMeanValue // ignore: cast_nullable_to_non_nullable
              as String,
      meanValueResponse: null == meanValueResponse
          ? _value.meanValueResponse
          : meanValueResponse // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $MeanValueStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoadingMeanValue,
      bool isHasErrorMeanValue,
      String errorMessageMeanValue,
      List<BaseRentResponse> meanValueResponse});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$MeanValueStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingMeanValue = null,
    Object? isHasErrorMeanValue = null,
    Object? errorMessageMeanValue = null,
    Object? meanValueResponse = null,
  }) {
    return _then(_$InitialImpl(
      isLoadingMeanValue: null == isLoadingMeanValue
          ? _value.isLoadingMeanValue
          : isLoadingMeanValue // ignore: cast_nullable_to_non_nullable
              as bool,
      isHasErrorMeanValue: null == isHasErrorMeanValue
          ? _value.isHasErrorMeanValue
          : isHasErrorMeanValue // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessageMeanValue: null == errorMessageMeanValue
          ? _value.errorMessageMeanValue
          : errorMessageMeanValue // ignore: cast_nullable_to_non_nullable
              as String,
      meanValueResponse: null == meanValueResponse
          ? _value._meanValueResponse
          : meanValueResponse // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.isLoadingMeanValue = false,
      this.isHasErrorMeanValue = false,
      this.errorMessageMeanValue = '',
      final List<BaseRentResponse> meanValueResponse = const []})
      : _meanValueResponse = meanValueResponse;

  @override
  @JsonKey()
  final bool isLoadingMeanValue;
  @override
  @JsonKey()
  final bool isHasErrorMeanValue;
  @override
  @JsonKey()
  final String errorMessageMeanValue;
  final List<BaseRentResponse> _meanValueResponse;
  @override
  @JsonKey()
  List<BaseRentResponse> get meanValueResponse {
    if (_meanValueResponse is EqualUnmodifiableListView)
      return _meanValueResponse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meanValueResponse);
  }

  @override
  String toString() {
    return 'MeanValueState.initial(isLoadingMeanValue: $isLoadingMeanValue, isHasErrorMeanValue: $isHasErrorMeanValue, errorMessageMeanValue: $errorMessageMeanValue, meanValueResponse: $meanValueResponse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoadingMeanValue, isLoadingMeanValue) ||
                other.isLoadingMeanValue == isLoadingMeanValue) &&
            (identical(other.isHasErrorMeanValue, isHasErrorMeanValue) ||
                other.isHasErrorMeanValue == isHasErrorMeanValue) &&
            (identical(other.errorMessageMeanValue, errorMessageMeanValue) ||
                other.errorMessageMeanValue == errorMessageMeanValue) &&
            const DeepCollectionEquality()
                .equals(other._meanValueResponse, _meanValueResponse));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoadingMeanValue,
      isHasErrorMeanValue,
      errorMessageMeanValue,
      const DeepCollectionEquality().hash(_meanValueResponse));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoadingMeanValue,
            bool isHasErrorMeanValue,
            String errorMessageMeanValue,
            List<BaseRentResponse> meanValueResponse)
        initial,
  }) {
    return initial(isLoadingMeanValue, isHasErrorMeanValue,
        errorMessageMeanValue, meanValueResponse);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool isLoadingMeanValue,
            bool isHasErrorMeanValue,
            String errorMessageMeanValue,
            List<BaseRentResponse> meanValueResponse)?
        initial,
  }) {
    return initial?.call(isLoadingMeanValue, isHasErrorMeanValue,
        errorMessageMeanValue, meanValueResponse);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isLoadingMeanValue,
            bool isHasErrorMeanValue,
            String errorMessageMeanValue,
            List<BaseRentResponse> meanValueResponse)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isLoadingMeanValue, isHasErrorMeanValue,
          errorMessageMeanValue, meanValueResponse);
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

abstract class _Initial implements MeanValueState {
  const factory _Initial(
      {final bool isLoadingMeanValue,
      final bool isHasErrorMeanValue,
      final String errorMessageMeanValue,
      final List<BaseRentResponse> meanValueResponse}) = _$InitialImpl;

  @override
  bool get isLoadingMeanValue;
  @override
  bool get isHasErrorMeanValue;
  @override
  String get errorMessageMeanValue;
  @override
  List<BaseRentResponse> get meanValueResponse;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
