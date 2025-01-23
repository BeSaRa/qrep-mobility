// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewsResponse _$NewsResponseFromJson(Map<String, dynamic> json) {
  return _NewsResponse.fromJson(json);
}

/// @nodoc
mixin _$NewsResponse {
  List<NewsModel> get data => throw _privateConstructorUsedError;

  /// Serializes this NewsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NewsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewsResponseCopyWith<NewsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsResponseCopyWith<$Res> {
  factory $NewsResponseCopyWith(
          NewsResponse value, $Res Function(NewsResponse) then) =
      _$NewsResponseCopyWithImpl<$Res, NewsResponse>;
  @useResult
  $Res call({List<NewsModel> data});
}

/// @nodoc
class _$NewsResponseCopyWithImpl<$Res, $Val extends NewsResponse>
    implements $NewsResponseCopyWith<$Res> {
  _$NewsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewsResponse
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
              as List<NewsModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsResponseImplCopyWith<$Res>
    implements $NewsResponseCopyWith<$Res> {
  factory _$$NewsResponseImplCopyWith(
          _$NewsResponseImpl value, $Res Function(_$NewsResponseImpl) then) =
      __$$NewsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NewsModel> data});
}

/// @nodoc
class __$$NewsResponseImplCopyWithImpl<$Res>
    extends _$NewsResponseCopyWithImpl<$Res, _$NewsResponseImpl>
    implements _$$NewsResponseImplCopyWith<$Res> {
  __$$NewsResponseImplCopyWithImpl(
      _$NewsResponseImpl _value, $Res Function(_$NewsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$NewsResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NewsModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsResponseImpl implements _NewsResponse {
  _$NewsResponseImpl({final List<NewsModel> data = const []}) : _data = data;

  factory _$NewsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsResponseImplFromJson(json);

  final List<NewsModel> _data;
  @override
  @JsonKey()
  List<NewsModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'NewsResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of NewsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsResponseImplCopyWith<_$NewsResponseImpl> get copyWith =>
      __$$NewsResponseImplCopyWithImpl<_$NewsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsResponseImplToJson(
      this,
    );
  }
}

abstract class _NewsResponse implements NewsResponse {
  factory _NewsResponse({final List<NewsModel> data}) = _$NewsResponseImpl;

  factory _NewsResponse.fromJson(Map<String, dynamic> json) =
      _$NewsResponseImpl.fromJson;

  @override
  List<NewsModel> get data;

  /// Create a copy of NewsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewsResponseImplCopyWith<_$NewsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NewsByIdResponse _$NewsByIdResponseFromJson(Map<String, dynamic> json) {
  return _NewsByIdResponse.fromJson(json);
}

/// @nodoc
mixin _$NewsByIdResponse {
  NewsModel get data => throw _privateConstructorUsedError;

  /// Serializes this NewsByIdResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NewsByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewsByIdResponseCopyWith<NewsByIdResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsByIdResponseCopyWith<$Res> {
  factory $NewsByIdResponseCopyWith(
          NewsByIdResponse value, $Res Function(NewsByIdResponse) then) =
      _$NewsByIdResponseCopyWithImpl<$Res, NewsByIdResponse>;
  @useResult
  $Res call({NewsModel data});

  $NewsModelCopyWith<$Res> get data;
}

/// @nodoc
class _$NewsByIdResponseCopyWithImpl<$Res, $Val extends NewsByIdResponse>
    implements $NewsByIdResponseCopyWith<$Res> {
  _$NewsByIdResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewsByIdResponse
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
              as NewsModel,
    ) as $Val);
  }

  /// Create a copy of NewsByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NewsModelCopyWith<$Res> get data {
    return $NewsModelCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NewsByIdResponseImplCopyWith<$Res>
    implements $NewsByIdResponseCopyWith<$Res> {
  factory _$$NewsByIdResponseImplCopyWith(_$NewsByIdResponseImpl value,
          $Res Function(_$NewsByIdResponseImpl) then) =
      __$$NewsByIdResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NewsModel data});

  @override
  $NewsModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$NewsByIdResponseImplCopyWithImpl<$Res>
    extends _$NewsByIdResponseCopyWithImpl<$Res, _$NewsByIdResponseImpl>
    implements _$$NewsByIdResponseImplCopyWith<$Res> {
  __$$NewsByIdResponseImplCopyWithImpl(_$NewsByIdResponseImpl _value,
      $Res Function(_$NewsByIdResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$NewsByIdResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as NewsModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsByIdResponseImpl implements _NewsByIdResponse {
  _$NewsByIdResponseImpl({this.data = const NewsModel()});

  factory _$NewsByIdResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsByIdResponseImplFromJson(json);

  @override
  @JsonKey()
  final NewsModel data;

  @override
  String toString() {
    return 'NewsByIdResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsByIdResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of NewsByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsByIdResponseImplCopyWith<_$NewsByIdResponseImpl> get copyWith =>
      __$$NewsByIdResponseImplCopyWithImpl<_$NewsByIdResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsByIdResponseImplToJson(
      this,
    );
  }
}

abstract class _NewsByIdResponse implements NewsByIdResponse {
  factory _NewsByIdResponse({final NewsModel data}) = _$NewsByIdResponseImpl;

  factory _NewsByIdResponse.fromJson(Map<String, dynamic> json) =
      _$NewsByIdResponseImpl.fromJson;

  @override
  NewsModel get data;

  /// Create a copy of NewsByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewsByIdResponseImplCopyWith<_$NewsByIdResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) {
  return _NewsModel.fromJson(json);
}

/// @nodoc
mixin _$NewsModel {
  int get id => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError; //==
  String get modified => throw _privateConstructorUsedError; //==
  String get status => throw _privateConstructorUsedError;
  TitleModel get title => throw _privateConstructorUsedError;
  ContentModel get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'og_image')
  List<OgImageModel> get ogImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_created')
  String? get userCreated => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_created')
  String? get dateCreated => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_updated')
  String? get userUpdated => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_updated')
  String? get dateUpdated => throw _privateConstructorUsedError;

  /// Serializes this NewsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NewsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewsModelCopyWith<NewsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsModelCopyWith<$Res> {
  factory $NewsModelCopyWith(NewsModel value, $Res Function(NewsModel) then) =
      _$NewsModelCopyWithImpl<$Res, NewsModel>;
  @useResult
  $Res call(
      {int id,
      String date,
      String modified,
      String status,
      TitleModel title,
      ContentModel content,
      @JsonKey(name: 'og_image') List<OgImageModel> ogImage,
      @JsonKey(name: 'user_created') String? userCreated,
      @JsonKey(name: 'date_created') String? dateCreated,
      @JsonKey(name: 'user_updated') String? userUpdated,
      @JsonKey(name: 'date_updated') String? dateUpdated});

  $TitleModelCopyWith<$Res> get title;
  $ContentModelCopyWith<$Res> get content;
}

/// @nodoc
class _$NewsModelCopyWithImpl<$Res, $Val extends NewsModel>
    implements $NewsModelCopyWith<$Res> {
  _$NewsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? modified = null,
    Object? status = null,
    Object? title = null,
    Object? content = null,
    Object? ogImage = null,
    Object? userCreated = freezed,
    Object? dateCreated = freezed,
    Object? userUpdated = freezed,
    Object? dateUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      modified: null == modified
          ? _value.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as TitleModel,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as ContentModel,
      ogImage: null == ogImage
          ? _value.ogImage
          : ogImage // ignore: cast_nullable_to_non_nullable
              as List<OgImageModel>,
      userCreated: freezed == userCreated
          ? _value.userCreated
          : userCreated // ignore: cast_nullable_to_non_nullable
              as String?,
      dateCreated: freezed == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as String?,
      userUpdated: freezed == userUpdated
          ? _value.userUpdated
          : userUpdated // ignore: cast_nullable_to_non_nullable
              as String?,
      dateUpdated: freezed == dateUpdated
          ? _value.dateUpdated
          : dateUpdated // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of NewsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TitleModelCopyWith<$Res> get title {
    return $TitleModelCopyWith<$Res>(_value.title, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }

  /// Create a copy of NewsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContentModelCopyWith<$Res> get content {
    return $ContentModelCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NewsModelImplCopyWith<$Res>
    implements $NewsModelCopyWith<$Res> {
  factory _$$NewsModelImplCopyWith(
          _$NewsModelImpl value, $Res Function(_$NewsModelImpl) then) =
      __$$NewsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String date,
      String modified,
      String status,
      TitleModel title,
      ContentModel content,
      @JsonKey(name: 'og_image') List<OgImageModel> ogImage,
      @JsonKey(name: 'user_created') String? userCreated,
      @JsonKey(name: 'date_created') String? dateCreated,
      @JsonKey(name: 'user_updated') String? userUpdated,
      @JsonKey(name: 'date_updated') String? dateUpdated});

  @override
  $TitleModelCopyWith<$Res> get title;
  @override
  $ContentModelCopyWith<$Res> get content;
}

/// @nodoc
class __$$NewsModelImplCopyWithImpl<$Res>
    extends _$NewsModelCopyWithImpl<$Res, _$NewsModelImpl>
    implements _$$NewsModelImplCopyWith<$Res> {
  __$$NewsModelImplCopyWithImpl(
      _$NewsModelImpl _value, $Res Function(_$NewsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? modified = null,
    Object? status = null,
    Object? title = null,
    Object? content = null,
    Object? ogImage = null,
    Object? userCreated = freezed,
    Object? dateCreated = freezed,
    Object? userUpdated = freezed,
    Object? dateUpdated = freezed,
  }) {
    return _then(_$NewsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      modified: null == modified
          ? _value.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as TitleModel,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as ContentModel,
      ogImage: null == ogImage
          ? _value._ogImage
          : ogImage // ignore: cast_nullable_to_non_nullable
              as List<OgImageModel>,
      userCreated: freezed == userCreated
          ? _value.userCreated
          : userCreated // ignore: cast_nullable_to_non_nullable
              as String?,
      dateCreated: freezed == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as String?,
      userUpdated: freezed == userUpdated
          ? _value.userUpdated
          : userUpdated // ignore: cast_nullable_to_non_nullable
              as String?,
      dateUpdated: freezed == dateUpdated
          ? _value.dateUpdated
          : dateUpdated // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsModelImpl implements _NewsModel {
  const _$NewsModelImpl(
      {this.id = 0,
      this.date = "",
      this.modified = "",
      this.status = '',
      this.title = const TitleModel(),
      this.content = const ContentModel(),
      @JsonKey(name: 'og_image') final List<OgImageModel> ogImage = const [],
      @JsonKey(name: 'user_created') this.userCreated = '',
      @JsonKey(name: 'date_created') this.dateCreated = '',
      @JsonKey(name: 'user_updated') this.userUpdated = '',
      @JsonKey(name: 'date_updated') this.dateUpdated = ''})
      : _ogImage = ogImage;

  factory _$NewsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String date;
//==
  @override
  @JsonKey()
  final String modified;
//==
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final TitleModel title;
  @override
  @JsonKey()
  final ContentModel content;
  final List<OgImageModel> _ogImage;
  @override
  @JsonKey(name: 'og_image')
  List<OgImageModel> get ogImage {
    if (_ogImage is EqualUnmodifiableListView) return _ogImage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ogImage);
  }

  @override
  @JsonKey(name: 'user_created')
  final String? userCreated;
  @override
  @JsonKey(name: 'date_created')
  final String? dateCreated;
  @override
  @JsonKey(name: 'user_updated')
  final String? userUpdated;
  @override
  @JsonKey(name: 'date_updated')
  final String? dateUpdated;

  @override
  String toString() {
    return 'NewsModel(id: $id, date: $date, modified: $modified, status: $status, title: $title, content: $content, ogImage: $ogImage, userCreated: $userCreated, dateCreated: $dateCreated, userUpdated: $userUpdated, dateUpdated: $dateUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.modified, modified) ||
                other.modified == modified) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other._ogImage, _ogImage) &&
            (identical(other.userCreated, userCreated) ||
                other.userCreated == userCreated) &&
            (identical(other.dateCreated, dateCreated) ||
                other.dateCreated == dateCreated) &&
            (identical(other.userUpdated, userUpdated) ||
                other.userUpdated == userUpdated) &&
            (identical(other.dateUpdated, dateUpdated) ||
                other.dateUpdated == dateUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      date,
      modified,
      status,
      title,
      content,
      const DeepCollectionEquality().hash(_ogImage),
      userCreated,
      dateCreated,
      userUpdated,
      dateUpdated);

  /// Create a copy of NewsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsModelImplCopyWith<_$NewsModelImpl> get copyWith =>
      __$$NewsModelImplCopyWithImpl<_$NewsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsModelImplToJson(
      this,
    );
  }
}

