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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsResponse _$NewsResponseFromJson(Map<String, dynamic> json) {
  return _NewsResponse.fromJson(json);
}

/// @nodoc
mixin _$NewsResponse {
  List<NewsModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
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
  @override
  @JsonKey(ignore: true)
  _$$NewsResponseImplCopyWith<_$NewsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NewsByIdResponse _$NewsByIdResponseFromJson(Map<String, dynamic> json) {
  return _NewsByIdResponse.fromJson(json);
}

/// @nodoc
mixin _$NewsByIdResponse {
  NewsModel get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsByIdResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
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
  @override
  @JsonKey(ignore: true)
  _$$NewsByIdResponseImplCopyWith<_$NewsByIdResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) {
  return _NewsModel.fromJson(json);
}

/// @nodoc
mixin _$NewsModel {
  int get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_created')
  String get userCreated => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_created')
  String get dateCreated => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_updated')
  String get userUpdated => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_updated')
  String get dateUpdated => throw _privateConstructorUsedError;
  String get excerpt => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      String status,
      @JsonKey(name: 'user_created') String userCreated,
      @JsonKey(name: 'date_created') String dateCreated,
      @JsonKey(name: 'user_updated') String userUpdated,
      @JsonKey(name: 'date_updated') String dateUpdated,
      String excerpt,
      String title,
      String image,
      String content});
}

/// @nodoc
class _$NewsModelCopyWithImpl<$Res, $Val extends NewsModel>
    implements $NewsModelCopyWith<$Res> {
  _$NewsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? userCreated = null,
    Object? dateCreated = null,
    Object? userUpdated = null,
    Object? dateUpdated = null,
    Object? excerpt = null,
    Object? title = null,
    Object? image = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      userCreated: null == userCreated
          ? _value.userCreated
          : userCreated // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: null == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as String,
      userUpdated: null == userUpdated
          ? _value.userUpdated
          : userUpdated // ignore: cast_nullable_to_non_nullable
              as String,
      dateUpdated: null == dateUpdated
          ? _value.dateUpdated
          : dateUpdated // ignore: cast_nullable_to_non_nullable
              as String,
      excerpt: null == excerpt
          ? _value.excerpt
          : excerpt // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
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
      String status,
      @JsonKey(name: 'user_created') String userCreated,
      @JsonKey(name: 'date_created') String dateCreated,
      @JsonKey(name: 'user_updated') String userUpdated,
      @JsonKey(name: 'date_updated') String dateUpdated,
      String excerpt,
      String title,
      String image,
      String content});
}

/// @nodoc
class __$$NewsModelImplCopyWithImpl<$Res>
    extends _$NewsModelCopyWithImpl<$Res, _$NewsModelImpl>
    implements _$$NewsModelImplCopyWith<$Res> {
  __$$NewsModelImplCopyWithImpl(
      _$NewsModelImpl _value, $Res Function(_$NewsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? userCreated = null,
    Object? dateCreated = null,
    Object? userUpdated = null,
    Object? dateUpdated = null,
    Object? excerpt = null,
    Object? title = null,
    Object? image = null,
    Object? content = null,
  }) {
    return _then(_$NewsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      userCreated: null == userCreated
          ? _value.userCreated
          : userCreated // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: null == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as String,
      userUpdated: null == userUpdated
          ? _value.userUpdated
          : userUpdated // ignore: cast_nullable_to_non_nullable
              as String,
      dateUpdated: null == dateUpdated
          ? _value.dateUpdated
          : dateUpdated // ignore: cast_nullable_to_non_nullable
              as String,
      excerpt: null == excerpt
          ? _value.excerpt
          : excerpt // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
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
class _$NewsModelImpl implements _NewsModel {
  const _$NewsModelImpl(
      {this.id = 0,
      this.status = '',
      @JsonKey(name: 'user_created') this.userCreated = '',
      @JsonKey(name: 'date_created') this.dateCreated = '',
      @JsonKey(name: 'user_updated') this.userUpdated = '',
      @JsonKey(name: 'date_updated') this.dateUpdated = '',
      this.excerpt = '',
      this.title = '',
      this.image = '',
      this.content = ''});

  factory _$NewsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey(name: 'user_created')
  final String userCreated;
  @override
  @JsonKey(name: 'date_created')
  final String dateCreated;
  @override
  @JsonKey(name: 'user_updated')
  final String userUpdated;
  @override
  @JsonKey(name: 'date_updated')
  final String dateUpdated;
  @override
  @JsonKey()
  final String excerpt;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String image;
  @override
  @JsonKey()
  final String content;

  @override
  String toString() {
    return 'NewsModel(id: $id, status: $status, userCreated: $userCreated, dateCreated: $dateCreated, userUpdated: $userUpdated, dateUpdated: $dateUpdated, excerpt: $excerpt, title: $title, image: $image, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.userCreated, userCreated) ||
                other.userCreated == userCreated) &&
            (identical(other.dateCreated, dateCreated) ||
                other.dateCreated == dateCreated) &&
            (identical(other.userUpdated, userUpdated) ||
                other.userUpdated == userUpdated) &&
            (identical(other.dateUpdated, dateUpdated) ||
                other.dateUpdated == dateUpdated) &&
            (identical(other.excerpt, excerpt) || other.excerpt == excerpt) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, userCreated,
      dateCreated, userUpdated, dateUpdated, excerpt, title, image, content);

  @JsonKey(ignore: true)
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
      final String status,
      @JsonKey(name: 'user_created') final String userCreated,
      @JsonKey(name: 'date_created') final String dateCreated,
      @JsonKey(name: 'user_updated') final String userUpdated,
      @JsonKey(name: 'date_updated') final String dateUpdated,
      final String excerpt,
      final String title,
      final String image,
      final String content}) = _$NewsModelImpl;

  factory _NewsModel.fromJson(Map<String, dynamic> json) =
      _$NewsModelImpl.fromJson;

  @override
  int get id;
  @override
  String get status;
  @override
  @JsonKey(name: 'user_created')
  String get userCreated;
  @override
  @JsonKey(name: 'date_created')
  String get dateCreated;
  @override
  @JsonKey(name: 'user_updated')
  String get userUpdated;
  @override
  @JsonKey(name: 'date_updated')
  String get dateUpdated;
  @override
  String get excerpt;
  @override
  String get title;
  @override
  String get image;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$NewsModelImplCopyWith<_$NewsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
