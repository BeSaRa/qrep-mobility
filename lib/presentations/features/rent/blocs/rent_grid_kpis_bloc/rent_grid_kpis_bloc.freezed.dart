// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rent_grid_kpis_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RentGridKPIsEvent {
  RentRequest get request => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RentRequest request) getData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RentRequest request)? getData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RentRequest request)? getData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RentGridKPIsEvent value) getData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RentGridKPIsEvent value)? getData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RentGridKPIsEvent value)? getData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of RentGridKPIsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RentGridKPIsEventCopyWith<RentGridKPIsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentGridKPIsEventCopyWith<$Res> {
  factory $RentGridKPIsEventCopyWith(
          RentGridKPIsEvent value, $Res Function(RentGridKPIsEvent) then) =
      _$RentGridKPIsEventCopyWithImpl<$Res, RentGridKPIsEvent>;
  @useResult
  $Res call({RentRequest request});

  $RentRequestCopyWith<$Res> get request;
}

/// @nodoc
class _$RentGridKPIsEventCopyWithImpl<$Res, $Val extends RentGridKPIsEvent>
    implements $RentGridKPIsEventCopyWith<$Res> {
  _$RentGridKPIsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RentGridKPIsEvent
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

  /// Create a copy of RentGridKPIsEvent
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
abstract class _$$RentGridKPIsEventImplCopyWith<$Res>
    implements $RentGridKPIsEventCopyWith<$Res> {
  factory _$$RentGridKPIsEventImplCopyWith(_$RentGridKPIsEventImpl value,
          $Res Function(_$RentGridKPIsEventImpl) then) =
      __$$RentGridKPIsEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RentRequest request});

  @override
  $RentRequestCopyWith<$Res> get request;
}

/// @nodoc
class __$$RentGridKPIsEventImplCopyWithImpl<$Res>
    extends _$RentGridKPIsEventCopyWithImpl<$Res, _$RentGridKPIsEventImpl>
    implements _$$RentGridKPIsEventImplCopyWith<$Res> {
  __$$RentGridKPIsEventImplCopyWithImpl(_$RentGridKPIsEventImpl _value,
      $Res Function(_$RentGridKPIsEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of RentGridKPIsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$RentGridKPIsEventImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as RentRequest,
    ));
  }
}

/// @nodoc

class _$RentGridKPIsEventImpl implements _RentGridKPIsEvent {
  const _$RentGridKPIsEventImpl({required this.request});

  @override
  final RentRequest request;

  @override
  String toString() {
    return 'RentGridKPIsEvent.getData(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RentGridKPIsEventImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of RentGridKPIsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RentGridKPIsEventImplCopyWith<_$RentGridKPIsEventImpl> get copyWith =>
      __$$RentGridKPIsEventImplCopyWithImpl<_$RentGridKPIsEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RentRequest request) getData,
  }) {
    return getData(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RentRequest request)? getData,
  }) {
    return getData?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RentRequest request)? getData,
    required TResult orElse(),
  }) {
    if (getData != null) {
      return getData(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RentGridKPIsEvent value) getData,
  }) {
    return getData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RentGridKPIsEvent value)? getData,
  }) {
    return getData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RentGridKPIsEvent value)? getData,
    required TResult orElse(),
  }) {
    if (getData != null) {
      return getData(this);
    }
    return orElse();
  }
}

abstract class _RentGridKPIsEvent implements RentGridKPIsEvent {
  const factory _RentGridKPIsEvent({required final RentRequest request}) =
      _$RentGridKPIsEventImpl;

  @override
  RentRequest get request;

  /// Create a copy of RentGridKPIsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RentGridKPIsEventImplCopyWith<_$RentGridKPIsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RentGridKPIsState {
  bool get isLoading => throw _privateConstructorUsedError;

  /// KPI1
  List<BaseRentResponse> get totalContracts =>
      throw _privateConstructorUsedError;

  /// KPI4
  List<BaseRentResponse> get totalRentedUnits =>
      throw _privateConstructorUsedError;

