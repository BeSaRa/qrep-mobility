// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'certificate_contract_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CertificateContractEvent {
  RentRequest get request => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RentRequest request) certificateCountEvent,
    required TResult Function(RentRequest request) contractCountEvent,
    required TResult Function(RentRequest request) meanRentAmountEvent,
    required TResult Function(RentRequest request) rentAmountEvent,
    required TResult Function(RentRequest request) rentValuePerMeterEvent,
    required TResult Function(RentRequest request) rentedAreasEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RentRequest request)? certificateCountEvent,
    TResult? Function(RentRequest request)? contractCountEvent,
    TResult? Function(RentRequest request)? meanRentAmountEvent,
    TResult? Function(RentRequest request)? rentAmountEvent,
    TResult? Function(RentRequest request)? rentValuePerMeterEvent,
    TResult? Function(RentRequest request)? rentedAreasEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RentRequest request)? certificateCountEvent,
    TResult Function(RentRequest request)? contractCountEvent,
    TResult Function(RentRequest request)? meanRentAmountEvent,
    TResult Function(RentRequest request)? rentAmountEvent,
    TResult Function(RentRequest request)? rentValuePerMeterEvent,
    TResult Function(RentRequest request)? rentedAreasEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CertificateCountEvent value)
        certificateCountEvent,
    required TResult Function(_ContractCountEvent value) contractCountEvent,
    required TResult Function(_MeanRentAmountEvent value) meanRentAmountEvent,
    required TResult Function(_RentAmountEvent value) rentAmountEvent,
    required TResult Function(_RentValuePerMeterEvent value)
        rentValuePerMeterEvent,
    required TResult Function(_RentedAreasEvent value) rentedAreasEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CertificateCountEvent value)? certificateCountEvent,
    TResult? Function(_ContractCountEvent value)? contractCountEvent,
    TResult? Function(_MeanRentAmountEvent value)? meanRentAmountEvent,
    TResult? Function(_RentAmountEvent value)? rentAmountEvent,
    TResult? Function(_RentValuePerMeterEvent value)? rentValuePerMeterEvent,
    TResult? Function(_RentedAreasEvent value)? rentedAreasEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CertificateCountEvent value)? certificateCountEvent,
    TResult Function(_ContractCountEvent value)? contractCountEvent,
    TResult Function(_MeanRentAmountEvent value)? meanRentAmountEvent,
    TResult Function(_RentAmountEvent value)? rentAmountEvent,
    TResult Function(_RentValuePerMeterEvent value)? rentValuePerMeterEvent,
    TResult Function(_RentedAreasEvent value)? rentedAreasEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of CertificateContractEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CertificateContractEventCopyWith<CertificateContractEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CertificateContractEventCopyWith<$Res> {
  factory $CertificateContractEventCopyWith(CertificateContractEvent value,
          $Res Function(CertificateContractEvent) then) =
      _$CertificateContractEventCopyWithImpl<$Res, CertificateContractEvent>;
  @useResult
  $Res call({RentRequest request});

  $RentRequestCopyWith<$Res> get request;
}

/// @nodoc
class _$CertificateContractEventCopyWithImpl<$Res,
        $Val extends CertificateContractEvent>
    implements $CertificateContractEventCopyWith<$Res> {
  _$CertificateContractEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CertificateContractEvent
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

  /// Create a copy of CertificateContractEvent
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
abstract class _$$CertificateCountEventImplCopyWith<$Res>
    implements $CertificateContractEventCopyWith<$Res> {
  factory _$$CertificateCountEventImplCopyWith(
          _$CertificateCountEventImpl value,
          $Res Function(_$CertificateCountEventImpl) then) =
      __$$CertificateCountEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RentRequest request});

  @override
  $RentRequestCopyWith<$Res> get request;
}

/// @nodoc
class __$$CertificateCountEventImplCopyWithImpl<$Res>
    extends _$CertificateContractEventCopyWithImpl<$Res,
        _$CertificateCountEventImpl>
    implements _$$CertificateCountEventImplCopyWith<$Res> {
  __$$CertificateCountEventImplCopyWithImpl(_$CertificateCountEventImpl _value,
      $Res Function(_$CertificateCountEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CertificateContractEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$CertificateCountEventImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as RentRequest,
    ));
  }
}

/// @nodoc

class _$CertificateCountEventImpl implements _CertificateCountEvent {
  const _$CertificateCountEventImpl({required this.request});

