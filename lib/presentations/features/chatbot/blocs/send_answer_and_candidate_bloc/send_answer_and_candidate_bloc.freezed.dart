// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_answer_and_candidate_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SendAnswerAndCandidateState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SendAnswerResponseModel startStreamResponse) done,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SendAnswerResponseModel startStreamResponse)? done,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SendAnswerResponseModel startStreamResponse)? done,
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
abstract class $SendAnswerAndCandidateStateCopyWith<$Res> {
  factory $SendAnswerAndCandidateStateCopyWith(
          SendAnswerAndCandidateState value,
          $Res Function(SendAnswerAndCandidateState) then) =
      _$SendAnswerAndCandidateStateCopyWithImpl<$Res,
          SendAnswerAndCandidateState>;
}

/// @nodoc
class _$SendAnswerAndCandidateStateCopyWithImpl<$Res,
        $Val extends SendAnswerAndCandidateState>
    implements $SendAnswerAndCandidateStateCopyWith<$Res> {
  _$SendAnswerAndCandidateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendAnswerAndCandidateState
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
    extends _$SendAnswerAndCandidateStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendAnswerAndCandidateState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SendAnswerAndCandidateState.initial()';
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
    required TResult Function() loading,
    required TResult Function(SendAnswerResponseModel startStreamResponse) done,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SendAnswerResponseModel startStreamResponse)? done,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SendAnswerResponseModel startStreamResponse)? done,
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

abstract class _Initial implements SendAnswerAndCandidateState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$SendAnswerAndCandidateStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendAnswerAndCandidateState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'SendAnswerAndCandidateState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SendAnswerResponseModel startStreamResponse) done,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SendAnswerResponseModel startStreamResponse)? done,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SendAnswerResponseModel startStreamResponse)? done,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
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

abstract class _Loading implements SendAnswerAndCandidateState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$DoneImplCopyWith<$Res> {
  factory _$$DoneImplCopyWith(
          _$DoneImpl value, $Res Function(_$DoneImpl) then) =
      __$$DoneImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SendAnswerResponseModel startStreamResponse});

  $SendAnswerResponseModelCopyWith<$Res> get startStreamResponse;
}

/// @nodoc
class __$$DoneImplCopyWithImpl<$Res>
    extends _$SendAnswerAndCandidateStateCopyWithImpl<$Res, _$DoneImpl>
    implements _$$DoneImplCopyWith<$Res> {
  __$$DoneImplCopyWithImpl(_$DoneImpl _value, $Res Function(_$DoneImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendAnswerAndCandidateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startStreamResponse = null,
  }) {
    return _then(_$DoneImpl(
      startStreamResponse: null == startStreamResponse
          ? _value.startStreamResponse
          : startStreamResponse // ignore: cast_nullable_to_non_nullable
              as SendAnswerResponseModel,
    ));
  }

  /// Create a copy of SendAnswerAndCandidateState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SendAnswerResponseModelCopyWith<$Res> get startStreamResponse {
    return $SendAnswerResponseModelCopyWith<$Res>(_value.startStreamResponse,
        (value) {
      return _then(_value.copyWith(startStreamResponse: value));
    });
  }
}

/// @nodoc

class _$DoneImpl implements _Done {
  const _$DoneImpl({required this.startStreamResponse});

  @override
  final SendAnswerResponseModel startStreamResponse;

  @override
  String toString() {
    return 'SendAnswerAndCandidateState.done(startStreamResponse: $startStreamResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoneImpl &&
            (identical(other.startStreamResponse, startStreamResponse) ||
                other.startStreamResponse == startStreamResponse));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startStreamResponse);

  /// Create a copy of SendAnswerAndCandidateState
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
    required TResult Function() loading,
    required TResult Function(SendAnswerResponseModel startStreamResponse) done,
    required TResult Function(String message) error,
  }) {
    return done(startStreamResponse);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SendAnswerResponseModel startStreamResponse)? done,
    TResult? Function(String message)? error,
  }) {
    return done?.call(startStreamResponse);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SendAnswerResponseModel startStreamResponse)? done,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(startStreamResponse);
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

