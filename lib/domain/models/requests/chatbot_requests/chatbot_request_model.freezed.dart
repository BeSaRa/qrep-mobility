// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chatbot_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatbotRequestModel _$ChatbotRequestModelFromJson(Map<String, dynamic> json) {
  return _ChatbotRequestModel.fromJson(json);
}

/// @nodoc
mixin _$ChatbotRequestModel {
  @JsonKey(name: "stream_id")
  String? get streamId => throw _privateConstructorUsedError;
  List<MessageRequestModel> get messages => throw _privateConstructorUsedError;

  /// Serializes this ChatbotRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatbotRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatbotRequestModelCopyWith<ChatbotRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatbotRequestModelCopyWith<$Res> {
  factory $ChatbotRequestModelCopyWith(
          ChatbotRequestModel value, $Res Function(ChatbotRequestModel) then) =
      _$ChatbotRequestModelCopyWithImpl<$Res, ChatbotRequestModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "stream_id") String? streamId,
      List<MessageRequestModel> messages});
}

/// @nodoc
class _$ChatbotRequestModelCopyWithImpl<$Res, $Val extends ChatbotRequestModel>
    implements $ChatbotRequestModelCopyWith<$Res> {
  _$ChatbotRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatbotRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streamId = freezed,
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      streamId: freezed == streamId
          ? _value.streamId
          : streamId // ignore: cast_nullable_to_non_nullable
              as String?,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageRequestModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatbotRequestModelImplCopyWith<$Res>
    implements $ChatbotRequestModelCopyWith<$Res> {
  factory _$$ChatbotRequestModelImplCopyWith(_$ChatbotRequestModelImpl value,
          $Res Function(_$ChatbotRequestModelImpl) then) =
      __$$ChatbotRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "stream_id") String? streamId,
      List<MessageRequestModel> messages});
}

