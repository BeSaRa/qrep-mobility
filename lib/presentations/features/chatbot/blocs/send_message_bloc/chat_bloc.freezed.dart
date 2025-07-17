// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SendMessageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ChatbotRequestModel message) started,
    required TResult Function(PlatformChatbotRequestModel platformMessage)
        platformStarted,
    required TResult Function(NewChatbotResponseModel chunk) streamDataReceived,
    required TResult Function() streamComplete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ChatbotRequestModel message)? started,
    TResult? Function(PlatformChatbotRequestModel platformMessage)?
        platformStarted,
    TResult? Function(NewChatbotResponseModel chunk)? streamDataReceived,
    TResult? Function()? streamComplete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChatbotRequestModel message)? started,
    TResult Function(PlatformChatbotRequestModel platformMessage)?
        platformStarted,
    TResult Function(NewChatbotResponseModel chunk)? streamDataReceived,
    TResult Function()? streamComplete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_PlatformStarted value) platformStarted,
    required TResult Function(_StreamDataReceived value) streamDataReceived,
    required TResult Function(_StreamComplete value) streamComplete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_PlatformStarted value)? platformStarted,
    TResult? Function(_StreamDataReceived value)? streamDataReceived,
    TResult? Function(_StreamComplete value)? streamComplete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_PlatformStarted value)? platformStarted,
    TResult Function(_StreamDataReceived value)? streamDataReceived,
    TResult Function(_StreamComplete value)? streamComplete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendMessageEventCopyWith<$Res> {
  factory $SendMessageEventCopyWith(
          SendMessageEvent value, $Res Function(SendMessageEvent) then) =
      _$SendMessageEventCopyWithImpl<$Res, SendMessageEvent>;
}

/// @nodoc
class _$SendMessageEventCopyWithImpl<$Res, $Val extends SendMessageEvent>
    implements $SendMessageEventCopyWith<$Res> {
  _$SendMessageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendMessageEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChatbotRequestModel message});

  $ChatbotRequestModelCopyWith<$Res> get message;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$SendMessageEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendMessageEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$StartedImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as ChatbotRequestModel,
    ));
  }

  /// Create a copy of SendMessageEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatbotRequestModelCopyWith<$Res> get message {
    return $ChatbotRequestModelCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value));
    });
  }
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl(this.message);

  @override
  final ChatbotRequestModel message;

  @override
  String toString() {
    return 'SendMessageEvent.started(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of SendMessageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      __$$StartedImplCopyWithImpl<_$StartedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ChatbotRequestModel message) started,
    required TResult Function(PlatformChatbotRequestModel platformMessage)
        platformStarted,
    required TResult Function(NewChatbotResponseModel chunk) streamDataReceived,
    required TResult Function() streamComplete,
  }) {
    return started(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ChatbotRequestModel message)? started,
    TResult? Function(PlatformChatbotRequestModel platformMessage)?
        platformStarted,
    TResult? Function(NewChatbotResponseModel chunk)? streamDataReceived,
    TResult? Function()? streamComplete,
  }) {
    return started?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChatbotRequestModel message)? started,
    TResult Function(PlatformChatbotRequestModel platformMessage)?
        platformStarted,
    TResult Function(NewChatbotResponseModel chunk)? streamDataReceived,
    TResult Function()? streamComplete,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_PlatformStarted value) platformStarted,
    required TResult Function(_StreamDataReceived value) streamDataReceived,
    required TResult Function(_StreamComplete value) streamComplete,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_PlatformStarted value)? platformStarted,
    TResult? Function(_StreamDataReceived value)? streamDataReceived,
    TResult? Function(_StreamComplete value)? streamComplete,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_PlatformStarted value)? platformStarted,
    TResult Function(_StreamDataReceived value)? streamDataReceived,
    TResult Function(_StreamComplete value)? streamComplete,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements SendMessageEvent {
  const factory _Started(final ChatbotRequestModel message) = _$StartedImpl;

  ChatbotRequestModel get message;

  /// Create a copy of SendMessageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlatformStartedImplCopyWith<$Res> {
  factory _$$PlatformStartedImplCopyWith(_$PlatformStartedImpl value,
          $Res Function(_$PlatformStartedImpl) then) =
      __$$PlatformStartedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PlatformChatbotRequestModel platformMessage});

  $PlatformChatbotRequestModelCopyWith<$Res> get platformMessage;
}