  /// KPI7
  List<BaseRentResponse> get totalContractsValue =>
      throw _privateConstructorUsedError;

  /// KPI10
  List<BaseRentResponse> get totalRentedSpace =>
      throw _privateConstructorUsedError;

  /// KPI13
  List<BaseRentResponse> get meanRentUnitValue =>
      throw _privateConstructorUsedError;

  /// KPI16
  List<BaseRentResponse> get meanAreaValue =>
      throw _privateConstructorUsedError; //--------------------Error-------------------------------------------------
  String get errorMessage => throw _privateConstructorUsedError;

  /// KPI1
  bool get hasErrorTotalContracts => throw _privateConstructorUsedError;

  /// KPI4
  bool get hasErrorTotalRentedUnits => throw _privateConstructorUsedError;

  /// KPI7
  bool get hasErrorTotalContractsValue => throw _privateConstructorUsedError;

  /// KPI10
  bool get hasErrorTotalRentedSpace => throw _privateConstructorUsedError;

  /// KPI13
  bool get hasErrorMeanRentUnitValue => throw _privateConstructorUsedError;

  /// KPI16
  bool get hasErrorMeanAreaValue => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoading,
            List<BaseRentResponse> totalContracts,
            List<BaseRentResponse> totalRentedUnits,
            List<BaseRentResponse> totalContractsValue,
            List<BaseRentResponse> totalRentedSpace,
            List<BaseRentResponse> meanRentUnitValue,
            List<BaseRentResponse> meanAreaValue,
            String errorMessage,
            bool hasErrorTotalContracts,
            bool hasErrorTotalRentedUnits,
            bool hasErrorTotalContractsValue,
            bool hasErrorTotalRentedSpace,
            bool hasErrorMeanRentUnitValue,
            bool hasErrorMeanAreaValue)
        initialState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool isLoading,
            List<BaseRentResponse> totalContracts,
            List<BaseRentResponse> totalRentedUnits,
            List<BaseRentResponse> totalContractsValue,
            List<BaseRentResponse> totalRentedSpace,
            List<BaseRentResponse> meanRentUnitValue,
            List<BaseRentResponse> meanAreaValue,
            String errorMessage,
            bool hasErrorTotalContracts,
            bool hasErrorTotalRentedUnits,
            bool hasErrorTotalContractsValue,
            bool hasErrorTotalRentedSpace,
            bool hasErrorMeanRentUnitValue,
            bool hasErrorMeanAreaValue)?
        initialState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isLoading,
            List<BaseRentResponse> totalContracts,
            List<BaseRentResponse> totalRentedUnits,
            List<BaseRentResponse> totalContractsValue,
            List<BaseRentResponse> totalRentedSpace,
            List<BaseRentResponse> meanRentUnitValue,
            List<BaseRentResponse> meanAreaValue,
            String errorMessage,
            bool hasErrorTotalContracts,
            bool hasErrorTotalRentedUnits,
            bool hasErrorTotalContractsValue,
            bool hasErrorTotalRentedSpace,
            bool hasErrorMeanRentUnitValue,
            bool hasErrorMeanAreaValue)?
        initialState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initialState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initialState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initialState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of RentGridKPIsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RentGridKPIsStateCopyWith<RentGridKPIsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentGridKPIsStateCopyWith<$Res> {
  factory $RentGridKPIsStateCopyWith(
          RentGridKPIsState value, $Res Function(RentGridKPIsState) then) =
      _$RentGridKPIsStateCopyWithImpl<$Res, RentGridKPIsState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<BaseRentResponse> totalContracts,
      List<BaseRentResponse> totalRentedUnits,
      List<BaseRentResponse> totalContractsValue,
      List<BaseRentResponse> totalRentedSpace,
      List<BaseRentResponse> meanRentUnitValue,
      List<BaseRentResponse> meanAreaValue,
      String errorMessage,
      bool hasErrorTotalContracts,
      bool hasErrorTotalRentedUnits,
      bool hasErrorTotalContractsValue,
      bool hasErrorTotalRentedSpace,
      bool hasErrorMeanRentUnitValue,
      bool hasErrorMeanAreaValue});
}