  @override
  final RentRequest request;

  @override
  String toString() {
    return 'CertificateContractEvent.certificateCountEvent(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CertificateCountEventImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of CertificateContractEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CertificateCountEventImplCopyWith<_$CertificateCountEventImpl>
      get copyWith => __$$CertificateCountEventImplCopyWithImpl<
          _$CertificateCountEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RentRequest request) certificateCountEvent,
    required TResult Function(RentRequest request) contractCountEvent,
    required TResult Function(RentRequest request) meanRentAmountEvent,
    required TResult Function(RentRequest request) rentAmountEvent,
    required TResult Function(RentRequest request) rentValuePerMeterEvent,
    required TResult Function(RentRequest request) rentedAreasEvent,
  }) {
    return certificateCountEvent(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RentRequest request)? certificateCountEvent,
    TResult? Function(RentRequest request)? contractCountEvent,
    TResult? Function(RentRequest request)? meanRentAmountEvent,
    TResult? Function(RentRequest request)? rentAmountEvent,
    TResult? Function(RentRequest request)? rentValuePerMeterEvent,
    TResult? Function(RentRequest request)? rentedAreasEvent,
  }) {
    return certificateCountEvent?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RentRequest request)? certificateCountEvent,
    TResult Function(RentRequest request)? contractCountEvent,
    TResult Function(RentRequest request)? meanRentAmountEvent,
    TResult Function(RentRequest request)? rentAmountEvent,
    TResult Function(RentRequest request)? rentValuePerMeterEvent,
    TResult Function(RentRequest request)? rentedAreasEvent,
    required TResult orElse(),
  }) {
    if (certificateCountEvent != null) {
      return certificateCountEvent(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CertificateCountEvent value)
        certificateCountEvent,
    required TResult Function(_ContractCountEvent value) contractCountEvent,
    required TResult Function(_MeanRentAmountEvent value) meanRentAmountEvent,
    required TResult Function(_RentAmountEvent value) rentAmountEvent,
    required TResult Function(_RentValuePerMeterEvent value)
        rentValuePerMeterEvent,
    required TResult Function(_RentedAreasEvent value) rentedAreasEvent,
  }) {
    return certificateCountEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CertificateCountEvent value)? certificateCountEvent,
    TResult? Function(_ContractCountEvent value)? contractCountEvent,
    TResult? Function(_MeanRentAmountEvent value)? meanRentAmountEvent,
    TResult? Function(_RentAmountEvent value)? rentAmountEvent,
    TResult? Function(_RentValuePerMeterEvent value)? rentValuePerMeterEvent,
    TResult? Function(_RentedAreasEvent value)? rentedAreasEvent,
  }) {
    return certificateCountEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CertificateCountEvent value)? certificateCountEvent,
    TResult Function(_ContractCountEvent value)? contractCountEvent,
    TResult Function(_MeanRentAmountEvent value)? meanRentAmountEvent,
    TResult Function(_RentAmountEvent value)? rentAmountEvent,
    TResult Function(_RentValuePerMeterEvent value)? rentValuePerMeterEvent,
    TResult Function(_RentedAreasEvent value)? rentedAreasEvent,
    required TResult orElse(),
  }) {
    if (certificateCountEvent != null) {
      return certificateCountEvent(this);
    }
    return orElse();
  }
}

abstract class _CertificateCountEvent implements CertificateContractEvent {
  const factory _CertificateCountEvent({required final RentRequest request}) =
      _$CertificateCountEventImpl;

  @override
  RentRequest get request;

  /// Create a copy of CertificateContractEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CertificateCountEventImplCopyWith<_$CertificateCountEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ContractCountEventImplCopyWith<$Res>
    implements $CertificateContractEventCopyWith<$Res> {
  factory _$$ContractCountEventImplCopyWith(_$ContractCountEventImpl value,
          $Res Function(_$ContractCountEventImpl) then) =
      __$$ContractCountEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RentRequest request});

  @override
  $RentRequestCopyWith<$Res> get request;
}

/// @nodoc
class __$$ContractCountEventImplCopyWithImpl<$Res>
    extends _$CertificateContractEventCopyWithImpl<$Res,
        _$ContractCountEventImpl>
    implements _$$ContractCountEventImplCopyWith<$Res> {
  __$$ContractCountEventImplCopyWithImpl(_$ContractCountEventImpl _value,
      $Res Function(_$ContractCountEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CertificateContractEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$ContractCountEventImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as RentRequest,
    ));
  }
}

