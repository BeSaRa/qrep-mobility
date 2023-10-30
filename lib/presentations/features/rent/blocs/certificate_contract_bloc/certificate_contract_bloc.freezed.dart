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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CertificateContractEvent {
  RequestMeanValue get request => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RequestMeanValue request) certificateCountEvent,
    required TResult Function(RequestMeanValue request) contractCountEvent,
    required TResult Function(RequestMeanValue request) meanRentAmountEvent,
    required TResult Function(RequestMeanValue request) RentAmountEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RequestMeanValue request)? certificateCountEvent,
    TResult? Function(RequestMeanValue request)? contractCountEvent,
    TResult? Function(RequestMeanValue request)? meanRentAmountEvent,
    TResult? Function(RequestMeanValue request)? RentAmountEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RequestMeanValue request)? certificateCountEvent,
    TResult Function(RequestMeanValue request)? contractCountEvent,
    TResult Function(RequestMeanValue request)? meanRentAmountEvent,
    TResult Function(RequestMeanValue request)? RentAmountEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CertificateCountEvent value)
        certificateCountEvent,
    required TResult Function(_ContractCountEvent value) contractCountEvent,
    required TResult Function(_MeanRentAmountEvent value) meanRentAmountEvent,
    required TResult Function(_RentAmountEvent value) RentAmountEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CertificateCountEvent value)? certificateCountEvent,
    TResult? Function(_ContractCountEvent value)? contractCountEvent,
    TResult? Function(_MeanRentAmountEvent value)? meanRentAmountEvent,
    TResult? Function(_RentAmountEvent value)? RentAmountEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CertificateCountEvent value)? certificateCountEvent,
    TResult Function(_ContractCountEvent value)? contractCountEvent,
    TResult Function(_MeanRentAmountEvent value)? meanRentAmountEvent,
    TResult Function(_RentAmountEvent value)? RentAmountEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CertificateContractEventCopyWith<CertificateContractEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CertificateContractEventCopyWith<$Res> {
  factory $CertificateContractEventCopyWith(CertificateContractEvent value,
          $Res Function(CertificateContractEvent) then) =
      _$CertificateContractEventCopyWithImpl<$Res, CertificateContractEvent>;
  @useResult
  $Res call({RequestMeanValue request});

  $RequestMeanValueCopyWith<$Res> get request;
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
abstract class _$$CertificateCountEventImplCopyWith<$Res>
    implements $CertificateContractEventCopyWith<$Res> {
  factory _$$CertificateCountEventImplCopyWith(
          _$CertificateCountEventImpl value,
          $Res Function(_$CertificateCountEventImpl) then) =
      __$$CertificateCountEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RequestMeanValue request});

  @override
  $RequestMeanValueCopyWith<$Res> get request;
}

/// @nodoc
class __$$CertificateCountEventImplCopyWithImpl<$Res>
    extends _$CertificateContractEventCopyWithImpl<$Res,
        _$CertificateCountEventImpl>
    implements _$$CertificateCountEventImplCopyWith<$Res> {
  __$$CertificateCountEventImplCopyWithImpl(_$CertificateCountEventImpl _value,
      $Res Function(_$CertificateCountEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$CertificateCountEventImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as RequestMeanValue,
    ));
  }
}

/// @nodoc

class _$CertificateCountEventImpl implements _CertificateCountEvent {
  const _$CertificateCountEventImpl({required this.request});

  @override
  final RequestMeanValue request;

