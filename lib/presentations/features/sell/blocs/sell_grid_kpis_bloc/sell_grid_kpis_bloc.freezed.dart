// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sell_grid_kpis_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SellGridKPIsEvent {
  RequestSellValues get request => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RequestSellValues request) getData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RequestSellValues request)? getData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RequestSellValues request)? getData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SellGridKPIsEvent value) getData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SellGridKPIsEvent value)? getData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SellGridKPIsEvent value)? getData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SellGridKPIsEventCopyWith<SellGridKPIsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellGridKPIsEventCopyWith<$Res> {
  factory $SellGridKPIsEventCopyWith(
          SellGridKPIsEvent value, $Res Function(SellGridKPIsEvent) then) =
      _$SellGridKPIsEventCopyWithImpl<$Res, SellGridKPIsEvent>;
  @useResult
  $Res call({RequestSellValues request});

  $RequestSellValuesCopyWith<$Res> get request;
}

/// @nodoc
class _$SellGridKPIsEventCopyWithImpl<$Res, $Val extends SellGridKPIsEvent>
    implements $SellGridKPIsEventCopyWith<$Res> {
  _$SellGridKPIsEventCopyWithImpl(this._value, this._then);

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
              as RequestSellValues,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RequestSellValuesCopyWith<$Res> get request {
    return $RequestSellValuesCopyWith<$Res>(_value.request, (value) {
      return _then(_value.copyWith(request: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SellGridKPIsEventImplCopyWith<$Res>
    implements $SellGridKPIsEventCopyWith<$Res> {
  factory _$$SellGridKPIsEventImplCopyWith(_$SellGridKPIsEventImpl value,
          $Res Function(_$SellGridKPIsEventImpl) then) =
      __$$SellGridKPIsEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RequestSellValues request});

  @override
  $RequestSellValuesCopyWith<$Res> get request;
}

/// @nodoc
class __$$SellGridKPIsEventImplCopyWithImpl<$Res>
    extends _$SellGridKPIsEventCopyWithImpl<$Res, _$SellGridKPIsEventImpl>
    implements _$$SellGridKPIsEventImplCopyWith<$Res> {
  __$$SellGridKPIsEventImplCopyWithImpl(_$SellGridKPIsEventImpl _value,
      $Res Function(_$SellGridKPIsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$SellGridKPIsEventImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as RequestSellValues,
    ));
  }
}

/// @nodoc

class _$SellGridKPIsEventImpl implements _SellGridKPIsEvent {
  const _$SellGridKPIsEventImpl({required this.request});

  @override
  final RequestSellValues request;

  @override
  String toString() {
    return 'SellGridKPIsEvent.getData(request: $request)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellGridKPIsEventImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SellGridKPIsEventImplCopyWith<_$SellGridKPIsEventImpl> get copyWith =>
      __$$SellGridKPIsEventImplCopyWithImpl<_$SellGridKPIsEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RequestSellValues request) getData,
  }) {
    return getData(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RequestSellValues request)? getData,
  }) {
    return getData?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RequestSellValues request)? getData,
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
    required TResult Function(_SellGridKPIsEvent value) getData,
  }) {
    return getData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SellGridKPIsEvent value)? getData,
  }) {
    return getData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SellGridKPIsEvent value)? getData,
    required TResult orElse(),
  }) {
    if (getData != null) {
      return getData(this);
    }
    return orElse();
  }
}

abstract class _SellGridKPIsEvent implements SellGridKPIsEvent {
  const factory _SellGridKPIsEvent({required final RequestSellValues request}) =
      _$SellGridKPIsEventImpl;

