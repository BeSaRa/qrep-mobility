// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_chatbot_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FullNewChatbotResponseModel _$FullNewChatbotResponseModelFromJson(
    Map<String, dynamic> json) {
  return _FullNewChatbotResponseModel.fromJson(json);
}

/// @nodoc
mixin _$FullNewChatbotResponseModel {
  NewChatbotResponseModel get data => throw _privateConstructorUsedError;

  /// Serializes this FullNewChatbotResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FullNewChatbotResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FullNewChatbotResponseModelCopyWith<FullNewChatbotResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FullNewChatbotResponseModelCopyWith<$Res> {
  factory $FullNewChatbotResponseModelCopyWith(
          FullNewChatbotResponseModel value,
          $Res Function(FullNewChatbotResponseModel) then) =
      _$FullNewChatbotResponseModelCopyWithImpl<$Res,
          FullNewChatbotResponseModel>;
  @useResult
  $Res call({NewChatbotResponseModel data});

  $NewChatbotResponseModelCopyWith<$Res> get data;
}

/// @nodoc
class _$FullNewChatbotResponseModelCopyWithImpl<$Res,
        $Val extends FullNewChatbotResponseModel>
    implements $FullNewChatbotResponseModelCopyWith<$Res> {
  _$FullNewChatbotResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FullNewChatbotResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as NewChatbotResponseModel,
    ) as $Val);
  }

  /// Create a copy of FullNewChatbotResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NewChatbotResponseModelCopyWith<$Res> get data {
    return $NewChatbotResponseModelCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FullNewChatbotResponseModelImplCopyWith<$Res>
    implements $FullNewChatbotResponseModelCopyWith<$Res> {
  factory _$$FullNewChatbotResponseModelImplCopyWith(
          _$FullNewChatbotResponseModelImpl value,
          $Res Function(_$FullNewChatbotResponseModelImpl) then) =
      __$$FullNewChatbotResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NewChatbotResponseModel data});

  @override
  $NewChatbotResponseModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$FullNewChatbotResponseModelImplCopyWithImpl<$Res>
    extends _$FullNewChatbotResponseModelCopyWithImpl<$Res,
        _$FullNewChatbotResponseModelImpl>
    implements _$$FullNewChatbotResponseModelImplCopyWith<$Res> {
  __$$FullNewChatbotResponseModelImplCopyWithImpl(
      _$FullNewChatbotResponseModelImpl _value,
      $Res Function(_$FullNewChatbotResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FullNewChatbotResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$FullNewChatbotResponseModelImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as NewChatbotResponseModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FullNewChatbotResponseModelImpl
    implements _FullNewChatbotResponseModel {
  const _$FullNewChatbotResponseModelImpl({required this.data});

  factory _$FullNewChatbotResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$FullNewChatbotResponseModelImplFromJson(json);

  @override
  final NewChatbotResponseModel data;

  @override
  String toString() {
    return 'FullNewChatbotResponseModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FullNewChatbotResponseModelImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of FullNewChatbotResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FullNewChatbotResponseModelImplCopyWith<_$FullNewChatbotResponseModelImpl>
      get copyWith => __$$FullNewChatbotResponseModelImplCopyWithImpl<
          _$FullNewChatbotResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FullNewChatbotResponseModelImplToJson(
      this,
    );
  }
}

abstract class _FullNewChatbotResponseModel
    implements FullNewChatbotResponseModel {
  const factory _FullNewChatbotResponseModel(
          {required final NewChatbotResponseModel data}) =
      _$FullNewChatbotResponseModelImpl;

  factory _FullNewChatbotResponseModel.fromJson(Map<String, dynamic> json) =
      _$FullNewChatbotResponseModelImpl.fromJson;

  @override
  NewChatbotResponseModel get data;

  /// Create a copy of FullNewChatbotResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FullNewChatbotResponseModelImplCopyWith<_$FullNewChatbotResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

NewChatbotResponseModel _$NewChatbotResponseModelFromJson(
    Map<String, dynamic> json) {
  return _NewChatbotResponseModel.fromJson(json);
}

/// @nodoc
mixin _$NewChatbotResponseModel {
  String get event => throw _privateConstructorUsedError;
  DataResponseModel get data => throw _privateConstructorUsedError;

  /// Serializes this NewChatbotResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NewChatbotResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewChatbotResponseModelCopyWith<NewChatbotResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewChatbotResponseModelCopyWith<$Res> {
  factory $NewChatbotResponseModelCopyWith(NewChatbotResponseModel value,
          $Res Function(NewChatbotResponseModel) then) =
      _$NewChatbotResponseModelCopyWithImpl<$Res, NewChatbotResponseModel>;
  @useResult
  $Res call({String event, DataResponseModel data});

  $DataResponseModelCopyWith<$Res> get data;
}

/// @nodoc
class _$NewChatbotResponseModelCopyWithImpl<$Res,
        $Val extends NewChatbotResponseModel>
    implements $NewChatbotResponseModelCopyWith<$Res> {
  _$NewChatbotResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewChatbotResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataResponseModel,
    ) as $Val);
  }

  /// Create a copy of NewChatbotResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataResponseModelCopyWith<$Res> get data {
    return $DataResponseModelCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NewChatbotResponseModelImplCopyWith<$Res>
    implements $NewChatbotResponseModelCopyWith<$Res> {
  factory _$$NewChatbotResponseModelImplCopyWith(
          _$NewChatbotResponseModelImpl value,
          $Res Function(_$NewChatbotResponseModelImpl) then) =
      __$$NewChatbotResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String event, DataResponseModel data});

  @override
  $DataResponseModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$NewChatbotResponseModelImplCopyWithImpl<$Res>
    extends _$NewChatbotResponseModelCopyWithImpl<$Res,
        _$NewChatbotResponseModelImpl>
    implements _$$NewChatbotResponseModelImplCopyWith<$Res> {
  __$$NewChatbotResponseModelImplCopyWithImpl(
      _$NewChatbotResponseModelImpl _value,
      $Res Function(_$NewChatbotResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewChatbotResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
    Object? data = null,
  }) {
    return _then(_$NewChatbotResponseModelImpl(
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataResponseModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewChatbotResponseModelImpl implements _NewChatbotResponseModel {
  const _$NewChatbotResponseModelImpl(
      {required this.event, required this.data});

  factory _$NewChatbotResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewChatbotResponseModelImplFromJson(json);

  @override
  final String event;
  @override
  final DataResponseModel data;

  @override
  String toString() {
    return 'NewChatbotResponseModel(event: $event, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewChatbotResponseModelImpl &&
            (identical(other.event, event) || other.event == event) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, event, data);

  /// Create a copy of NewChatbotResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewChatbotResponseModelImplCopyWith<_$NewChatbotResponseModelImpl>
      get copyWith => __$$NewChatbotResponseModelImplCopyWithImpl<
          _$NewChatbotResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewChatbotResponseModelImplToJson(
      this,
    );
  }
}

abstract class _NewChatbotResponseModel implements NewChatbotResponseModel {
  const factory _NewChatbotResponseModel(
      {required final String event,
      required final DataResponseModel data}) = _$NewChatbotResponseModelImpl;

  factory _NewChatbotResponseModel.fromJson(Map<String, dynamic> json) =
      _$NewChatbotResponseModelImpl.fromJson;

  @override
  String get event;
  @override
  DataResponseModel get data;

  /// Create a copy of NewChatbotResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewChatbotResponseModelImplCopyWith<_$NewChatbotResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DataResponseModel _$DataResponseModelFromJson(Map<String, dynamic> json) {
  return _DataResponseModel.fromJson(json);
}

/// @nodoc
mixin _$DataResponseModel {
  String get content => throw _privateConstructorUsedError;
  List<DocumentModel>? get citations => throw _privateConstructorUsedError;
  @JsonKey(name: "conversation_id")
  String get conversationId => throw _privateConstructorUsedError;
  @JsonKey(name: "stream_id")
  String get streamId => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "action_results")
  List<ActionResult> get actionResults => throw _privateConstructorUsedError;

  /// Serializes this DataResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DataResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataResponseModelCopyWith<DataResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataResponseModelCopyWith<$Res> {
  factory $DataResponseModelCopyWith(
          DataResponseModel value, $Res Function(DataResponseModel) then) =
      _$DataResponseModelCopyWithImpl<$Res, DataResponseModel>;
  @useResult
  $Res call(
      {String content,
      List<DocumentModel>? citations,
      @JsonKey(name: "conversation_id") String conversationId,
      @JsonKey(name: "stream_id") String streamId,
      @JsonKey(name: "user_id") String userId,
      @JsonKey(name: "action_results") List<ActionResult> actionResults});
}

/// @nodoc
class _$DataResponseModelCopyWithImpl<$Res, $Val extends DataResponseModel>
    implements $DataResponseModelCopyWith<$Res> {
  _$DataResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? citations = freezed,
    Object? conversationId = null,
    Object? streamId = null,
    Object? userId = null,
    Object? actionResults = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      citations: freezed == citations
          ? _value.citations
          : citations // ignore: cast_nullable_to_non_nullable
              as List<DocumentModel>?,
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
          ? _value.actionResults
          : actionResults // ignore: cast_nullable_to_non_nullable
              as List<ActionResult>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataResponseModelImplCopyWith<$Res>
    implements $DataResponseModelCopyWith<$Res> {
  factory _$$DataResponseModelImplCopyWith(_$DataResponseModelImpl value,
          $Res Function(_$DataResponseModelImpl) then) =
      __$$DataResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String content,
      List<DocumentModel>? citations,
      @JsonKey(name: "conversation_id") String conversationId,
      @JsonKey(name: "stream_id") String streamId,
      @JsonKey(name: "user_id") String userId,
      @JsonKey(name: "action_results") List<ActionResult> actionResults});
}

/// @nodoc
class __$$DataResponseModelImplCopyWithImpl<$Res>
    extends _$DataResponseModelCopyWithImpl<$Res, _$DataResponseModelImpl>
    implements _$$DataResponseModelImplCopyWith<$Res> {
  __$$DataResponseModelImplCopyWithImpl(_$DataResponseModelImpl _value,
      $Res Function(_$DataResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? citations = freezed,
    Object? conversationId = null,
    Object? streamId = null,
    Object? userId = null,
    Object? actionResults = null,
  }) {
    return _then(_$DataResponseModelImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      citations: freezed == citations
          ? _value._citations
          : citations // ignore: cast_nullable_to_non_nullable
              as List<DocumentModel>?,
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
@JsonSerializable()
class _$DataResponseModelImpl implements _DataResponseModel {
  const _$DataResponseModelImpl(
      {this.content = '',
      final List<DocumentModel>? citations = const [],
      @JsonKey(name: "conversation_id") this.conversationId = '',
      @JsonKey(name: "stream_id") this.streamId = '',
      @JsonKey(name: "user_id") this.userId = '',
      @JsonKey(name: "action_results")
      final List<ActionResult> actionResults = const []})
      : _citations = citations,
        _actionResults = actionResults;

  factory _$DataResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataResponseModelImplFromJson(json);

  @override
  @JsonKey()
  final String content;
  final List<DocumentModel>? _citations;
  @override
  @JsonKey()
  List<DocumentModel>? get citations {
    final value = _citations;
    if (value == null) return null;
    if (_citations is EqualUnmodifiableListView) return _citations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "conversation_id")
  final String conversationId;
  @override
  @JsonKey(name: "stream_id")
  final String streamId;
  @override
  @JsonKey(name: "user_id")
  final String userId;
  final List<ActionResult> _actionResults;
  @override
  @JsonKey(name: "action_results")
  List<ActionResult> get actionResults {
    if (_actionResults is EqualUnmodifiableListView) return _actionResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actionResults);
  }

  @override
  String toString() {
    return 'DataResponseModel(content: $content, citations: $citations, conversationId: $conversationId, streamId: $streamId, userId: $userId, actionResults: $actionResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataResponseModelImpl &&
            (identical(other.content, content) || other.content == content) &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      content,
      const DeepCollectionEquality().hash(_citations),
      conversationId,
      streamId,
      userId,
      const DeepCollectionEquality().hash(_actionResults));

  /// Create a copy of DataResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataResponseModelImplCopyWith<_$DataResponseModelImpl> get copyWith =>
      __$$DataResponseModelImplCopyWithImpl<_$DataResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataResponseModelImplToJson(
      this,
    );
  }
}

abstract class _DataResponseModel implements DataResponseModel {
  const factory _DataResponseModel(
      {final String content,
      final List<DocumentModel>? citations,
      @JsonKey(name: "conversation_id") final String conversationId,
      @JsonKey(name: "stream_id") final String streamId,
      @JsonKey(name: "user_id") final String userId,
      @JsonKey(name: "action_results")
      final List<ActionResult> actionResults}) = _$DataResponseModelImpl;

  factory _DataResponseModel.fromJson(Map<String, dynamic> json) =
      _$DataResponseModelImpl.fromJson;

  @override
  String get content;
  @override
  List<DocumentModel>? get citations;
  @override
  @JsonKey(name: "conversation_id")
  String get conversationId;
  @override
  @JsonKey(name: "stream_id")
  String get streamId;
  @override
  @JsonKey(name: "user_id")
  String get userId;
  @override
  @JsonKey(name: "action_results")
  List<ActionResult> get actionResults;

  /// Create a copy of DataResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataResponseModelImplCopyWith<_$DataResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ActionResult _$ActionResultFromJson(Map<String, dynamic> json) {
  return _ActionResult.fromJson(json);
}

/// @nodoc
mixin _$ActionResult {
  @JsonKey(name: "retrieve_documents")
  List<DocumentModel> get retrieveDocuments =>
      throw _privateConstructorUsedError;

  /// Serializes this ActionResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActionResultCopyWith<ActionResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActionResultCopyWith<$Res> {
  factory $ActionResultCopyWith(
          ActionResult value, $Res Function(ActionResult) then) =
      _$ActionResultCopyWithImpl<$Res, ActionResult>;
  @useResult
  $Res call(
      {@JsonKey(name: "retrieve_documents")
      List<DocumentModel> retrieveDocuments});
}

/// @nodoc
class _$ActionResultCopyWithImpl<$Res, $Val extends ActionResult>
    implements $ActionResultCopyWith<$Res> {
  _$ActionResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retrieveDocuments = null,
  }) {
    return _then(_value.copyWith(
      retrieveDocuments: null == retrieveDocuments
          ? _value.retrieveDocuments
          : retrieveDocuments // ignore: cast_nullable_to_non_nullable
              as List<DocumentModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActionResultImplCopyWith<$Res>
    implements $ActionResultCopyWith<$Res> {
  factory _$$ActionResultImplCopyWith(
          _$ActionResultImpl value, $Res Function(_$ActionResultImpl) then) =
      __$$ActionResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "retrieve_documents")
      List<DocumentModel> retrieveDocuments});
}

/// @nodoc
class __$$ActionResultImplCopyWithImpl<$Res>
    extends _$ActionResultCopyWithImpl<$Res, _$ActionResultImpl>
    implements _$$ActionResultImplCopyWith<$Res> {
  __$$ActionResultImplCopyWithImpl(
      _$ActionResultImpl _value, $Res Function(_$ActionResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retrieveDocuments = null,
  }) {
    return _then(_$ActionResultImpl(
      retrieveDocuments: null == retrieveDocuments
          ? _value._retrieveDocuments
          : retrieveDocuments // ignore: cast_nullable_to_non_nullable
              as List<DocumentModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActionResultImpl implements _ActionResult {
  const _$ActionResultImpl(
      {@JsonKey(name: "retrieve_documents")
      final List<DocumentModel> retrieveDocuments = const []})
      : _retrieveDocuments = retrieveDocuments;

  factory _$ActionResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActionResultImplFromJson(json);

  final List<DocumentModel> _retrieveDocuments;
  @override
  @JsonKey(name: "retrieve_documents")
  List<DocumentModel> get retrieveDocuments {
    if (_retrieveDocuments is EqualUnmodifiableListView)
      return _retrieveDocuments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_retrieveDocuments);
  }

  @override
  String toString() {
    return 'ActionResult(retrieveDocuments: $retrieveDocuments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionResultImpl &&
            const DeepCollectionEquality()
                .equals(other._retrieveDocuments, _retrieveDocuments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_retrieveDocuments));

  /// Create a copy of ActionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionResultImplCopyWith<_$ActionResultImpl> get copyWith =>
      __$$ActionResultImplCopyWithImpl<_$ActionResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActionResultImplToJson(
      this,
    );
  }
}

abstract class _ActionResult implements ActionResult {
  const factory _ActionResult(
      {@JsonKey(name: "retrieve_documents")
      final List<DocumentModel> retrieveDocuments}) = _$ActionResultImpl;

  factory _ActionResult.fromJson(Map<String, dynamic> json) =
      _$ActionResultImpl.fromJson;

  @override
  @JsonKey(name: "retrieve_documents")
  List<DocumentModel> get retrieveDocuments;

  /// Create a copy of ActionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActionResultImplCopyWith<_$ActionResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DocumentModel _$DocumentModelFromJson(Map<String, dynamic> json) {
  return _DocumentModel.fromJson(json);
}

/// @nodoc
mixin _$DocumentModel {
  @JsonKey(name: "parent_id")
  String get parentId => throw _privateConstructorUsedError;
  @JsonKey(name: "chunk_id")
  String get chunkId => throw _privateConstructorUsedError;
  String get chunk => throw _privateConstructorUsedError;
  @JsonKey(name: "ref_url")
  String get refUrl => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: "base_url")
  String? get baseUrl => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "index_date")
  String? get indexDate => throw _privateConstructorUsedError;
  @JsonKey(name: "news_date")
  String? get newsDate => throw _privateConstructorUsedError;
  @JsonKey(name: "language")
  String? get language => throw _privateConstructorUsedError;
  @JsonKey(name: "sentiment")
  String? get sentiment => throw _privateConstructorUsedError;
  @JsonKey(name: "keyphrases")
  String? get keyphrases => throw _privateConstructorUsedError;
  @JsonKey(name: "people")
  String? get people => throw _privateConstructorUsedError;
  @JsonKey(name: "organizations")
  String? get organizations => throw _privateConstructorUsedError;
  @JsonKey(name: "locations")
  String? get locations => throw _privateConstructorUsedError;
  @JsonKey(name: "dateTime")
  String? get dateTime => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  /// Serializes this DocumentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DocumentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocumentModelCopyWith<DocumentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentModelCopyWith<$Res> {
  factory $DocumentModelCopyWith(
          DocumentModel value, $Res Function(DocumentModel) then) =
      _$DocumentModelCopyWithImpl<$Res, DocumentModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "parent_id") String parentId,
      @JsonKey(name: "chunk_id") String chunkId,
      String chunk,
      @JsonKey(name: "ref_url") String refUrl,
      String url,
      @JsonKey(name: "base_url") String? baseUrl,
      String title,
      @JsonKey(name: "index_date") String? indexDate,
      @JsonKey(name: "news_date") String? newsDate,
      @JsonKey(name: "language") String? language,
      @JsonKey(name: "sentiment") String? sentiment,
      @JsonKey(name: "keyphrases") String? keyphrases,
      @JsonKey(name: "people") String? people,
      @JsonKey(name: "organizations") String? organizations,
      @JsonKey(name: "locations") String? locations,
      @JsonKey(name: "dateTime") String? dateTime,
      String? type});
}