  @override
  String toString() {
    return 'CertificateContractEvent.certificateCountEvent(request: $request)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CertificateCountEventImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CertificateCountEventImplCopyWith<_$CertificateCountEventImpl>
      get copyWith => __$$CertificateCountEventImplCopyWithImpl<
          _$CertificateCountEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RequestMeanValue request) certificateCountEvent,
    required TResult Function(RequestMeanValue request) contractCountEvent,
    required TResult Function(RequestMeanValue request) meanRentAmountEvent,
    required TResult Function(RequestMeanValue request) RentAmountEvent,
  }) {
    return certificateCountEvent(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RequestMeanValue request)? certificateCountEvent,
    TResult? Function(RequestMeanValue request)? contractCountEvent,
    TResult? Function(RequestMeanValue request)? meanRentAmountEvent,
    TResult? Function(RequestMeanValue request)? RentAmountEvent,
  }) {
    return certificateCountEvent?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RequestMeanValue request)? certificateCountEvent,
    TResult Function(RequestMeanValue request)? contractCountEvent,
    TResult Function(RequestMeanValue request)? meanRentAmountEvent,
    TResult Function(RequestMeanValue request)? RentAmountEvent,
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
    required TResult Function(_RentAmountEvent value) RentAmountEvent,
  }) {
    return certificateCountEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CertificateCountEvent value)? certificateCountEvent,
    TResult? Function(_ContractCountEvent value)? contractCountEvent,
    TResult? Function(_MeanRentAmountEvent value)? meanRentAmountEvent,
    TResult? Function(_RentAmountEvent value)? RentAmountEvent,
  }) {
    return certificateCountEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CertificateCountEvent value)? certificateCountEvent,
    TResult Function(_ContractCountEvent value)? contractCountEvent,
    TResult Function(_MeanRentAmountEvent value)? meanRentAmountEvent,
    TResult Function(_RentAmountEvent value)? RentAmountEvent,
    required TResult orElse(),
  }) {
    if (certificateCountEvent != null) {
      return certificateCountEvent(this);
    }
    return orElse();
  }
}

abstract class _CertificateCountEvent implements CertificateContractEvent {
  const factory _CertificateCountEvent(
      {required final RequestMeanValue request}) = _$CertificateCountEventImpl;

  @override
  RequestMeanValue get request;
  @override
  @JsonKey(ignore: true)
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
  $Res call({RequestMeanValue request});

  @override
  $RequestMeanValueCopyWith<$Res> get request;
}

/// @nodoc
class __$$ContractCountEventImplCopyWithImpl<$Res>
    extends _$CertificateContractEventCopyWithImpl<$Res,
        _$ContractCountEventImpl>
    implements _$$ContractCountEventImplCopyWith<$Res> {
  __$$ContractCountEventImplCopyWithImpl(_$ContractCountEventImpl _value,
      $Res Function(_$ContractCountEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$ContractCountEventImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as RequestMeanValue,
    ));
  }
}

/// @nodoc

class _$ContractCountEventImpl implements _ContractCountEvent {
  const _$ContractCountEventImpl({required this.request});

  @override
  final RequestMeanValue request;

  @override
  String toString() {
    return 'CertificateContractEvent.contractCountEvent(request: $request)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContractCountEventImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContractCountEventImplCopyWith<_$ContractCountEventImpl> get copyWith =>
      __$$ContractCountEventImplCopyWithImpl<_$ContractCountEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RequestMeanValue request) certificateCountEvent,
    required TResult Function(RequestMeanValue request) contractCountEvent,
    required TResult Function(RequestMeanValue request) meanRentAmountEvent,
    required TResult Function(RequestMeanValue request) RentAmountEvent,
  }) {
    return contractCountEvent(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RequestMeanValue request)? certificateCountEvent,
    TResult? Function(RequestMeanValue request)? contractCountEvent,
    TResult? Function(RequestMeanValue request)? meanRentAmountEvent,
    TResult? Function(RequestMeanValue request)? RentAmountEvent,
  }) {
    return contractCountEvent?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RequestMeanValue request)? certificateCountEvent,
    TResult Function(RequestMeanValue request)? contractCountEvent,
    TResult Function(RequestMeanValue request)? meanRentAmountEvent,
    TResult Function(RequestMeanValue request)? RentAmountEvent,
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
    required TResult Function(_RentAmountEvent value) RentAmountEvent,
  }) {
    return contractCountEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CertificateCountEvent value)? certificateCountEvent,
    TResult? Function(_ContractCountEvent value)? contractCountEvent,
    TResult? Function(_MeanRentAmountEvent value)? meanRentAmountEvent,
    TResult? Function(_RentAmountEvent value)? RentAmountEvent,
  }) {
    return contractCountEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CertificateCountEvent value)? certificateCountEvent,
    TResult Function(_ContractCountEvent value)? contractCountEvent,
    TResult Function(_MeanRentAmountEvent value)? meanRentAmountEvent,
    TResult Function(_RentAmountEvent value)? RentAmountEvent,
    required TResult orElse(),
  }) {
    if (contractCountEvent != null) {
      return contractCountEvent(this);
    }
    return orElse();
  }
}

