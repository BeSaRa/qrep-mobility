// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'start_stream_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StartStreamState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  StartStreamModel get startStreamResponse =>
      throw _privateConstructorUsedError;
  SendAnswerResponseModel get sendAnswerResponse =>
      throw _privateConstructorUsedError;
  SendAnswerResponseModel get sendCandidateResponse =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoading,
            bool hasError,
            String errorMessage,
            StartStreamModel startStreamResponse,
            SendAnswerResponseModel sendAnswerResponse,
            SendAnswerResponseModel sendCandidateResponse)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool isLoading,
            bool hasError,
            String errorMessage,
            StartStreamModel startStreamResponse,
            SendAnswerResponseModel sendAnswerResponse,
            SendAnswerResponseModel sendCandidateResponse)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isLoading,
            bool hasError,
            String errorMessage,
            StartStreamModel startStreamResponse,
            SendAnswerResponseModel sendAnswerResponse,
            SendAnswerResponseModel sendCandidateResponse)?
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

  /// Create a copy of StartStreamState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StartStreamStateCopyWith<StartStreamState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartStreamStateCopyWith<$Res> {
  factory $StartStreamStateCopyWith(
          StartStreamState value, $Res Function(StartStreamState) then) =
      _$StartStreamStateCopyWithImpl<$Res, StartStreamState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      String errorMessage,
      StartStreamModel startStreamResponse,
      SendAnswerResponseModel sendAnswerResponse,
      SendAnswerResponseModel sendCandidateResponse});

  $StartStreamModelCopyWith<$Res> get startStreamResponse;
  $SendAnswerResponseModelCopyWith<$Res> get sendAnswerResponse;
  $SendAnswerResponseModelCopyWith<$Res> get sendCandidateResponse;
}