  @override
  RequestSellValues get request;
  @override
  @JsonKey(ignore: true)
  _$$SellGridKPIsEventImplCopyWith<_$SellGridKPIsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SellGridKPIsState {
  bool get isLoading => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  List<BaseRentResponse> get totalContracts =>
      throw _privateConstructorUsedError;
  List<BaseRentResponse> get totalSoldUnits =>
      throw _privateConstructorUsedError;
  List<BaseRentResponse> get totalTransactionsValue =>
      throw _privateConstructorUsedError;
  List<BaseRentResponse> get meanSellUnitValue =>
      throw _privateConstructorUsedError;
  List<BaseRentResponse> get totalSoldSpaces =>
      throw _privateConstructorUsedError;
  List<BaseRentResponse> get meanSoldAreaValue =>
      throw _privateConstructorUsedError; //----------------------------errors----------------------------------------
  bool get hasErrorTotalContracts => throw _privateConstructorUsedError;
  bool get hasErrorTotalSoldUnits => throw _privateConstructorUsedError;
  bool get hasErrorTotalTransactionsValue => throw _privateConstructorUsedError;
  bool get hasErrorMeanSellUnitValue => throw _privateConstructorUsedError;
  bool get hasErrorTotalSoldSpaces => throw _privateConstructorUsedError;
  bool get hasErrorMeanSoldAreaValue => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoading,
            String errorMessage,
            List<BaseRentResponse> totalContracts,
            List<BaseRentResponse> totalSoldUnits,
            List<BaseRentResponse> totalTransactionsValue,
            List<BaseRentResponse> meanSellUnitValue,
            List<BaseRentResponse> totalSoldSpaces,
            List<BaseRentResponse> meanSoldAreaValue,
            bool hasErrorTotalContracts,
            bool hasErrorTotalSoldUnits,
            bool hasErrorTotalTransactionsValue,
            bool hasErrorMeanSellUnitValue,
            bool hasErrorTotalSoldSpaces,
            bool hasErrorMeanSoldAreaValue)
        initialState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool isLoading,
            String errorMessage,
            List<BaseRentResponse> totalContracts,
            List<BaseRentResponse> totalSoldUnits,
            List<BaseRentResponse> totalTransactionsValue,
            List<BaseRentResponse> meanSellUnitValue,
            List<BaseRentResponse> totalSoldSpaces,
            List<BaseRentResponse> meanSoldAreaValue,
            bool hasErrorTotalContracts,
            bool hasErrorTotalSoldUnits,
            bool hasErrorTotalTransactionsValue,
            bool hasErrorMeanSellUnitValue,
            bool hasErrorTotalSoldSpaces,
            bool hasErrorMeanSoldAreaValue)?
        initialState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isLoading,
            String errorMessage,
            List<BaseRentResponse> totalContracts,
            List<BaseRentResponse> totalSoldUnits,
            List<BaseRentResponse> totalTransactionsValue,
            List<BaseRentResponse> meanSellUnitValue,
            List<BaseRentResponse> totalSoldSpaces,
            List<BaseRentResponse> meanSoldAreaValue,
            bool hasErrorTotalContracts,
            bool hasErrorTotalSoldUnits,
            bool hasErrorTotalTransactionsValue,
            bool hasErrorMeanSellUnitValue,
            bool hasErrorTotalSoldSpaces,
            bool hasErrorMeanSoldAreaValue)?
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

  @JsonKey(ignore: true)
  $SellGridKPIsStateCopyWith<SellGridKPIsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellGridKPIsStateCopyWith<$Res> {
  factory $SellGridKPIsStateCopyWith(
          SellGridKPIsState value, $Res Function(SellGridKPIsState) then) =
      _$SellGridKPIsStateCopyWithImpl<$Res, SellGridKPIsState>;
  @useResult
  $Res call(
      {bool isLoading,
      String errorMessage,
      List<BaseRentResponse> totalContracts,
      List<BaseRentResponse> totalSoldUnits,
      List<BaseRentResponse> totalTransactionsValue,
      List<BaseRentResponse> meanSellUnitValue,
      List<BaseRentResponse> totalSoldSpaces,
      List<BaseRentResponse> meanSoldAreaValue,
      bool hasErrorTotalContracts,
      bool hasErrorTotalSoldUnits,
      bool hasErrorTotalTransactionsValue,
      bool hasErrorMeanSellUnitValue,
      bool hasErrorTotalSoldSpaces,
      bool hasErrorMeanSoldAreaValue});
}