abstract class _NewsModel implements NewsModel {
  const factory _NewsModel(
          {final int id,
          final String date,
          final String modified,
          final String status,
          final TitleModel title,
          final ContentModel content,
          @JsonKey(name: 'og_image') final List<OgImageModel> ogImage,
          @JsonKey(name: 'user_created') final String? userCreated,
          @JsonKey(name: 'date_created') final String? dateCreated,
          @JsonKey(name: 'user_updated') final String? userUpdated,
          @JsonKey(name: 'date_updated') final String? dateUpdated}) =
      _$NewsModelImpl;

  factory _NewsModel.fromJson(Map<String, dynamic> json) =
      _$NewsModelImpl.fromJson;

  @override
  int get id;
  @override
  String get date; //==
  @override
  String get modified; //==
  @override
  String get status;
  @override
  TitleModel get title;
  @override
  ContentModel get content;
  @override
  @JsonKey(name: 'og_image')
  List<OgImageModel> get ogImage;
  @override
  @JsonKey(name: 'user_created')
  String? get userCreated;
  @override
  @JsonKey(name: 'date_created')
  String? get dateCreated;
  @override
  @JsonKey(name: 'user_updated')
  String? get userUpdated;
  @override
  @JsonKey(name: 'date_updated')
  String? get dateUpdated;