/// @nodoc
class _$DocumentModelCopyWithImpl<$Res, $Val extends DocumentModel>
    implements $DocumentModelCopyWith<$Res> {
  _$DocumentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DocumentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parentId = null,
    Object? chunkId = null,
    Object? chunk = null,
    Object? refUrl = null,
    Object? url = null,
    Object? baseUrl = freezed,
    Object? title = null,
    Object? indexDate = freezed,
    Object? newsDate = freezed,
    Object? language = freezed,
    Object? sentiment = freezed,
    Object? keyphrases = freezed,
    Object? people = freezed,
    Object? organizations = freezed,
    Object? locations = freezed,
    Object? dateTime = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String,
      chunkId: null == chunkId
          ? _value.chunkId
          : chunkId // ignore: cast_nullable_to_non_nullable
              as String,
      chunk: null == chunk
          ? _value.chunk
          : chunk // ignore: cast_nullable_to_non_nullable
              as String,
      refUrl: null == refUrl
          ? _value.refUrl
          : refUrl // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      baseUrl: freezed == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      indexDate: freezed == indexDate
          ? _value.indexDate
          : indexDate // ignore: cast_nullable_to_non_nullable
              as String?,
      newsDate: freezed == newsDate
          ? _value.newsDate
          : newsDate // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      sentiment: freezed == sentiment
          ? _value.sentiment
          : sentiment // ignore: cast_nullable_to_non_nullable
              as String?,
      keyphrases: freezed == keyphrases
          ? _value.keyphrases
          : keyphrases // ignore: cast_nullable_to_non_nullable
              as String?,
      people: freezed == people
          ? _value.people
          : people // ignore: cast_nullable_to_non_nullable
              as String?,
      organizations: freezed == organizations
          ? _value.organizations
          : organizations // ignore: cast_nullable_to_non_nullable
              as String?,
      locations: freezed == locations
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DocumentModelImplCopyWith<$Res>
    implements $DocumentModelCopyWith<$Res> {
  factory _$$DocumentModelImplCopyWith(
          _$DocumentModelImpl value, $Res Function(_$DocumentModelImpl) then) =
      __$$DocumentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "parent_id") String parentId,
      @JsonKey(name: "chunk_id") String chunkId,
      String chunk,
      @JsonKey(name: "ref_url") String refUrl,
      String url,
      @JsonKey(name: "base_url") String? baseUrl,
      String title,
      @JsonKey(name: "index_date") String? indexDate,
      @JsonKey(name: "news_date") String? newsDate,
      @JsonKey(name: "language") String? language,
      @JsonKey(name: "sentiment") String? sentiment,
      @JsonKey(name: "keyphrases") String? keyphrases,
      @JsonKey(name: "people") String? people,
      @JsonKey(name: "organizations") String? organizations,
      @JsonKey(name: "locations") String? locations,
      @JsonKey(name: "dateTime") String? dateTime,
      String? type});
}