/// @nodoc
class __$$PlatformStartedImplCopyWithImpl<$Res>
    extends _$SendMessageEventCopyWithImpl<$Res, _$PlatformStartedImpl>
    implements _$$PlatformStartedImplCopyWith<$Res> {
  __$$PlatformStartedImplCopyWithImpl(
      _$PlatformStartedImpl _value, $Res Function(_$PlatformStartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendMessageEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platformMessage = null,
  }) {
    return _then(_$PlatformStartedImpl(
      null == platformMessage
          ? _value.platformMessage
          : platformMessage // ignore: cast_nullable_to_non_nullable
              as PlatformChatbotRequestModel,
    ));
  }

  /// Create a copy of SendMessageEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlatformChatbotRequestModelCopyWith<$Res> get platformMessage {
    return $PlatformChatbotRequestModelCopyWith<$Res>(_value.platformMessage,
        (value) {
      return _then(_value.copyWith(platformMessage: value));
    });
  }
}

/// @nodoc

class _$PlatformStartedImpl implements _PlatformStarted {
  const _$PlatformStartedImpl(this.platformMessage);

  @override
  final PlatformChatbotRequestModel platformMessage;

  @override
  String toString() {
    return 'SendMessageEvent.platformStarted(platformMessage: $platformMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlatformStartedImpl &&
            (identical(other.platformMessage, platformMessage) ||
                other.platformMessage == platformMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, platformMessage);

  /// Create a copy of SendMessageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlatformStartedImplCopyWith<_$PlatformStartedImpl> get copyWith =>
      __$$PlatformStartedImplCopyWithImpl<_$PlatformStartedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ChatbotRequestModel message) started,
    required TResult Function(PlatformChatbotRequestModel platformMessage)
        platformStarted,
    required TResult Function(NewChatbotResponseModel chunk) streamDataReceived,
    required TResult Function() streamComplete,
  }) {
    return platformStarted(platformMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ChatbotRequestModel message)? started,
    TResult? Function(PlatformChatbotRequestModel platformMessage)?
        platformStarted,
    TResult? Function(NewChatbotResponseModel chunk)? streamDataReceived,
    TResult? Function()? streamComplete,
  }) {
    return platformStarted?.call(platformMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChatbotRequestModel message)? started,
    TResult Function(PlatformChatbotRequestModel platformMessage)?
        platformStarted,
    TResult Function(NewChatbotResponseModel chunk)? streamDataReceived,
    TResult Function()? streamComplete,
    required TResult orElse(),
  }) {
    if (platformStarted != null) {
      return platformStarted(platformMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_PlatformStarted value) platformStarted,
    required TResult Function(_StreamDataReceived value) streamDataReceived,
    required TResult Function(_StreamComplete value) streamComplete,
  }) {
    return platformStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_PlatformStarted value)? platformStarted,
    TResult? Function(_StreamDataReceived value)? streamDataReceived,
    TResult? Function(_StreamComplete value)? streamComplete,
  }) {
    return platformStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_PlatformStarted value)? platformStarted,
    TResult Function(_StreamDataReceived value)? streamDataReceived,
    TResult Function(_StreamComplete value)? streamComplete,
    required TResult orElse(),
  }) {
    if (platformStarted != null) {
      return platformStarted(this);
    }
    return orElse();
  }
}

abstract class _PlatformStarted implements SendMessageEvent {
  const factory _PlatformStarted(
          final PlatformChatbotRequestModel platformMessage) =
      _$PlatformStartedImpl;

  PlatformChatbotRequestModel get platformMessage;

  /// Create a copy of SendMessageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlatformStartedImplCopyWith<_$PlatformStartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StreamDataReceivedImplCopyWith<$Res> {
  factory _$$StreamDataReceivedImplCopyWith(_$StreamDataReceivedImpl value,
          $Res Function(_$StreamDataReceivedImpl) then) =
      __$$StreamDataReceivedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NewChatbotResponseModel chunk});

  $NewChatbotResponseModelCopyWith<$Res> get chunk;
}