/// @nodoc
class _$SellGridKPIsStateCopyWithImpl<$Res, $Val extends SellGridKPIsState>
    implements $SellGridKPIsStateCopyWith<$Res> {
  _$SellGridKPIsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? totalContracts = null,
    Object? totalSoldUnits = null,
    Object? totalTransactionsValue = null,
    Object? meanSellUnitValue = null,
    Object? totalSoldSpaces = null,
    Object? meanSoldAreaValue = null,
    Object? hasErrorTotalContracts = null,
    Object? hasErrorTotalSoldUnits = null,
    Object? hasErrorTotalTransactionsValue = null,
    Object? hasErrorMeanSellUnitValue = null,
    Object? hasErrorTotalSoldSpaces = null,
    Object? hasErrorMeanSoldAreaValue = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      totalContracts: null == totalContracts
          ? _value.totalContracts
          : totalContracts // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
      totalSoldUnits: null == totalSoldUnits
          ? _value.totalSoldUnits
          : totalSoldUnits // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
      totalTransactionsValue: null == totalTransactionsValue
          ? _value.totalTransactionsValue
          : totalTransactionsValue // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
      meanSellUnitValue: null == meanSellUnitValue
          ? _value.meanSellUnitValue
          : meanSellUnitValue // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
      totalSoldSpaces: null == totalSoldSpaces
          ? _value.totalSoldSpaces
          : totalSoldSpaces // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
      meanSoldAreaValue: null == meanSoldAreaValue
          ? _value.meanSoldAreaValue
          : meanSoldAreaValue // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
      hasErrorTotalContracts: null == hasErrorTotalContracts
          ? _value.hasErrorTotalContracts
          : hasErrorTotalContracts // ignore: cast_nullable_to_non_nullable
              as bool,
      hasErrorTotalSoldUnits: null == hasErrorTotalSoldUnits
          ? _value.hasErrorTotalSoldUnits
          : hasErrorTotalSoldUnits // ignore: cast_nullable_to_non_nullable
              as bool,
      hasErrorTotalTransactionsValue: null == hasErrorTotalTransactionsValue
          ? _value.hasErrorTotalTransactionsValue
          : hasErrorTotalTransactionsValue // ignore: cast_nullable_to_non_nullable
              as bool,
      hasErrorMeanSellUnitValue: null == hasErrorMeanSellUnitValue
          ? _value.hasErrorMeanSellUnitValue
          : hasErrorMeanSellUnitValue // ignore: cast_nullable_to_non_nullable
              as bool,
      hasErrorTotalSoldSpaces: null == hasErrorTotalSoldSpaces
          ? _value.hasErrorTotalSoldSpaces
          : hasErrorTotalSoldSpaces // ignore: cast_nullable_to_non_nullable
              as bool,
      hasErrorMeanSoldAreaValue: null == hasErrorMeanSoldAreaValue
          ? _value.hasErrorMeanSoldAreaValue
          : hasErrorMeanSoldAreaValue // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialStateImplCopyWith<$Res>
    implements $SellGridKPIsStateCopyWith<$Res> {
  factory _$$InitialStateImplCopyWith(
          _$InitialStateImpl value, $Res Function(_$InitialStateImpl) then) =
      __$$InitialStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String errorMessage,
      List<BaseRentResponse> totalContracts,
      List<BaseRentResponse> totalSoldUnits,
      List<BaseRentResponse> totalTransactionsValue,
      List<BaseRentResponse> meanSellUnitValue,
      List<BaseRentResponse> totalSoldSpaces,
      List<BaseRentResponse> meanSoldAreaValue,
      bool hasErrorTotalContracts,
      bool hasErrorTotalSoldUnits,
      bool hasErrorTotalTransactionsValue,
      bool hasErrorMeanSellUnitValue,
      bool hasErrorTotalSoldSpaces,
      bool hasErrorMeanSoldAreaValue});
}