/// @nodoc
class __$$DocumentModelImplCopyWithImpl<$Res>
    extends _$DocumentModelCopyWithImpl<$Res, _$DocumentModelImpl>
    implements _$$DocumentModelImplCopyWith<$Res> {
  __$$DocumentModelImplCopyWithImpl(
      _$DocumentModelImpl _value, $Res Function(_$DocumentModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DocumentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parentId = null,
    Object? chunkId = null,
    Object? chunk = null,
    Object? refUrl = null,
    Object? url = null,
    Object? baseUrl = freezed,
    Object? title = null,
    Object? indexDate = freezed,
    Object? newsDate = freezed,
    Object? language = freezed,
    Object? sentiment = freezed,
    Object? keyphrases = freezed,
    Object? people = freezed,
    Object? organizations = freezed,
    Object? locations = freezed,
    Object? dateTime = freezed,
    Object? type = freezed,
  }) {
    return _then(_$DocumentModelImpl(
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String,
      chunkId: null == chunkId
          ? _value.chunkId
          : chunkId // ignore: cast_nullable_to_non_nullable
              as String,
      chunk: null == chunk
          ? _value.chunk
          : chunk // ignore: cast_nullable_to_non_nullable
              as String,
      refUrl: null == refUrl
          ? _value.refUrl
          : refUrl // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      baseUrl: freezed == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      indexDate: freezed == indexDate
          ? _value.indexDate
          : indexDate // ignore: cast_nullable_to_non_nullable
              as String?,
      newsDate: freezed == newsDate
          ? _value.newsDate
          : newsDate // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      sentiment: freezed == sentiment
          ? _value.sentiment
          : sentiment // ignore: cast_nullable_to_non_nullable
              as String?,
      keyphrases: freezed == keyphrases
          ? _value.keyphrases
          : keyphrases // ignore: cast_nullable_to_non_nullable
              as String?,
      people: freezed == people
          ? _value.people
          : people // ignore: cast_nullable_to_non_nullable
              as String?,
      organizations: freezed == organizations
          ? _value.organizations
          : organizations // ignore: cast_nullable_to_non_nullable
              as String?,
      locations: freezed == locations
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DocumentModelImpl implements _DocumentModel {
  const _$DocumentModelImpl(
      {@JsonKey(name: "parent_id") this.parentId = '',
      @JsonKey(name: "chunk_id") this.chunkId = '',
      this.chunk = '',
      @JsonKey(name: "ref_url") this.refUrl = '',
      this.url = '',
      @JsonKey(name: "base_url") this.baseUrl = '',
      this.title = '',
      @JsonKey(name: "index_date") this.indexDate = '',
      @JsonKey(name: "news_date") this.newsDate = '',
      @JsonKey(name: "language") this.language = '',
      @JsonKey(name: "sentiment") this.sentiment = '',
      @JsonKey(name: "keyphrases") this.keyphrases = '',
      @JsonKey(name: "people") this.people = '',
      @JsonKey(name: "organizations") this.organizations = '',
      @JsonKey(name: "locations") this.locations = '',
      @JsonKey(name: "dateTime") this.dateTime = '',
      this.type = ''});

  factory _$DocumentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocumentModelImplFromJson(json);

  @override
  @JsonKey(name: "parent_id")
  final String parentId;
  @override
  @JsonKey(name: "chunk_id")
  final String chunkId;
  @override
  @JsonKey()
  final String chunk;
  @override
  @JsonKey(name: "ref_url")
  final String refUrl;
  @override
  @JsonKey()
  final String url;
  @override
  @JsonKey(name: "base_url")
  final String? baseUrl;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey(name: "index_date")
  final String? indexDate;
  @override
  @JsonKey(name: "news_date")
  final String? newsDate;
  @override
  @JsonKey(name: "language")
  final String? language;
  @override
  @JsonKey(name: "sentiment")
  final String? sentiment;
  @override
  @JsonKey(name: "keyphrases")
  final String? keyphrases;
  @override
  @JsonKey(name: "people")
  final String? people;
  @override
  @JsonKey(name: "organizations")
  final String? organizations;
  @override
  @JsonKey(name: "locations")
  final String? locations;
  @override
  @JsonKey(name: "dateTime")
  final String? dateTime;
  @override
  @JsonKey()
  final String? type;

  @override
  String toString() {
    return 'DocumentModel(parentId: $parentId, chunkId: $chunkId, chunk: $chunk, refUrl: $refUrl, url: $url, baseUrl: $baseUrl, title: $title, indexDate: $indexDate, newsDate: $newsDate, language: $language, sentiment: $sentiment, keyphrases: $keyphrases, people: $people, organizations: $organizations, locations: $locations, dateTime: $dateTime, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentModelImpl &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.chunkId, chunkId) || other.chunkId == chunkId) &&
            (identical(other.chunk, chunk) || other.chunk == chunk) &&
            (identical(other.refUrl, refUrl) || other.refUrl == refUrl) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.indexDate, indexDate) ||
                other.indexDate == indexDate) &&
            (identical(other.newsDate, newsDate) ||
                other.newsDate == newsDate) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.sentiment, sentiment) ||
                other.sentiment == sentiment) &&
            (identical(other.keyphrases, keyphrases) ||
                other.keyphrases == keyphrases) &&
            (identical(other.people, people) || other.people == people) &&
            (identical(other.organizations, organizations) ||
                other.organizations == organizations) &&
            (identical(other.locations, locations) ||
                other.locations == locations) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      parentId,
      chunkId,
      chunk,
      refUrl,
      url,
      baseUrl,
      title,
      indexDate,
      newsDate,
      language,
      sentiment,
      keyphrases,
      people,
      organizations,
      locations,
      dateTime,
      type);

  /// Create a copy of DocumentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentModelImplCopyWith<_$DocumentModelImpl> get copyWith =>
      __$$DocumentModelImplCopyWithImpl<_$DocumentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DocumentModelImplToJson(
      this,
    );
  }
}