/// @nodoc

class _$ContractCountEventImpl implements _ContractCountEvent {
  const _$ContractCountEventImpl({required this.request});

  @override
  final RentRequest request;

  @override
  String toString() {
    return 'CertificateContractEvent.contractCountEvent(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContractCountEventImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of CertificateContractEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContractCountEventImplCopyWith<_$ContractCountEventImpl> get copyWith =>
      __$$ContractCountEventImplCopyWithImpl<_$ContractCountEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RentRequest request) certificateCountEvent,
    required TResult Function(RentRequest request) contractCountEvent,
    required TResult Function(RentRequest request) meanRentAmountEvent,
    required TResult Function(RentRequest request) rentAmountEvent,
    required TResult Function(RentRequest request) rentValuePerMeterEvent,
    required TResult Function(RentRequest request) rentedAreasEvent,
  }) {
    return contractCountEvent(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RentRequest request)? certificateCountEvent,
    TResult? Function(RentRequest request)? contractCountEvent,
    TResult? Function(RentRequest request)? meanRentAmountEvent,
    TResult? Function(RentRequest request)? rentAmountEvent,
    TResult? Function(RentRequest request)? rentValuePerMeterEvent,
    TResult? Function(RentRequest request)? rentedAreasEvent,
  }) {
    return contractCountEvent?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RentRequest request)? certificateCountEvent,
    TResult Function(RentRequest request)? contractCountEvent,
    TResult Function(RentRequest request)? meanRentAmountEvent,
    TResult Function(RentRequest request)? rentAmountEvent,
    TResult Function(RentRequest request)? rentValuePerMeterEvent,
    TResult Function(RentRequest request)? rentedAreasEvent,
    required TResult orElse(),
  }) {
    if (contractCountEvent != null) {
      return contractCountEvent(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CertificateCountEvent value)
        certificateCountEvent,
    required TResult Function(_ContractCountEvent value) contractCountEvent,
    required TResult Function(_MeanRentAmountEvent value) meanRentAmountEvent,
    required TResult Function(_RentAmountEvent value) rentAmountEvent,
    required TResult Function(_RentValuePerMeterEvent value)
        rentValuePerMeterEvent,
    required TResult Function(_RentedAreasEvent value) rentedAreasEvent,
  }) {
    return contractCountEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CertificateCountEvent value)? certificateCountEvent,
    TResult? Function(_ContractCountEvent value)? contractCountEvent,
    TResult? Function(_MeanRentAmountEvent value)? meanRentAmountEvent,
    TResult? Function(_RentAmountEvent value)? rentAmountEvent,
    TResult? Function(_RentValuePerMeterEvent value)? rentValuePerMeterEvent,
    TResult? Function(_RentedAreasEvent value)? rentedAreasEvent,
  }) {
    return contractCountEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CertificateCountEvent value)? certificateCountEvent,
    TResult Function(_ContractCountEvent value)? contractCountEvent,
    TResult Function(_MeanRentAmountEvent value)? meanRentAmountEvent,
    TResult Function(_RentAmountEvent value)? rentAmountEvent,
    TResult Function(_RentValuePerMeterEvent value)? rentValuePerMeterEvent,
    TResult Function(_RentedAreasEvent value)? rentedAreasEvent,
    required TResult orElse(),
  }) {
    if (contractCountEvent != null) {
      return contractCountEvent(this);
    }
    return orElse();
  }
}

abstract class _ContractCountEvent implements CertificateContractEvent {
  const factory _ContractCountEvent({required final RentRequest request}) =
      _$ContractCountEventImpl;

  @override
  RentRequest get request;

  /// Create a copy of CertificateContractEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContractCountEventImplCopyWith<_$ContractCountEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MeanRentAmountEventImplCopyWith<$Res>
    implements $CertificateContractEventCopyWith<$Res> {
  factory _$$MeanRentAmountEventImplCopyWith(_$MeanRentAmountEventImpl value,
          $Res Function(_$MeanRentAmountEventImpl) then) =
      __$$MeanRentAmountEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RentRequest request});

  @override
  $RentRequestCopyWith<$Res> get request;
}

/// @nodoc
class __$$MeanRentAmountEventImplCopyWithImpl<$Res>
    extends _$CertificateContractEventCopyWithImpl<$Res,
        _$MeanRentAmountEventImpl>
    implements _$$MeanRentAmountEventImplCopyWith<$Res> {
  __$$MeanRentAmountEventImplCopyWithImpl(_$MeanRentAmountEventImpl _value,
      $Res Function(_$MeanRentAmountEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CertificateContractEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$MeanRentAmountEventImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as RentRequest,
    ));
  }
}

