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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RequestMeanValue request)? certificateCountEvent,
    TResult? Function(RequestMeanValue request)? contractCountEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RequestMeanValue request)? certificateCountEvent,
    TResult Function(RequestMeanValue request)? contractCountEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CertificateCountEvent value)
        certificateCountEvent,
    required TResult Function(_ContractCountEvent value) contractCountEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CertificateCountEvent value)? certificateCountEvent,
    TResult? Function(_ContractCountEvent value)? contractCountEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CertificateCountEvent value)? certificateCountEvent,
    TResult Function(_ContractCountEvent value)? contractCountEvent,
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
  }) {
    return certificateCountEvent(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RequestMeanValue request)? certificateCountEvent,
    TResult? Function(RequestMeanValue request)? contractCountEvent,
  }) {
    return certificateCountEvent?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RequestMeanValue request)? certificateCountEvent,
    TResult Function(RequestMeanValue request)? contractCountEvent,
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
  }) {
    return certificateCountEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CertificateCountEvent value)? certificateCountEvent,
    TResult? Function(_ContractCountEvent value)? contractCountEvent,
  }) {
    return certificateCountEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CertificateCountEvent value)? certificateCountEvent,
    TResult Function(_ContractCountEvent value)? contractCountEvent,
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
  }) {
    return contractCountEvent(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RequestMeanValue request)? certificateCountEvent,
    TResult? Function(RequestMeanValue request)? contractCountEvent,
  }) {
    return contractCountEvent?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RequestMeanValue request)? certificateCountEvent,
    TResult Function(RequestMeanValue request)? contractCountEvent,
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
  }) {
    return contractCountEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CertificateCountEvent value)? certificateCountEvent,
    TResult? Function(_ContractCountEvent value)? contractCountEvent,
  }) {
    return contractCountEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CertificateCountEvent value)? certificateCountEvent,
    TResult Function(_ContractCountEvent value)? contractCountEvent,
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
mixin _$CertificateContractState {
  bool get isLoadingCertificate => throw _privateConstructorUsedError;
  bool get isLoadingContract => throw _privateConstructorUsedError;
  bool get isHasErrorContract => throw _privateConstructorUsedError;
  bool get isHasErrorCertificate => throw _privateConstructorUsedError;
  String get errorMessageCertificate => throw _privateConstructorUsedError;
  String get errorMessageContract => throw _privateConstructorUsedError;
  List<BaseRentResponse> get certificateCountResponse =>
      throw _privateConstructorUsedError;
  List<BaseRentResponse> get contractCountResponse =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoadingCertificate,
            bool isLoadingContract,
            bool isHasErrorContract,
            bool isHasErrorCertificate,
            String errorMessageCertificate,
            String errorMessageContract,
            List<BaseRentResponse> certificateCountResponse,
            List<BaseRentResponse> contractCountResponse)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool isLoadingCertificate,
            bool isLoadingContract,
            bool isHasErrorContract,
            bool isHasErrorCertificate,
            String errorMessageCertificate,
            String errorMessageContract,
            List<BaseRentResponse> certificateCountResponse,
            List<BaseRentResponse> contractCountResponse)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isLoadingCertificate,
            bool isLoadingContract,
            bool isHasErrorContract,
            bool isHasErrorCertificate,
            String errorMessageCertificate,
            String errorMessageContract,
            List<BaseRentResponse> certificateCountResponse,
            List<BaseRentResponse> contractCountResponse)?
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
      {bool isLoadingCertificate,
      bool isLoadingContract,
      bool isHasErrorContract,
      bool isHasErrorCertificate,
      String errorMessageCertificate,
      String errorMessageContract,
      List<BaseRentResponse> certificateCountResponse,
      List<BaseRentResponse> contractCountResponse});
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
    Object? isLoadingCertificate = null,
    Object? isLoadingContract = null,
    Object? isHasErrorContract = null,
    Object? isHasErrorCertificate = null,
    Object? errorMessageCertificate = null,
    Object? errorMessageContract = null,
    Object? certificateCountResponse = null,
    Object? contractCountResponse = null,
  }) {
    return _then(_value.copyWith(
      isLoadingCertificate: null == isLoadingCertificate
          ? _value.isLoadingCertificate
          : isLoadingCertificate // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingContract: null == isLoadingContract
          ? _value.isLoadingContract
          : isLoadingContract // ignore: cast_nullable_to_non_nullable
              as bool,
      isHasErrorContract: null == isHasErrorContract
          ? _value.isHasErrorContract
          : isHasErrorContract // ignore: cast_nullable_to_non_nullable
              as bool,
      isHasErrorCertificate: null == isHasErrorCertificate
          ? _value.isHasErrorCertificate
          : isHasErrorCertificate // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessageCertificate: null == errorMessageCertificate
          ? _value.errorMessageCertificate
          : errorMessageCertificate // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessageContract: null == errorMessageContract
          ? _value.errorMessageContract
          : errorMessageContract // ignore: cast_nullable_to_non_nullable
              as String,
      certificateCountResponse: null == certificateCountResponse
          ? _value.certificateCountResponse
          : certificateCountResponse // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
      contractCountResponse: null == contractCountResponse
          ? _value.contractCountResponse
          : contractCountResponse // ignore: cast_nullable_to_non_nullable
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
      {bool isLoadingCertificate,
      bool isLoadingContract,
      bool isHasErrorContract,
      bool isHasErrorCertificate,
      String errorMessageCertificate,
      String errorMessageContract,
      List<BaseRentResponse> certificateCountResponse,
      List<BaseRentResponse> contractCountResponse});
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
    Object? isLoadingCertificate = null,
    Object? isLoadingContract = null,
    Object? isHasErrorContract = null,
    Object? isHasErrorCertificate = null,
    Object? errorMessageCertificate = null,
    Object? errorMessageContract = null,
    Object? certificateCountResponse = null,
    Object? contractCountResponse = null,
  }) {
    return _then(_$InitialImpl(
      isLoadingCertificate: null == isLoadingCertificate
          ? _value.isLoadingCertificate
          : isLoadingCertificate // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingContract: null == isLoadingContract
          ? _value.isLoadingContract
          : isLoadingContract // ignore: cast_nullable_to_non_nullable
              as bool,
      isHasErrorContract: null == isHasErrorContract
          ? _value.isHasErrorContract
          : isHasErrorContract // ignore: cast_nullable_to_non_nullable
              as bool,
      isHasErrorCertificate: null == isHasErrorCertificate
          ? _value.isHasErrorCertificate
          : isHasErrorCertificate // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessageCertificate: null == errorMessageCertificate
          ? _value.errorMessageCertificate
          : errorMessageCertificate // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessageContract: null == errorMessageContract
          ? _value.errorMessageContract
          : errorMessageContract // ignore: cast_nullable_to_non_nullable
              as String,
      certificateCountResponse: null == certificateCountResponse
          ? _value._certificateCountResponse
          : certificateCountResponse // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
      contractCountResponse: null == contractCountResponse
          ? _value._contractCountResponse
          : contractCountResponse // ignore: cast_nullable_to_non_nullable
              as List<BaseRentResponse>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.isLoadingCertificate = false,
      this.isLoadingContract = false,
      this.isHasErrorContract = false,
      this.isHasErrorCertificate = false,
      this.errorMessageCertificate = '',
      this.errorMessageContract = '',
      final List<BaseRentResponse> certificateCountResponse = const [],
      final List<BaseRentResponse> contractCountResponse = const []})
      : _certificateCountResponse = certificateCountResponse,
        _contractCountResponse = contractCountResponse;

  @override
  @JsonKey()
  final bool isLoadingCertificate;
  @override
  @JsonKey()
  final bool isLoadingContract;
  @override
  @JsonKey()
  final bool isHasErrorContract;
  @override
  @JsonKey()
  final bool isHasErrorCertificate;
  @override
  @JsonKey()
  final String errorMessageCertificate;
  @override
  @JsonKey()
  final String errorMessageContract;
  final List<BaseRentResponse> _certificateCountResponse;
  @override
  @JsonKey()
  List<BaseRentResponse> get certificateCountResponse {
    if (_certificateCountResponse is EqualUnmodifiableListView)
      return _certificateCountResponse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_certificateCountResponse);
  }

  final List<BaseRentResponse> _contractCountResponse;
  @override
  @JsonKey()
  List<BaseRentResponse> get contractCountResponse {
    if (_contractCountResponse is EqualUnmodifiableListView)
      return _contractCountResponse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contractCountResponse);
  }

  @override
  String toString() {
    return 'CertificateContractState.initial(isLoadingCertificate: $isLoadingCertificate, isLoadingContract: $isLoadingContract, isHasErrorContract: $isHasErrorContract, isHasErrorCertificate: $isHasErrorCertificate, errorMessageCertificate: $errorMessageCertificate, errorMessageContract: $errorMessageContract, certificateCountResponse: $certificateCountResponse, contractCountResponse: $contractCountResponse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoadingCertificate, isLoadingCertificate) ||
                other.isLoadingCertificate == isLoadingCertificate) &&
            (identical(other.isLoadingContract, isLoadingContract) ||
                other.isLoadingContract == isLoadingContract) &&
            (identical(other.isHasErrorContract, isHasErrorContract) ||
                other.isHasErrorContract == isHasErrorContract) &&
            (identical(other.isHasErrorCertificate, isHasErrorCertificate) ||
                other.isHasErrorCertificate == isHasErrorCertificate) &&
            (identical(
                    other.errorMessageCertificate, errorMessageCertificate) ||
                other.errorMessageCertificate == errorMessageCertificate) &&
            (identical(other.errorMessageContract, errorMessageContract) ||
                other.errorMessageContract == errorMessageContract) &&
            const DeepCollectionEquality().equals(
                other._certificateCountResponse, _certificateCountResponse) &&
            const DeepCollectionEquality()
                .equals(other._contractCountResponse, _contractCountResponse));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoadingCertificate,
      isLoadingContract,
      isHasErrorContract,
      isHasErrorCertificate,
      errorMessageCertificate,
      errorMessageContract,
      const DeepCollectionEquality().hash(_certificateCountResponse),
      const DeepCollectionEquality().hash(_contractCountResponse));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoadingCertificate,
            bool isLoadingContract,
            bool isHasErrorContract,
            bool isHasErrorCertificate,
            String errorMessageCertificate,
            String errorMessageContract,
            List<BaseRentResponse> certificateCountResponse,
            List<BaseRentResponse> contractCountResponse)
        initial,
  }) {
    return initial(
        isLoadingCertificate,
        isLoadingContract,
        isHasErrorContract,
        isHasErrorCertificate,
        errorMessageCertificate,
        errorMessageContract,
        certificateCountResponse,
        contractCountResponse);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool isLoadingCertificate,
            bool isLoadingContract,
            bool isHasErrorContract,
            bool isHasErrorCertificate,
            String errorMessageCertificate,
            String errorMessageContract,
            List<BaseRentResponse> certificateCountResponse,
            List<BaseRentResponse> contractCountResponse)?
        initial,
  }) {
    return initial?.call(
        isLoadingCertificate,
        isLoadingContract,
        isHasErrorContract,
        isHasErrorCertificate,
        errorMessageCertificate,
        errorMessageContract,
        certificateCountResponse,
        contractCountResponse);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isLoadingCertificate,
            bool isLoadingContract,
            bool isHasErrorContract,
            bool isHasErrorCertificate,
            String errorMessageCertificate,
            String errorMessageContract,
            List<BaseRentResponse> certificateCountResponse,
            List<BaseRentResponse> contractCountResponse)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          isLoadingCertificate,
          isLoadingContract,
          isHasErrorContract,
          isHasErrorCertificate,
          errorMessageCertificate,
          errorMessageContract,
          certificateCountResponse,
          contractCountResponse);
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
      {final bool isLoadingCertificate,
      final bool isLoadingContract,
      final bool isHasErrorContract,
      final bool isHasErrorCertificate,
      final String errorMessageCertificate,
      final String errorMessageContract,
      final List<BaseRentResponse> certificateCountResponse,
      final List<BaseRentResponse> contractCountResponse}) = _$InitialImpl;

  @override
  bool get isLoadingCertificate;
  @override
  bool get isLoadingContract;
  @override
  bool get isHasErrorContract;
  @override
  bool get isHasErrorCertificate;
  @override
  String get errorMessageCertificate;
  @override
  String get errorMessageContract;
  @override
  List<BaseRentResponse> get certificateCountResponse;
  @override
  List<BaseRentResponse> get contractCountResponse;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