/// @nodoc
class __$$StreamDataReceivedImplCopyWithImpl<$Res>
    extends _$SendMessageEventCopyWithImpl<$Res, _$StreamDataReceivedImpl>
    implements _$$StreamDataReceivedImplCopyWith<$Res> {
  __$$StreamDataReceivedImplCopyWithImpl(_$StreamDataReceivedImpl _value,
      $Res Function(_$StreamDataReceivedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendMessageEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chunk = null,
  }) {
    return _then(_$StreamDataReceivedImpl(
      null == chunk
          ? _value.chunk
          : chunk // ignore: cast_nullable_to_non_nullable
              as NewChatbotResponseModel,
    ));
  }

  /// Create a copy of SendMessageEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NewChatbotResponseModelCopyWith<$Res> get chunk {
    return $NewChatbotResponseModelCopyWith<$Res>(_value.chunk, (value) {
      return _then(_value.copyWith(chunk: value));
    });
  }
}

/// @nodoc

class _$StreamDataReceivedImpl implements _StreamDataReceived {
  const _$StreamDataReceivedImpl(this.chunk);

  @override
  final NewChatbotResponseModel chunk;

  @override
  String toString() {
    return 'SendMessageEvent.streamDataReceived(chunk: $chunk)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreamDataReceivedImpl &&
            (identical(other.chunk, chunk) || other.chunk == chunk));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chunk);

  /// Create a copy of SendMessageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StreamDataReceivedImplCopyWith<_$StreamDataReceivedImpl> get copyWith =>
      __$$StreamDataReceivedImplCopyWithImpl<_$StreamDataReceivedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ChatbotRequestModel message) started,
    required TResult Function(PlatformChatbotRequestModel platformMessage)
        platformStarted,
    required TResult Function(NewChatbotResponseModel chunk) streamDataReceived,
    required TResult Function() streamComplete,
  }) {
    return streamDataReceived(chunk);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ChatbotRequestModel message)? started,
    TResult? Function(PlatformChatbotRequestModel platformMessage)?
        platformStarted,
    TResult? Function(NewChatbotResponseModel chunk)? streamDataReceived,
    TResult? Function()? streamComplete,
  }) {
    return streamDataReceived?.call(chunk);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChatbotRequestModel message)? started,
    TResult Function(PlatformChatbotRequestModel platformMessage)?
        platformStarted,
    TResult Function(NewChatbotResponseModel chunk)? streamDataReceived,
    TResult Function()? streamComplete,
    required TResult orElse(),
  }) {
    if (streamDataReceived != null) {
      return streamDataReceived(chunk);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_PlatformStarted value) platformStarted,
    required TResult Function(_StreamDataReceived value) streamDataReceived,
    required TResult Function(_StreamComplete value) streamComplete,
  }) {
    return streamDataReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_PlatformStarted value)? platformStarted,
    TResult? Function(_StreamDataReceived value)? streamDataReceived,
    TResult? Function(_StreamComplete value)? streamComplete,
  }) {
    return streamDataReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_PlatformStarted value)? platformStarted,
    TResult Function(_StreamDataReceived value)? streamDataReceived,
    TResult Function(_StreamComplete value)? streamComplete,
    required TResult orElse(),
  }) {
    if (streamDataReceived != null) {
      return streamDataReceived(this);
    }
    return orElse();
  }
}

abstract class _StreamDataReceived implements SendMessageEvent {
  const factory _StreamDataReceived(final NewChatbotResponseModel chunk) =
      _$StreamDataReceivedImpl;

  NewChatbotResponseModel get chunk;