/// @nodoc
class _$RentGridKPIsStateCopyWithImpl<$Res, $Val extends RentGridKPIsState>
    implements $RentGridKPIsStateCopyWith<$Res> {
  _$RentGridKPIsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RentGridKPIsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? totalContracts = null,
    Object? totalRentedUnits = null,
    Object? totalContractsValue = null,
    Object? totalRentedSpace = null,
    Object? meanRentUnitValue = null,
    Object? meanAreaValue = null,
    Object? errorMessage = null,
    Object? hasErrorTotalContracts = null,
    Object? hasErrorTotalRentedUnits = null,
    Object? hasErrorTotalContractsValue = null,
    Object? hasErrorTotalRentedSpace = null,
    Object? hasErrorMeanRentUnitValue = null,
    Object? hasErrorMeanAreaValue = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      totalContracts: null == totalContracts
          ? _value.totalContracts
          : totalContracts // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
      totalRentedUnits: null == totalRentedUnits
          ? _value.totalRentedUnits
          : totalRentedUnits // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
      totalContractsValue: null == totalContractsValue
          ? _value.totalContractsValue
          : totalContractsValue // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
      totalRentedSpace: null == totalRentedSpace
          ? _value.totalRentedSpace
          : totalRentedSpace // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
      meanRentUnitValue: null == meanRentUnitValue
          ? _value.meanRentUnitValue
          : meanRentUnitValue // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
      meanAreaValue: null == meanAreaValue
          ? _value.meanAreaValue
          : meanAreaValue // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      hasErrorTotalContracts: null == hasErrorTotalContracts
          ? _value.hasErrorTotalContracts
          : hasErrorTotalContracts // ignore: cast_nullable_to_non_nullable
              as bool,
      hasErrorTotalRentedUnits: null == hasErrorTotalRentedUnits
          ? _value.hasErrorTotalRentedUnits
          : hasErrorTotalRentedUnits // ignore: cast_nullable_to_non_nullable
              as bool,
      hasErrorTotalContractsValue: null == hasErrorTotalContractsValue
          ? _value.hasErrorTotalContractsValue
          : hasErrorTotalContractsValue // ignore: cast_nullable_to_non_nullable
              as bool,
      hasErrorTotalRentedSpace: null == hasErrorTotalRentedSpace
          ? _value.hasErrorTotalRentedSpace
          : hasErrorTotalRentedSpace // ignore: cast_nullable_to_non_nullable
              as bool,
      hasErrorMeanRentUnitValue: null == hasErrorMeanRentUnitValue
          ? _value.hasErrorMeanRentUnitValue
          : hasErrorMeanRentUnitValue // ignore: cast_nullable_to_non_nullable
              as bool,
      hasErrorMeanAreaValue: null == hasErrorMeanAreaValue
          ? _value.hasErrorMeanAreaValue
          : hasErrorMeanAreaValue // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialStateImplCopyWith<$Res>
    implements $RentGridKPIsStateCopyWith<$Res> {
  factory _$$InitialStateImplCopyWith(
          _$InitialStateImpl value, $Res Function(_$InitialStateImpl) then) =
      __$$InitialStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<BaseRentResponse> totalContracts,
      List<BaseRentResponse> totalRentedUnits,
      List<BaseRentResponse> totalContractsValue,
      List<BaseRentResponse> totalRentedSpace,
      List<BaseRentResponse> meanRentUnitValue,
      List<BaseRentResponse> meanAreaValue,
      String errorMessage,
      bool hasErrorTotalContracts,
      bool hasErrorTotalRentedUnits,
      bool hasErrorTotalContractsValue,
      bool hasErrorTotalRentedSpace,
      bool hasErrorMeanRentUnitValue,
      bool hasErrorMeanAreaValue});
}

