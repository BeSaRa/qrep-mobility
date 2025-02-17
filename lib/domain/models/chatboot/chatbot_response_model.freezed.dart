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

StartStreamModel _$StartStreamModelFromJson(Map<String, dynamic> json) {
  return _StartStreamModel.fromJson(json);
}

/// @nodoc
mixin _$StartStreamModel {
  int get statusCode => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  WebRTCDataModel? get data => throw _privateConstructorUsedError;

  /// Serializes this StartStreamModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StartStreamModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StartStreamModelCopyWith<StartStreamModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartStreamModelCopyWith<$Res> {
  factory $StartStreamModelCopyWith(
          StartStreamModel value, $Res Function(StartStreamModel) then) =
      _$StartStreamModelCopyWithImpl<$Res, StartStreamModel>;
  @useResult
  $Res call(
      {int statusCode, String status, String message, WebRTCDataModel? data});

  $WebRTCDataModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$StartStreamModelCopyWithImpl<$Res, $Val extends StartStreamModel>
    implements $StartStreamModelCopyWith<$Res> {
  _$StartStreamModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StartStreamModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? status = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as WebRTCDataModel?,
    ) as $Val);
  }

  /// Create a copy of StartStreamModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WebRTCDataModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $WebRTCDataModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StartStreamModelImplCopyWith<$Res>
    implements $StartStreamModelCopyWith<$Res> {
  factory _$$StartStreamModelImplCopyWith(_$StartStreamModelImpl value,
          $Res Function(_$StartStreamModelImpl) then) =
      __$$StartStreamModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int statusCode, String status, String message, WebRTCDataModel? data});

  @override
  $WebRTCDataModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$StartStreamModelImplCopyWithImpl<$Res>
    extends _$StartStreamModelCopyWithImpl<$Res, _$StartStreamModelImpl>
    implements _$$StartStreamModelImplCopyWith<$Res> {
  __$$StartStreamModelImplCopyWithImpl(_$StartStreamModelImpl _value,
      $Res Function(_$StartStreamModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StartStreamModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? status = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$StartStreamModelImpl(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as WebRTCDataModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StartStreamModelImpl implements _StartStreamModel {
  const _$StartStreamModelImpl(
      {this.statusCode = 200, this.status = '', this.message = '', this.data});

  factory _$StartStreamModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StartStreamModelImplFromJson(json);

  @override
  @JsonKey()
  final int statusCode;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final String message;
  @override
  final WebRTCDataModel? data;

  @override
  String toString() {
    return 'StartStreamModel(statusCode: $statusCode, status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartStreamModelImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, statusCode, status, message, data);

  /// Create a copy of StartStreamModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartStreamModelImplCopyWith<_$StartStreamModelImpl> get copyWith =>
      __$$StartStreamModelImplCopyWithImpl<_$StartStreamModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StartStreamModelImplToJson(
      this,
    );
  }
}

abstract class _StartStreamModel implements StartStreamModel {
  const factory _StartStreamModel(
      {final int statusCode,
      final String status,
      final String message,
      final WebRTCDataModel? data}) = _$StartStreamModelImpl;

  factory _StartStreamModel.fromJson(Map<String, dynamic> json) =
      _$StartStreamModelImpl.fromJson;

  @override
  int get statusCode;
  @override
  String get status;
  @override
  String get message;
  @override
  WebRTCDataModel? get data;

  /// Create a copy of StartStreamModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartStreamModelImplCopyWith<_$StartStreamModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WebRTCDataModel _$WebRTCDataModelFromJson(Map<String, dynamic> json) {
  return _WebRTCDataModel.fromJson(json);
}

/// @nodoc
mixin _$WebRTCDataModel {
  String get id => throw _privateConstructorUsedError;
  WebRTCDetailsModel? get webrtcData => throw _privateConstructorUsedError;

  /// Serializes this WebRTCDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WebRTCDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WebRTCDataModelCopyWith<WebRTCDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebRTCDataModelCopyWith<$Res> {
  factory $WebRTCDataModelCopyWith(
          WebRTCDataModel value, $Res Function(WebRTCDataModel) then) =
      _$WebRTCDataModelCopyWithImpl<$Res, WebRTCDataModel>;
  @useResult
  $Res call({String id, WebRTCDetailsModel? webrtcData});

  $WebRTCDetailsModelCopyWith<$Res>? get webrtcData;
}

/// @nodoc
class _$WebRTCDataModelCopyWithImpl<$Res, $Val extends WebRTCDataModel>
    implements $WebRTCDataModelCopyWith<$Res> {
  _$WebRTCDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WebRTCDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? webrtcData = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      webrtcData: freezed == webrtcData
          ? _value.webrtcData
          : webrtcData // ignore: cast_nullable_to_non_nullable
              as WebRTCDetailsModel?,
    ) as $Val);
  }

  /// Create a copy of WebRTCDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WebRTCDetailsModelCopyWith<$Res>? get webrtcData {
    if (_value.webrtcData == null) {
      return null;
    }

    return $WebRTCDetailsModelCopyWith<$Res>(_value.webrtcData!, (value) {
      return _then(_value.copyWith(webrtcData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WebRTCDataModelImplCopyWith<$Res>
    implements $WebRTCDataModelCopyWith<$Res> {
  factory _$$WebRTCDataModelImplCopyWith(_$WebRTCDataModelImpl value,
          $Res Function(_$WebRTCDataModelImpl) then) =
      __$$WebRTCDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, WebRTCDetailsModel? webrtcData});

  @override
  $WebRTCDetailsModelCopyWith<$Res>? get webrtcData;
}

/// @nodoc
class __$$WebRTCDataModelImplCopyWithImpl<$Res>
    extends _$WebRTCDataModelCopyWithImpl<$Res, _$WebRTCDataModelImpl>
    implements _$$WebRTCDataModelImplCopyWith<$Res> {
  __$$WebRTCDataModelImplCopyWithImpl(
      _$WebRTCDataModelImpl _value, $Res Function(_$WebRTCDataModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WebRTCDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? webrtcData = freezed,
  }) {
    return _then(_$WebRTCDataModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      webrtcData: freezed == webrtcData
          ? _value.webrtcData
          : webrtcData // ignore: cast_nullable_to_non_nullable
              as WebRTCDetailsModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WebRTCDataModelImpl implements _WebRTCDataModel {
  const _$WebRTCDataModelImpl({this.id = '', this.webrtcData});

  factory _$WebRTCDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WebRTCDataModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  final WebRTCDetailsModel? webrtcData;

  @override
  String toString() {
    return 'WebRTCDataModel(id: $id, webrtcData: $webrtcData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WebRTCDataModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.webrtcData, webrtcData) ||
                other.webrtcData == webrtcData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, webrtcData);

  /// Create a copy of WebRTCDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WebRTCDataModelImplCopyWith<_$WebRTCDataModelImpl> get copyWith =>
      __$$WebRTCDataModelImplCopyWithImpl<_$WebRTCDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WebRTCDataModelImplToJson(
      this,
    );
  }
}

abstract class _WebRTCDataModel implements WebRTCDataModel {
  const factory _WebRTCDataModel(
      {final String id,
      final WebRTCDetailsModel? webrtcData}) = _$WebRTCDataModelImpl;

  factory _WebRTCDataModel.fromJson(Map<String, dynamic> json) =
      _$WebRTCDataModelImpl.fromJson;

  @override
  String get id;
  @override
  WebRTCDetailsModel? get webrtcData;

  /// Create a copy of WebRTCDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WebRTCDataModelImplCopyWith<_$WebRTCDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WebRTCDetailsModel _$WebRTCDetailsModelFromJson(Map<String, dynamic> json) {
  return _WebRTCDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$WebRTCDetailsModel {
  OfferModel? get offer => throw _privateConstructorUsedError;
  List<ICEServerModel> get iceServers => throw _privateConstructorUsedError;

  /// Serializes this WebRTCDetailsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WebRTCDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WebRTCDetailsModelCopyWith<WebRTCDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebRTCDetailsModelCopyWith<$Res> {
  factory $WebRTCDetailsModelCopyWith(
          WebRTCDetailsModel value, $Res Function(WebRTCDetailsModel) then) =
      _$WebRTCDetailsModelCopyWithImpl<$Res, WebRTCDetailsModel>;
  @useResult
  $Res call({OfferModel? offer, List<ICEServerModel> iceServers});

  $OfferModelCopyWith<$Res>? get offer;
}

/// @nodoc
class _$WebRTCDetailsModelCopyWithImpl<$Res, $Val extends WebRTCDetailsModel>
    implements $WebRTCDetailsModelCopyWith<$Res> {
  _$WebRTCDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WebRTCDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offer = freezed,
    Object? iceServers = null,
  }) {
    return _then(_value.copyWith(
      offer: freezed == offer
          ? _value.offer
          : offer // ignore: cast_nullable_to_non_nullable
              as OfferModel?,
      iceServers: null == iceServers
          ? _value.iceServers
          : iceServers // ignore: cast_nullable_to_non_nullable
              as List<ICEServerModel>,
    ) as $Val);
  }

  /// Create a copy of WebRTCDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OfferModelCopyWith<$Res>? get offer {
    if (_value.offer == null) {
      return null;
    }

    return $OfferModelCopyWith<$Res>(_value.offer!, (value) {
      return _then(_value.copyWith(offer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WebRTCDetailsModelImplCopyWith<$Res>
    implements $WebRTCDetailsModelCopyWith<$Res> {
  factory _$$WebRTCDetailsModelImplCopyWith(_$WebRTCDetailsModelImpl value,
          $Res Function(_$WebRTCDetailsModelImpl) then) =
      __$$WebRTCDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OfferModel? offer, List<ICEServerModel> iceServers});

  @override
  $OfferModelCopyWith<$Res>? get offer;
}

/// @nodoc
class __$$WebRTCDetailsModelImplCopyWithImpl<$Res>
    extends _$WebRTCDetailsModelCopyWithImpl<$Res, _$WebRTCDetailsModelImpl>
    implements _$$WebRTCDetailsModelImplCopyWith<$Res> {
  __$$WebRTCDetailsModelImplCopyWithImpl(_$WebRTCDetailsModelImpl _value,
      $Res Function(_$WebRTCDetailsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WebRTCDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offer = freezed,
    Object? iceServers = null,
  }) {
    return _then(_$WebRTCDetailsModelImpl(
      offer: freezed == offer
          ? _value.offer
          : offer // ignore: cast_nullable_to_non_nullable
              as OfferModel?,
      iceServers: null == iceServers
          ? _value._iceServers
          : iceServers // ignore: cast_nullable_to_non_nullable
              as List<ICEServerModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WebRTCDetailsModelImpl implements _WebRTCDetailsModel {
  const _$WebRTCDetailsModelImpl(
      {this.offer, final List<ICEServerModel> iceServers = const []})
      : _iceServers = iceServers;

  factory _$WebRTCDetailsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WebRTCDetailsModelImplFromJson(json);

  @override
  final OfferModel? offer;
  final List<ICEServerModel> _iceServers;
  @override
  @JsonKey()
  List<ICEServerModel> get iceServers {
    if (_iceServers is EqualUnmodifiableListView) return _iceServers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_iceServers);
  }

  @override
  String toString() {
    return 'WebRTCDetailsModel(offer: $offer, iceServers: $iceServers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WebRTCDetailsModelImpl &&
            (identical(other.offer, offer) || other.offer == offer) &&
            const DeepCollectionEquality()
                .equals(other._iceServers, _iceServers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, offer, const DeepCollectionEquality().hash(_iceServers));

  /// Create a copy of WebRTCDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WebRTCDetailsModelImplCopyWith<_$WebRTCDetailsModelImpl> get copyWith =>
      __$$WebRTCDetailsModelImplCopyWithImpl<_$WebRTCDetailsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WebRTCDetailsModelImplToJson(
      this,
    );
  }
}

abstract class _WebRTCDetailsModel implements WebRTCDetailsModel {
  const factory _WebRTCDetailsModel(
      {final OfferModel? offer,
      final List<ICEServerModel> iceServers}) = _$WebRTCDetailsModelImpl;

  factory _WebRTCDetailsModel.fromJson(Map<String, dynamic> json) =
      _$WebRTCDetailsModelImpl.fromJson;

  @override
  OfferModel? get offer;
  @override
  List<ICEServerModel> get iceServers;

  /// Create a copy of WebRTCDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WebRTCDetailsModelImplCopyWith<_$WebRTCDetailsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OfferModel _$OfferModelFromJson(Map<String, dynamic> json) {
  return _OfferModel.fromJson(json);
}

/// @nodoc
mixin _$OfferModel {
  String get type => throw _privateConstructorUsedError;
  String get sdp => throw _privateConstructorUsedError;

  /// Serializes this OfferModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OfferModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OfferModelCopyWith<OfferModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferModelCopyWith<$Res> {
  factory $OfferModelCopyWith(
          OfferModel value, $Res Function(OfferModel) then) =
      _$OfferModelCopyWithImpl<$Res, OfferModel>;
  @useResult
  $Res call({String type, String sdp});
}

/// @nodoc
class _$OfferModelCopyWithImpl<$Res, $Val extends OfferModel>
    implements $OfferModelCopyWith<$Res> {
  _$OfferModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OfferModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? sdp = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      sdp: null == sdp
          ? _value.sdp
          : sdp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OfferModelImplCopyWith<$Res>
    implements $OfferModelCopyWith<$Res> {
  factory _$$OfferModelImplCopyWith(
          _$OfferModelImpl value, $Res Function(_$OfferModelImpl) then) =
      __$$OfferModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String sdp});
}

/// @nodoc
class __$$OfferModelImplCopyWithImpl<$Res>
    extends _$OfferModelCopyWithImpl<$Res, _$OfferModelImpl>
    implements _$$OfferModelImplCopyWith<$Res> {
  __$$OfferModelImplCopyWithImpl(
      _$OfferModelImpl _value, $Res Function(_$OfferModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OfferModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? sdp = null,
  }) {
    return _then(_$OfferModelImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      sdp: null == sdp
          ? _value.sdp
          : sdp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OfferModelImpl implements _OfferModel {
  const _$OfferModelImpl({this.type = '', this.sdp = ''});

  factory _$OfferModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfferModelImplFromJson(json);

  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final String sdp;

  @override
  String toString() {
    return 'OfferModel(type: $type, sdp: $sdp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfferModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.sdp, sdp) || other.sdp == sdp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, sdp);

  /// Create a copy of OfferModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OfferModelImplCopyWith<_$OfferModelImpl> get copyWith =>
      __$$OfferModelImplCopyWithImpl<_$OfferModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfferModelImplToJson(
      this,
    );
  }
}

abstract class _OfferModel implements OfferModel {
  const factory _OfferModel({final String type, final String sdp}) =
      _$OfferModelImpl;

  factory _OfferModel.fromJson(Map<String, dynamic> json) =
      _$OfferModelImpl.fromJson;

  @override
  String get type;
  @override
  String get sdp;

  /// Create a copy of OfferModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OfferModelImplCopyWith<_$OfferModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ICEServerModel _$ICEServerModelFromJson(Map<String, dynamic> json) {
  return _ICEServerModel.fromJson(json);
}

/// @nodoc
mixin _$ICEServerModel {
  String get urls => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get credential => throw _privateConstructorUsedError;

  /// Serializes this ICEServerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ICEServerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ICEServerModelCopyWith<ICEServerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ICEServerModelCopyWith<$Res> {
  factory $ICEServerModelCopyWith(
          ICEServerModel value, $Res Function(ICEServerModel) then) =
      _$ICEServerModelCopyWithImpl<$Res, ICEServerModel>;
  @useResult
  $Res call({String urls, String username, String credential});
}

/// @nodoc
class _$ICEServerModelCopyWithImpl<$Res, $Val extends ICEServerModel>
    implements $ICEServerModelCopyWith<$Res> {
  _$ICEServerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ICEServerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? urls = null,
    Object? username = null,
    Object? credential = null,
  }) {
    return _then(_value.copyWith(
      urls: null == urls
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      credential: null == credential
          ? _value.credential
          : credential // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ICEServerModelImplCopyWith<$Res>
    implements $ICEServerModelCopyWith<$Res> {
  factory _$$ICEServerModelImplCopyWith(_$ICEServerModelImpl value,
          $Res Function(_$ICEServerModelImpl) then) =
      __$$ICEServerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String urls, String username, String credential});
}

/// @nodoc
class __$$ICEServerModelImplCopyWithImpl<$Res>
    extends _$ICEServerModelCopyWithImpl<$Res, _$ICEServerModelImpl>
    implements _$$ICEServerModelImplCopyWith<$Res> {
  __$$ICEServerModelImplCopyWithImpl(
      _$ICEServerModelImpl _value, $Res Function(_$ICEServerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ICEServerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? urls = null,
    Object? username = null,
    Object? credential = null,
  }) {
    return _then(_$ICEServerModelImpl(
      urls: null == urls
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      credential: null == credential
          ? _value.credential
          : credential // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ICEServerModelImpl implements _ICEServerModel {
  const _$ICEServerModelImpl(
      {this.urls = '', this.username = '', this.credential = ''});

  factory _$ICEServerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ICEServerModelImplFromJson(json);

  @override
  @JsonKey()
  final String urls;
  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final String credential;

  @override
  String toString() {
    return 'ICEServerModel(urls: $urls, username: $username, credential: $credential)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ICEServerModelImpl &&
            (identical(other.urls, urls) || other.urls == urls) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.credential, credential) ||
                other.credential == credential));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, urls, username, credential);

  /// Create a copy of ICEServerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ICEServerModelImplCopyWith<_$ICEServerModelImpl> get copyWith =>
      __$$ICEServerModelImplCopyWithImpl<_$ICEServerModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ICEServerModelImplToJson(
      this,
    );
  }
}

abstract class _ICEServerModel implements ICEServerModel {
  const factory _ICEServerModel(
      {final String urls,
      final String username,
      final String credential}) = _$ICEServerModelImpl;

  factory _ICEServerModel.fromJson(Map<String, dynamic> json) =
      _$ICEServerModelImpl.fromJson;

  @override
  String get urls;
  @override
  String get username;
  @override
  String get credential;

  /// Create a copy of ICEServerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ICEServerModelImplCopyWith<_$ICEServerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SendAnswerResponseModel _$SendAnswerResponseModelFromJson(
    Map<String, dynamic> json) {
  return _SendAnswerResponseModel.fromJson(json);
}

/// @nodoc
mixin _$SendAnswerResponseModel {
  @JsonKey(name: "status_code")
  int get statusCode => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this SendAnswerResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendAnswerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendAnswerResponseModelCopyWith<SendAnswerResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendAnswerResponseModelCopyWith<$Res> {
  factory $SendAnswerResponseModelCopyWith(SendAnswerResponseModel value,
          $Res Function(SendAnswerResponseModel) then) =
      _$SendAnswerResponseModelCopyWithImpl<$Res, SendAnswerResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status_code") int statusCode,
      String status,
      String message});
}

/// @nodoc
class _$SendAnswerResponseModelCopyWithImpl<$Res,
        $Val extends SendAnswerResponseModel>
    implements $SendAnswerResponseModelCopyWith<$Res> {
  _$SendAnswerResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendAnswerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? status = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendAnswerResponseModelImplCopyWith<$Res>
    implements $SendAnswerResponseModelCopyWith<$Res> {
  factory _$$SendAnswerResponseModelImplCopyWith(
          _$SendAnswerResponseModelImpl value,
          $Res Function(_$SendAnswerResponseModelImpl) then) =
      __$$SendAnswerResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status_code") int statusCode,
      String status,
      String message});
}

/// @nodoc
class __$$SendAnswerResponseModelImplCopyWithImpl<$Res>
    extends _$SendAnswerResponseModelCopyWithImpl<$Res,
        _$SendAnswerResponseModelImpl>
    implements _$$SendAnswerResponseModelImplCopyWith<$Res> {
  __$$SendAnswerResponseModelImplCopyWithImpl(
      _$SendAnswerResponseModelImpl _value,
      $Res Function(_$SendAnswerResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendAnswerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? status = null,
    Object? message = null,
  }) {
    return _then(_$SendAnswerResponseModelImpl(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendAnswerResponseModelImpl implements _SendAnswerResponseModel {
  const _$SendAnswerResponseModelImpl(
      {@JsonKey(name: "status_code") this.statusCode = 0,
      this.status = '',
      this.message = ''});

  factory _$SendAnswerResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendAnswerResponseModelImplFromJson(json);

  @override
  @JsonKey(name: "status_code")
  final int statusCode;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'SendAnswerResponseModel(statusCode: $statusCode, status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendAnswerResponseModelImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, status, message);

  /// Create a copy of SendAnswerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendAnswerResponseModelImplCopyWith<_$SendAnswerResponseModelImpl>
      get copyWith => __$$SendAnswerResponseModelImplCopyWithImpl<
          _$SendAnswerResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendAnswerResponseModelImplToJson(
      this,
    );
  }
}

abstract class _SendAnswerResponseModel implements SendAnswerResponseModel {
  const factory _SendAnswerResponseModel(
      {@JsonKey(name: "status_code") final int statusCode,
      final String status,
      final String message}) = _$SendAnswerResponseModelImpl;

  factory _SendAnswerResponseModel.fromJson(Map<String, dynamic> json) =
      _$SendAnswerResponseModelImpl.fromJson;

  @override
  @JsonKey(name: "status_code")
  int get statusCode;
  @override
  String get status;
  @override
  String get message;

  /// Create a copy of SendAnswerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendAnswerResponseModelImplCopyWith<_$SendAnswerResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FailureCloseStreamModel _$FailureCloseStreamModelFromJson(
    Map<String, dynamic> json) {
  return _FailureCloseStreamModel.fromJson(json);
}

/// @nodoc
mixin _$FailureCloseStreamModel {
  List<String>? get errorDescription => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get detail => throw _privateConstructorUsedError;
  int? get statusCode => throw _privateConstructorUsedError;

  /// Serializes this FailureCloseStreamModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FailureCloseStreamModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FailureCloseStreamModelCopyWith<FailureCloseStreamModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCloseStreamModelCopyWith<$Res> {
  factory $FailureCloseStreamModelCopyWith(FailureCloseStreamModel value,
          $Res Function(FailureCloseStreamModel) then) =
      _$FailureCloseStreamModelCopyWithImpl<$Res, FailureCloseStreamModel>;
  @useResult
  $Res call(
      {List<String>? errorDescription,
      String? message,
      String? detail,
      int? statusCode});
}

/// @nodoc
class _$FailureCloseStreamModelCopyWithImpl<$Res,
        $Val extends FailureCloseStreamModel>
    implements $FailureCloseStreamModelCopyWith<$Res> {
  _$FailureCloseStreamModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FailureCloseStreamModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorDescription = freezed,
    Object? message = freezed,
    Object? detail = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_value.copyWith(
      errorDescription: freezed == errorDescription
          ? _value.errorDescription
          : errorDescription // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FailureCloseStreamModelImplCopyWith<$Res>
    implements $FailureCloseStreamModelCopyWith<$Res> {
  factory _$$FailureCloseStreamModelImplCopyWith(
          _$FailureCloseStreamModelImpl value,
          $Res Function(_$FailureCloseStreamModelImpl) then) =
      __$$FailureCloseStreamModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String>? errorDescription,
      String? message,
      String? detail,
      int? statusCode});
}

/// @nodoc
class __$$FailureCloseStreamModelImplCopyWithImpl<$Res>
    extends _$FailureCloseStreamModelCopyWithImpl<$Res,
        _$FailureCloseStreamModelImpl>
    implements _$$FailureCloseStreamModelImplCopyWith<$Res> {
  __$$FailureCloseStreamModelImplCopyWithImpl(
      _$FailureCloseStreamModelImpl _value,
      $Res Function(_$FailureCloseStreamModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FailureCloseStreamModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorDescription = freezed,
    Object? message = freezed,
    Object? detail = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_$FailureCloseStreamModelImpl(
      errorDescription: freezed == errorDescription
          ? _value._errorDescription
          : errorDescription // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FailureCloseStreamModelImpl implements _FailureCloseStreamModel {
  const _$FailureCloseStreamModelImpl(
      {final List<String>? errorDescription = const [],
      this.message = null,
      this.detail = null,
      this.statusCode = 0})
      : _errorDescription = errorDescription;

  factory _$FailureCloseStreamModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FailureCloseStreamModelImplFromJson(json);

  final List<String>? _errorDescription;
  @override
  @JsonKey()
  List<String>? get errorDescription {
    final value = _errorDescription;
    if (value == null) return null;
    if (_errorDescription is EqualUnmodifiableListView)
      return _errorDescription;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final String? message;
  @override
  @JsonKey()
  final String? detail;
  @override
  @JsonKey()
  final int? statusCode;

  @override
  String toString() {
    return 'FailureCloseStreamModel(errorDescription: $errorDescription, message: $message, detail: $detail, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureCloseStreamModelImpl &&
            const DeepCollectionEquality()
                .equals(other._errorDescription, _errorDescription) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_errorDescription),
      message,
      detail,
      statusCode);

  /// Create a copy of FailureCloseStreamModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureCloseStreamModelImplCopyWith<_$FailureCloseStreamModelImpl>
      get copyWith => __$$FailureCloseStreamModelImplCopyWithImpl<
          _$FailureCloseStreamModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FailureCloseStreamModelImplToJson(
      this,
    );
  }
}

abstract class _FailureCloseStreamModel implements FailureCloseStreamModel {
  const factory _FailureCloseStreamModel(
      {final List<String>? errorDescription,
      final String? message,
      final String? detail,
      final int? statusCode}) = _$FailureCloseStreamModelImpl;

  factory _FailureCloseStreamModel.fromJson(Map<String, dynamic> json) =
      _$FailureCloseStreamModelImpl.fromJson;

  @override
  List<String>? get errorDescription;
  @override
  String? get message;
  @override
  String? get detail;
  @override
  int? get statusCode;

  /// Create a copy of FailureCloseStreamModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureCloseStreamModelImplCopyWith<_$FailureCloseStreamModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PlatformChatbotResponseModel _$PlatformChatbotResponseModelFromJson(
    Map<String, dynamic> json) {
  return _PlatformChatbotResponseModel.fromJson(json);
}

/// @nodoc
mixin _$PlatformChatbotResponseModel {
  String? get conversationId => throw _privateConstructorUsedError;
  List<dynamic> get response => throw _privateConstructorUsedError;
  String? get responseFormat => throw _privateConstructorUsedError;

  /// Serializes this PlatformChatbotResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlatformChatbotResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlatformChatbotResponseModelCopyWith<PlatformChatbotResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlatformChatbotResponseModelCopyWith<$Res> {
  factory $PlatformChatbotResponseModelCopyWith(
          PlatformChatbotResponseModel value,
          $Res Function(PlatformChatbotResponseModel) then) =
      _$PlatformChatbotResponseModelCopyWithImpl<$Res,
          PlatformChatbotResponseModel>;
  @useResult
  $Res call(
      {String? conversationId, List<dynamic> response, String? responseFormat});
}

/// @nodoc
class _$PlatformChatbotResponseModelCopyWithImpl<$Res,
        $Val extends PlatformChatbotResponseModel>
    implements $PlatformChatbotResponseModelCopyWith<$Res> {
  _$PlatformChatbotResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlatformChatbotResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationId = freezed,
    Object? response = null,
    Object? responseFormat = freezed,
  }) {
    return _then(_value.copyWith(
      conversationId: freezed == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as String?,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      responseFormat: freezed == responseFormat
          ? _value.responseFormat
          : responseFormat // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlatformChatbotResponseModelImplCopyWith<$Res>
    implements $PlatformChatbotResponseModelCopyWith<$Res> {
  factory _$$PlatformChatbotResponseModelImplCopyWith(
          _$PlatformChatbotResponseModelImpl value,
          $Res Function(_$PlatformChatbotResponseModelImpl) then) =
      __$$PlatformChatbotResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? conversationId, List<dynamic> response, String? responseFormat});
}

/// @nodoc
class __$$PlatformChatbotResponseModelImplCopyWithImpl<$Res>
    extends _$PlatformChatbotResponseModelCopyWithImpl<$Res,
        _$PlatformChatbotResponseModelImpl>
    implements _$$PlatformChatbotResponseModelImplCopyWith<$Res> {
  __$$PlatformChatbotResponseModelImplCopyWithImpl(
      _$PlatformChatbotResponseModelImpl _value,
      $Res Function(_$PlatformChatbotResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlatformChatbotResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationId = freezed,
    Object? response = null,
    Object? responseFormat = freezed,
  }) {
    return _then(_$PlatformChatbotResponseModelImpl(
      conversationId: freezed == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as String?,
      response: null == response
          ? _value._response
          : response // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      responseFormat: freezed == responseFormat
          ? _value.responseFormat
          : responseFormat // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlatformChatbotResponseModelImpl
    implements _PlatformChatbotResponseModel {
  const _$PlatformChatbotResponseModelImpl(
      {this.conversationId = null,
      final List<dynamic> response = const [],
      this.responseFormat = ""})
      : _response = response;

  factory _$PlatformChatbotResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PlatformChatbotResponseModelImplFromJson(json);

  @override
  @JsonKey()
  final String? conversationId;
  final List<dynamic> _response;
  @override
  @JsonKey()
  List<dynamic> get response {
    if (_response is EqualUnmodifiableListView) return _response;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_response);
  }

  @override
  @JsonKey()
  final String? responseFormat;

  @override
  String toString() {
    return 'PlatformChatbotResponseModel(conversationId: $conversationId, response: $response, responseFormat: $responseFormat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlatformChatbotResponseModelImpl &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            const DeepCollectionEquality().equals(other._response, _response) &&
            (identical(other.responseFormat, responseFormat) ||
                other.responseFormat == responseFormat));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, conversationId,
      const DeepCollectionEquality().hash(_response), responseFormat);

  /// Create a copy of PlatformChatbotResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlatformChatbotResponseModelImplCopyWith<
          _$PlatformChatbotResponseModelImpl>
      get copyWith => __$$PlatformChatbotResponseModelImplCopyWithImpl<
          _$PlatformChatbotResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlatformChatbotResponseModelImplToJson(
      this,
    );
  }
}

abstract class _PlatformChatbotResponseModel
    implements PlatformChatbotResponseModel {
  const factory _PlatformChatbotResponseModel(
      {final String? conversationId,
      final List<dynamic> response,
      final String? responseFormat}) = _$PlatformChatbotResponseModelImpl;

  factory _PlatformChatbotResponseModel.fromJson(Map<String, dynamic> json) =
      _$PlatformChatbotResponseModelImpl.fromJson;

  @override
  String? get conversationId;
  @override
  List<dynamic> get response;
  @override
  String? get responseFormat;

  /// Create a copy of PlatformChatbotResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlatformChatbotResponseModelImplCopyWith<
          _$PlatformChatbotResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