abstract class _DocumentModel implements DocumentModel {
  const factory _DocumentModel(
      {@JsonKey(name: "parent_id") final String parentId,
      @JsonKey(name: "chunk_id") final String chunkId,
      final String chunk,
      @JsonKey(name: "ref_url") final String refUrl,
      final String url,
      @JsonKey(name: "base_url") final String? baseUrl,
      final String title,
      @JsonKey(name: "index_date") final String? indexDate,
      @JsonKey(name: "news_date") final String? newsDate,
      @JsonKey(name: "language") final String? language,
      @JsonKey(name: "sentiment") final String? sentiment,
      @JsonKey(name: "keyphrases") final String? keyphrases,
      @JsonKey(name: "people") final String? people,
      @JsonKey(name: "organizations") final String? organizations,
      @JsonKey(name: "locations") final String? locations,
      @JsonKey(name: "dateTime") final String? dateTime,
      final String? type}) = _$DocumentModelImpl;

  factory _DocumentModel.fromJson(Map<String, dynamic> json) =
      _$DocumentModelImpl.fromJson;

  @override
  @JsonKey(name: "parent_id")
  String get parentId;
  @override
  @JsonKey(name: "chunk_id")
  String get chunkId;
  @override
  String get chunk;
  @override
  @JsonKey(name: "ref_url")
  String get refUrl;
  @override
  String get url;
  @override
  @JsonKey(name: "base_url")
  String? get baseUrl;
  @override
  String get title;
  @override
  @JsonKey(name: "index_date")
  String? get indexDate;
  @override
  @JsonKey(name: "news_date")
  String? get newsDate;
  @override
  @JsonKey(name: "language")
  String? get language;
  @override
  @JsonKey(name: "sentiment")
  String? get sentiment;
  @override
  @JsonKey(name: "keyphrases")
  String? get keyphrases;
  @override
  @JsonKey(name: "people")
  String? get people;
  @override
  @JsonKey(name: "organizations")
  String? get organizations;
  @override
  @JsonKey(name: "locations")
  String? get locations;
  @override
  @JsonKey(name: "dateTime")
  String? get dateTime;
  @override
  String? get type;

  /// Create a copy of DocumentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentModelImplCopyWith<_$DocumentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