/// @nodoc
class _$StartStreamStateCopyWithImpl<$Res, $Val extends StartStreamState>
    implements $StartStreamStateCopyWith<$Res> {
  _$StartStreamStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StartStreamState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? errorMessage = null,
    Object? startStreamResponse = null,
    Object? sendAnswerResponse = null,
    Object? sendCandidateResponse = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      startStreamResponse: null == startStreamResponse
          ? _value.startStreamResponse
          : startStreamResponse // ignore: cast_nullable_to_non_nullable
              as StartStreamModel,
      sendAnswerResponse: null == sendAnswerResponse
          ? _value.sendAnswerResponse
          : sendAnswerResponse // ignore: cast_nullable_to_non_nullable
              as SendAnswerResponseModel,
      sendCandidateResponse: null == sendCandidateResponse
          ? _value.sendCandidateResponse
          : sendCandidateResponse // ignore: cast_nullable_to_non_nullable
              as SendAnswerResponseModel,
    ) as $Val);
  }

  /// Create a copy of StartStreamState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StartStreamModelCopyWith<$Res> get startStreamResponse {
    return $StartStreamModelCopyWith<$Res>(_value.startStreamResponse, (value) {
      return _then(_value.copyWith(startStreamResponse: value) as $Val);
    });
  }

  /// Create a copy of StartStreamState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SendAnswerResponseModelCopyWith<$Res> get sendAnswerResponse {
    return $SendAnswerResponseModelCopyWith<$Res>(_value.sendAnswerResponse,
        (value) {
      return _then(_value.copyWith(sendAnswerResponse: value) as $Val);
    });
  }

  /// Create a copy of StartStreamState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SendAnswerResponseModelCopyWith<$Res> get sendCandidateResponse {
    return $SendAnswerResponseModelCopyWith<$Res>(_value.sendCandidateResponse,
        (value) {
      return _then(_value.copyWith(sendCandidateResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $StartStreamStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      String errorMessage,
      StartStreamModel startStreamResponse,
      SendAnswerResponseModel sendAnswerResponse,
      SendAnswerResponseModel sendCandidateResponse});

  @override
  $StartStreamModelCopyWith<$Res> get startStreamResponse;
  @override
  $SendAnswerResponseModelCopyWith<$Res> get sendAnswerResponse;
  @override
  $SendAnswerResponseModelCopyWith<$Res> get sendCandidateResponse;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$StartStreamStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of StartStreamState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? errorMessage = null,
    Object? startStreamResponse = null,
    Object? sendAnswerResponse = null,
    Object? sendCandidateResponse = null,
  }) {
    return _then(_$InitialImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      startStreamResponse: null == startStreamResponse
          ? _value.startStreamResponse
          : startStreamResponse // ignore: cast_nullable_to_non_nullable
              as StartStreamModel,
      sendAnswerResponse: null == sendAnswerResponse
          ? _value.sendAnswerResponse
          : sendAnswerResponse // ignore: cast_nullable_to_non_nullable
              as SendAnswerResponseModel,
      sendCandidateResponse: null == sendCandidateResponse
          ? _value.sendCandidateResponse
          : sendCandidateResponse // ignore: cast_nullable_to_non_nullable
              as SendAnswerResponseModel,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.isLoading = false,
      this.hasError = false,
      this.errorMessage = '',
      this.startStreamResponse = const StartStreamModel(),
      this.sendAnswerResponse = const SendAnswerResponseModel(),
      this.sendCandidateResponse = const SendAnswerResponseModel()});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasError;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final StartStreamModel startStreamResponse;
  @override
  @JsonKey()
  final SendAnswerResponseModel sendAnswerResponse;
  @override
  @JsonKey()
  final SendAnswerResponseModel sendCandidateResponse;

  @override
  String toString() {
    return 'StartStreamState.initial(isLoading: $isLoading, hasError: $hasError, errorMessage: $errorMessage, startStreamResponse: $startStreamResponse, sendAnswerResponse: $sendAnswerResponse, sendCandidateResponse: $sendCandidateResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.startStreamResponse, startStreamResponse) ||
                other.startStreamResponse == startStreamResponse) &&
            (identical(other.sendAnswerResponse, sendAnswerResponse) ||
                other.sendAnswerResponse == sendAnswerResponse) &&
            (identical(other.sendCandidateResponse, sendCandidateResponse) ||
                other.sendCandidateResponse == sendCandidateResponse));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      hasError,
      errorMessage,
      startStreamResponse,
      sendAnswerResponse,
      sendCandidateResponse);

  /// Create a copy of StartStreamState
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
            bool isLoading,
            bool hasError,
            String errorMessage,
            StartStreamModel startStreamResponse,
            SendAnswerResponseModel sendAnswerResponse,
            SendAnswerResponseModel sendCandidateResponse)
        initial,
  }) {
    return initial(isLoading, hasError, errorMessage, startStreamResponse,
        sendAnswerResponse, sendCandidateResponse);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool isLoading,
            bool hasError,
            String errorMessage,
            StartStreamModel startStreamResponse,
            SendAnswerResponseModel sendAnswerResponse,
            SendAnswerResponseModel sendCandidateResponse)?
        initial,
  }) {
    return initial?.call(isLoading, hasError, errorMessage, startStreamResponse,
        sendAnswerResponse, sendCandidateResponse);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isLoading,
            bool hasError,
            String errorMessage,
            StartStreamModel startStreamResponse,
            SendAnswerResponseModel sendAnswerResponse,
            SendAnswerResponseModel sendCandidateResponse)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isLoading, hasError, errorMessage, startStreamResponse,
          sendAnswerResponse, sendCandidateResponse);
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

abstract class _Initial implements StartStreamState {
  const factory _Initial(
      {final bool isLoading,
      final bool hasError,
      final String errorMessage,
      final StartStreamModel startStreamResponse,
      final SendAnswerResponseModel sendAnswerResponse,
      final SendAnswerResponseModel sendCandidateResponse}) = _$InitialImpl;

  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  String get errorMessage;
  @override
  StartStreamModel get startStreamResponse;
  @override
  SendAnswerResponseModel get sendAnswerResponse;
  @override
  SendAnswerResponseModel get sendCandidateResponse;

  /// Create a copy of StartStreamState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StartStreamEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(MainSendAnswerRequestModelById request)
        sendAnswer,
    required TResult Function(MainSendCandidateRequestModelById request)
        sendCandidate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(MainSendAnswerRequestModelById request)? sendAnswer,
    TResult? Function(MainSendCandidateRequestModelById request)? sendCandidate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(MainSendAnswerRequestModelById request)? sendAnswer,
    TResult Function(MainSendCandidateRequestModelById request)? sendCandidate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SendAnswer value) sendAnswer,
    required TResult Function(_SendCandidate value) sendCandidate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SendAnswer value)? sendAnswer,
    TResult? Function(_SendCandidate value)? sendCandidate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SendAnswer value)? sendAnswer,
    TResult Function(_SendCandidate value)? sendCandidate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartStreamEventCopyWith<$Res> {
  factory $StartStreamEventCopyWith(
          StartStreamEvent value, $Res Function(StartStreamEvent) then) =
      _$StartStreamEventCopyWithImpl<$Res, StartStreamEvent>;
}