/// @nodoc

class _$MeanRentAmountEventImpl implements _MeanRentAmountEvent {
  const _$MeanRentAmountEventImpl({required this.request});

  @override
  final RentRequest request;

  @override
  String toString() {
    return 'CertificateContractEvent.meanRentAmountEvent(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeanRentAmountEventImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of CertificateContractEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MeanRentAmountEventImplCopyWith<_$MeanRentAmountEventImpl> get copyWith =>
      __$$MeanRentAmountEventImplCopyWithImpl<_$MeanRentAmountEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RentRequest request) certificateCountEvent,
    required TResult Function(RentRequest request) contractCountEvent,
    required TResult Function(RentRequest request) meanRentAmountEvent,
    required TResult Function(RentRequest request) rentAmountEvent,
    required TResult Function(RentRequest request) rentValuePerMeterEvent,
    required TResult Function(RentRequest request) rentedAreasEvent,
  }) {
    return meanRentAmountEvent(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RentRequest request)? certificateCountEvent,
    TResult? Function(RentRequest request)? contractCountEvent,
    TResult? Function(RentRequest request)? meanRentAmountEvent,
    TResult? Function(RentRequest request)? rentAmountEvent,
    TResult? Function(RentRequest request)? rentValuePerMeterEvent,
    TResult? Function(RentRequest request)? rentedAreasEvent,
  }) {
    return meanRentAmountEvent?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RentRequest request)? certificateCountEvent,
    TResult Function(RentRequest request)? contractCountEvent,
    TResult Function(RentRequest request)? meanRentAmountEvent,
    TResult Function(RentRequest request)? rentAmountEvent,
    TResult Function(RentRequest request)? rentValuePerMeterEvent,
    TResult Function(RentRequest request)? rentedAreasEvent,
    required TResult orElse(),
  }) {
    if (meanRentAmountEvent != null) {
      return meanRentAmountEvent(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CertificateCountEvent value)
        certificateCountEvent,
    required TResult Function(_ContractCountEvent value) contractCountEvent,
    required TResult Function(_MeanRentAmountEvent value) meanRentAmountEvent,
    required TResult Function(_RentAmountEvent value) rentAmountEvent,
    required TResult Function(_RentValuePerMeterEvent value)
        rentValuePerMeterEvent,
    required TResult Function(_RentedAreasEvent value) rentedAreasEvent,
  }) {
    return meanRentAmountEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CertificateCountEvent value)? certificateCountEvent,
    TResult? Function(_ContractCountEvent value)? contractCountEvent,
    TResult? Function(_MeanRentAmountEvent value)? meanRentAmountEvent,
    TResult? Function(_RentAmountEvent value)? rentAmountEvent,
    TResult? Function(_RentValuePerMeterEvent value)? rentValuePerMeterEvent,
    TResult? Function(_RentedAreasEvent value)? rentedAreasEvent,
  }) {
    return meanRentAmountEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CertificateCountEvent value)? certificateCountEvent,
    TResult Function(_ContractCountEvent value)? contractCountEvent,
    TResult Function(_MeanRentAmountEvent value)? meanRentAmountEvent,
    TResult Function(_RentAmountEvent value)? rentAmountEvent,
    TResult Function(_RentValuePerMeterEvent value)? rentValuePerMeterEvent,
    TResult Function(_RentedAreasEvent value)? rentedAreasEvent,
    required TResult orElse(),
  }) {
    if (meanRentAmountEvent != null) {
      return meanRentAmountEvent(this);
    }
    return orElse();
  }
}

abstract class _MeanRentAmountEvent implements CertificateContractEvent {
  const factory _MeanRentAmountEvent({required final RentRequest request}) =
      _$MeanRentAmountEventImpl;

  @override
  RentRequest get request;

  /// Create a copy of CertificateContractEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MeanRentAmountEventImplCopyWith<_$MeanRentAmountEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RentAmountEventImplCopyWith<$Res>
    implements $CertificateContractEventCopyWith<$Res> {
  factory _$$RentAmountEventImplCopyWith(_$RentAmountEventImpl value,
          $Res Function(_$RentAmountEventImpl) then) =
      __$$RentAmountEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RentRequest request});

  @override
  $RentRequestCopyWith<$Res> get request;
}