/// @nodoc
class __$$InitialStateImplCopyWithImpl<$Res>
    extends _$RentGridKPIsStateCopyWithImpl<$Res, _$InitialStateImpl>
    implements _$$InitialStateImplCopyWith<$Res> {
  __$$InitialStateImplCopyWithImpl(
      _$InitialStateImpl _value, $Res Function(_$InitialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RentGridKPIsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? totalContracts = null,
    Object? totalRentedUnits = null,
    Object? totalContractsValue = null,
    Object? totalRentedSpace = null,
    Object? meanRentUnitValue = null,
    Object? meanAreaValue = null,
    Object? errorMessage = null,
    Object? hasErrorTotalContracts = null,
    Object? hasErrorTotalRentedUnits = null,
    Object? hasErrorTotalContractsValue = null,
    Object? hasErrorTotalRentedSpace = null,
    Object? hasErrorMeanRentUnitValue = null,
    Object? hasErrorMeanAreaValue = null,
  }) {
    return _then(_$InitialStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      totalContracts: null == totalContracts
          ? _value._totalContracts
          : totalContracts // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
      totalRentedUnits: null == totalRentedUnits
          ? _value._totalRentedUnits
          : totalRentedUnits // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
      totalContractsValue: null == totalContractsValue
          ? _value._totalContractsValue
          : totalContractsValue // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
      totalRentedSpace: null == totalRentedSpace
          ? _value._totalRentedSpace
          : totalRentedSpace // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
      meanRentUnitValue: null == meanRentUnitValue
          ? _value._meanRentUnitValue
          : meanRentUnitValue // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
      meanAreaValue: null == meanAreaValue
          ? _value._meanAreaValue
          : meanAreaValue // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      hasErrorTotalContracts: null == hasErrorTotalContracts
          ? _value.hasErrorTotalContracts
          : hasErrorTotalContracts // ignore: cast_nullable_to_non_nullable
              as bool,
      hasErrorTotalRentedUnits: null == hasErrorTotalRentedUnits
          ? _value.hasErrorTotalRentedUnits
          : hasErrorTotalRentedUnits // ignore: cast_nullable_to_non_nullable
              as bool,
      hasErrorTotalContractsValue: null == hasErrorTotalContractsValue
          ? _value.hasErrorTotalContractsValue
          : hasErrorTotalContractsValue // ignore: cast_nullable_to_non_nullable
              as bool,
      hasErrorTotalRentedSpace: null == hasErrorTotalRentedSpace
          ? _value.hasErrorTotalRentedSpace
          : hasErrorTotalRentedSpace // ignore: cast_nullable_to_non_nullable
              as bool,
      hasErrorMeanRentUnitValue: null == hasErrorMeanRentUnitValue
          ? _value.hasErrorMeanRentUnitValue
          : hasErrorMeanRentUnitValue // ignore: cast_nullable_to_non_nullable
              as bool,
      hasErrorMeanAreaValue: null == hasErrorMeanAreaValue
          ? _value.hasErrorMeanAreaValue
          : hasErrorMeanAreaValue // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InitialStateImpl implements _InitialState {
  const _$InitialStateImpl(
      {this.isLoading = false,
      final List<BaseRentResponse> totalContracts = const [],
      final List<BaseRentResponse> totalRentedUnits = const [],
      final List<BaseRentResponse> totalContractsValue = const [],
      final List<BaseRentResponse> totalRentedSpace = const [],
      final List<BaseRentResponse> meanRentUnitValue = const [],
      final List<BaseRentResponse> meanAreaValue = const [],
      this.errorMessage = '',
      this.hasErrorTotalContracts = false,
      this.hasErrorTotalRentedUnits = false,
      this.hasErrorTotalContractsValue = false,
      this.hasErrorTotalRentedSpace = false,
      this.hasErrorMeanRentUnitValue = false,
      this.hasErrorMeanAreaValue = false})
      : _totalContracts = totalContracts,
        _totalRentedUnits = totalRentedUnits,
        _totalContractsValue = totalContractsValue,
        _totalRentedSpace = totalRentedSpace,
        _meanRentUnitValue = meanRentUnitValue,
        _meanAreaValue = meanAreaValue;

  @override
  @JsonKey()
  final bool isLoading;

  /// KPI1
  final List<BaseRentResponse> _totalContracts;

  /// KPI1
  @override
  @JsonKey()
  List<BaseRentResponse> get totalContracts {
    if (_totalContracts is EqualUnmodifiableListView) return _totalContracts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_totalContracts);
  }

  /// KPI4
  final List<BaseRentResponse> _totalRentedUnits;

  /// KPI4
  @override
  @JsonKey()
  List<BaseRentResponse> get totalRentedUnits {
    if (_totalRentedUnits is EqualUnmodifiableListView)
      return _totalRentedUnits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_totalRentedUnits);
  }

  /// KPI7
  final List<BaseRentResponse> _totalContractsValue;

  /// KPI7
  @override
  @JsonKey()
  List<BaseRentResponse> get totalContractsValue {
    if (_totalContractsValue is EqualUnmodifiableListView)
      return _totalContractsValue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_totalContractsValue);
  }

  /// KPI10
  final List<BaseRentResponse> _totalRentedSpace;

  /// KPI10
  @override
  @JsonKey()
  List<BaseRentResponse> get totalRentedSpace {
    if (_totalRentedSpace is EqualUnmodifiableListView)
      return _totalRentedSpace;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_totalRentedSpace);
  }

  /// KPI13
  final List<BaseRentResponse> _meanRentUnitValue;

  /// KPI13
  @override
  @JsonKey()
  List<BaseRentResponse> get meanRentUnitValue {
    if (_meanRentUnitValue is EqualUnmodifiableListView)
      return _meanRentUnitValue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meanRentUnitValue);
  }

  /// KPI16
  final List<BaseRentResponse> _meanAreaValue;

  /// KPI16
  @override
  @JsonKey()
  List<BaseRentResponse> get meanAreaValue {
    if (_meanAreaValue is EqualUnmodifiableListView) return _meanAreaValue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meanAreaValue);
  }