abstract class _ContractCountEvent implements CertificateContractEvent {
  const factory _ContractCountEvent({required final RequestMeanValue request}) =
      _$ContractCountEventImpl;

  @override
  RequestMeanValue get request;
  @override
  @JsonKey(ignore: true)
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
  $Res call({RequestMeanValue request});

  @override
  $RequestMeanValueCopyWith<$Res> get request;
}

/// @nodoc
class __$$MeanRentAmountEventImplCopyWithImpl<$Res>
    extends _$CertificateContractEventCopyWithImpl<$Res,
        _$MeanRentAmountEventImpl>
    implements _$$MeanRentAmountEventImplCopyWith<$Res> {
  __$$MeanRentAmountEventImplCopyWithImpl(_$MeanRentAmountEventImpl _value,
      $Res Function(_$MeanRentAmountEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$MeanRentAmountEventImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as RequestMeanValue,
    ));
  }
}

/// @nodoc

class _$MeanRentAmountEventImpl implements _MeanRentAmountEvent {
  const _$MeanRentAmountEventImpl({required this.request});

  @override
  final RequestMeanValue request;

  @override
  String toString() {
    return 'CertificateContractEvent.meanRentAmountEvent(request: $request)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeanRentAmountEventImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MeanRentAmountEventImplCopyWith<_$MeanRentAmountEventImpl> get copyWith =>
      __$$MeanRentAmountEventImplCopyWithImpl<_$MeanRentAmountEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RequestMeanValue request) certificateCountEvent,
    required TResult Function(RequestMeanValue request) contractCountEvent,
    required TResult Function(RequestMeanValue request) meanRentAmountEvent,
    required TResult Function(RequestMeanValue request) RentAmountEvent,
  }) {
    return meanRentAmountEvent(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RequestMeanValue request)? certificateCountEvent,
    TResult? Function(RequestMeanValue request)? contractCountEvent,
    TResult? Function(RequestMeanValue request)? meanRentAmountEvent,
    TResult? Function(RequestMeanValue request)? RentAmountEvent,
  }) {
    return meanRentAmountEvent?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RequestMeanValue request)? certificateCountEvent,
    TResult Function(RequestMeanValue request)? contractCountEvent,
    TResult Function(RequestMeanValue request)? meanRentAmountEvent,
    TResult Function(RequestMeanValue request)? RentAmountEvent,
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
    required TResult Function(_RentAmountEvent value) RentAmountEvent,
  }) {
    return meanRentAmountEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CertificateCountEvent value)? certificateCountEvent,
    TResult? Function(_ContractCountEvent value)? contractCountEvent,
    TResult? Function(_MeanRentAmountEvent value)? meanRentAmountEvent,
    TResult? Function(_RentAmountEvent value)? RentAmountEvent,
  }) {
    return meanRentAmountEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CertificateCountEvent value)? certificateCountEvent,
    TResult Function(_ContractCountEvent value)? contractCountEvent,
    TResult Function(_MeanRentAmountEvent value)? meanRentAmountEvent,
    TResult Function(_RentAmountEvent value)? RentAmountEvent,
    required TResult orElse(),
  }) {
    if (meanRentAmountEvent != null) {
      return meanRentAmountEvent(this);
    }
    return orElse();
  }
}