/// @nodoc
class __$$RentAmountEventImplCopyWithImpl<$Res>
    extends _$CertificateContractEventCopyWithImpl<$Res, _$RentAmountEventImpl>
    implements _$$RentAmountEventImplCopyWith<$Res> {
  __$$RentAmountEventImplCopyWithImpl(
      _$RentAmountEventImpl _value, $Res Function(_$RentAmountEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CertificateContractEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$RentAmountEventImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as RentRequest,
    ));
  }
}

/// @nodoc

class _$RentAmountEventImpl implements _RentAmountEvent {
  const _$RentAmountEventImpl({required this.request});

  @override
  final RentRequest request;

  @override
  String toString() {
    return 'CertificateContractEvent.rentAmountEvent(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RentAmountEventImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of CertificateContractEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RentAmountEventImplCopyWith<_$RentAmountEventImpl> get copyWith =>
      __$$RentAmountEventImplCopyWithImpl<_$RentAmountEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RentRequest request) certificateCountEvent,
    required TResult Function(RentRequest request) contractCountEvent,
    required TResult Function(RentRequest request) meanRentAmountEvent,
    required TResult Function(RentRequest request) rentAmountEvent,
    required TResult Function(RentRequest request) rentValuePerMeterEvent,
    required TResult Function(RentRequest request) rentedAreasEvent,
  }) {
    return rentAmountEvent(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RentRequest request)? certificateCountEvent,
    TResult? Function(RentRequest request)? contractCountEvent,
    TResult? Function(RentRequest request)? meanRentAmountEvent,
    TResult? Function(RentRequest request)? rentAmountEvent,
    TResult? Function(RentRequest request)? rentValuePerMeterEvent,
    TResult? Function(RentRequest request)? rentedAreasEvent,
  }) {
    return rentAmountEvent?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RentRequest request)? certificateCountEvent,
    TResult Function(RentRequest request)? contractCountEvent,
    TResult Function(RentRequest request)? meanRentAmountEvent,
    TResult Function(RentRequest request)? rentAmountEvent,
    TResult Function(RentRequest request)? rentValuePerMeterEvent,
    TResult Function(RentRequest request)? rentedAreasEvent,
    required TResult orElse(),
  }) {
    if (rentAmountEvent != null) {
      return rentAmountEvent(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CertificateCountEvent value)
        certificateCountEvent,
    required TResult Function(_ContractCountEvent value) contractCountEvent,
    required TResult Function(_MeanRentAmountEvent value) meanRentAmountEvent,
    required TResult Function(_RentAmountEvent value) rentAmountEvent,
    required TResult Function(_RentValuePerMeterEvent value)
        rentValuePerMeterEvent,
    required TResult Function(_RentedAreasEvent value) rentedAreasEvent,
  }) {
    return rentAmountEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CertificateCountEvent value)? certificateCountEvent,
    TResult? Function(_ContractCountEvent value)? contractCountEvent,
    TResult? Function(_MeanRentAmountEvent value)? meanRentAmountEvent,
    TResult? Function(_RentAmountEvent value)? rentAmountEvent,
    TResult? Function(_RentValuePerMeterEvent value)? rentValuePerMeterEvent,
    TResult? Function(_RentedAreasEvent value)? rentedAreasEvent,
  }) {
    return rentAmountEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CertificateCountEvent value)? certificateCountEvent,
    TResult Function(_ContractCountEvent value)? contractCountEvent,
    TResult Function(_MeanRentAmountEvent value)? meanRentAmountEvent,
    TResult Function(_RentAmountEvent value)? rentAmountEvent,
    TResult Function(_RentValuePerMeterEvent value)? rentValuePerMeterEvent,
    TResult Function(_RentedAreasEvent value)? rentedAreasEvent,
    required TResult orElse(),
  }) {
    if (rentAmountEvent != null) {
      return rentAmountEvent(this);
    }
    return orElse();
  }
}

abstract class _RentAmountEvent implements CertificateContractEvent {
  const factory _RentAmountEvent({required final RentRequest request}) =
      _$RentAmountEventImpl;

  @override
  RentRequest get request;

  /// Create a copy of CertificateContractEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RentAmountEventImplCopyWith<_$RentAmountEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RentValuePerMeterEventImplCopyWith<$Res>
    implements $CertificateContractEventCopyWith<$Res> {
  factory _$$RentValuePerMeterEventImplCopyWith(
          _$RentValuePerMeterEventImpl value,
          $Res Function(_$RentValuePerMeterEventImpl) then) =
      __$$RentValuePerMeterEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RentRequest request});

  @override
  $RentRequestCopyWith<$Res> get request;
}