//--------------------Error-------------------------------------------------
  @override
  @JsonKey()
  final String errorMessage;

  /// KPI1
  @override
  @JsonKey()
  final bool hasErrorTotalContracts;

  /// KPI4
  @override
  @JsonKey()
  final bool hasErrorTotalRentedUnits;

  /// KPI7
  @override
  @JsonKey()
  final bool hasErrorTotalContractsValue;

  /// KPI10
  @override
  @JsonKey()
  final bool hasErrorTotalRentedSpace;

  /// KPI13
  @override
  @JsonKey()
  final bool hasErrorMeanRentUnitValue;

  /// KPI16
  @override
  @JsonKey()
  final bool hasErrorMeanAreaValue;

  @override
  String toString() {
    return 'RentGridKPIsState.initialState(isLoading: $isLoading, totalContracts: $totalContracts, totalRentedUnits: $totalRentedUnits, totalContractsValue: $totalContractsValue, totalRentedSpace: $totalRentedSpace, meanRentUnitValue: $meanRentUnitValue, meanAreaValue: $meanAreaValue, errorMessage: $errorMessage, hasErrorTotalContracts: $hasErrorTotalContracts, hasErrorTotalRentedUnits: $hasErrorTotalRentedUnits, hasErrorTotalContractsValue: $hasErrorTotalContractsValue, hasErrorTotalRentedSpace: $hasErrorTotalRentedSpace, hasErrorMeanRentUnitValue: $hasErrorMeanRentUnitValue, hasErrorMeanAreaValue: $hasErrorMeanAreaValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._totalContracts, _totalContracts) &&
            const DeepCollectionEquality()
                .equals(other._totalRentedUnits, _totalRentedUnits) &&
            const DeepCollectionEquality()
                .equals(other._totalContractsValue, _totalContractsValue) &&
            const DeepCollectionEquality()
                .equals(other._totalRentedSpace, _totalRentedSpace) &&
            const DeepCollectionEquality()
                .equals(other._meanRentUnitValue, _meanRentUnitValue) &&
            const DeepCollectionEquality()
                .equals(other._meanAreaValue, _meanAreaValue) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.hasErrorTotalContracts, hasErrorTotalContracts) ||
                other.hasErrorTotalContracts == hasErrorTotalContracts) &&
            (identical(
                    other.hasErrorTotalRentedUnits, hasErrorTotalRentedUnits) ||
                other.hasErrorTotalRentedUnits == hasErrorTotalRentedUnits) &&
            (identical(other.hasErrorTotalContractsValue,
                    hasErrorTotalContractsValue) ||
                other.hasErrorTotalContractsValue ==
                    hasErrorTotalContractsValue) &&
            (identical(
                    other.hasErrorTotalRentedSpace, hasErrorTotalRentedSpace) ||
                other.hasErrorTotalRentedSpace == hasErrorTotalRentedSpace) &&
            (identical(other.hasErrorMeanRentUnitValue,
                    hasErrorMeanRentUnitValue) ||
                other.hasErrorMeanRentUnitValue == hasErrorMeanRentUnitValue) &&
            (identical(other.hasErrorMeanAreaValue, hasErrorMeanAreaValue) ||
                other.hasErrorMeanAreaValue == hasErrorMeanAreaValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_totalContracts),
      const DeepCollectionEquality().hash(_totalRentedUnits),
      const DeepCollectionEquality().hash(_totalContractsValue),
      const DeepCollectionEquality().hash(_totalRentedSpace),
      const DeepCollectionEquality().hash(_meanRentUnitValue),
      const DeepCollectionEquality().hash(_meanAreaValue),
      errorMessage,
      hasErrorTotalContracts,
      hasErrorTotalRentedUnits,
      hasErrorTotalContractsValue,
      hasErrorTotalRentedSpace,
      hasErrorMeanRentUnitValue,
      hasErrorMeanAreaValue);

  /// Create a copy of RentGridKPIsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialStateImplCopyWith<_$InitialStateImpl> get copyWith =>
      __$$InitialStateImplCopyWithImpl<_$InitialStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoading,
            List<BaseRentResponse> totalContracts,
            List<BaseRentResponse> totalRentedUnits,
            List<BaseRentResponse> totalContractsValue,
            List<BaseRentResponse> totalRentedSpace,
            List<BaseRentResponse> meanRentUnitValue,
            List<BaseRentResponse> meanAreaValue,
            String errorMessage,
            bool hasErrorTotalContracts,
            bool hasErrorTotalRentedUnits,
            bool hasErrorTotalContractsValue,
            bool hasErrorTotalRentedSpace,
            bool hasErrorMeanRentUnitValue,
            bool hasErrorMeanAreaValue)
        initialState,
  }) {
    return initialState(
        isLoading,
        totalContracts,
        totalRentedUnits,
        totalContractsValue,
        totalRentedSpace,
        meanRentUnitValue,
        meanAreaValue,
        errorMessage,
        hasErrorTotalContracts,
        hasErrorTotalRentedUnits,
        hasErrorTotalContractsValue,
        hasErrorTotalRentedSpace,
        hasErrorMeanRentUnitValue,
        hasErrorMeanAreaValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool isLoading,
            List<BaseRentResponse> totalContracts,
            List<BaseRentResponse> totalRentedUnits,
            List<BaseRentResponse> totalContractsValue,
            List<BaseRentResponse> totalRentedSpace,
            List<BaseRentResponse> meanRentUnitValue,
            List<BaseRentResponse> meanAreaValue,
            String errorMessage,
            bool hasErrorTotalContracts,
            bool hasErrorTotalRentedUnits,
            bool hasErrorTotalContractsValue,
            bool hasErrorTotalRentedSpace,
            bool hasErrorMeanRentUnitValue,
            bool hasErrorMeanAreaValue)?
        initialState,
  }) {
    return initialState?.call(
        isLoading,
        totalContracts,
        totalRentedUnits,
        totalContractsValue,
        totalRentedSpace,
        meanRentUnitValue,
        meanAreaValue,
        errorMessage,
        hasErrorTotalContracts,
        hasErrorTotalRentedUnits,
        hasErrorTotalContractsValue,
        hasErrorTotalRentedSpace,
        hasErrorMeanRentUnitValue,
        hasErrorMeanAreaValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isLoading,
            List<BaseRentResponse> totalContracts,
            List<BaseRentResponse> totalRentedUnits,
            List<BaseRentResponse> totalContractsValue,
            List<BaseRentResponse> totalRentedSpace,
            List<BaseRentResponse> meanRentUnitValue,
            List<BaseRentResponse> meanAreaValue,
            String errorMessage,
            bool hasErrorTotalContracts,
            bool hasErrorTotalRentedUnits,
            bool hasErrorTotalContractsValue,
            bool hasErrorTotalRentedSpace,
            bool hasErrorMeanRentUnitValue,
            bool hasErrorMeanAreaValue)?
        initialState,
    required TResult orElse(),
  }) {
    if (initialState != null) {
      return initialState(
          isLoading,
          totalContracts,
          totalRentedUnits,
          totalContractsValue,
          totalRentedSpace,
          meanRentUnitValue,
          meanAreaValue,
          errorMessage,
          hasErrorTotalContracts,
          hasErrorTotalRentedUnits,
          hasErrorTotalContractsValue,
          hasErrorTotalRentedSpace,
          hasErrorMeanRentUnitValue,
          hasErrorMeanAreaValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initialState,
  }) {
    return initialState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initialState,
  }) {
    return initialState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initialState,
    required TResult orElse(),
  }) {
    if (initialState != null) {
      return initialState(this);
    }
    return orElse();
  }
}