  /// Create a copy of SendMessageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StreamDataReceivedImplCopyWith<_$StreamDataReceivedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StreamCompleteImplCopyWith<$Res> {
  factory _$$StreamCompleteImplCopyWith(_$StreamCompleteImpl value,
          $Res Function(_$StreamCompleteImpl) then) =
      __$$StreamCompleteImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StreamCompleteImplCopyWithImpl<$Res>
    extends _$SendMessageEventCopyWithImpl<$Res, _$StreamCompleteImpl>
    implements _$$StreamCompleteImplCopyWith<$Res> {
  __$$StreamCompleteImplCopyWithImpl(
      _$StreamCompleteImpl _value, $Res Function(_$StreamCompleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendMessageEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StreamCompleteImpl implements _StreamComplete {
  const _$StreamCompleteImpl();

  @override
  String toString() {
    return 'SendMessageEvent.streamComplete()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StreamCompleteImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ChatbotRequestModel message) started,
    required TResult Function(PlatformChatbotRequestModel platformMessage)
        platformStarted,
    required TResult Function(NewChatbotResponseModel chunk) streamDataReceived,
    required TResult Function() streamComplete,
  }) {
    return streamComplete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ChatbotRequestModel message)? started,
    TResult? Function(PlatformChatbotRequestModel platformMessage)?
        platformStarted,
    TResult? Function(NewChatbotResponseModel chunk)? streamDataReceived,
    TResult? Function()? streamComplete,
  }) {
    return streamComplete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChatbotRequestModel message)? started,
    TResult Function(PlatformChatbotRequestModel platformMessage)?
        platformStarted,
    TResult Function(NewChatbotResponseModel chunk)? streamDataReceived,
    TResult Function()? streamComplete,
    required TResult orElse(),
  }) {
    if (streamComplete != null) {
      return streamComplete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_PlatformStarted value) platformStarted,
    required TResult Function(_StreamDataReceived value) streamDataReceived,
    required TResult Function(_StreamComplete value) streamComplete,
  }) {
    return streamComplete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_PlatformStarted value)? platformStarted,
    TResult? Function(_StreamDataReceived value)? streamDataReceived,
    TResult? Function(_StreamComplete value)? streamComplete,
  }) {
    return streamComplete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_PlatformStarted value)? platformStarted,
    TResult Function(_StreamDataReceived value)? streamDataReceived,
    TResult Function(_StreamComplete value)? streamComplete,
    required TResult orElse(),
  }) {
    if (streamComplete != null) {
      return streamComplete(this);
    }
    return orElse();
  }
}

abstract class _StreamComplete implements SendMessageEvent {
  const factory _StreamComplete() = _$StreamCompleteImpl;
}

/// @nodoc
mixin _$ChatBotState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            String accumulatedContent,
            List<DocumentModel> citations,
            String conversationId,
            String streamId,
            String userId,
            List<ActionResult> actionResults)
        streaming,
    required TResult Function(NewChatbotResponseModel? response,
            PlatformChatbotResponseModel? platformResponse)
        done,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            String accumulatedContent,
            List<DocumentModel> citations,
            String conversationId,
            String streamId,
            String userId,
            List<ActionResult> actionResults)?
        streaming,
    TResult? Function(NewChatbotResponseModel? response,
            PlatformChatbotResponseModel? platformResponse)?
        done,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            String accumulatedContent,
            List<DocumentModel> citations,
            String conversationId,
            String streamId,
            String userId,
            List<ActionResult> actionResults)?
        streaming,
    TResult Function(NewChatbotResponseModel? response,
            PlatformChatbotResponseModel? platformResponse)?
        done,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Streaming value) streaming,
    required TResult Function(_Done value) done,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Streaming value)? streaming,
    TResult? Function(_Done value)? done,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Streaming value)? streaming,
    TResult Function(_Done value)? done,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatBotStateCopyWith<$Res> {
  factory $ChatBotStateCopyWith(
          ChatBotState value, $Res Function(ChatBotState) then) =
      _$ChatBotStateCopyWithImpl<$Res, ChatBotState>;
}

/// @nodoc
class _$ChatBotStateCopyWithImpl<$Res, $Val extends ChatBotState>
    implements $ChatBotStateCopyWith<$Res> {
  _$ChatBotStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatBotState
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
    extends _$ChatBotStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatBotState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ChatBotState.initial()';
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
    required TResult Function(
            String accumulatedContent,
            List<DocumentModel> citations,
            String conversationId,
            String streamId,
            String userId,
            List<ActionResult> actionResults)
        streaming,
    required TResult Function(NewChatbotResponseModel? response,
            PlatformChatbotResponseModel? platformResponse)
        done,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            String accumulatedContent,
            List<DocumentModel> citations,
            String conversationId,
            String streamId,
            String userId,
            List<ActionResult> actionResults)?
        streaming,
    TResult? Function(NewChatbotResponseModel? response,
            PlatformChatbotResponseModel? platformResponse)?
        done,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            String accumulatedContent,
            List<DocumentModel> citations,
            String conversationId,
            String streamId,
            String userId,
            List<ActionResult> actionResults)?
        streaming,
    TResult Function(NewChatbotResponseModel? response,
            PlatformChatbotResponseModel? platformResponse)?
        done,
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
    required TResult Function(_Streaming value) streaming,
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
    TResult? Function(_Streaming value)? streaming,
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
    TResult Function(_Streaming value)? streaming,
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