abstract class _Done implements SendAnswerAndCandidateState {
  const factory _Done(
          {required final SendAnswerResponseModel startStreamResponse}) =
      _$DoneImpl;

  SendAnswerResponseModel get startStreamResponse;

  /// Create a copy of SendAnswerAndCandidateState
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
    extends _$SendAnswerAndCandidateStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendAnswerAndCandidateState
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
    return 'SendAnswerAndCandidateState.error(message: $message)';
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

  /// Create a copy of SendAnswerAndCandidateState
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
    required TResult Function() loading,
    required TResult Function(SendAnswerResponseModel startStreamResponse) done,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SendAnswerResponseModel startStreamResponse)? done,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SendAnswerResponseModel startStreamResponse)? done,
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

abstract class _Error implements SendAnswerAndCandidateState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of SendAnswerAndCandidateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SendAnswerAndCandidateEvent {
  Object get request => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MainSendAnswerRequestModelById request)
        sendAnswer,
    required TResult Function(MainSendCandidateRequestModelById request)
        sendCandidate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MainSendAnswerRequestModelById request)? sendAnswer,
    TResult? Function(MainSendCandidateRequestModelById request)? sendCandidate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MainSendAnswerRequestModelById request)? sendAnswer,
    TResult Function(MainSendCandidateRequestModelById request)? sendCandidate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendAnswer value) sendAnswer,
    required TResult Function(_SendCandidate value) sendCandidate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendAnswer value)? sendAnswer,
    TResult? Function(_SendCandidate value)? sendCandidate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendAnswer value)? sendAnswer,
    TResult Function(_SendCandidate value)? sendCandidate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendAnswerAndCandidateEventCopyWith<$Res> {
  factory $SendAnswerAndCandidateEventCopyWith(
          SendAnswerAndCandidateEvent value,
          $Res Function(SendAnswerAndCandidateEvent) then) =
      _$SendAnswerAndCandidateEventCopyWithImpl<$Res,
          SendAnswerAndCandidateEvent>;
}

/// @nodoc
class _$SendAnswerAndCandidateEventCopyWithImpl<$Res,
        $Val extends SendAnswerAndCandidateEvent>
    implements $SendAnswerAndCandidateEventCopyWith<$Res> {
  _$SendAnswerAndCandidateEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendAnswerAndCandidateEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SendAnswerImplCopyWith<$Res> {
  factory _$$SendAnswerImplCopyWith(
          _$SendAnswerImpl value, $Res Function(_$SendAnswerImpl) then) =
      __$$SendAnswerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MainSendAnswerRequestModelById request});
}

/// @nodoc
class __$$SendAnswerImplCopyWithImpl<$Res>
    extends _$SendAnswerAndCandidateEventCopyWithImpl<$Res, _$SendAnswerImpl>
    implements _$$SendAnswerImplCopyWith<$Res> {
  __$$SendAnswerImplCopyWithImpl(
      _$SendAnswerImpl _value, $Res Function(_$SendAnswerImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendAnswerAndCandidateEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$SendAnswerImpl(
      null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as MainSendAnswerRequestModelById,
    ));
  }
}

/// @nodoc

class _$SendAnswerImpl implements _SendAnswer {
  const _$SendAnswerImpl(this.request);

  @override
  final MainSendAnswerRequestModelById request;

