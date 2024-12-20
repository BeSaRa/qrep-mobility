// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'laws_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LawsResponse _$LawsResponseFromJson(Map<String, dynamic> json) {
  return _LawsResponse.fromJson(json);
}

/// @nodoc
mixin _$LawsResponse {
  List<LawsModel> get data => throw _privateConstructorUsedError;

  /// Serializes this LawsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LawsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LawsResponseCopyWith<LawsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LawsResponseCopyWith<$Res> {
  factory $LawsResponseCopyWith(
          LawsResponse value, $Res Function(LawsResponse) then) =
      _$LawsResponseCopyWithImpl<$Res, LawsResponse>;
  @useResult
  $Res call({List<LawsModel> data});
}

/// @nodoc
class _$LawsResponseCopyWithImpl<$Res, $Val extends LawsResponse>
    implements $LawsResponseCopyWith<$Res> {
  _$LawsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LawsResponse
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
              as List<LawsModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LawsResponseImplCopyWith<$Res>
    implements $LawsResponseCopyWith<$Res> {
  factory _$$LawsResponseImplCopyWith(
          _$LawsResponseImpl value, $Res Function(_$LawsResponseImpl) then) =
      __$$LawsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LawsModel> data});
}

/// @nodoc
class __$$LawsResponseImplCopyWithImpl<$Res>
    extends _$LawsResponseCopyWithImpl<$Res, _$LawsResponseImpl>
    implements _$$LawsResponseImplCopyWith<$Res> {
  __$$LawsResponseImplCopyWithImpl(
      _$LawsResponseImpl _value, $Res Function(_$LawsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of LawsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LawsResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<LawsModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LawsResponseImpl implements _LawsResponse {
  const _$LawsResponseImpl({final List<LawsModel> data = const []})
      : _data = data;

  factory _$LawsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LawsResponseImplFromJson(json);

  final List<LawsModel> _data;
  @override
  @JsonKey()
  List<LawsModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'LawsResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LawsResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of LawsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LawsResponseImplCopyWith<_$LawsResponseImpl> get copyWith =>
      __$$LawsResponseImplCopyWithImpl<_$LawsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LawsResponseImplToJson(
      this,
    );
  }
}

abstract class _LawsResponse implements LawsResponse {
  const factory _LawsResponse({final List<LawsModel> data}) =
      _$LawsResponseImpl;

  factory _LawsResponse.fromJson(Map<String, dynamic> json) =
      _$LawsResponseImpl.fromJson;

  @override
  List<LawsModel> get data;

  /// Create a copy of LawsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LawsResponseImplCopyWith<_$LawsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LawByIdResponse _$LawByIdResponseFromJson(Map<String, dynamic> json) {
  return _LawByIdResponse.fromJson(json);
}

/// @nodoc
mixin _$LawByIdResponse {
  LawsModel get data => throw _privateConstructorUsedError;

  /// Serializes this LawByIdResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LawByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LawByIdResponseCopyWith<LawByIdResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LawByIdResponseCopyWith<$Res> {
  factory $LawByIdResponseCopyWith(
          LawByIdResponse value, $Res Function(LawByIdResponse) then) =
      _$LawByIdResponseCopyWithImpl<$Res, LawByIdResponse>;
  @useResult
  $Res call({LawsModel data});

  $LawsModelCopyWith<$Res> get data;
}

/// @nodoc
class _$LawByIdResponseCopyWithImpl<$Res, $Val extends LawByIdResponse>
    implements $LawByIdResponseCopyWith<$Res> {
  _$LawByIdResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LawByIdResponse
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
              as LawsModel,
    ) as $Val);
  }

  /// Create a copy of LawByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LawsModelCopyWith<$Res> get data {
    return $LawsModelCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LawByIdResponseImplCopyWith<$Res>
    implements $LawByIdResponseCopyWith<$Res> {
  factory _$$LawByIdResponseImplCopyWith(_$LawByIdResponseImpl value,
          $Res Function(_$LawByIdResponseImpl) then) =
      __$$LawByIdResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LawsModel data});

  @override
  $LawsModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$LawByIdResponseImplCopyWithImpl<$Res>
    extends _$LawByIdResponseCopyWithImpl<$Res, _$LawByIdResponseImpl>
    implements _$$LawByIdResponseImplCopyWith<$Res> {
  __$$LawByIdResponseImplCopyWithImpl(
      _$LawByIdResponseImpl _value, $Res Function(_$LawByIdResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of LawByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LawByIdResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as LawsModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LawByIdResponseImpl implements _LawByIdResponse {
  const _$LawByIdResponseImpl({this.data = const LawsModel()});

  factory _$LawByIdResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LawByIdResponseImplFromJson(json);

  @override
  @JsonKey()
  final LawsModel data;

  @override
  String toString() {
    return 'LawByIdResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LawByIdResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of LawByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LawByIdResponseImplCopyWith<_$LawByIdResponseImpl> get copyWith =>
      __$$LawByIdResponseImplCopyWithImpl<_$LawByIdResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LawByIdResponseImplToJson(
      this,
    );
  }
}

abstract class _LawByIdResponse implements LawByIdResponse {
  const factory _LawByIdResponse({final LawsModel data}) =
      _$LawByIdResponseImpl;

  factory _LawByIdResponse.fromJson(Map<String, dynamic> json) =
      _$LawByIdResponseImpl.fromJson;

  @override
  LawsModel get data;

  /// Create a copy of LawByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LawByIdResponseImplCopyWith<_$LawByIdResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LawsModel _$LawsModelFromJson(Map<String, dynamic> json) {
  return _LawsModel.fromJson(json);
}

/// @nodoc
mixin _$LawsModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'issue_date')
  String get issueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'law_number')
  int get lawNumber => throw _privateConstructorUsedError;
  String get file => throw _privateConstructorUsedError;
  List<ArticleModel> get articles => throw _privateConstructorUsedError;

  /// Serializes this LawsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LawsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LawsModelCopyWith<LawsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LawsModelCopyWith<$Res> {
  factory $LawsModelCopyWith(LawsModel value, $Res Function(LawsModel) then) =
      _$LawsModelCopyWithImpl<$Res, LawsModel>;
  @useResult
  $Res call(
      {int id,
      String title,
      @JsonKey(name: 'issue_date') String issueDate,
      @JsonKey(name: 'law_number') int lawNumber,
      String file,
      List<ArticleModel> articles});
}