abstract class _Initial implements ChatBotState {
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
    extends _$ChatBotStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatBotState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ChatBotState.loading()';
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
    required TResult Function(
            String accumulatedContent,
            List<DocumentModel> citations,
            String conversationId,
            String streamId,
            String userId,
            List<ActionResult> actionResults)
        streaming,
    required TResult Function(NewChatbotResponseModel? response,
            PlatformChatbotResponseModel? platformResponse)
        done,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            String accumulatedContent,
            List<DocumentModel> citations,
            String conversationId,
            String streamId,
            String userId,
            List<ActionResult> actionResults)?
        streaming,
    TResult? Function(NewChatbotResponseModel? response,
            PlatformChatbotResponseModel? platformResponse)?
        done,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            String accumulatedContent,
            List<DocumentModel> citations,
            String conversationId,
            String streamId,
            String userId,
            List<ActionResult> actionResults)?
        streaming,
    TResult Function(NewChatbotResponseModel? response,
            PlatformChatbotResponseModel? platformResponse)?
        done,
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
    required TResult Function(_Streaming value) streaming,
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
    TResult? Function(_Streaming value)? streaming,
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
    TResult Function(_Streaming value)? streaming,
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

abstract class _Loading implements ChatBotState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$StreamingImplCopyWith<$Res> {
  factory _$$StreamingImplCopyWith(
          _$StreamingImpl value, $Res Function(_$StreamingImpl) then) =
      __$$StreamingImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String accumulatedContent,
      List<DocumentModel> citations,
      String conversationId,
      String streamId,
      String userId,
      List<ActionResult> actionResults});
}

/// @nodoc
class __$$StreamingImplCopyWithImpl<$Res>
    extends _$ChatBotStateCopyWithImpl<$Res, _$StreamingImpl>
    implements _$$StreamingImplCopyWith<$Res> {
  __$$StreamingImplCopyWithImpl(
      _$StreamingImpl _value, $Res Function(_$StreamingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatBotState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accumulatedContent = null,
    Object? citations = null,
    Object? conversationId = null,
    Object? streamId = null,
    Object? userId = null,
    Object? actionResults = null,
  }) {
    return _then(_$StreamingImpl(
      accumulatedContent: null == accumulatedContent
          ? _value.accumulatedContent
          : accumulatedContent // ignore: cast_nullable_to_non_nullable
              as String,
      citations: null == citations
          ? _value._citations
          : citations // ignore: cast_nullable_to_non_nullable
              as List<DocumentModel>,
      conversationId: null == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as String,
      streamId: null == streamId
          ? _value.streamId
          : streamId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      actionResults: null == actionResults
          ? _value._actionResults
          : actionResults // ignore: cast_nullable_to_non_nullable
              as List<ActionResult>,
    ));
  }
}

/// @nodoc

class _$StreamingImpl implements _Streaming {
  const _$StreamingImpl(
      {required this.accumulatedContent,
      required final List<DocumentModel> citations,
      required this.conversationId,
      required this.streamId,
      required this.userId,
      required final List<ActionResult> actionResults})
      : _citations = citations,
        _actionResults = actionResults;

