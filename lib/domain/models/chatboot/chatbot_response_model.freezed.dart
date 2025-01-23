// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chatbot_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatbotResponseModel _$ChatbotResponseModelFromJson(Map<String, dynamic> json) {
  return _ChatbotResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ChatbotResponseModel {
  String get finishReason => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  MessageResponseModel get message => throw _privateConstructorUsedError;
  Usage get usage => throw _privateConstructorUsedError;

  /// Serializes this ChatbotResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatbotResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatbotResponseModelCopyWith<ChatbotResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatbotResponseModelCopyWith<$Res> {
  factory $ChatbotResponseModelCopyWith(ChatbotResponseModel value,
          $Res Function(ChatbotResponseModel) then) =
      _$ChatbotResponseModelCopyWithImpl<$Res, ChatbotResponseModel>;
  @useResult
  $Res call(
      {String finishReason,
      int index,
      MessageResponseModel message,
      Usage usage});

  $MessageResponseModelCopyWith<$Res> get message;
  $UsageCopyWith<$Res> get usage;
}

/// @nodoc
class _$ChatbotResponseModelCopyWithImpl<$Res,
        $Val extends ChatbotResponseModel>
    implements $ChatbotResponseModelCopyWith<$Res> {
  _$ChatbotResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatbotResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? finishReason = null,
    Object? index = null,
    Object? message = null,
    Object? usage = null,
  }) {
    return _then(_value.copyWith(
      finishReason: null == finishReason
          ? _value.finishReason
          : finishReason // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as MessageResponseModel,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as Usage,
    ) as $Val);
  }

  /// Create a copy of ChatbotResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessageResponseModelCopyWith<$Res> get message {
    return $MessageResponseModelCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value) as $Val);
    });
  }

  /// Create a copy of ChatbotResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UsageCopyWith<$Res> get usage {
    return $UsageCopyWith<$Res>(_value.usage, (value) {
      return _then(_value.copyWith(usage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatbotResponseModelImplCopyWith<$Res>
    implements $ChatbotResponseModelCopyWith<$Res> {
  factory _$$ChatbotResponseModelImplCopyWith(_$ChatbotResponseModelImpl value,
          $Res Function(_$ChatbotResponseModelImpl) then) =
      __$$ChatbotResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String finishReason,
      int index,
      MessageResponseModel message,
      Usage usage});

  @override
  $MessageResponseModelCopyWith<$Res> get message;
  @override
  $UsageCopyWith<$Res> get usage;
}

/// @nodoc
class __$$ChatbotResponseModelImplCopyWithImpl<$Res>
    extends _$ChatbotResponseModelCopyWithImpl<$Res, _$ChatbotResponseModelImpl>
    implements _$$ChatbotResponseModelImplCopyWith<$Res> {
  __$$ChatbotResponseModelImplCopyWithImpl(_$ChatbotResponseModelImpl _value,
      $Res Function(_$ChatbotResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatbotResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? finishReason = null,
    Object? index = null,
    Object? message = null,
    Object? usage = null,
  }) {
    return _then(_$ChatbotResponseModelImpl(
      finishReason: null == finishReason
          ? _value.finishReason
          : finishReason // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as MessageResponseModel,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as Usage,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatbotResponseModelImpl implements _ChatbotResponseModel {
  const _$ChatbotResponseModelImpl(
      {this.finishReason = '',
      this.index = 0,
      required this.message,
      required this.usage});

  factory _$ChatbotResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatbotResponseModelImplFromJson(json);

  @override
  @JsonKey()
  final String finishReason;
  @override
  @JsonKey()
  final int index;
  @override
  final MessageResponseModel message;
  @override
  final Usage usage;

  @override
  String toString() {
    return 'ChatbotResponseModel(finishReason: $finishReason, index: $index, message: $message, usage: $usage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatbotResponseModelImpl &&
            (identical(other.finishReason, finishReason) ||
                other.finishReason == finishReason) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.usage, usage) || other.usage == usage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, finishReason, index, message, usage);

  /// Create a copy of ChatbotResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatbotResponseModelImplCopyWith<_$ChatbotResponseModelImpl>
      get copyWith =>
          __$$ChatbotResponseModelImplCopyWithImpl<_$ChatbotResponseModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatbotResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ChatbotResponseModel implements ChatbotResponseModel {
  const factory _ChatbotResponseModel(
      {final String finishReason,
      final int index,
      required final MessageResponseModel message,
      required final Usage usage}) = _$ChatbotResponseModelImpl;

  factory _ChatbotResponseModel.fromJson(Map<String, dynamic> json) =
      _$ChatbotResponseModelImpl.fromJson;

  @override
  String get finishReason;
  @override
  int get index;
  @override
  MessageResponseModel get message;
  @override
  Usage get usage;

  /// Create a copy of ChatbotResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatbotResponseModelImplCopyWith<_$ChatbotResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MessageResponseModel _$MessageResponseModelFromJson(Map<String, dynamic> json) {
  return _MessageResponseModel.fromJson(json);
}

/// @nodoc
mixin _$MessageResponseModel {
  String get content => throw _privateConstructorUsedError;
  String get conversationId => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  bool get endTurn => throw _privateConstructorUsedError;
  ContextModel? get contextModel => throw _privateConstructorUsedError;

  /// Serializes this MessageResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageResponseModelCopyWith<MessageResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageResponseModelCopyWith<$Res> {
  factory $MessageResponseModelCopyWith(MessageResponseModel value,
          $Res Function(MessageResponseModel) then) =
      _$MessageResponseModelCopyWithImpl<$Res, MessageResponseModel>;
  @useResult
  $Res call(
      {String content,
      String conversationId,
      String role,
      bool endTurn,
      ContextModel? contextModel});

  $ContextModelCopyWith<$Res>? get contextModel;
}

/// @nodoc
class _$MessageResponseModelCopyWithImpl<$Res,
        $Val extends MessageResponseModel>
    implements $MessageResponseModelCopyWith<$Res> {
  _$MessageResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? conversationId = null,
    Object? role = null,
    Object? endTurn = null,
    Object? contextModel = freezed,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      conversationId: null == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      endTurn: null == endTurn
          ? _value.endTurn
          : endTurn // ignore: cast_nullable_to_non_nullable
              as bool,
      contextModel: freezed == contextModel
          ? _value.contextModel
          : contextModel // ignore: cast_nullable_to_non_nullable
              as ContextModel?,
    ) as $Val);
  }

  /// Create a copy of MessageResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContextModelCopyWith<$Res>? get contextModel {
    if (_value.contextModel == null) {
      return null;
    }

    return $ContextModelCopyWith<$Res>(_value.contextModel!, (value) {
      return _then(_value.copyWith(contextModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessageResponseModelImplCopyWith<$Res>
    implements $MessageResponseModelCopyWith<$Res> {
  factory _$$MessageResponseModelImplCopyWith(_$MessageResponseModelImpl value,
          $Res Function(_$MessageResponseModelImpl) then) =
      __$$MessageResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String content,
      String conversationId,
      String role,
      bool endTurn,
      ContextModel? contextModel});

  @override
  $ContextModelCopyWith<$Res>? get contextModel;
}

/// @nodoc
class __$$MessageResponseModelImplCopyWithImpl<$Res>
    extends _$MessageResponseModelCopyWithImpl<$Res, _$MessageResponseModelImpl>
    implements _$$MessageResponseModelImplCopyWith<$Res> {
  __$$MessageResponseModelImplCopyWithImpl(_$MessageResponseModelImpl _value,
      $Res Function(_$MessageResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? conversationId = null,
    Object? role = null,
    Object? endTurn = null,
    Object? contextModel = freezed,
  }) {
    return _then(_$MessageResponseModelImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      conversationId: null == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      endTurn: null == endTurn
          ? _value.endTurn
          : endTurn // ignore: cast_nullable_to_non_nullable
              as bool,
      contextModel: freezed == contextModel
          ? _value.contextModel
          : contextModel // ignore: cast_nullable_to_non_nullable
              as ContextModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageResponseModelImpl implements _MessageResponseModel {
  const _$MessageResponseModelImpl(
      {this.content = '',
      this.conversationId = '',
      this.role = '',
      this.endTurn = false,
      this.contextModel = null});

  factory _$MessageResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageResponseModelImplFromJson(json);

  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey()
  final String conversationId;
  @override
  @JsonKey()
  final String role;
  @override
  @JsonKey()
  final bool endTurn;
  @override
  @JsonKey()
  final ContextModel? contextModel;

  @override
  String toString() {
    return 'MessageResponseModel(content: $content, conversationId: $conversationId, role: $role, endTurn: $endTurn, contextModel: $contextModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageResponseModelImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.endTurn, endTurn) || other.endTurn == endTurn) &&
            (identical(other.contextModel, contextModel) ||
                other.contextModel == contextModel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, content, conversationId, role, endTurn, contextModel);

  /// Create a copy of MessageResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageResponseModelImplCopyWith<_$MessageResponseModelImpl>
      get copyWith =>
          __$$MessageResponseModelImplCopyWithImpl<_$MessageResponseModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageResponseModelImplToJson(
      this,
    );
  }
}

abstract class _MessageResponseModel implements MessageResponseModel {
  const factory _MessageResponseModel(
      {final String content,
      final String conversationId,
      final String role,
      final bool endTurn,
      final ContextModel? contextModel}) = _$MessageResponseModelImpl;

  factory _MessageResponseModel.fromJson(Map<String, dynamic> json) =
      _$MessageResponseModelImpl.fromJson;

  @override
  String get content;
  @override
  String get conversationId;
  @override
  String get role;
  @override
  bool get endTurn;
  @override
  ContextModel? get contextModel;

  /// Create a copy of MessageResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageResponseModelImplCopyWith<_$MessageResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Usage _$UsageFromJson(Map<String, dynamic> json) {
  return _Usage.fromJson(json);
}

/// @nodoc
mixin _$Usage {
  int get completionTokens => throw _privateConstructorUsedError;
  int get promptTokens => throw _privateConstructorUsedError;
  int get totalTokens => throw _privateConstructorUsedError;
  String? get completionTokensDetails => throw _privateConstructorUsedError;
  String? get promptTokensDetails => throw _privateConstructorUsedError;

  /// Serializes this Usage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Usage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UsageCopyWith<Usage> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsageCopyWith<$Res> {
  factory $UsageCopyWith(Usage value, $Res Function(Usage) then) =
      _$UsageCopyWithImpl<$Res, Usage>;
  @useResult
  $Res call(
      {int completionTokens,
      int promptTokens,
      int totalTokens,
      String? completionTokensDetails,
      String? promptTokensDetails});
}

/// @nodoc
class _$UsageCopyWithImpl<$Res, $Val extends Usage>
    implements $UsageCopyWith<$Res> {
  _$UsageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Usage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completionTokens = null,
    Object? promptTokens = null,
    Object? totalTokens = null,
    Object? completionTokensDetails = freezed,
    Object? promptTokensDetails = freezed,
  }) {
    return _then(_value.copyWith(
      completionTokens: null == completionTokens
          ? _value.completionTokens
          : completionTokens // ignore: cast_nullable_to_non_nullable
              as int,
      promptTokens: null == promptTokens
          ? _value.promptTokens
          : promptTokens // ignore: cast_nullable_to_non_nullable
              as int,
      totalTokens: null == totalTokens
          ? _value.totalTokens
          : totalTokens // ignore: cast_nullable_to_non_nullable
              as int,
      completionTokensDetails: freezed == completionTokensDetails
          ? _value.completionTokensDetails
          : completionTokensDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      promptTokensDetails: freezed == promptTokensDetails
          ? _value.promptTokensDetails
          : promptTokensDetails // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsageImplCopyWith<$Res> implements $UsageCopyWith<$Res> {
  factory _$$UsageImplCopyWith(
          _$UsageImpl value, $Res Function(_$UsageImpl) then) =
      __$$UsageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int completionTokens,
      int promptTokens,
      int totalTokens,
      String? completionTokensDetails,
      String? promptTokensDetails});
}

/// @nodoc
class __$$UsageImplCopyWithImpl<$Res>
    extends _$UsageCopyWithImpl<$Res, _$UsageImpl>
    implements _$$UsageImplCopyWith<$Res> {
  __$$UsageImplCopyWithImpl(
      _$UsageImpl _value, $Res Function(_$UsageImpl) _then)
      : super(_value, _then);

  /// Create a copy of Usage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completionTokens = null,
    Object? promptTokens = null,
    Object? totalTokens = null,
    Object? completionTokensDetails = freezed,
    Object? promptTokensDetails = freezed,
  }) {
    return _then(_$UsageImpl(
      completionTokens: null == completionTokens
          ? _value.completionTokens
          : completionTokens // ignore: cast_nullable_to_non_nullable
              as int,
      promptTokens: null == promptTokens
          ? _value.promptTokens
          : promptTokens // ignore: cast_nullable_to_non_nullable
              as int,
      totalTokens: null == totalTokens
          ? _value.totalTokens
          : totalTokens // ignore: cast_nullable_to_non_nullable
              as int,
      completionTokensDetails: freezed == completionTokensDetails
          ? _value.completionTokensDetails
          : completionTokensDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      promptTokensDetails: freezed == promptTokensDetails
          ? _value.promptTokensDetails
          : promptTokensDetails // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsageImpl implements _Usage {
  const _$UsageImpl(
      {this.completionTokens = 0,
      this.promptTokens = 0,
      this.totalTokens = 0,
      this.completionTokensDetails = "",
      this.promptTokensDetails = ""});

  factory _$UsageImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsageImplFromJson(json);

  @override
  @JsonKey()
  final int completionTokens;
  @override
  @JsonKey()
  final int promptTokens;
  @override
  @JsonKey()
  final int totalTokens;
  @override
  @JsonKey()
  final String? completionTokensDetails;
  @override
  @JsonKey()
  final String? promptTokensDetails;

  @override
  String toString() {
    return 'Usage(completionTokens: $completionTokens, promptTokens: $promptTokens, totalTokens: $totalTokens, completionTokensDetails: $completionTokensDetails, promptTokensDetails: $promptTokensDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsageImpl &&
            (identical(other.completionTokens, completionTokens) ||
                other.completionTokens == completionTokens) &&
            (identical(other.promptTokens, promptTokens) ||
                other.promptTokens == promptTokens) &&
            (identical(other.totalTokens, totalTokens) ||
                other.totalTokens == totalTokens) &&
            (identical(
                    other.completionTokensDetails, completionTokensDetails) ||
                other.completionTokensDetails == completionTokensDetails) &&
            (identical(other.promptTokensDetails, promptTokensDetails) ||
                other.promptTokensDetails == promptTokensDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, completionTokens, promptTokens,
      totalTokens, completionTokensDetails, promptTokensDetails);

  /// Create a copy of Usage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsageImplCopyWith<_$UsageImpl> get copyWith =>
      __$$UsageImplCopyWithImpl<_$UsageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsageImplToJson(
      this,
    );
  }
}

abstract class _Usage implements Usage {
  const factory _Usage(
      {final int completionTokens,
      final int promptTokens,
      final int totalTokens,
      final String? completionTokensDetails,
      final String? promptTokensDetails}) = _$UsageImpl;

  factory _Usage.fromJson(Map<String, dynamic> json) = _$UsageImpl.fromJson;

  @override
  int get completionTokens;
  @override
  int get promptTokens;
  @override
  int get totalTokens;
  @override
  String? get completionTokensDetails;
  @override
  String? get promptTokensDetails;

  /// Create a copy of Usage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsageImplCopyWith<_$UsageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContextModel _$ContextModelFromJson(Map<String, dynamic> json) {
  return _ContextModel.fromJson(json);
}

/// @nodoc
mixin _$ContextModel {
  List<Citation> get citations => throw _privateConstructorUsedError;
  List<String> get intent => throw _privateConstructorUsedError;

  /// Serializes this ContextModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContextModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContextModelCopyWith<ContextModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContextModelCopyWith<$Res> {
  factory $ContextModelCopyWith(
          ContextModel value, $Res Function(ContextModel) then) =
      _$ContextModelCopyWithImpl<$Res, ContextModel>;
  @useResult
  $Res call({List<Citation> citations, List<String> intent});
}

/// @nodoc
class _$ContextModelCopyWithImpl<$Res, $Val extends ContextModel>
    implements $ContextModelCopyWith<$Res> {
  _$ContextModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContextModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? citations = null,
    Object? intent = null,
  }) {
    return _then(_value.copyWith(
      citations: null == citations
          ? _value.citations
          : citations // ignore: cast_nullable_to_non_nullable
              as List<Citation>,
      intent: null == intent
          ? _value.intent
          : intent // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContextModelImplCopyWith<$Res>
    implements $ContextModelCopyWith<$Res> {
  factory _$$ContextModelImplCopyWith(
          _$ContextModelImpl value, $Res Function(_$ContextModelImpl) then) =
      __$$ContextModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Citation> citations, List<String> intent});
}

/// @nodoc
class __$$ContextModelImplCopyWithImpl<$Res>
    extends _$ContextModelCopyWithImpl<$Res, _$ContextModelImpl>
    implements _$$ContextModelImplCopyWith<$Res> {
  __$$ContextModelImplCopyWithImpl(
      _$ContextModelImpl _value, $Res Function(_$ContextModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContextModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? citations = null,
    Object? intent = null,
  }) {
    return _then(_$ContextModelImpl(
      citations: null == citations
          ? _value._citations
          : citations // ignore: cast_nullable_to_non_nullable
              as List<Citation>,
      intent: null == intent
          ? _value._intent
          : intent // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContextModelImpl implements _ContextModel {
  const _$ContextModelImpl(
      {final List<Citation> citations = const [],
      final List<String> intent = const []})
      : _citations = citations,
        _intent = intent;

  factory _$ContextModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContextModelImplFromJson(json);

  final List<Citation> _citations;
  @override
  @JsonKey()
  List<Citation> get citations {
    if (_citations is EqualUnmodifiableListView) return _citations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_citations);
  }

  final List<String> _intent;
  @override
  @JsonKey()
  List<String> get intent {
    if (_intent is EqualUnmodifiableListView) return _intent;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_intent);
  }

  @override
  String toString() {
    return 'ContextModel(citations: $citations, intent: $intent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContextModelImpl &&
            const DeepCollectionEquality()
                .equals(other._citations, _citations) &&
            const DeepCollectionEquality().equals(other._intent, _intent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_citations),
      const DeepCollectionEquality().hash(_intent));

  /// Create a copy of ContextModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContextModelImplCopyWith<_$ContextModelImpl> get copyWith =>
      __$$ContextModelImplCopyWithImpl<_$ContextModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContextModelImplToJson(
      this,
    );
  }
}

abstract class _ContextModel implements ContextModel {
  const factory _ContextModel(
      {final List<Citation> citations,
      final List<String> intent}) = _$ContextModelImpl;

  factory _ContextModel.fromJson(Map<String, dynamic> json) =
      _$ContextModelImpl.fromJson;

  @override
  List<Citation> get citations;
  @override
  List<String> get intent;

  /// Create a copy of ContextModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContextModelImplCopyWith<_$ContextModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Citation _$CitationFromJson(Map<String, dynamic> json) {
  return _Citation.fromJson(json);
}

/// @nodoc
mixin _$Citation {
  String get content => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String? get filepath => throw _privateConstructorUsedError;
  String get chunkId => throw _privateConstructorUsedError;

  /// Serializes this Citation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Citation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CitationCopyWith<Citation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CitationCopyWith<$Res> {
  factory $CitationCopyWith(Citation value, $Res Function(Citation) then) =
      _$CitationCopyWithImpl<$Res, Citation>;
  @useResult
  $Res call(
      {String content,
      String title,
      String url,
      String? filepath,
      String chunkId});
}

/// @nodoc
class _$CitationCopyWithImpl<$Res, $Val extends Citation>
    implements $CitationCopyWith<$Res> {
  _$CitationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Citation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? title = null,
    Object? url = null,
    Object? filepath = freezed,
    Object? chunkId = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      filepath: freezed == filepath
          ? _value.filepath
          : filepath // ignore: cast_nullable_to_non_nullable
              as String?,
      chunkId: null == chunkId
          ? _value.chunkId
          : chunkId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CitationImplCopyWith<$Res>
    implements $CitationCopyWith<$Res> {
  factory _$$CitationImplCopyWith(
          _$CitationImpl value, $Res Function(_$CitationImpl) then) =
      __$$CitationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String content,
      String title,
      String url,
      String? filepath,
      String chunkId});
}

/// @nodoc
class __$$CitationImplCopyWithImpl<$Res>
    extends _$CitationCopyWithImpl<$Res, _$CitationImpl>
    implements _$$CitationImplCopyWith<$Res> {
  __$$CitationImplCopyWithImpl(
      _$CitationImpl _value, $Res Function(_$CitationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Citation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? title = null,
    Object? url = null,
    Object? filepath = freezed,
    Object? chunkId = null,
  }) {
    return _then(_$CitationImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      filepath: freezed == filepath
          ? _value.filepath
          : filepath // ignore: cast_nullable_to_non_nullable
              as String?,
      chunkId: null == chunkId
          ? _value.chunkId
          : chunkId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CitationImpl implements _Citation {
  const _$CitationImpl(
      {this.content = '',
      this.title = '',
      this.url = '',
      this.filepath = '',
      this.chunkId = ''});

  factory _$CitationImpl.fromJson(Map<String, dynamic> json) =>
      _$$CitationImplFromJson(json);

  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String url;
  @override
  @JsonKey()
  final String? filepath;
  @override
  @JsonKey()
  final String chunkId;

  @override
  String toString() {
    return 'Citation(content: $content, title: $title, url: $url, filepath: $filepath, chunkId: $chunkId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CitationImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.filepath, filepath) ||
                other.filepath == filepath) &&
            (identical(other.chunkId, chunkId) || other.chunkId == chunkId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, content, title, url, filepath, chunkId);

  /// Create a copy of Citation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CitationImplCopyWith<_$CitationImpl> get copyWith =>
      __$$CitationImplCopyWithImpl<_$CitationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CitationImplToJson(
      this,
    );
  }
}

abstract class _Citation implements Citation {
  const factory _Citation(
      {final String content,
      final String title,
      final String url,
      final String? filepath,
      final String chunkId}) = _$CitationImpl;

  factory _Citation.fromJson(Map<String, dynamic> json) =
      _$CitationImpl.fromJson;

  @override
  String get content;
  @override
  String get title;
  @override
  String get url;
  @override
  String? get filepath;
  @override
  String get chunkId;

  /// Create a copy of Citation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CitationImplCopyWith<_$CitationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