/// @nodoc
class __$$ChatbotRequestModelImplCopyWithImpl<$Res>
    extends _$ChatbotRequestModelCopyWithImpl<$Res, _$ChatbotRequestModelImpl>
    implements _$$ChatbotRequestModelImplCopyWith<$Res> {
  __$$ChatbotRequestModelImplCopyWithImpl(_$ChatbotRequestModelImpl _value,
      $Res Function(_$ChatbotRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatbotRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streamId = freezed,
    Object? messages = null,
  }) {
    return _then(_$ChatbotRequestModelImpl(
      streamId: freezed == streamId
          ? _value.streamId
          : streamId // ignore: cast_nullable_to_non_nullable
              as String?,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageRequestModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatbotRequestModelImpl implements _ChatbotRequestModel {
  const _$ChatbotRequestModelImpl(
      {@JsonKey(name: "stream_id") this.streamId = '',
      final List<MessageRequestModel> messages = const []})
      : _messages = messages;

  factory _$ChatbotRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatbotRequestModelImplFromJson(json);

  @override
  @JsonKey(name: "stream_id")
  final String? streamId;
  final List<MessageRequestModel> _messages;
  @override
  @JsonKey()
  List<MessageRequestModel> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'ChatbotRequestModel(streamId: $streamId, messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatbotRequestModelImpl &&
            (identical(other.streamId, streamId) ||
                other.streamId == streamId) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, streamId, const DeepCollectionEquality().hash(_messages));

  /// Create a copy of ChatbotRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatbotRequestModelImplCopyWith<_$ChatbotRequestModelImpl> get copyWith =>
      __$$ChatbotRequestModelImplCopyWithImpl<_$ChatbotRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatbotRequestModelImplToJson(
      this,
    );
  }
}

abstract class _ChatbotRequestModel implements ChatbotRequestModel {
  const factory _ChatbotRequestModel(
      {@JsonKey(name: "stream_id") final String? streamId,
      final List<MessageRequestModel> messages}) = _$ChatbotRequestModelImpl;

  factory _ChatbotRequestModel.fromJson(Map<String, dynamic> json) =
      _$ChatbotRequestModelImpl.fromJson;

  @override
  @JsonKey(name: "stream_id")
  String? get streamId;
  @override
  List<MessageRequestModel> get messages;

  /// Create a copy of ChatbotRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatbotRequestModelImplCopyWith<_$ChatbotRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MessageRequestModel _$MessageRequestModelFromJson(Map<String, dynamic> json) {
  return _MessageRequestModel.fromJson(json);
}

/// @nodoc
mixin _$MessageRequestModel {
  String get role => throw _privateConstructorUsedError;
  String? get authorityConvId => throw _privateConstructorUsedError;
  @JsonKey(name: "context")
  ContextModel? get contextData =>
      throw _privateConstructorUsedError; //it' dynamic for the platform chat
  dynamic get content => throw _privateConstructorUsedError;

  /// Serializes this MessageRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageRequestModelCopyWith<MessageRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageRequestModelCopyWith<$Res> {
  factory $MessageRequestModelCopyWith(
          MessageRequestModel value, $Res Function(MessageRequestModel) then) =
      _$MessageRequestModelCopyWithImpl<$Res, MessageRequestModel>;
  @useResult
  $Res call(
      {String role,
      String? authorityConvId,
      @JsonKey(name: "context") ContextModel? contextData,
      dynamic content});

  $ContextModelCopyWith<$Res>? get contextData;
}

/// @nodoc
class _$MessageRequestModelCopyWithImpl<$Res, $Val extends MessageRequestModel>
    implements $MessageRequestModelCopyWith<$Res> {
  _$MessageRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? authorityConvId = freezed,
    Object? contextData = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      authorityConvId: freezed == authorityConvId
          ? _value.authorityConvId
          : authorityConvId // ignore: cast_nullable_to_non_nullable
              as String?,
      contextData: freezed == contextData
          ? _value.contextData
          : contextData // ignore: cast_nullable_to_non_nullable
              as ContextModel?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  /// Create a copy of MessageRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContextModelCopyWith<$Res>? get contextData {
    if (_value.contextData == null) {
      return null;
    }

    return $ContextModelCopyWith<$Res>(_value.contextData!, (value) {
      return _then(_value.copyWith(contextData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessageRequestModelImplCopyWith<$Res>
    implements $MessageRequestModelCopyWith<$Res> {
  factory _$$MessageRequestModelImplCopyWith(_$MessageRequestModelImpl value,
          $Res Function(_$MessageRequestModelImpl) then) =
      __$$MessageRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String role,
      String? authorityConvId,
      @JsonKey(name: "context") ContextModel? contextData,
      dynamic content});

  @override
  $ContextModelCopyWith<$Res>? get contextData;
}

/// @nodoc
class __$$MessageRequestModelImplCopyWithImpl<$Res>
    extends _$MessageRequestModelCopyWithImpl<$Res, _$MessageRequestModelImpl>
    implements _$$MessageRequestModelImplCopyWith<$Res> {
  __$$MessageRequestModelImplCopyWithImpl(_$MessageRequestModelImpl _value,
      $Res Function(_$MessageRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? authorityConvId = freezed,
    Object? contextData = freezed,
    Object? content = freezed,
  }) {
    return _then(_$MessageRequestModelImpl(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      authorityConvId: freezed == authorityConvId
          ? _value.authorityConvId
          : authorityConvId // ignore: cast_nullable_to_non_nullable
              as String?,
      contextData: freezed == contextData
          ? _value.contextData
          : contextData // ignore: cast_nullable_to_non_nullable
              as ContextModel?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageRequestModelImpl implements _MessageRequestModel {
  const _$MessageRequestModelImpl(
      {this.role = '',
      this.authorityConvId = null,
      @JsonKey(name: "context") this.contextData = null,
      this.content = ''});

  factory _$MessageRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageRequestModelImplFromJson(json);

  @override
  @JsonKey()
  final String role;
  @override
  @JsonKey()
  final String? authorityConvId;
  @override
  @JsonKey(name: "context")
  final ContextModel? contextData;
//it' dynamic for the platform chat
  @override
  @JsonKey()
  final dynamic content;

  @override
  String toString() {
    return 'MessageRequestModel(role: $role, authorityConvId: $authorityConvId, contextData: $contextData, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageRequestModelImpl &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.authorityConvId, authorityConvId) ||
                other.authorityConvId == authorityConvId) &&
            (identical(other.contextData, contextData) ||
                other.contextData == contextData) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, role, authorityConvId,
      contextData, const DeepCollectionEquality().hash(content));

  /// Create a copy of MessageRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageRequestModelImplCopyWith<_$MessageRequestModelImpl> get copyWith =>
      __$$MessageRequestModelImplCopyWithImpl<_$MessageRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageRequestModelImplToJson(
      this,
    );
  }
}

abstract class _MessageRequestModel implements MessageRequestModel {
  const factory _MessageRequestModel(
      {final String role,
      final String? authorityConvId,
      @JsonKey(name: "context") final ContextModel? contextData,
      final dynamic content}) = _$MessageRequestModelImpl;

  factory _MessageRequestModel.fromJson(Map<String, dynamic> json) =
      _$MessageRequestModelImpl.fromJson;

  @override
  String get role;
  @override
  String? get authorityConvId;
  @override
  @JsonKey(name: "context")
  ContextModel? get contextData; //it' dynamic for the platform chat
  @override
  dynamic get content;

  /// Create a copy of MessageRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageRequestModelImplCopyWith<_$MessageRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MainSendAnswerRequestModel _$MainSendAnswerRequestModelFromJson(
    Map<String, dynamic> json) {
  return _MainSendAnswerRequestModel.fromJson(json);
}

/// @nodoc
mixin _$MainSendAnswerRequestModel {
  SendAnswerRequestModel get answer => throw _privateConstructorUsedError;

  /// Serializes this MainSendAnswerRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MainSendAnswerRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MainSendAnswerRequestModelCopyWith<MainSendAnswerRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainSendAnswerRequestModelCopyWith<$Res> {
  factory $MainSendAnswerRequestModelCopyWith(MainSendAnswerRequestModel value,
          $Res Function(MainSendAnswerRequestModel) then) =
      _$MainSendAnswerRequestModelCopyWithImpl<$Res,
          MainSendAnswerRequestModel>;
  @useResult
  $Res call({SendAnswerRequestModel answer});

  $SendAnswerRequestModelCopyWith<$Res> get answer;
}

/// @nodoc
class _$MainSendAnswerRequestModelCopyWithImpl<$Res,
        $Val extends MainSendAnswerRequestModel>
    implements $MainSendAnswerRequestModelCopyWith<$Res> {
  _$MainSendAnswerRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainSendAnswerRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answer = null,
  }) {
    return _then(_value.copyWith(
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as SendAnswerRequestModel,
    ) as $Val);
  }

  /// Create a copy of MainSendAnswerRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SendAnswerRequestModelCopyWith<$Res> get answer {
    return $SendAnswerRequestModelCopyWith<$Res>(_value.answer, (value) {
      return _then(_value.copyWith(answer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MainSendAnswerRequestModelImplCopyWith<$Res>
    implements $MainSendAnswerRequestModelCopyWith<$Res> {
  factory _$$MainSendAnswerRequestModelImplCopyWith(
          _$MainSendAnswerRequestModelImpl value,
          $Res Function(_$MainSendAnswerRequestModelImpl) then) =
      __$$MainSendAnswerRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SendAnswerRequestModel answer});

  @override
  $SendAnswerRequestModelCopyWith<$Res> get answer;
}

/// @nodoc
class __$$MainSendAnswerRequestModelImplCopyWithImpl<$Res>
    extends _$MainSendAnswerRequestModelCopyWithImpl<$Res,
        _$MainSendAnswerRequestModelImpl>
    implements _$$MainSendAnswerRequestModelImplCopyWith<$Res> {
  __$$MainSendAnswerRequestModelImplCopyWithImpl(
      _$MainSendAnswerRequestModelImpl _value,
      $Res Function(_$MainSendAnswerRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainSendAnswerRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answer = null,
  }) {
    return _then(_$MainSendAnswerRequestModelImpl(
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as SendAnswerRequestModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MainSendAnswerRequestModelImpl implements _MainSendAnswerRequestModel {
  const _$MainSendAnswerRequestModelImpl(
      {this.answer = const SendAnswerRequestModel()});

  factory _$MainSendAnswerRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MainSendAnswerRequestModelImplFromJson(json);

  @override
  @JsonKey()
  final SendAnswerRequestModel answer;

  @override
  String toString() {
    return 'MainSendAnswerRequestModel(answer: $answer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainSendAnswerRequestModelImpl &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, answer);

  /// Create a copy of MainSendAnswerRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MainSendAnswerRequestModelImplCopyWith<_$MainSendAnswerRequestModelImpl>
      get copyWith => __$$MainSendAnswerRequestModelImplCopyWithImpl<
          _$MainSendAnswerRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MainSendAnswerRequestModelImplToJson(
      this,
    );
  }
}

abstract class _MainSendAnswerRequestModel
    implements MainSendAnswerRequestModel {
  const factory _MainSendAnswerRequestModel(
      {final SendAnswerRequestModel answer}) = _$MainSendAnswerRequestModelImpl;

  factory _MainSendAnswerRequestModel.fromJson(Map<String, dynamic> json) =
      _$MainSendAnswerRequestModelImpl.fromJson;

  @override
  SendAnswerRequestModel get answer;

  /// Create a copy of MainSendAnswerRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MainSendAnswerRequestModelImplCopyWith<_$MainSendAnswerRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SendAnswerRequestModel _$SendAnswerRequestModelFromJson(
    Map<String, dynamic> json) {
  return _SendAnswerRequestModel.fromJson(json);
}

/// @nodoc
mixin _$SendAnswerRequestModel {
  String get sdp => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  /// Serializes this SendAnswerRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendAnswerRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendAnswerRequestModelCopyWith<SendAnswerRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendAnswerRequestModelCopyWith<$Res> {
  factory $SendAnswerRequestModelCopyWith(SendAnswerRequestModel value,
          $Res Function(SendAnswerRequestModel) then) =
      _$SendAnswerRequestModelCopyWithImpl<$Res, SendAnswerRequestModel>;
  @useResult
  $Res call({String sdp, String type});
}

/// @nodoc
class _$SendAnswerRequestModelCopyWithImpl<$Res,
        $Val extends SendAnswerRequestModel>
    implements $SendAnswerRequestModelCopyWith<$Res> {
  _$SendAnswerRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendAnswerRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sdp = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      sdp: null == sdp
          ? _value.sdp
          : sdp // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendAnswerRequestModelImplCopyWith<$Res>
    implements $SendAnswerRequestModelCopyWith<$Res> {
  factory _$$SendAnswerRequestModelImplCopyWith(
          _$SendAnswerRequestModelImpl value,
          $Res Function(_$SendAnswerRequestModelImpl) then) =
      __$$SendAnswerRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sdp, String type});
}

/// @nodoc
class __$$SendAnswerRequestModelImplCopyWithImpl<$Res>
    extends _$SendAnswerRequestModelCopyWithImpl<$Res,
        _$SendAnswerRequestModelImpl>
    implements _$$SendAnswerRequestModelImplCopyWith<$Res> {
  __$$SendAnswerRequestModelImplCopyWithImpl(
      _$SendAnswerRequestModelImpl _value,
      $Res Function(_$SendAnswerRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendAnswerRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sdp = null,
    Object? type = null,
  }) {
    return _then(_$SendAnswerRequestModelImpl(
      sdp: null == sdp
          ? _value.sdp
          : sdp // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendAnswerRequestModelImpl implements _SendAnswerRequestModel {
  const _$SendAnswerRequestModelImpl({this.sdp = '', this.type = ''});

  factory _$SendAnswerRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendAnswerRequestModelImplFromJson(json);

  @override
  @JsonKey()
  final String sdp;
  @override
  @JsonKey()
  final String type;

  @override
  String toString() {
    return 'SendAnswerRequestModel(sdp: $sdp, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendAnswerRequestModelImpl &&
            (identical(other.sdp, sdp) || other.sdp == sdp) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sdp, type);

  /// Create a copy of SendAnswerRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendAnswerRequestModelImplCopyWith<_$SendAnswerRequestModelImpl>
      get copyWith => __$$SendAnswerRequestModelImplCopyWithImpl<
          _$SendAnswerRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendAnswerRequestModelImplToJson(
      this,
    );
  }
}

abstract class _SendAnswerRequestModel implements SendAnswerRequestModel {
  const factory _SendAnswerRequestModel({final String sdp, final String type}) =
      _$SendAnswerRequestModelImpl;

  factory _SendAnswerRequestModel.fromJson(Map<String, dynamic> json) =
      _$SendAnswerRequestModelImpl.fromJson;

  @override
  String get sdp;
  @override
  String get type;

  /// Create a copy of SendAnswerRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendAnswerRequestModelImplCopyWith<_$SendAnswerRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MainSendCandidateRequestModel _$MainSendCandidateRequestModelFromJson(
    Map<String, dynamic> json) {
  return _MainSendCandidateRequestModel.fromJson(json);
}

/// @nodoc
mixin _$MainSendCandidateRequestModel {
  SendCandidateRequestModel get candidate => throw _privateConstructorUsedError;

  /// Serializes this MainSendCandidateRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MainSendCandidateRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MainSendCandidateRequestModelCopyWith<MainSendCandidateRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainSendCandidateRequestModelCopyWith<$Res> {
  factory $MainSendCandidateRequestModelCopyWith(
          MainSendCandidateRequestModel value,
          $Res Function(MainSendCandidateRequestModel) then) =
      _$MainSendCandidateRequestModelCopyWithImpl<$Res,
          MainSendCandidateRequestModel>;
  @useResult
  $Res call({SendCandidateRequestModel candidate});

  $SendCandidateRequestModelCopyWith<$Res> get candidate;
}

/// @nodoc
class _$MainSendCandidateRequestModelCopyWithImpl<$Res,
        $Val extends MainSendCandidateRequestModel>
    implements $MainSendCandidateRequestModelCopyWith<$Res> {
  _$MainSendCandidateRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainSendCandidateRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? candidate = null,
  }) {
    return _then(_value.copyWith(
      candidate: null == candidate
          ? _value.candidate
          : candidate // ignore: cast_nullable_to_non_nullable
              as SendCandidateRequestModel,
    ) as $Val);
  }

  /// Create a copy of MainSendCandidateRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SendCandidateRequestModelCopyWith<$Res> get candidate {
    return $SendCandidateRequestModelCopyWith<$Res>(_value.candidate, (value) {
      return _then(_value.copyWith(candidate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MainSendCandidateRequestModelImplCopyWith<$Res>
    implements $MainSendCandidateRequestModelCopyWith<$Res> {
  factory _$$MainSendCandidateRequestModelImplCopyWith(
          _$MainSendCandidateRequestModelImpl value,
          $Res Function(_$MainSendCandidateRequestModelImpl) then) =
      __$$MainSendCandidateRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SendCandidateRequestModel candidate});

  @override
  $SendCandidateRequestModelCopyWith<$Res> get candidate;
}

/// @nodoc
class __$$MainSendCandidateRequestModelImplCopyWithImpl<$Res>
    extends _$MainSendCandidateRequestModelCopyWithImpl<$Res,
        _$MainSendCandidateRequestModelImpl>
    implements _$$MainSendCandidateRequestModelImplCopyWith<$Res> {
  __$$MainSendCandidateRequestModelImplCopyWithImpl(
      _$MainSendCandidateRequestModelImpl _value,
      $Res Function(_$MainSendCandidateRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainSendCandidateRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? candidate = null,
  }) {
    return _then(_$MainSendCandidateRequestModelImpl(
      candidate: null == candidate
          ? _value.candidate
          : candidate // ignore: cast_nullable_to_non_nullable
              as SendCandidateRequestModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MainSendCandidateRequestModelImpl
    implements _MainSendCandidateRequestModel {
  const _$MainSendCandidateRequestModelImpl(
      {this.candidate = const SendCandidateRequestModel()});

  factory _$MainSendCandidateRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MainSendCandidateRequestModelImplFromJson(json);

  @override
  @JsonKey()
  final SendCandidateRequestModel candidate;

  @override
  String toString() {
    return 'MainSendCandidateRequestModel(candidate: $candidate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainSendCandidateRequestModelImpl &&
            (identical(other.candidate, candidate) ||
                other.candidate == candidate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, candidate);

  /// Create a copy of MainSendCandidateRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MainSendCandidateRequestModelImplCopyWith<
          _$MainSendCandidateRequestModelImpl>
      get copyWith => __$$MainSendCandidateRequestModelImplCopyWithImpl<
          _$MainSendCandidateRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MainSendCandidateRequestModelImplToJson(
      this,
    );
  }
}

abstract class _MainSendCandidateRequestModel
    implements MainSendCandidateRequestModel {
  const factory _MainSendCandidateRequestModel(
          {final SendCandidateRequestModel candidate}) =
      _$MainSendCandidateRequestModelImpl;

  factory _MainSendCandidateRequestModel.fromJson(Map<String, dynamic> json) =
      _$MainSendCandidateRequestModelImpl.fromJson;

  @override
  SendCandidateRequestModel get candidate;

  /// Create a copy of MainSendCandidateRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MainSendCandidateRequestModelImplCopyWith<
          _$MainSendCandidateRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SendCandidateRequestModel _$SendCandidateRequestModelFromJson(
    Map<String, dynamic> json) {
  return _SendCandidateRequestModel.fromJson(json);
}

/// @nodoc
mixin _$SendCandidateRequestModel {
  String get candidate => throw _privateConstructorUsedError;
  int get sdpMLineIndex => throw _privateConstructorUsedError;
  String get sdpMid => throw _privateConstructorUsedError;
  String get usernameFragment => throw _privateConstructorUsedError;

  /// Serializes this SendCandidateRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendCandidateRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendCandidateRequestModelCopyWith<SendCandidateRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendCandidateRequestModelCopyWith<$Res> {
  factory $SendCandidateRequestModelCopyWith(SendCandidateRequestModel value,
          $Res Function(SendCandidateRequestModel) then) =
      _$SendCandidateRequestModelCopyWithImpl<$Res, SendCandidateRequestModel>;
  @useResult
  $Res call(
      {String candidate,
      int sdpMLineIndex,
      String sdpMid,
      String usernameFragment});
}

/// @nodoc
class _$SendCandidateRequestModelCopyWithImpl<$Res,
        $Val extends SendCandidateRequestModel>
    implements $SendCandidateRequestModelCopyWith<$Res> {
  _$SendCandidateRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendCandidateRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? candidate = null,
    Object? sdpMLineIndex = null,
    Object? sdpMid = null,
    Object? usernameFragment = null,
  }) {
    return _then(_value.copyWith(
      candidate: null == candidate
          ? _value.candidate
          : candidate // ignore: cast_nullable_to_non_nullable
              as String,
      sdpMLineIndex: null == sdpMLineIndex
          ? _value.sdpMLineIndex
          : sdpMLineIndex // ignore: cast_nullable_to_non_nullable
              as int,
      sdpMid: null == sdpMid
          ? _value.sdpMid
          : sdpMid // ignore: cast_nullable_to_non_nullable
              as String,
      usernameFragment: null == usernameFragment
          ? _value.usernameFragment
          : usernameFragment // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendCandidateRequestModelImplCopyWith<$Res>
    implements $SendCandidateRequestModelCopyWith<$Res> {
  factory _$$SendCandidateRequestModelImplCopyWith(
          _$SendCandidateRequestModelImpl value,
          $Res Function(_$SendCandidateRequestModelImpl) then) =
      __$$SendCandidateRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String candidate,
      int sdpMLineIndex,
      String sdpMid,
      String usernameFragment});
}

/// @nodoc
class __$$SendCandidateRequestModelImplCopyWithImpl<$Res>
    extends _$SendCandidateRequestModelCopyWithImpl<$Res,
        _$SendCandidateRequestModelImpl>
    implements _$$SendCandidateRequestModelImplCopyWith<$Res> {
  __$$SendCandidateRequestModelImplCopyWithImpl(
      _$SendCandidateRequestModelImpl _value,
      $Res Function(_$SendCandidateRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendCandidateRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? candidate = null,
    Object? sdpMLineIndex = null,
    Object? sdpMid = null,
    Object? usernameFragment = null,
  }) {
    return _then(_$SendCandidateRequestModelImpl(
      candidate: null == candidate
          ? _value.candidate
          : candidate // ignore: cast_nullable_to_non_nullable
              as String,
      sdpMLineIndex: null == sdpMLineIndex
          ? _value.sdpMLineIndex
          : sdpMLineIndex // ignore: cast_nullable_to_non_nullable
              as int,
      sdpMid: null == sdpMid
          ? _value.sdpMid
          : sdpMid // ignore: cast_nullable_to_non_nullable
              as String,
      usernameFragment: null == usernameFragment
          ? _value.usernameFragment
          : usernameFragment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendCandidateRequestModelImpl implements _SendCandidateRequestModel {
  const _$SendCandidateRequestModelImpl(
      {this.candidate = '',
      this.sdpMLineIndex = 0,
      this.sdpMid = '',
      this.usernameFragment = ''});

  factory _$SendCandidateRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendCandidateRequestModelImplFromJson(json);

  @override
  @JsonKey()
  final String candidate;
  @override
  @JsonKey()
  final int sdpMLineIndex;
  @override
  @JsonKey()
  final String sdpMid;
  @override
  @JsonKey()
  final String usernameFragment;

  @override
  String toString() {
    return 'SendCandidateRequestModel(candidate: $candidate, sdpMLineIndex: $sdpMLineIndex, sdpMid: $sdpMid, usernameFragment: $usernameFragment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendCandidateRequestModelImpl &&
            (identical(other.candidate, candidate) ||
                other.candidate == candidate) &&
            (identical(other.sdpMLineIndex, sdpMLineIndex) ||
                other.sdpMLineIndex == sdpMLineIndex) &&
            (identical(other.sdpMid, sdpMid) || other.sdpMid == sdpMid) &&
            (identical(other.usernameFragment, usernameFragment) ||
                other.usernameFragment == usernameFragment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, candidate, sdpMLineIndex, sdpMid, usernameFragment);

  /// Create a copy of SendCandidateRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendCandidateRequestModelImplCopyWith<_$SendCandidateRequestModelImpl>
      get copyWith => __$$SendCandidateRequestModelImplCopyWithImpl<
          _$SendCandidateRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendCandidateRequestModelImplToJson(
      this,
    );
  }
}

abstract class _SendCandidateRequestModel implements SendCandidateRequestModel {
  const factory _SendCandidateRequestModel(
      {final String candidate,
      final int sdpMLineIndex,
      final String sdpMid,
      final String usernameFragment}) = _$SendCandidateRequestModelImpl;

  factory _SendCandidateRequestModel.fromJson(Map<String, dynamic> json) =
      _$SendCandidateRequestModelImpl.fromJson;

  @override
  String get candidate;
  @override
  int get sdpMLineIndex;
  @override
  String get sdpMid;
  @override
  String get usernameFragment;

  /// Create a copy of SendCandidateRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendCandidateRequestModelImplCopyWith<_$SendCandidateRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PlatformChatbotRequestModel _$PlatformChatbotRequestModelFromJson(
    Map<String, dynamic> json) {
  return _PlatformChatbotRequestModel.fromJson(json);
}

/// @nodoc
mixin _$PlatformChatbotRequestModel {
  int? get lang => throw _privateConstructorUsedError;
  String? get question => throw _privateConstructorUsedError;

  /// Serializes this PlatformChatbotRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlatformChatbotRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlatformChatbotRequestModelCopyWith<PlatformChatbotRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlatformChatbotRequestModelCopyWith<$Res> {
  factory $PlatformChatbotRequestModelCopyWith(
          PlatformChatbotRequestModel value,
          $Res Function(PlatformChatbotRequestModel) then) =
      _$PlatformChatbotRequestModelCopyWithImpl<$Res,
          PlatformChatbotRequestModel>;
  @useResult
  $Res call({int? lang, String? question});
}

/// @nodoc
class _$PlatformChatbotRequestModelCopyWithImpl<$Res,
        $Val extends PlatformChatbotRequestModel>
    implements $PlatformChatbotRequestModelCopyWith<$Res> {
  _$PlatformChatbotRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlatformChatbotRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lang = freezed,
    Object? question = freezed,
  }) {
    return _then(_value.copyWith(
      lang: freezed == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as int?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlatformChatbotRequestModelImplCopyWith<$Res>
    implements $PlatformChatbotRequestModelCopyWith<$Res> {
  factory _$$PlatformChatbotRequestModelImplCopyWith(
          _$PlatformChatbotRequestModelImpl value,
          $Res Function(_$PlatformChatbotRequestModelImpl) then) =
      __$$PlatformChatbotRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? lang, String? question});
}

/// @nodoc
class __$$PlatformChatbotRequestModelImplCopyWithImpl<$Res>
    extends _$PlatformChatbotRequestModelCopyWithImpl<$Res,
        _$PlatformChatbotRequestModelImpl>
    implements _$$PlatformChatbotRequestModelImplCopyWith<$Res> {
  __$$PlatformChatbotRequestModelImplCopyWithImpl(
      _$PlatformChatbotRequestModelImpl _value,
      $Res Function(_$PlatformChatbotRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlatformChatbotRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lang = freezed,
    Object? question = freezed,
  }) {
    return _then(_$PlatformChatbotRequestModelImpl(
      lang: freezed == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as int?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlatformChatbotRequestModelImpl
    implements _PlatformChatbotRequestModel {
  const _$PlatformChatbotRequestModelImpl({this.lang = 0, this.question = ''});

  factory _$PlatformChatbotRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PlatformChatbotRequestModelImplFromJson(json);

  @override
  @JsonKey()
  final int? lang;
  @override
  @JsonKey()
  final String? question;

  @override
  String toString() {
    return 'PlatformChatbotRequestModel(lang: $lang, question: $question)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlatformChatbotRequestModelImpl &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.question, question) ||
                other.question == question));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lang, question);

  /// Create a copy of PlatformChatbotRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlatformChatbotRequestModelImplCopyWith<_$PlatformChatbotRequestModelImpl>
      get copyWith => __$$PlatformChatbotRequestModelImplCopyWithImpl<
          _$PlatformChatbotRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlatformChatbotRequestModelImplToJson(
      this,
    );
  }
}

abstract class _PlatformChatbotRequestModel
    implements PlatformChatbotRequestModel {
  const factory _PlatformChatbotRequestModel(
      {final int? lang,
      final String? question}) = _$PlatformChatbotRequestModelImpl;

  factory _PlatformChatbotRequestModel.fromJson(Map<String, dynamic> json) =
      _$PlatformChatbotRequestModelImpl.fromJson;

  @override
  int? get lang;
  @override
  String? get question;

  /// Create a copy of PlatformChatbotRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlatformChatbotRequestModelImplCopyWith<_$PlatformChatbotRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
