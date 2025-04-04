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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MeanValueEvent {
  RentRequest get request => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RentRequest request) getMeanValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RentRequest request)? getMeanValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RentRequest request)? getMeanValue,
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

  /// Create a copy of MeanValueEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MeanValueEventCopyWith<MeanValueEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeanValueEventCopyWith<$Res> {
  factory $MeanValueEventCopyWith(
          MeanValueEvent value, $Res Function(MeanValueEvent) then) =
      _$MeanValueEventCopyWithImpl<$Res, MeanValueEvent>;
  @useResult
  $Res call({RentRequest request});

  $RentRequestCopyWith<$Res> get request;
}

/// @nodoc
class _$MeanValueEventCopyWithImpl<$Res, $Val extends MeanValueEvent>
    implements $MeanValueEventCopyWith<$Res> {
  _$MeanValueEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MeanValueEvent
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

  /// Create a copy of MeanValueEvent
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
abstract class _$$GetMeanValueEventImplCopyWith<$Res>
    implements $MeanValueEventCopyWith<$Res> {
  factory _$$GetMeanValueEventImplCopyWith(_$GetMeanValueEventImpl value,
          $Res Function(_$GetMeanValueEventImpl) then) =
      __$$GetMeanValueEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RentRequest request});

  @override
  $RentRequestCopyWith<$Res> get request;
}

/// @nodoc
class __$$GetMeanValueEventImplCopyWithImpl<$Res>
    extends _$MeanValueEventCopyWithImpl<$Res, _$GetMeanValueEventImpl>
    implements _$$GetMeanValueEventImplCopyWith<$Res> {
  __$$GetMeanValueEventImplCopyWithImpl(_$GetMeanValueEventImpl _value,
      $Res Function(_$GetMeanValueEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of MeanValueEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$GetMeanValueEventImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as RentRequest,
    ));
  }
}

/// @nodoc

class _$GetMeanValueEventImpl implements _GetMeanValueEvent {
  const _$GetMeanValueEventImpl({required this.request});

  @override
  final RentRequest request;

  @override
  String toString() {
    return 'MeanValueEvent.getMeanValue(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMeanValueEventImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of MeanValueEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetMeanValueEventImplCopyWith<_$GetMeanValueEventImpl> get copyWith =>
      __$$GetMeanValueEventImplCopyWithImpl<_$GetMeanValueEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RentRequest request) getMeanValue,
  }) {
    return getMeanValue(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RentRequest request)? getMeanValue,
  }) {
    return getMeanValue?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RentRequest request)? getMeanValue,
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
  const factory _GetMeanValueEvent({required final RentRequest request}) =
      _$GetMeanValueEventImpl;

  @override
  RentRequest get request;

  /// Create a copy of MeanValueEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetMeanValueEventImplCopyWith<_$GetMeanValueEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MeanValueState {
  bool get isLoadingMeanValue => throw _privateConstructorUsedError;
  bool get isLoadingMeanValueProperty => throw _privateConstructorUsedError;
  bool get isLoadingMeanValuePurpose => throw _privateConstructorUsedError;
  bool get isHasErrorMeanValue => throw _privateConstructorUsedError;
  bool get isHasErrorMeanValueProperty => throw _privateConstructorUsedError;
  bool get isHasErrorMeanValuePurpose => throw _privateConstructorUsedError;
  String get errorMessageMeanValue => throw _privateConstructorUsedError;
  String get errorMessageMeanValuePurpose => throw _privateConstructorUsedError;
  String get errorMessageMeanValueProperty =>
      throw _privateConstructorUsedError;
  List<BaseRentResponse> get meanValueResponse =>
      throw _privateConstructorUsedError;
  List<BaseRentResponse> get meanValueResponseProperty =>
      throw _privateConstructorUsedError;
  List<BaseRentResponse> get meanValueResponsePurpose =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoadingMeanValue,
            bool isLoadingMeanValueProperty,
            bool isLoadingMeanValuePurpose,
            bool isHasErrorMeanValue,
            bool isHasErrorMeanValueProperty,
            bool isHasErrorMeanValuePurpose,
            String errorMessageMeanValue,
            String errorMessageMeanValuePurpose,
            String errorMessageMeanValueProperty,
            List<BaseRentResponse> meanValueResponse,
            List<BaseRentResponse> meanValueResponseProperty,
            List<BaseRentResponse> meanValueResponsePurpose)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool isLoadingMeanValue,
            bool isLoadingMeanValueProperty,
            bool isLoadingMeanValuePurpose,
            bool isHasErrorMeanValue,
            bool isHasErrorMeanValueProperty,
            bool isHasErrorMeanValuePurpose,
            String errorMessageMeanValue,
            String errorMessageMeanValuePurpose,
            String errorMessageMeanValueProperty,
            List<BaseRentResponse> meanValueResponse,
            List<BaseRentResponse> meanValueResponseProperty,
            List<BaseRentResponse> meanValueResponsePurpose)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isLoadingMeanValue,
            bool isLoadingMeanValueProperty,
            bool isLoadingMeanValuePurpose,
            bool isHasErrorMeanValue,
            bool isHasErrorMeanValueProperty,
            bool isHasErrorMeanValuePurpose,
            String errorMessageMeanValue,
            String errorMessageMeanValuePurpose,
            String errorMessageMeanValueProperty,
            List<BaseRentResponse> meanValueResponse,
            List<BaseRentResponse> meanValueResponseProperty,
            List<BaseRentResponse> meanValueResponsePurpose)?
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

  /// Create a copy of MeanValueState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      bool isLoadingMeanValueProperty,
      bool isLoadingMeanValuePurpose,
      bool isHasErrorMeanValue,
      bool isHasErrorMeanValueProperty,
      bool isHasErrorMeanValuePurpose,
      String errorMessageMeanValue,
      String errorMessageMeanValuePurpose,
      String errorMessageMeanValueProperty,
      List<BaseRentResponse> meanValueResponse,
      List<BaseRentResponse> meanValueResponseProperty,
      List<BaseRentResponse> meanValueResponsePurpose});
}