/// @nodoc
class __$$RentValuePerMeterEventImplCopyWithImpl<$Res>
    extends _$CertificateContractEventCopyWithImpl<$Res,
        _$RentValuePerMeterEventImpl>
    implements _$$RentValuePerMeterEventImplCopyWith<$Res> {
  __$$RentValuePerMeterEventImplCopyWithImpl(
      _$RentValuePerMeterEventImpl _value,
      $Res Function(_$RentValuePerMeterEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CertificateContractEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$RentValuePerMeterEventImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as RentRequest,
    ));
  }
}

/// @nodoc

class _$RentValuePerMeterEventImpl implements _RentValuePerMeterEvent {
  const _$RentValuePerMeterEventImpl({required this.request});

  @override
  final RentRequest request;

  @override
  String toString() {
    return 'CertificateContractEvent.rentValuePerMeterEvent(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RentValuePerMeterEventImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of CertificateContractEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RentValuePerMeterEventImplCopyWith<_$RentValuePerMeterEventImpl>
      get copyWith => __$$RentValuePerMeterEventImplCopyWithImpl<
          _$RentValuePerMeterEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RentRequest request) certificateCountEvent,
    required TResult Function(RentRequest request) contractCountEvent,
    required TResult Function(RentRequest request) meanRentAmountEvent,
    required TResult Function(RentRequest request) rentAmountEvent,
    required TResult Function(RentRequest request) rentValuePerMeterEvent,
    required TResult Function(RentRequest request) rentedAreasEvent,
  }) {
    return rentValuePerMeterEvent(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RentRequest request)? certificateCountEvent,
    TResult? Function(RentRequest request)? contractCountEvent,
    TResult? Function(RentRequest request)? meanRentAmountEvent,
    TResult? Function(RentRequest request)? rentAmountEvent,
    TResult? Function(RentRequest request)? rentValuePerMeterEvent,
    TResult? Function(RentRequest request)? rentedAreasEvent,
  }) {
    return rentValuePerMeterEvent?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RentRequest request)? certificateCountEvent,
    TResult Function(RentRequest request)? contractCountEvent,
    TResult Function(RentRequest request)? meanRentAmountEvent,
    TResult Function(RentRequest request)? rentAmountEvent,
    TResult Function(RentRequest request)? rentValuePerMeterEvent,
    TResult Function(RentRequest request)? rentedAreasEvent,
    required TResult orElse(),
  }) {
    if (rentValuePerMeterEvent != null) {
      return rentValuePerMeterEvent(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CertificateCountEvent value)
        certificateCountEvent,
    required TResult Function(_ContractCountEvent value) contractCountEvent,
    required TResult Function(_MeanRentAmountEvent value) meanRentAmountEvent,
    required TResult Function(_RentAmountEvent value) rentAmountEvent,
    required TResult Function(_RentValuePerMeterEvent value)
        rentValuePerMeterEvent,
    required TResult Function(_RentedAreasEvent value) rentedAreasEvent,
  }) {
    return rentValuePerMeterEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CertificateCountEvent value)? certificateCountEvent,
    TResult? Function(_ContractCountEvent value)? contractCountEvent,
    TResult? Function(_MeanRentAmountEvent value)? meanRentAmountEvent,
    TResult? Function(_RentAmountEvent value)? rentAmountEvent,
    TResult? Function(_RentValuePerMeterEvent value)? rentValuePerMeterEvent,
    TResult? Function(_RentedAreasEvent value)? rentedAreasEvent,
  }) {
    return rentValuePerMeterEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CertificateCountEvent value)? certificateCountEvent,
    TResult Function(_ContractCountEvent value)? contractCountEvent,
    TResult Function(_MeanRentAmountEvent value)? meanRentAmountEvent,
    TResult Function(_RentAmountEvent value)? rentAmountEvent,
    TResult Function(_RentValuePerMeterEvent value)? rentValuePerMeterEvent,
    TResult Function(_RentedAreasEvent value)? rentedAreasEvent,
    required TResult orElse(),
  }) {
    if (rentValuePerMeterEvent != null) {
      return rentValuePerMeterEvent(this);
    }
    return orElse();
  }
}