  /// Create a copy of NewsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewsModelImplCopyWith<_$NewsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TitleModel _$TitleModelFromJson(Map<String, dynamic> json) {
  return _TitleModel.fromJson(json);
}

/// @nodoc
mixin _$TitleModel {
  String get rendered => throw _privateConstructorUsedError;

  /// Serializes this TitleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TitleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TitleModelCopyWith<TitleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TitleModelCopyWith<$Res> {
  factory $TitleModelCopyWith(
          TitleModel value, $Res Function(TitleModel) then) =
      _$TitleModelCopyWithImpl<$Res, TitleModel>;
  @useResult
  $Res call({String rendered});
}

/// @nodoc
class _$TitleModelCopyWithImpl<$Res, $Val extends TitleModel>
    implements $TitleModelCopyWith<$Res> {
  _$TitleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TitleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rendered = null,
  }) {
    return _then(_value.copyWith(
      rendered: null == rendered
          ? _value.rendered
          : rendered // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TitleModelImplCopyWith<$Res>
    implements $TitleModelCopyWith<$Res> {
  factory _$$TitleModelImplCopyWith(
          _$TitleModelImpl value, $Res Function(_$TitleModelImpl) then) =
      __$$TitleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String rendered});
}

/// @nodoc
class __$$TitleModelImplCopyWithImpl<$Res>
    extends _$TitleModelCopyWithImpl<$Res, _$TitleModelImpl>
    implements _$$TitleModelImplCopyWith<$Res> {
  __$$TitleModelImplCopyWithImpl(
      _$TitleModelImpl _value, $Res Function(_$TitleModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TitleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rendered = null,
  }) {
    return _then(_$TitleModelImpl(
      rendered: null == rendered
          ? _value.rendered
          : rendered // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TitleModelImpl implements _TitleModel {
  const _$TitleModelImpl({this.rendered = ""});

  factory _$TitleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TitleModelImplFromJson(json);

  @override
  @JsonKey()
  final String rendered;

  @override
  String toString() {
    return 'TitleModel(rendered: $rendered)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TitleModelImpl &&
            (identical(other.rendered, rendered) ||
                other.rendered == rendered));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rendered);

  /// Create a copy of TitleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TitleModelImplCopyWith<_$TitleModelImpl> get copyWith =>
      __$$TitleModelImplCopyWithImpl<_$TitleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TitleModelImplToJson(
      this,
    );
  }
}

abstract class _TitleModel implements TitleModel {
  const factory _TitleModel({final String rendered}) = _$TitleModelImpl;

  factory _TitleModel.fromJson(Map<String, dynamic> json) =
      _$TitleModelImpl.fromJson;

  @override
  String get rendered;

  /// Create a copy of TitleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TitleModelImplCopyWith<_$TitleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContentModel _$ContentModelFromJson(Map<String, dynamic> json) {
  return _ContentModel.fromJson(json);
}

/// @nodoc
mixin _$ContentModel {
  String get rendered => throw _privateConstructorUsedError;

  /// Serializes this ContentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContentModelCopyWith<ContentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentModelCopyWith<$Res> {
  factory $ContentModelCopyWith(
          ContentModel value, $Res Function(ContentModel) then) =
      _$ContentModelCopyWithImpl<$Res, ContentModel>;
  @useResult
  $Res call({String rendered});
}

/// @nodoc
class _$ContentModelCopyWithImpl<$Res, $Val extends ContentModel>
    implements $ContentModelCopyWith<$Res> {
  _$ContentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rendered = null,
  }) {
    return _then(_value.copyWith(
      rendered: null == rendered
          ? _value.rendered
          : rendered // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentModelImplCopyWith<$Res>
    implements $ContentModelCopyWith<$Res> {
  factory _$$ContentModelImplCopyWith(
          _$ContentModelImpl value, $Res Function(_$ContentModelImpl) then) =
      __$$ContentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String rendered});
}

/// @nodoc
class __$$ContentModelImplCopyWithImpl<$Res>
    extends _$ContentModelCopyWithImpl<$Res, _$ContentModelImpl>
    implements _$$ContentModelImplCopyWith<$Res> {
  __$$ContentModelImplCopyWithImpl(
      _$ContentModelImpl _value, $Res Function(_$ContentModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rendered = null,
  }) {
    return _then(_$ContentModelImpl(
      rendered: null == rendered
          ? _value.rendered
          : rendered // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentModelImpl implements _ContentModel {
  const _$ContentModelImpl({this.rendered = ""});

  factory _$ContentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentModelImplFromJson(json);

  @override
  @JsonKey()
  final String rendered;

  @override
  String toString() {
    return 'ContentModel(rendered: $rendered)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentModelImpl &&
            (identical(other.rendered, rendered) ||
                other.rendered == rendered));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rendered);

  /// Create a copy of ContentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentModelImplCopyWith<_$ContentModelImpl> get copyWith =>
      __$$ContentModelImplCopyWithImpl<_$ContentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentModelImplToJson(
      this,
    );
  }
}

abstract class _ContentModel implements ContentModel {
  const factory _ContentModel({final String rendered}) = _$ContentModelImpl;

  factory _ContentModel.fromJson(Map<String, dynamic> json) =
      _$ContentModelImpl.fromJson;

  @override
  String get rendered;

  /// Create a copy of ContentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentModelImplCopyWith<_$ContentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OgImageModel _$OgImageModelFromJson(Map<String, dynamic> json) {
  return _OgImageModel.fromJson(json);
}

/// @nodoc
mixin _$OgImageModel {
  String get url => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;

  /// Serializes this OgImageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OgImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OgImageModelCopyWith<OgImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OgImageModelCopyWith<$Res> {
  factory $OgImageModelCopyWith(
          OgImageModel value, $Res Function(OgImageModel) then) =
      _$OgImageModelCopyWithImpl<$Res, OgImageModel>;
  @useResult
  $Res call({String url, int width});
}

/// @nodoc
class _$OgImageModelCopyWithImpl<$Res, $Val extends OgImageModel>
    implements $OgImageModelCopyWith<$Res> {
  _$OgImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OgImageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? width = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OgImageModelImplCopyWith<$Res>
    implements $OgImageModelCopyWith<$Res> {
  factory _$$OgImageModelImplCopyWith(
          _$OgImageModelImpl value, $Res Function(_$OgImageModelImpl) then) =
      __$$OgImageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url, int width});
}

/// @nodoc
class __$$OgImageModelImplCopyWithImpl<$Res>
    extends _$OgImageModelCopyWithImpl<$Res, _$OgImageModelImpl>
    implements _$$OgImageModelImplCopyWith<$Res> {
  __$$OgImageModelImplCopyWithImpl(
      _$OgImageModelImpl _value, $Res Function(_$OgImageModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OgImageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? width = null,
  }) {
    return _then(_$OgImageModelImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OgImageModelImpl implements _OgImageModel {
  const _$OgImageModelImpl({this.url = "", this.width = 0});

  factory _$OgImageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OgImageModelImplFromJson(json);

  @override
  @JsonKey()
  final String url;
  @override
  @JsonKey()
  final int width;

  @override
  String toString() {
    return 'OgImageModel(url: $url, width: $width)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OgImageModelImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.width, width) || other.width == width));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, width);

  /// Create a copy of OgImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OgImageModelImplCopyWith<_$OgImageModelImpl> get copyWith =>
      __$$OgImageModelImplCopyWithImpl<_$OgImageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OgImageModelImplToJson(
      this,
    );
  }
}

abstract class _OgImageModel implements OgImageModel {
  const factory _OgImageModel({final String url, final int width}) =
      _$OgImageModelImpl;

  factory _OgImageModel.fromJson(Map<String, dynamic> json) =
      _$OgImageModelImpl.fromJson;

  @override
  String get url;
  @override
  int get width;

  /// Create a copy of OgImageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OgImageModelImplCopyWith<_$OgImageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