  @override
  final String accumulatedContent;
  final List<DocumentModel> _citations;
  @override
  List<DocumentModel> get citations {
    if (_citations is EqualUnmodifiableListView) return _citations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_citations);
  }

  @override
  final String conversationId;
  @override
  final String streamId;
  @override
  final String userId;
  final List<ActionResult> _actionResults;
  @override
  List<ActionResult> get actionResults {
    if (_actionResults is EqualUnmodifiableListView) return _actionResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actionResults);
  }

  @override
  String toString() {
    return 'ChatBotState.streaming(accumulatedContent: $accumulatedContent, citations: $citations, conversationId: $conversationId, streamId: $streamId, userId: $userId, actionResults: $actionResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreamingImpl &&
            (identical(other.accumulatedContent, accumulatedContent) ||
                other.accumulatedContent == accumulatedContent) &&
            const DeepCollectionEquality()
                .equals(other._citations, _citations) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.streamId, streamId) ||
                other.streamId == streamId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality()
                .equals(other._actionResults, _actionResults));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      accumulatedContent,
      const DeepCollectionEquality().hash(_citations),
      conversationId,
      streamId,
      userId,
      const DeepCollectionEquality().hash(_actionResults));

  /// Create a copy of ChatBotState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StreamingImplCopyWith<_$StreamingImpl> get copyWith =>
      __$$StreamingImplCopyWithImpl<_$StreamingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            String accumulatedContent,
            List<DocumentModel> citations,
            String conversationId,
            String streamId,
            String userId,
            List<ActionResult> actionResults)
        streaming,
    required TResult Function(NewChatbotResponseModel? response,
            PlatformChatbotResponseModel? platformResponse)
        done,
    required TResult Function(String message) error,
  }) {
    return streaming(accumulatedContent, citations, conversationId, streamId,
        userId, actionResults);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            String accumulatedContent,
            List<DocumentModel> citations,
            String conversationId,
            String streamId,
            String userId,
            List<ActionResult> actionResults)?
        streaming,
    TResult? Function(NewChatbotResponseModel? response,
            PlatformChatbotResponseModel? platformResponse)?
        done,
    TResult? Function(String message)? error,
  }) {
    return streaming?.call(accumulatedContent, citations, conversationId,
        streamId, userId, actionResults);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            String accumulatedContent,
            List<DocumentModel> citations,
            String conversationId,
            String streamId,
            String userId,
            List<ActionResult> actionResults)?
        streaming,
    TResult Function(NewChatbotResponseModel? response,
            PlatformChatbotResponseModel? platformResponse)?
        done,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (streaming != null) {
      return streaming(accumulatedContent, citations, conversationId, streamId,
          userId, actionResults);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Streaming value) streaming,
    required TResult Function(_Done value) done,
    required TResult Function(_Error value) error,
  }) {
    return streaming(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Streaming value)? streaming,
    TResult? Function(_Done value)? done,
    TResult? Function(_Error value)? error,
  }) {
    return streaming?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Streaming value)? streaming,
    TResult Function(_Done value)? done,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (streaming != null) {
      return streaming(this);
    }
    return orElse();
  }
}

abstract class _Streaming implements ChatBotState {
  const factory _Streaming(
      {required final String accumulatedContent,
      required final List<DocumentModel> citations,
      required final String conversationId,
      required final String streamId,
      required final String userId,
      required final List<ActionResult> actionResults}) = _$StreamingImpl;

  String get accumulatedContent;
  List<DocumentModel> get citations;
  String get conversationId;
  String get streamId;
  String get userId;
  List<ActionResult> get actionResults;

  /// Create a copy of ChatBotState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StreamingImplCopyWith<_$StreamingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DoneImplCopyWith<$Res> {
  factory _$$DoneImplCopyWith(
          _$DoneImpl value, $Res Function(_$DoneImpl) then) =
      __$$DoneImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {NewChatbotResponseModel? response,
      PlatformChatbotResponseModel? platformResponse});

  $NewChatbotResponseModelCopyWith<$Res>? get response;
  $PlatformChatbotResponseModelCopyWith<$Res>? get platformResponse;
}