/// @nodoc
class _$MeanValueStateCopyWithImpl<$Res, $Val extends MeanValueState>
    implements $MeanValueStateCopyWith<$Res> {
  _$MeanValueStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MeanValueState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingMeanValue = null,
    Object? isLoadingMeanValueProperty = null,
    Object? isLoadingMeanValuePurpose = null,
    Object? isHasErrorMeanValue = null,
    Object? isHasErrorMeanValueProperty = null,
    Object? isHasErrorMeanValuePurpose = null,
    Object? errorMessageMeanValue = null,
    Object? errorMessageMeanValuePurpose = null,
    Object? errorMessageMeanValueProperty = null,
    Object? meanValueResponse = null,
    Object? meanValueResponseProperty = null,
    Object? meanValueResponsePurpose = null,
  }) {
    return _then(_value.copyWith(
      isLoadingMeanValue: null == isLoadingMeanValue
          ? _value.isLoadingMeanValue
          : isLoadingMeanValue // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMeanValueProperty: null == isLoadingMeanValueProperty
          ? _value.isLoadingMeanValueProperty
          : isLoadingMeanValueProperty // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMeanValuePurpose: null == isLoadingMeanValuePurpose
          ? _value.isLoadingMeanValuePurpose
          : isLoadingMeanValuePurpose // ignore: cast_nullable_to_non_nullable
              as bool,
      isHasErrorMeanValue: null == isHasErrorMeanValue
          ? _value.isHasErrorMeanValue
          : isHasErrorMeanValue // ignore: cast_nullable_to_non_nullable
              as bool,
      isHasErrorMeanValueProperty: null == isHasErrorMeanValueProperty
          ? _value.isHasErrorMeanValueProperty
          : isHasErrorMeanValueProperty // ignore: cast_nullable_to_non_nullable
              as bool,
      isHasErrorMeanValuePurpose: null == isHasErrorMeanValuePurpose
          ? _value.isHasErrorMeanValuePurpose
          : isHasErrorMeanValuePurpose // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessageMeanValue: null == errorMessageMeanValue
          ? _value.errorMessageMeanValue
          : errorMessageMeanValue // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessageMeanValuePurpose: null == errorMessageMeanValuePurpose
          ? _value.errorMessageMeanValuePurpose
          : errorMessageMeanValuePurpose // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessageMeanValueProperty: null == errorMessageMeanValueProperty
          ? _value.errorMessageMeanValueProperty
          : errorMessageMeanValueProperty // ignore: cast_nullable_to_non_nullable
              as String,
      meanValueResponse: null == meanValueResponse
          ? _value.meanValueResponse
          : meanValueResponse // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
      meanValueResponseProperty: null == meanValueResponseProperty
          ? _value.meanValueResponseProperty
          : meanValueResponseProperty // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
      meanValueResponsePurpose: null == meanValueResponsePurpose
          ? _value.meanValueResponsePurpose
          : meanValueResponsePurpose // ignore: cast_nullable_to_non_nullable
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
      bool isLoadingMeanValueProperty,
      bool isLoadingMeanValuePurpose,
      bool isHasErrorMeanValue,
      bool isHasErrorMeanValueProperty,
      bool isHasErrorMeanValuePurpose,
      String errorMessageMeanValue,
      String errorMessageMeanValuePurpose,
      String errorMessageMeanValueProperty,
      List<BaseRentResponse> meanValueResponse,
      List<BaseRentResponse> meanValueResponseProperty,
      List<BaseRentResponse> meanValueResponsePurpose});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$MeanValueStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of MeanValueState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingMeanValue = null,
    Object? isLoadingMeanValueProperty = null,
    Object? isLoadingMeanValuePurpose = null,
    Object? isHasErrorMeanValue = null,
    Object? isHasErrorMeanValueProperty = null,
    Object? isHasErrorMeanValuePurpose = null,
    Object? errorMessageMeanValue = null,
    Object? errorMessageMeanValuePurpose = null,
    Object? errorMessageMeanValueProperty = null,
    Object? meanValueResponse = null,
    Object? meanValueResponseProperty = null,
    Object? meanValueResponsePurpose = null,
  }) {
    return _then(_$InitialImpl(
      isLoadingMeanValue: null == isLoadingMeanValue
          ? _value.isLoadingMeanValue
          : isLoadingMeanValue // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMeanValueProperty: null == isLoadingMeanValueProperty
          ? _value.isLoadingMeanValueProperty
          : isLoadingMeanValueProperty // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMeanValuePurpose: null == isLoadingMeanValuePurpose
          ? _value.isLoadingMeanValuePurpose
          : isLoadingMeanValuePurpose // ignore: cast_nullable_to_non_nullable
              as bool,
      isHasErrorMeanValue: null == isHasErrorMeanValue
          ? _value.isHasErrorMeanValue
          : isHasErrorMeanValue // ignore: cast_nullable_to_non_nullable
              as bool,
      isHasErrorMeanValueProperty: null == isHasErrorMeanValueProperty
          ? _value.isHasErrorMeanValueProperty
          : isHasErrorMeanValueProperty // ignore: cast_nullable_to_non_nullable
              as bool,
      isHasErrorMeanValuePurpose: null == isHasErrorMeanValuePurpose
          ? _value.isHasErrorMeanValuePurpose
          : isHasErrorMeanValuePurpose // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessageMeanValue: null == errorMessageMeanValue
          ? _value.errorMessageMeanValue
          : errorMessageMeanValue // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessageMeanValuePurpose: null == errorMessageMeanValuePurpose
          ? _value.errorMessageMeanValuePurpose
          : errorMessageMeanValuePurpose // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessageMeanValueProperty: null == errorMessageMeanValueProperty
          ? _value.errorMessageMeanValueProperty
          : errorMessageMeanValueProperty // ignore: cast_nullable_to_non_nullable
              as String,
      meanValueResponse: null == meanValueResponse
          ? _value._meanValueResponse
          : meanValueResponse // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
      meanValueResponseProperty: null == meanValueResponseProperty
          ? _value._meanValueResponseProperty
          : meanValueResponseProperty // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
      meanValueResponsePurpose: null == meanValueResponsePurpose
          ? _value._meanValueResponsePurpose
          : meanValueResponsePurpose // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.isLoadingMeanValue = false,
      this.isLoadingMeanValueProperty = false,
      this.isLoadingMeanValuePurpose = false,
      this.isHasErrorMeanValue = false,
      this.isHasErrorMeanValueProperty = false,
      this.isHasErrorMeanValuePurpose = false,
      this.errorMessageMeanValue = '',
      this.errorMessageMeanValuePurpose = '',
      this.errorMessageMeanValueProperty = '',
      final List<BaseRentResponse> meanValueResponse = const [],
      final List<BaseRentResponse> meanValueResponseProperty = const [],
      final List<BaseRentResponse> meanValueResponsePurpose = const []})
      : _meanValueResponse = meanValueResponse,
        _meanValueResponseProperty = meanValueResponseProperty,
        _meanValueResponsePurpose = meanValueResponsePurpose;

  @override
  @JsonKey()
  final bool isLoadingMeanValue;
  @override
  @JsonKey()
  final bool isLoadingMeanValueProperty;
  @override
  @JsonKey()
  final bool isLoadingMeanValuePurpose;
  @override
  @JsonKey()
  final bool isHasErrorMeanValue;
  @override
  @JsonKey()
  final bool isHasErrorMeanValueProperty;
  @override
  @JsonKey()
  final bool isHasErrorMeanValuePurpose;
  @override
  @JsonKey()
  final String errorMessageMeanValue;
  @override
  @JsonKey()
  final String errorMessageMeanValuePurpose;
  @override
  @JsonKey()
  final String errorMessageMeanValueProperty;
  final List<BaseRentResponse> _meanValueResponse;
  @override
  @JsonKey()
  List<BaseRentResponse> get meanValueResponse {
    if (_meanValueResponse is EqualUnmodifiableListView)
      return _meanValueResponse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meanValueResponse);
  }

  final List<BaseRentResponse> _meanValueResponseProperty;
  @override
  @JsonKey()
  List<BaseRentResponse> get meanValueResponseProperty {
    if (_meanValueResponseProperty is EqualUnmodifiableListView)
      return _meanValueResponseProperty;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meanValueResponseProperty);
  }

  final List<BaseRentResponse> _meanValueResponsePurpose;
  @override
  @JsonKey()
  List<BaseRentResponse> get meanValueResponsePurpose {
    if (_meanValueResponsePurpose is EqualUnmodifiableListView)
      return _meanValueResponsePurpose;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meanValueResponsePurpose);
  }

  @override
  String toString() {
    return 'MeanValueState.initial(isLoadingMeanValue: $isLoadingMeanValue, isLoadingMeanValueProperty: $isLoadingMeanValueProperty, isLoadingMeanValuePurpose: $isLoadingMeanValuePurpose, isHasErrorMeanValue: $isHasErrorMeanValue, isHasErrorMeanValueProperty: $isHasErrorMeanValueProperty, isHasErrorMeanValuePurpose: $isHasErrorMeanValuePurpose, errorMessageMeanValue: $errorMessageMeanValue, errorMessageMeanValuePurpose: $errorMessageMeanValuePurpose, errorMessageMeanValueProperty: $errorMessageMeanValueProperty, meanValueResponse: $meanValueResponse, meanValueResponseProperty: $meanValueResponseProperty, meanValueResponsePurpose: $meanValueResponsePurpose)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoadingMeanValue, isLoadingMeanValue) ||
                other.isLoadingMeanValue == isLoadingMeanValue) &&
            (identical(other.isLoadingMeanValueProperty, isLoadingMeanValueProperty) ||
                other.isLoadingMeanValueProperty ==
                    isLoadingMeanValueProperty) &&
            (identical(other.isLoadingMeanValuePurpose, isLoadingMeanValuePurpose) ||
                other.isLoadingMeanValuePurpose == isLoadingMeanValuePurpose) &&
            (identical(other.isHasErrorMeanValue, isHasErrorMeanValue) ||
                other.isHasErrorMeanValue == isHasErrorMeanValue) &&
            (identical(other.isHasErrorMeanValueProperty, isHasErrorMeanValueProperty) ||
                other.isHasErrorMeanValueProperty ==
                    isHasErrorMeanValueProperty) &&
            (identical(other.isHasErrorMeanValuePurpose, isHasErrorMeanValuePurpose) ||
                other.isHasErrorMeanValuePurpose ==
                    isHasErrorMeanValuePurpose) &&
            (identical(other.errorMessageMeanValue, errorMessageMeanValue) ||
                other.errorMessageMeanValue == errorMessageMeanValue) &&
            (identical(other.errorMessageMeanValuePurpose,
                    errorMessageMeanValuePurpose) ||
                other.errorMessageMeanValuePurpose ==
                    errorMessageMeanValuePurpose) &&
            (identical(other.errorMessageMeanValueProperty,
                    errorMessageMeanValueProperty) ||
                other.errorMessageMeanValueProperty ==
                    errorMessageMeanValueProperty) &&
            const DeepCollectionEquality()
                .equals(other._meanValueResponse, _meanValueResponse) &&
            const DeepCollectionEquality().equals(
                other._meanValueResponseProperty, _meanValueResponseProperty) &&
            const DeepCollectionEquality().equals(
                other._meanValueResponsePurpose, _meanValueResponsePurpose));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoadingMeanValue,
      isLoadingMeanValueProperty,
      isLoadingMeanValuePurpose,
      isHasErrorMeanValue,
      isHasErrorMeanValueProperty,
      isHasErrorMeanValuePurpose,
      errorMessageMeanValue,
      errorMessageMeanValuePurpose,
      errorMessageMeanValueProperty,
      const DeepCollectionEquality().hash(_meanValueResponse),
      const DeepCollectionEquality().hash(_meanValueResponseProperty),
      const DeepCollectionEquality().hash(_meanValueResponsePurpose));

  /// Create a copy of MeanValueState
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
            bool isLoadingMeanValue,
            bool isLoadingMeanValueProperty,
            bool isLoadingMeanValuePurpose,
            bool isHasErrorMeanValue,
            bool isHasErrorMeanValueProperty,
            bool isHasErrorMeanValuePurpose,
            String errorMessageMeanValue,
            String errorMessageMeanValuePurpose,
            String errorMessageMeanValueProperty,
            List<BaseRentResponse> meanValueResponse,
            List<BaseRentResponse> meanValueResponseProperty,
            List<BaseRentResponse> meanValueResponsePurpose)
        initial,
  }) {
    return initial(
        isLoadingMeanValue,
        isLoadingMeanValueProperty,
        isLoadingMeanValuePurpose,
        isHasErrorMeanValue,
        isHasErrorMeanValueProperty,
        isHasErrorMeanValuePurpose,
        errorMessageMeanValue,
        errorMessageMeanValuePurpose,
        errorMessageMeanValueProperty,
        meanValueResponse,
        meanValueResponseProperty,
        meanValueResponsePurpose);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool isLoadingMeanValue,
            bool isLoadingMeanValueProperty,
            bool isLoadingMeanValuePurpose,
            bool isHasErrorMeanValue,
            bool isHasErrorMeanValueProperty,
            bool isHasErrorMeanValuePurpose,
            String errorMessageMeanValue,
            String errorMessageMeanValuePurpose,
            String errorMessageMeanValueProperty,
            List<BaseRentResponse> meanValueResponse,
            List<BaseRentResponse> meanValueResponseProperty,
            List<BaseRentResponse> meanValueResponsePurpose)?
        initial,
  }) {
    return initial?.call(
        isLoadingMeanValue,
        isLoadingMeanValueProperty,
        isLoadingMeanValuePurpose,
        isHasErrorMeanValue,
        isHasErrorMeanValueProperty,
        isHasErrorMeanValuePurpose,
        errorMessageMeanValue,
        errorMessageMeanValuePurpose,
        errorMessageMeanValueProperty,
        meanValueResponse,
        meanValueResponseProperty,
        meanValueResponsePurpose);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isLoadingMeanValue,
            bool isLoadingMeanValueProperty,
            bool isLoadingMeanValuePurpose,
            bool isHasErrorMeanValue,
            bool isHasErrorMeanValueProperty,
            bool isHasErrorMeanValuePurpose,
            String errorMessageMeanValue,
            String errorMessageMeanValuePurpose,
            String errorMessageMeanValueProperty,
            List<BaseRentResponse> meanValueResponse,
            List<BaseRentResponse> meanValueResponseProperty,
            List<BaseRentResponse> meanValueResponsePurpose)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          isLoadingMeanValue,
          isLoadingMeanValueProperty,
          isLoadingMeanValuePurpose,
          isHasErrorMeanValue,
          isHasErrorMeanValueProperty,
          isHasErrorMeanValuePurpose,
          errorMessageMeanValue,
          errorMessageMeanValuePurpose,
          errorMessageMeanValueProperty,
          meanValueResponse,
          meanValueResponseProperty,
          meanValueResponsePurpose);
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
      final bool isLoadingMeanValueProperty,
      final bool isLoadingMeanValuePurpose,
      final bool isHasErrorMeanValue,
      final bool isHasErrorMeanValueProperty,
      final bool isHasErrorMeanValuePurpose,
      final String errorMessageMeanValue,
      final String errorMessageMeanValuePurpose,
      final String errorMessageMeanValueProperty,
      final List<BaseRentResponse> meanValueResponse,
      final List<BaseRentResponse> meanValueResponseProperty,
      final List<BaseRentResponse> meanValueResponsePurpose}) = _$InitialImpl;

  @override
  bool get isLoadingMeanValue;
  @override
  bool get isLoadingMeanValueProperty;
  @override
  bool get isLoadingMeanValuePurpose;
  @override
  bool get isHasErrorMeanValue;
  @override
  bool get isHasErrorMeanValueProperty;
  @override
  bool get isHasErrorMeanValuePurpose;
  @override
  String get errorMessageMeanValue;
  @override
  String get errorMessageMeanValuePurpose;
  @override
  String get errorMessageMeanValueProperty;
  @override
  List<BaseRentResponse> get meanValueResponse;
  @override
  List<BaseRentResponse> get meanValueResponseProperty;
  @override
  List<BaseRentResponse> get meanValueResponsePurpose;

  /// Create a copy of MeanValueState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