/// @nodoc
class _$LawsModelCopyWithImpl<$Res, $Val extends LawsModel>
    implements $LawsModelCopyWith<$Res> {
  _$LawsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LawsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? issueDate = null,
    Object? lawNumber = null,
    Object? file = null,
    Object? articles = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      issueDate: null == issueDate
          ? _value.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as String,
      lawNumber: null == lawNumber
          ? _value.lawNumber
          : lawNumber // ignore: cast_nullable_to_non_nullable
              as int,
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String,
      articles: null == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<ArticleModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LawsModelImplCopyWith<$Res>
    implements $LawsModelCopyWith<$Res> {
  factory _$$LawsModelImplCopyWith(
          _$LawsModelImpl value, $Res Function(_$LawsModelImpl) then) =
      __$$LawsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      @JsonKey(name: 'issue_date') String issueDate,
      @JsonKey(name: 'law_number') int lawNumber,
      String file,
      List<ArticleModel> articles});
}

/// @nodoc
class __$$LawsModelImplCopyWithImpl<$Res>
    extends _$LawsModelCopyWithImpl<$Res, _$LawsModelImpl>
    implements _$$LawsModelImplCopyWith<$Res> {
  __$$LawsModelImplCopyWithImpl(
      _$LawsModelImpl _value, $Res Function(_$LawsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LawsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? issueDate = null,
    Object? lawNumber = null,
    Object? file = null,
    Object? articles = null,
  }) {
    return _then(_$LawsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      issueDate: null == issueDate
          ? _value.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as String,
      lawNumber: null == lawNumber
          ? _value.lawNumber
          : lawNumber // ignore: cast_nullable_to_non_nullable
              as int,
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String,
      articles: null == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<ArticleModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LawsModelImpl implements _LawsModel {
  const _$LawsModelImpl(
      {this.id = 0,
      this.title = '',
      @JsonKey(name: 'issue_date') this.issueDate = '',
      @JsonKey(name: 'law_number') this.lawNumber = 0,
      this.file = '',
      final List<ArticleModel> articles = const []})
      : _articles = articles;

  factory _$LawsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LawsModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey(name: 'issue_date')
  final String issueDate;
  @override
  @JsonKey(name: 'law_number')
  final int lawNumber;
  @override
  @JsonKey()
  final String file;
  final List<ArticleModel> _articles;
  @override
  @JsonKey()
  List<ArticleModel> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  @override
  String toString() {
    return 'LawsModel(id: $id, title: $title, issueDate: $issueDate, lawNumber: $lawNumber, file: $file, articles: $articles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LawsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.issueDate, issueDate) ||
                other.issueDate == issueDate) &&
            (identical(other.lawNumber, lawNumber) ||
                other.lawNumber == lawNumber) &&
            (identical(other.file, file) || other.file == file) &&
            const DeepCollectionEquality().equals(other._articles, _articles));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, issueDate, lawNumber,
      file, const DeepCollectionEquality().hash(_articles));

  /// Create a copy of LawsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LawsModelImplCopyWith<_$LawsModelImpl> get copyWith =>
      __$$LawsModelImplCopyWithImpl<_$LawsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LawsModelImplToJson(
      this,
    );
  }
}