/// @nodoc
class __$$InitialStateImplCopyWithImpl<$Res>
    extends _$SellGridKPIsStateCopyWithImpl<$Res, _$InitialStateImpl>
    implements _$$InitialStateImplCopyWith<$Res> {
  __$$InitialStateImplCopyWithImpl(
      _$InitialStateImpl _value, $Res Function(_$InitialStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = null,
    Object? totalContracts = null,
    Object? totalSoldUnits = null,
    Object? totalTransactionsValue = null,
    Object? meanSellUnitValue = null,
    Object? totalSoldSpaces = null,
    Object? meanSoldAreaValue = null,
    Object? hasErrorTotalContracts = null,
    Object? hasErrorTotalSoldUnits = null,
    Object? hasErrorTotalTransactionsValue = null,
    Object? hasErrorMeanSellUnitValue = null,
    Object? hasErrorTotalSoldSpaces = null,
    Object? hasErrorMeanSoldAreaValue = null,
  }) {
    return _then(_$InitialStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      totalContracts: null == totalContracts
          ? _value._totalContracts
          : totalContracts // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
      totalSoldUnits: null == totalSoldUnits
          ? _value._totalSoldUnits
          : totalSoldUnits // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
      totalTransactionsValue: null == totalTransactionsValue
          ? _value._totalTransactionsValue
          : totalTransactionsValue // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
      meanSellUnitValue: null == meanSellUnitValue
          ? _value._meanSellUnitValue
          : meanSellUnitValue // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
      totalSoldSpaces: null == totalSoldSpaces
          ? _value._totalSoldSpaces
          : totalSoldSpaces // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
      meanSoldAreaValue: null == meanSoldAreaValue
          ? _value._meanSoldAreaValue
          : meanSoldAreaValue // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
      hasErrorTotalContracts: null == hasErrorTotalContracts
          ? _value.hasErrorTotalContracts
          : hasErrorTotalContracts // ignore: cast_nullable_to_non_nullable
              as bool,
      hasErrorTotalSoldUnits: null == hasErrorTotalSoldUnits
          ? _value.hasErrorTotalSoldUnits
          : hasErrorTotalSoldUnits // ignore: cast_nullable_to_non_nullable
              as bool,
      hasErrorTotalTransactionsValue: null == hasErrorTotalTransactionsValue
          ? _value.hasErrorTotalTransactionsValue
          : hasErrorTotalTransactionsValue // ignore: cast_nullable_to_non_nullable
              as bool,
      hasErrorMeanSellUnitValue: null == hasErrorMeanSellUnitValue
          ? _value.hasErrorMeanSellUnitValue
          : hasErrorMeanSellUnitValue // ignore: cast_nullable_to_non_nullable
              as bool,
      hasErrorTotalSoldSpaces: null == hasErrorTotalSoldSpaces
          ? _value.hasErrorTotalSoldSpaces
          : hasErrorTotalSoldSpaces // ignore: cast_nullable_to_non_nullable
              as bool,
      hasErrorMeanSoldAreaValue: null == hasErrorMeanSoldAreaValue
          ? _value.hasErrorMeanSoldAreaValue
          : hasErrorMeanSoldAreaValue // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InitialStateImpl implements _InitialState {
  const _$InitialStateImpl(
      {this.isLoading = false,
      this.errorMessage = '',
      final List<BaseRentResponse> totalContracts = const [],
      final List<BaseRentResponse> totalSoldUnits = const [],
      final List<BaseRentResponse> totalTransactionsValue = const [],
      final List<BaseRentResponse> meanSellUnitValue = const [],
      final List<BaseRentResponse> totalSoldSpaces = const [],
      final List<BaseRentResponse> meanSoldAreaValue = const [],
      this.hasErrorTotalContracts = false,
      this.hasErrorTotalSoldUnits = false,
      this.hasErrorTotalTransactionsValue = false,
      this.hasErrorMeanSellUnitValue = false,
      this.hasErrorTotalSoldSpaces = false,
      this.hasErrorMeanSoldAreaValue = false})
      : _totalContracts = totalContracts,
        _totalSoldUnits = totalSoldUnits,
        _totalTransactionsValue = totalTransactionsValue,
        _meanSellUnitValue = meanSellUnitValue,
        _totalSoldSpaces = totalSoldSpaces,
        _meanSoldAreaValue = meanSoldAreaValue;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String errorMessage;
  final List<BaseRentResponse> _totalContracts;
  @override
  @JsonKey()
  List<BaseRentResponse> get totalContracts {
    if (_totalContracts is EqualUnmodifiableListView) return _totalContracts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_totalContracts);
  }

  final List<BaseRentResponse> _totalSoldUnits;
  @override
  @JsonKey()
  List<BaseRentResponse> get totalSoldUnits {
    if (_totalSoldUnits is EqualUnmodifiableListView) return _totalSoldUnits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_totalSoldUnits);
  }

  final List<BaseRentResponse> _totalTransactionsValue;
  @override
  @JsonKey()
  List<BaseRentResponse> get totalTransactionsValue {
    if (_totalTransactionsValue is EqualUnmodifiableListView)
      return _totalTransactionsValue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_totalTransactionsValue);
  }

  final List<BaseRentResponse> _meanSellUnitValue;
  @override
  @JsonKey()
  List<BaseRentResponse> get meanSellUnitValue {
    if (_meanSellUnitValue is EqualUnmodifiableListView)
      return _meanSellUnitValue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meanSellUnitValue);
  }

  final List<BaseRentResponse> _totalSoldSpaces;
  @override
  @JsonKey()
  List<BaseRentResponse> get totalSoldSpaces {
    if (_totalSoldSpaces is EqualUnmodifiableListView) return _totalSoldSpaces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_totalSoldSpaces);
  }

  final List<BaseRentResponse> _meanSoldAreaValue;
  @override
  @JsonKey()
  List<BaseRentResponse> get meanSoldAreaValue {
    if (_meanSoldAreaValue is EqualUnmodifiableListView)
      return _meanSoldAreaValue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meanSoldAreaValue);
  }

