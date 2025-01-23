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
  $Res call({String? streamId, List<MessageRequestModel> messages});
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
  $Res call({String? streamId, List<MessageRequestModel> messages});
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
      {this.streamId = '', final List<MessageRequestModel> messages = const []})
      : _messages = messages;

  factory _$ChatbotRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatbotRequestModelImplFromJson(json);

  @override
  @JsonKey()
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
      {final String? streamId,
      final List<MessageRequestModel> messages}) = _$ChatbotRequestModelImpl;

  factory _ChatbotRequestModel.fromJson(Map<String, dynamic> json) =
      _$ChatbotRequestModelImpl.fromJson;

  @override
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
  String get content => throw _privateConstructorUsedError;

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
  $Res call({String role, String content});
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
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
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
  $Res call({String role, String content});
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
    Object? content = null,
  }) {
    return _then(_$MessageRequestModelImpl(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageRequestModelImpl implements _MessageRequestModel {
  const _$MessageRequestModelImpl({this.role = '', this.content = ''});

  factory _$MessageRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageRequestModelImplFromJson(json);

  @override
  @JsonKey()
  final String role;
  @override
  @JsonKey()
  final String content;

  @override
  String toString() {
    return 'MessageRequestModel(role: $role, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageRequestModelImpl &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, role, content);

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
      {final String role, final String content}) = _$MessageRequestModelImpl;

  factory _MessageRequestModel.fromJson(Map<String, dynamic> json) =
      _$MessageRequestModelImpl.fromJson;

  @override
  String get role;
  @override
  String get content;

  /// Create a copy of MessageRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageRequestModelImplCopyWith<_$MessageRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