abstract class _MeanRentAmountEvent implements CertificateContractEvent {
  const factory _MeanRentAmountEvent(
      {required final RequestMeanValue request}) = _$MeanRentAmountEventImpl;

  @override
  RequestMeanValue get request;
  @override
  @JsonKey(ignore: true)
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
  $Res call({RequestMeanValue request});

  @override
  $RequestMeanValueCopyWith<$Res> get request;
}

/// @nodoc
class __$$RentAmountEventImplCopyWithImpl<$Res>
    extends _$CertificateContractEventCopyWithImpl<$Res, _$RentAmountEventImpl>
    implements _$$RentAmountEventImplCopyWith<$Res> {
  __$$RentAmountEventImplCopyWithImpl(
      _$RentAmountEventImpl _value, $Res Function(_$RentAmountEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$RentAmountEventImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as RequestMeanValue,
    ));
  }
}

/// @nodoc

class _$RentAmountEventImpl implements _RentAmountEvent {
  const _$RentAmountEventImpl({required this.request});

  @override
  final RequestMeanValue request;

  @override
  String toString() {
    return 'CertificateContractEvent.RentAmountEvent(request: $request)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RentAmountEventImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RentAmountEventImplCopyWith<_$RentAmountEventImpl> get copyWith =>
      __$$RentAmountEventImplCopyWithImpl<_$RentAmountEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RequestMeanValue request) certificateCountEvent,
    required TResult Function(RequestMeanValue request) contractCountEvent,
    required TResult Function(RequestMeanValue request) meanRentAmountEvent,
    required TResult Function(RequestMeanValue request) RentAmountEvent,
  }) {
    return RentAmountEvent(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RequestMeanValue request)? certificateCountEvent,
    TResult? Function(RequestMeanValue request)? contractCountEvent,
    TResult? Function(RequestMeanValue request)? meanRentAmountEvent,
    TResult? Function(RequestMeanValue request)? RentAmountEvent,
  }) {
    return RentAmountEvent?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RequestMeanValue request)? certificateCountEvent,
    TResult Function(RequestMeanValue request)? contractCountEvent,
    TResult Function(RequestMeanValue request)? meanRentAmountEvent,
    TResult Function(RequestMeanValue request)? RentAmountEvent,
    required TResult orElse(),
  }) {
    if (RentAmountEvent != null) {
      return RentAmountEvent(request);
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
    required TResult Function(_RentAmountEvent value) RentAmountEvent,
  }) {
    return RentAmountEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CertificateCountEvent value)? certificateCountEvent,
    TResult? Function(_ContractCountEvent value)? contractCountEvent,
    TResult? Function(_MeanRentAmountEvent value)? meanRentAmountEvent,
    TResult? Function(_RentAmountEvent value)? RentAmountEvent,
  }) {
    return RentAmountEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CertificateCountEvent value)? certificateCountEvent,
    TResult Function(_ContractCountEvent value)? contractCountEvent,
    TResult Function(_MeanRentAmountEvent value)? meanRentAmountEvent,
    TResult Function(_RentAmountEvent value)? RentAmountEvent,
    required TResult orElse(),
  }) {
    if (RentAmountEvent != null) {
      return RentAmountEvent(this);
    }
    return orElse();
  }
}

abstract class _RentAmountEvent implements CertificateContractEvent {
  const factory _RentAmountEvent({required final RequestMeanValue request}) =
      _$RentAmountEventImpl;

  @override
  RequestMeanValue get request;
  @override
  @JsonKey(ignore: true)
  _$$RentAmountEventImplCopyWith<_$RentAmountEventImpl> get copyWith =>
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

  @JsonKey(ignore: true)
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
  bool operator ==(dynamic other) {
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

  @JsonKey(ignore: true)
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
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