/// @nodoc
class __$$DoneImplCopyWithImpl<$Res>
    extends _$ChatBotStateCopyWithImpl<$Res, _$DoneImpl>
    implements _$$DoneImplCopyWith<$Res> {
  __$$DoneImplCopyWithImpl(_$DoneImpl _value, $Res Function(_$DoneImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatBotState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
    Object? platformResponse = freezed,
  }) {
    return _then(_$DoneImpl(
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as NewChatbotResponseModel?,
      platformResponse: freezed == platformResponse
          ? _value.platformResponse
          : platformResponse // ignore: cast_nullable_to_non_nullable
              as PlatformChatbotResponseModel?,
    ));
  }

  /// Create a copy of ChatBotState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NewChatbotResponseModelCopyWith<$Res>? get response {
    if (_value.response == null) {
      return null;
    }

    return $NewChatbotResponseModelCopyWith<$Res>(_value.response!, (value) {
      return _then(_value.copyWith(response: value));
    });
  }

  /// Create a copy of ChatBotState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlatformChatbotResponseModelCopyWith<$Res>? get platformResponse {
    if (_value.platformResponse == null) {
      return null;
    }

    return $PlatformChatbotResponseModelCopyWith<$Res>(_value.platformResponse!,
        (value) {
      return _then(_value.copyWith(platformResponse: value));
    });
  }
}

/// @nodoc

class _$DoneImpl implements _Done {
  const _$DoneImpl({this.response, this.platformResponse});

  @override
  final NewChatbotResponseModel? response;
  @override
  final PlatformChatbotResponseModel? platformResponse;

  @override
  String toString() {
    return 'ChatBotState.done(response: $response, platformResponse: $platformResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoneImpl &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.platformResponse, platformResponse) ||
                other.platformResponse == platformResponse));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response, platformResponse);

  /// Create a copy of ChatBotState
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
    required TResult Function(
            String accumulatedContent,
            List<DocumentModel> citations,
            String conversationId,
            String streamId,
            String userId,
            List<ActionResult> actionResults)
        streaming,
    required TResult Function(NewChatbotResponseModel? response,
            PlatformChatbotResponseModel? platformResponse)
        done,
    required TResult Function(String message) error,
  }) {
    return done(response, platformResponse);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            String accumulatedContent,
            List<DocumentModel> citations,
            String conversationId,
            String streamId,
            String userId,
            List<ActionResult> actionResults)?
        streaming,
    TResult? Function(NewChatbotResponseModel? response,
            PlatformChatbotResponseModel? platformResponse)?
        done,
    TResult? Function(String message)? error,
  }) {
    return done?.call(response, platformResponse);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            String accumulatedContent,
            List<DocumentModel> citations,
            String conversationId,
            String streamId,
            String userId,
            List<ActionResult> actionResults)?
        streaming,
    TResult Function(NewChatbotResponseModel? response,
            PlatformChatbotResponseModel? platformResponse)?
        done,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(response, platformResponse);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Streaming value) streaming,
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
    TResult? Function(_Streaming value)? streaming,
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
    TResult Function(_Streaming value)? streaming,
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

abstract class _Done implements ChatBotState {
  const factory _Done(
      {final NewChatbotResponseModel? response,
      final PlatformChatbotResponseModel? platformResponse}) = _$DoneImpl;

  NewChatbotResponseModel? get response;
  PlatformChatbotResponseModel? get platformResponse;

  /// Create a copy of ChatBotState
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
    extends _$ChatBotStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatBotState
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
    return 'ChatBotState.error(message: $message)';
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

  /// Create a copy of ChatBotState
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
    required TResult Function(
            String accumulatedContent,
            List<DocumentModel> citations,
            String conversationId,
            String streamId,
            String userId,
            List<ActionResult> actionResults)
        streaming,
    required TResult Function(NewChatbotResponseModel? response,
            PlatformChatbotResponseModel? platformResponse)
        done,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            String accumulatedContent,
            List<DocumentModel> citations,
            String conversationId,
            String streamId,
            String userId,
            List<ActionResult> actionResults)?
        streaming,
    TResult? Function(NewChatbotResponseModel? response,
            PlatformChatbotResponseModel? platformResponse)?
        done,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            String accumulatedContent,
            List<DocumentModel> citations,
            String conversationId,
            String streamId,
            String userId,
            List<ActionResult> actionResults)?
        streaming,
    TResult Function(NewChatbotResponseModel? response,
            PlatformChatbotResponseModel? platformResponse)?
        done,
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
    required TResult Function(_Streaming value) streaming,
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
    TResult? Function(_Streaming value)? streaming,
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
    TResult Function(_Streaming value)? streaming,
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

abstract class _Error implements ChatBotState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of ChatBotState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