abstract class _LawsModel implements LawsModel {
  const factory _LawsModel(
      {final int id,
      final String title,
      @JsonKey(name: 'issue_date') final String issueDate,
      @JsonKey(name: 'law_number') final int lawNumber,
      final String file,
      final List<ArticleModel> articles}) = _$LawsModelImpl;

  factory _LawsModel.fromJson(Map<String, dynamic> json) =
      _$LawsModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(name: 'issue_date')
  String get issueDate;
  @override
  @JsonKey(name: 'law_number')
  int get lawNumber;
  @override
  String get file;
  @override
  List<ArticleModel> get articles;

  /// Create a copy of LawsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LawsModelImplCopyWith<_$LawsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) {
  return _ArticleModel.fromJson(json);
}

/// @nodoc
mixin _$ArticleModel {
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  /// Serializes this ArticleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ArticleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArticleModelCopyWith<ArticleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleModelCopyWith<$Res> {
  factory $ArticleModelCopyWith(
          ArticleModel value, $Res Function(ArticleModel) then) =
      _$ArticleModelCopyWithImpl<$Res, ArticleModel>;
  @useResult
  $Res call({String title, String content});
}

/// @nodoc
class _$ArticleModelCopyWithImpl<$Res, $Val extends ArticleModel>
    implements $ArticleModelCopyWith<$Res> {
  _$ArticleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArticleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArticleModelImplCopyWith<$Res>
    implements $ArticleModelCopyWith<$Res> {
  factory _$$ArticleModelImplCopyWith(
          _$ArticleModelImpl value, $Res Function(_$ArticleModelImpl) then) =
      __$$ArticleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String content});
}

/// @nodoc
class __$$ArticleModelImplCopyWithImpl<$Res>
    extends _$ArticleModelCopyWithImpl<$Res, _$ArticleModelImpl>
    implements _$$ArticleModelImplCopyWith<$Res> {
  __$$ArticleModelImplCopyWithImpl(
      _$ArticleModelImpl _value, $Res Function(_$ArticleModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArticleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_$ArticleModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
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
class _$ArticleModelImpl implements _ArticleModel {
  const _$ArticleModelImpl({this.title = '', this.content = ''});

  factory _$ArticleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticleModelImplFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String content;

  @override
  String toString() {
    return 'ArticleModel(title: $title, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, content);

  /// Create a copy of ArticleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleModelImplCopyWith<_$ArticleModelImpl> get copyWith =>
      __$$ArticleModelImplCopyWithImpl<_$ArticleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticleModelImplToJson(
      this,
    );
  }
}

abstract class _ArticleModel implements ArticleModel {
  const factory _ArticleModel({final String title, final String content}) =
      _$ArticleModelImpl;

  factory _ArticleModel.fromJson(Map<String, dynamic> json) =
      _$ArticleModelImpl.fromJson;

  @override
  String get title;
  @override
  String get content;

  /// Create a copy of ArticleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArticleModelImplCopyWith<_$ArticleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