abstract class _InitialState implements RentGridKPIsState {
  const factory _InitialState(
      {final bool isLoading,
      final List<BaseRentResponse> totalContracts,
      final List<BaseRentResponse> totalRentedUnits,
      final List<BaseRentResponse> totalContractsValue,
      final List<BaseRentResponse> totalRentedSpace,
      final List<BaseRentResponse> meanRentUnitValue,
      final List<BaseRentResponse> meanAreaValue,
      final String errorMessage,
      final bool hasErrorTotalContracts,
      final bool hasErrorTotalRentedUnits,
      final bool hasErrorTotalContractsValue,
      final bool hasErrorTotalRentedSpace,
      final bool hasErrorMeanRentUnitValue,
      final bool hasErrorMeanAreaValue}) = _$InitialStateImpl;

  @override
  bool get isLoading;

  /// KPI1
  @override
  List<BaseRentResponse> get totalContracts;

  /// KPI4
  @override
  List<BaseRentResponse> get totalRentedUnits;

  /// KPI7
  @override
  List<BaseRentResponse> get totalContractsValue;

  /// KPI10
  @override
  List<BaseRentResponse> get totalRentedSpace;

  /// KPI13
  @override
  List<BaseRentResponse> get meanRentUnitValue;

  /// KPI16
  @override
  List<BaseRentResponse>
      get meanAreaValue; //--------------------Error-------------------------------------------------
  @override
  String get errorMessage;

  /// KPI1
  @override
  bool get hasErrorTotalContracts;

  /// KPI4
  @override
  bool get hasErrorTotalRentedUnits;

  /// KPI7
  @override
  bool get hasErrorTotalContractsValue;

  /// KPI10
  @override
  bool get hasErrorTotalRentedSpace;

  /// KPI13
  @override
  bool get hasErrorMeanRentUnitValue;

  /// KPI16
  @override
  bool get hasErrorMeanAreaValue;

  /// Create a copy of RentGridKPIsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialStateImplCopyWith<_$InitialStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