/// @nodoc
class _$StartStreamEventCopyWithImpl<$Res, $Val extends StartStreamEvent>
    implements $StartStreamEventCopyWith<$Res> {
  _$StartStreamEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StartStreamEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$StartStreamEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of StartStreamEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'StartStreamEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(MainSendAnswerRequestModelById request)
        sendAnswer,
    required TResult Function(MainSendCandidateRequestModelById request)
        sendCandidate,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(MainSendAnswerRequestModelById request)? sendAnswer,
    TResult? Function(MainSendCandidateRequestModelById request)? sendCandidate,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(MainSendAnswerRequestModelById request)? sendAnswer,
    TResult Function(MainSendCandidateRequestModelById request)? sendCandidate,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SendAnswer value) sendAnswer,
    required TResult Function(_SendCandidate value) sendCandidate,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SendAnswer value)? sendAnswer,
    TResult? Function(_SendCandidate value)? sendCandidate,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SendAnswer value)? sendAnswer,
    TResult Function(_SendCandidate value)? sendCandidate,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements StartStreamEvent {
  const factory _Started() = _$StartedImpl;
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
    extends _$StartStreamEventCopyWithImpl<$Res, _$SendAnswerImpl>
    implements _$$SendAnswerImplCopyWith<$Res> {
  __$$SendAnswerImplCopyWithImpl(
      _$SendAnswerImpl _value, $Res Function(_$SendAnswerImpl) _then)
      : super(_value, _then);

  /// Create a copy of StartStreamEvent
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
    return 'StartStreamEvent.sendAnswer(request: $request)';
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

  /// Create a copy of StartStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendAnswerImplCopyWith<_$SendAnswerImpl> get copyWith =>
      __$$SendAnswerImplCopyWithImpl<_$SendAnswerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
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
    TResult? Function()? started,
    TResult? Function(MainSendAnswerRequestModelById request)? sendAnswer,
    TResult? Function(MainSendCandidateRequestModelById request)? sendCandidate,
  }) {
    return sendAnswer?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
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
    required TResult Function(_Started value) started,
    required TResult Function(_SendAnswer value) sendAnswer,
    required TResult Function(_SendCandidate value) sendCandidate,
  }) {
    return sendAnswer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SendAnswer value)? sendAnswer,
    TResult? Function(_SendCandidate value)? sendCandidate,
  }) {
    return sendAnswer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
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

abstract class _SendAnswer implements StartStreamEvent {
  const factory _SendAnswer(final MainSendAnswerRequestModelById request) =
      _$SendAnswerImpl;

  MainSendAnswerRequestModelById get request;

  /// Create a copy of StartStreamEvent
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
    extends _$StartStreamEventCopyWithImpl<$Res, _$SendCandidateImpl>
    implements _$$SendCandidateImplCopyWith<$Res> {
  __$$SendCandidateImplCopyWithImpl(
      _$SendCandidateImpl _value, $Res Function(_$SendCandidateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StartStreamEvent
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
    return 'StartStreamEvent.sendCandidate(request: $request)';
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

  /// Create a copy of StartStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendCandidateImplCopyWith<_$SendCandidateImpl> get copyWith =>
      __$$SendCandidateImplCopyWithImpl<_$SendCandidateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
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
    TResult? Function()? started,
    TResult? Function(MainSendAnswerRequestModelById request)? sendAnswer,
    TResult? Function(MainSendCandidateRequestModelById request)? sendCandidate,
  }) {
    return sendCandidate?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
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
    required TResult Function(_Started value) started,
    required TResult Function(_SendAnswer value) sendAnswer,
    required TResult Function(_SendCandidate value) sendCandidate,
  }) {
    return sendCandidate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SendAnswer value)? sendAnswer,
    TResult? Function(_SendCandidate value)? sendCandidate,
  }) {
    return sendCandidate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
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

abstract class _SendCandidate implements StartStreamEvent {
  const factory _SendCandidate(
      final MainSendCandidateRequestModelById request) = _$SendCandidateImpl;

  MainSendCandidateRequestModelById get request;

  /// Create a copy of StartStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendCandidateImplCopyWith<_$SendCandidateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