//----------------------------errors----------------------------------------
  @override
  @JsonKey()
  final bool hasErrorTotalContracts;
  @override
  @JsonKey()
  final bool hasErrorTotalSoldUnits;
  @override
  @JsonKey()
  final bool hasErrorTotalTransactionsValue;
  @override
  @JsonKey()
  final bool hasErrorMeanSellUnitValue;
  @override
  @JsonKey()
  final bool hasErrorTotalSoldSpaces;
  @override
  @JsonKey()
  final bool hasErrorMeanSoldAreaValue;

  @override
  String toString() {
    return 'SellGridKPIsState.initialState(isLoading: $isLoading, errorMessage: $errorMessage, totalContracts: $totalContracts, totalSoldUnits: $totalSoldUnits, totalTransactionsValue: $totalTransactionsValue, meanSellUnitValue: $meanSellUnitValue, totalSoldSpaces: $totalSoldSpaces, meanSoldAreaValue: $meanSoldAreaValue, hasErrorTotalContracts: $hasErrorTotalContracts, hasErrorTotalSoldUnits: $hasErrorTotalSoldUnits, hasErrorTotalTransactionsValue: $hasErrorTotalTransactionsValue, hasErrorMeanSellUnitValue: $hasErrorMeanSellUnitValue, hasErrorTotalSoldSpaces: $hasErrorTotalSoldSpaces, hasErrorMeanSoldAreaValue: $hasErrorMeanSoldAreaValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._totalContracts, _totalContracts) &&
            const DeepCollectionEquality()
                .equals(other._totalSoldUnits, _totalSoldUnits) &&
            const DeepCollectionEquality().equals(
                other._totalTransactionsValue, _totalTransactionsValue) &&
            const DeepCollectionEquality()
                .equals(other._meanSellUnitValue, _meanSellUnitValue) &&
            const DeepCollectionEquality()
                .equals(other._totalSoldSpaces, _totalSoldSpaces) &&
            const DeepCollectionEquality()
                .equals(other._meanSoldAreaValue, _meanSoldAreaValue) &&
            (identical(other.hasErrorTotalContracts, hasErrorTotalContracts) ||
                other.hasErrorTotalContracts == hasErrorTotalContracts) &&
            (identical(other.hasErrorTotalSoldUnits, hasErrorTotalSoldUnits) ||
                other.hasErrorTotalSoldUnits == hasErrorTotalSoldUnits) &&
            (identical(other.hasErrorTotalTransactionsValue,
                    hasErrorTotalTransactionsValue) ||
                other.hasErrorTotalTransactionsValue ==
                    hasErrorTotalTransactionsValue) &&
            (identical(other.hasErrorMeanSellUnitValue,
                    hasErrorMeanSellUnitValue) ||
                other.hasErrorMeanSellUnitValue == hasErrorMeanSellUnitValue) &&
            (identical(
                    other.hasErrorTotalSoldSpaces, hasErrorTotalSoldSpaces) ||
                other.hasErrorTotalSoldSpaces == hasErrorTotalSoldSpaces) &&
            (identical(other.hasErrorMeanSoldAreaValue,
                    hasErrorMeanSoldAreaValue) ||
                other.hasErrorMeanSoldAreaValue == hasErrorMeanSoldAreaValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      errorMessage,
      const DeepCollectionEquality().hash(_totalContracts),
      const DeepCollectionEquality().hash(_totalSoldUnits),
      const DeepCollectionEquality().hash(_totalTransactionsValue),
      const DeepCollectionEquality().hash(_meanSellUnitValue),
      const DeepCollectionEquality().hash(_totalSoldSpaces),
      const DeepCollectionEquality().hash(_meanSoldAreaValue),
      hasErrorTotalContracts,
      hasErrorTotalSoldUnits,
      hasErrorTotalTransactionsValue,
      hasErrorMeanSellUnitValue,
      hasErrorTotalSoldSpaces,
      hasErrorMeanSoldAreaValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialStateImplCopyWith<_$InitialStateImpl> get copyWith =>
      __$$InitialStateImplCopyWithImpl<_$InitialStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoading,
            String errorMessage,
            List<BaseRentResponse> totalContracts,
            List<BaseRentResponse> totalSoldUnits,
            List<BaseRentResponse> totalTransactionsValue,
            List<BaseRentResponse> meanSellUnitValue,
            List<BaseRentResponse> totalSoldSpaces,
            List<BaseRentResponse> meanSoldAreaValue,
            bool hasErrorTotalContracts,
            bool hasErrorTotalSoldUnits,
            bool hasErrorTotalTransactionsValue,
            bool hasErrorMeanSellUnitValue,
            bool hasErrorTotalSoldSpaces,
            bool hasErrorMeanSoldAreaValue)
        initialState,
  }) {
    return initialState(
        isLoading,
        errorMessage,
        totalContracts,
        totalSoldUnits,
        totalTransactionsValue,
        meanSellUnitValue,
        totalSoldSpaces,
        meanSoldAreaValue,
        hasErrorTotalContracts,
        hasErrorTotalSoldUnits,
        hasErrorTotalTransactionsValue,
        hasErrorMeanSellUnitValue,
        hasErrorTotalSoldSpaces,
        hasErrorMeanSoldAreaValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool isLoading,
            String errorMessage,
            List<BaseRentResponse> totalContracts,
            List<BaseRentResponse> totalSoldUnits,
            List<BaseRentResponse> totalTransactionsValue,
            List<BaseRentResponse> meanSellUnitValue,
            List<BaseRentResponse> totalSoldSpaces,
            List<BaseRentResponse> meanSoldAreaValue,
            bool hasErrorTotalContracts,
            bool hasErrorTotalSoldUnits,
            bool hasErrorTotalTransactionsValue,
            bool hasErrorMeanSellUnitValue,
            bool hasErrorTotalSoldSpaces,
            bool hasErrorMeanSoldAreaValue)?
        initialState,
  }) {
    return initialState?.call(
        isLoading,
        errorMessage,
        totalContracts,
        totalSoldUnits,
        totalTransactionsValue,
        meanSellUnitValue,
        totalSoldSpaces,
        meanSoldAreaValue,
        hasErrorTotalContracts,
        hasErrorTotalSoldUnits,
        hasErrorTotalTransactionsValue,
        hasErrorMeanSellUnitValue,
        hasErrorTotalSoldSpaces,
        hasErrorMeanSoldAreaValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isLoading,
            String errorMessage,
            List<BaseRentResponse> totalContracts,
            List<BaseRentResponse> totalSoldUnits,
            List<BaseRentResponse> totalTransactionsValue,
            List<BaseRentResponse> meanSellUnitValue,
            List<BaseRentResponse> totalSoldSpaces,
            List<BaseRentResponse> meanSoldAreaValue,
            bool hasErrorTotalContracts,
            bool hasErrorTotalSoldUnits,
            bool hasErrorTotalTransactionsValue,
            bool hasErrorMeanSellUnitValue,
            bool hasErrorTotalSoldSpaces,
            bool hasErrorMeanSoldAreaValue)?
        initialState,
    required TResult orElse(),
  }) {
    if (initialState != null) {
      return initialState(
          isLoading,
          errorMessage,
          totalContracts,
          totalSoldUnits,
          totalTransactionsValue,
          meanSellUnitValue,
          totalSoldSpaces,
          meanSoldAreaValue,
          hasErrorTotalContracts,
          hasErrorTotalSoldUnits,
          hasErrorTotalTransactionsValue,
          hasErrorMeanSellUnitValue,
          hasErrorTotalSoldSpaces,
          hasErrorMeanSoldAreaValue);
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

abstract class _InitialState implements SellGridKPIsState {
  const factory _InitialState(
      {final bool isLoading,
      final String errorMessage,
      final List<BaseRentResponse> totalContracts,
      final List<BaseRentResponse> totalSoldUnits,
      final List<BaseRentResponse> totalTransactionsValue,
      final List<BaseRentResponse> meanSellUnitValue,
      final List<BaseRentResponse> totalSoldSpaces,
      final List<BaseRentResponse> meanSoldAreaValue,
      final bool hasErrorTotalContracts,
      final bool hasErrorTotalSoldUnits,
      final bool hasErrorTotalTransactionsValue,
      final bool hasErrorMeanSellUnitValue,
      final bool hasErrorTotalSoldSpaces,
      final bool hasErrorMeanSoldAreaValue}) = _$InitialStateImpl;

  @override
  bool get isLoading;
  @override
  String get errorMessage;
  @override
  List<BaseRentResponse> get totalContracts;
  @override
  List<BaseRentResponse> get totalSoldUnits;
  @override
  List<BaseRentResponse> get totalTransactionsValue;
  @override
  List<BaseRentResponse> get meanSellUnitValue;
  @override
  List<BaseRentResponse> get totalSoldSpaces;
  @override
  List<BaseRentResponse> get meanSoldAreaValue;
  @override //----------------------------errors----------------------------------------
  bool get hasErrorTotalContracts;
  @override
  bool get hasErrorTotalSoldUnits;
  @override
  bool get hasErrorTotalTransactionsValue;
  @override
  bool get hasErrorMeanSellUnitValue;
  @override
  bool get hasErrorTotalSoldSpaces;
  @override
  bool get hasErrorMeanSoldAreaValue;
  @override
  @JsonKey(ignore: true)
  _$$InitialStateImplCopyWith<_$InitialStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