abstract class _RentValuePerMeterEvent implements CertificateContractEvent {
  const factory _RentValuePerMeterEvent({required final RentRequest request}) =
      _$RentValuePerMeterEventImpl;

  @override
  RentRequest get request;

  /// Create a copy of CertificateContractEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RentValuePerMeterEventImplCopyWith<_$RentValuePerMeterEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RentedAreasEventImplCopyWith<$Res>
    implements $CertificateContractEventCopyWith<$Res> {
  factory _$$RentedAreasEventImplCopyWith(_$RentedAreasEventImpl value,
          $Res Function(_$RentedAreasEventImpl) then) =
      __$$RentedAreasEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RentRequest request});

  @override
  $RentRequestCopyWith<$Res> get request;
}

/// @nodoc
class __$$RentedAreasEventImplCopyWithImpl<$Res>
    extends _$CertificateContractEventCopyWithImpl<$Res, _$RentedAreasEventImpl>
    implements _$$RentedAreasEventImplCopyWith<$Res> {
  __$$RentedAreasEventImplCopyWithImpl(_$RentedAreasEventImpl _value,
      $Res Function(_$RentedAreasEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CertificateContractEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$RentedAreasEventImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as RentRequest,
    ));
  }
}

/// @nodoc

class _$RentedAreasEventImpl implements _RentedAreasEvent {
  const _$RentedAreasEventImpl({required this.request});

  @override
  final RentRequest request;

  @override
  String toString() {
    return 'CertificateContractEvent.rentedAreasEvent(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RentedAreasEventImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of CertificateContractEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RentedAreasEventImplCopyWith<_$RentedAreasEventImpl> get copyWith =>
      __$$RentedAreasEventImplCopyWithImpl<_$RentedAreasEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RentRequest request) certificateCountEvent,
    required TResult Function(RentRequest request) contractCountEvent,
    required TResult Function(RentRequest request) meanRentAmountEvent,
    required TResult Function(RentRequest request) rentAmountEvent,
    required TResult Function(RentRequest request) rentValuePerMeterEvent,
    required TResult Function(RentRequest request) rentedAreasEvent,
  }) {
    return rentedAreasEvent(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RentRequest request)? certificateCountEvent,
    TResult? Function(RentRequest request)? contractCountEvent,
    TResult? Function(RentRequest request)? meanRentAmountEvent,
    TResult? Function(RentRequest request)? rentAmountEvent,
    TResult? Function(RentRequest request)? rentValuePerMeterEvent,
    TResult? Function(RentRequest request)? rentedAreasEvent,
  }) {
    return rentedAreasEvent?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RentRequest request)? certificateCountEvent,
    TResult Function(RentRequest request)? contractCountEvent,
    TResult Function(RentRequest request)? meanRentAmountEvent,
    TResult Function(RentRequest request)? rentAmountEvent,
    TResult Function(RentRequest request)? rentValuePerMeterEvent,
    TResult Function(RentRequest request)? rentedAreasEvent,
    required TResult orElse(),
  }) {
    if (rentedAreasEvent != null) {
      return rentedAreasEvent(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CertificateCountEvent value)
        certificateCountEvent,
    required TResult Function(_ContractCountEvent value) contractCountEvent,
    required TResult Function(_MeanRentAmountEvent value) meanRentAmountEvent,
    required TResult Function(_RentAmountEvent value) rentAmountEvent,
    required TResult Function(_RentValuePerMeterEvent value)
        rentValuePerMeterEvent,
    required TResult Function(_RentedAreasEvent value) rentedAreasEvent,
  }) {
    return rentedAreasEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CertificateCountEvent value)? certificateCountEvent,
    TResult? Function(_ContractCountEvent value)? contractCountEvent,
    TResult? Function(_MeanRentAmountEvent value)? meanRentAmountEvent,
    TResult? Function(_RentAmountEvent value)? rentAmountEvent,
    TResult? Function(_RentValuePerMeterEvent value)? rentValuePerMeterEvent,
    TResult? Function(_RentedAreasEvent value)? rentedAreasEvent,
  }) {
    return rentedAreasEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CertificateCountEvent value)? certificateCountEvent,
    TResult Function(_ContractCountEvent value)? contractCountEvent,
    TResult Function(_MeanRentAmountEvent value)? meanRentAmountEvent,
    TResult Function(_RentAmountEvent value)? rentAmountEvent,
    TResult Function(_RentValuePerMeterEvent value)? rentValuePerMeterEvent,
    TResult Function(_RentedAreasEvent value)? rentedAreasEvent,
    required TResult orElse(),
  }) {
    if (rentedAreasEvent != null) {
      return rentedAreasEvent(this);
    }
    return orElse();
  }
}