  @override
  String toString() {
    return 'SendAnswerAndCandidateEvent.sendAnswer(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendAnswerImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of SendAnswerAndCandidateEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendAnswerImplCopyWith<_$SendAnswerImpl> get copyWith =>
      __$$SendAnswerImplCopyWithImpl<_$SendAnswerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MainSendAnswerRequestModelById request)
        sendAnswer,
    required TResult Function(MainSendCandidateRequestModelById request)
        sendCandidate,
  }) {
    return sendAnswer(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MainSendAnswerRequestModelById request)? sendAnswer,
    TResult? Function(MainSendCandidateRequestModelById request)? sendCandidate,
  }) {
    return sendAnswer?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MainSendAnswerRequestModelById request)? sendAnswer,
    TResult Function(MainSendCandidateRequestModelById request)? sendCandidate,
    required TResult orElse(),
  }) {
    if (sendAnswer != null) {
      return sendAnswer(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendAnswer value) sendAnswer,
    required TResult Function(_SendCandidate value) sendCandidate,
  }) {
    return sendAnswer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendAnswer value)? sendAnswer,
    TResult? Function(_SendCandidate value)? sendCandidate,
  }) {
    return sendAnswer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendAnswer value)? sendAnswer,
    TResult Function(_SendCandidate value)? sendCandidate,
    required TResult orElse(),
  }) {
    if (sendAnswer != null) {
      return sendAnswer(this);
    }
    return orElse();
  }
}

abstract class _SendAnswer implements SendAnswerAndCandidateEvent {
  const factory _SendAnswer(final MainSendAnswerRequestModelById request) =
      _$SendAnswerImpl;

  @override
  MainSendAnswerRequestModelById get request;

  /// Create a copy of SendAnswerAndCandidateEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendAnswerImplCopyWith<_$SendAnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendCandidateImplCopyWith<$Res> {
  factory _$$SendCandidateImplCopyWith(
          _$SendCandidateImpl value, $Res Function(_$SendCandidateImpl) then) =
      __$$SendCandidateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MainSendCandidateRequestModelById request});
}

/// @nodoc
class __$$SendCandidateImplCopyWithImpl<$Res>
    extends _$SendAnswerAndCandidateEventCopyWithImpl<$Res, _$SendCandidateImpl>
    implements _$$SendCandidateImplCopyWith<$Res> {
  __$$SendCandidateImplCopyWithImpl(
      _$SendCandidateImpl _value, $Res Function(_$SendCandidateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendAnswerAndCandidateEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$SendCandidateImpl(
      null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as MainSendCandidateRequestModelById,
    ));
  }
}

/// @nodoc

class _$SendCandidateImpl implements _SendCandidate {
  const _$SendCandidateImpl(this.request);

  @override
  final MainSendCandidateRequestModelById request;

  @override
  String toString() {
    return 'SendAnswerAndCandidateEvent.sendCandidate(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendCandidateImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of SendAnswerAndCandidateEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendCandidateImplCopyWith<_$SendCandidateImpl> get copyWith =>
      __$$SendCandidateImplCopyWithImpl<_$SendCandidateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MainSendAnswerRequestModelById request)
        sendAnswer,
    required TResult Function(MainSendCandidateRequestModelById request)
        sendCandidate,
  }) {
    return sendCandidate(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MainSendAnswerRequestModelById request)? sendAnswer,
    TResult? Function(MainSendCandidateRequestModelById request)? sendCandidate,
  }) {
    return sendCandidate?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MainSendAnswerRequestModelById request)? sendAnswer,
    TResult Function(MainSendCandidateRequestModelById request)? sendCandidate,
    required TResult orElse(),
  }) {
    if (sendCandidate != null) {
      return sendCandidate(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendAnswer value) sendAnswer,
    required TResult Function(_SendCandidate value) sendCandidate,
  }) {
    return sendCandidate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendAnswer value)? sendAnswer,
    TResult? Function(_SendCandidate value)? sendCandidate,
  }) {
    return sendCandidate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendAnswer value)? sendAnswer,
    TResult Function(_SendCandidate value)? sendCandidate,
    required TResult orElse(),
  }) {
    if (sendCandidate != null) {
      return sendCandidate(this);
    }
    return orElse();
  }
}

abstract class _SendCandidate implements SendAnswerAndCandidateEvent {
  const factory _SendCandidate(
      final MainSendCandidateRequestModelById request) = _$SendCandidateImpl;

  @override
  MainSendCandidateRequestModelById get request;

  /// Create a copy of SendAnswerAndCandidateEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendCandidateImplCopyWith<_$SendCandidateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