abstract class _RentedAreasEvent implements CertificateContractEvent {
  const factory _RentedAreasEvent({required final RentRequest request}) =
      _$RentedAreasEventImpl;

  @override
  RentRequest get request;

  /// Create a copy of CertificateContractEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RentedAreasEventImplCopyWith<_$RentedAreasEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CertificateContractState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isHasErrorContract => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  List<BaseRentResponse> get listResponse => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading, bool isHasErrorContract,
            String errorMessage, List<BaseRentResponse> listResponse)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, bool isHasErrorContract,
            String errorMessage, List<BaseRentResponse> listResponse)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, bool isHasErrorContract,
            String errorMessage, List<BaseRentResponse> listResponse)?
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

  /// Create a copy of CertificateContractState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CertificateContractStateCopyWith<CertificateContractState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CertificateContractStateCopyWith<$Res> {
  factory $CertificateContractStateCopyWith(CertificateContractState value,
          $Res Function(CertificateContractState) then) =
      _$CertificateContractStateCopyWithImpl<$Res, CertificateContractState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isHasErrorContract,
      String errorMessage,
      List<BaseRentResponse> listResponse});
}

/// @nodoc
class _$CertificateContractStateCopyWithImpl<$Res,
        $Val extends CertificateContractState>
    implements $CertificateContractStateCopyWith<$Res> {
  _$CertificateContractStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CertificateContractState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isHasErrorContract = null,
    Object? errorMessage = null,
    Object? listResponse = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isHasErrorContract: null == isHasErrorContract
          ? _value.isHasErrorContract
          : isHasErrorContract // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      listResponse: null == listResponse
          ? _value.listResponse
          : listResponse // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $CertificateContractStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isHasErrorContract,
      String errorMessage,
      List<BaseRentResponse> listResponse});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CertificateContractStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of CertificateContractState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isHasErrorContract = null,
    Object? errorMessage = null,
    Object? listResponse = null,
  }) {
    return _then(_$InitialImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isHasErrorContract: null == isHasErrorContract
          ? _value.isHasErrorContract
          : isHasErrorContract // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      listResponse: null == listResponse
          ? _value._listResponse
          : listResponse // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.isLoading = false,
      this.isHasErrorContract = false,
      this.errorMessage = '',
      final List<BaseRentResponse> listResponse = const []})
      : _listResponse = listResponse;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isHasErrorContract;
  @override
  @JsonKey()
  final String errorMessage;
  final List<BaseRentResponse> _listResponse;
  @override
  @JsonKey()
  List<BaseRentResponse> get listResponse {
    if (_listResponse is EqualUnmodifiableListView) return _listResponse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listResponse);
  }

  @override
  String toString() {
    return 'CertificateContractState.initial(isLoading: $isLoading, isHasErrorContract: $isHasErrorContract, errorMessage: $errorMessage, listResponse: $listResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isHasErrorContract, isHasErrorContract) ||
                other.isHasErrorContract == isHasErrorContract) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._listResponse, _listResponse));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isHasErrorContract,
      errorMessage, const DeepCollectionEquality().hash(_listResponse));

  /// Create a copy of CertificateContractState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading, bool isHasErrorContract,
            String errorMessage, List<BaseRentResponse> listResponse)
        initial,
  }) {
    return initial(isLoading, isHasErrorContract, errorMessage, listResponse);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, bool isHasErrorContract,
            String errorMessage, List<BaseRentResponse> listResponse)?
        initial,
  }) {
    return initial?.call(
        isLoading, isHasErrorContract, errorMessage, listResponse);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, bool isHasErrorContract,
            String errorMessage, List<BaseRentResponse> listResponse)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isLoading, isHasErrorContract, errorMessage, listResponse);
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

abstract class _Initial implements CertificateContractState {
  const factory _Initial(
      {final bool isLoading,
      final bool isHasErrorContract,
      final String errorMessage,
      final List<BaseRentResponse> listResponse}) = _$InitialImpl;

  @override
  bool get isLoading;
  @override
  bool get isHasErrorContract;
  @override
  String get errorMessage;
  @override
  List<BaseRentResponse> get listResponse;

  /// Create a copy of CertificateContractState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
