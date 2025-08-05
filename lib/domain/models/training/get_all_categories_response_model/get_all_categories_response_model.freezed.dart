// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_categories_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetAllCategoriesResponseModel _$GetAllCategoriesResponseModelFromJson(
    Map<String, dynamic> json) {
  return _GetAllCategoriesResponseModel.fromJson(json);
}

/// @nodoc
mixin _$GetAllCategoriesResponseModel {
  @JsonKey(name: 'Code')
  int get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'Result')
  bool get result => throw _privateConstructorUsedError;
  @JsonKey(name: 'Data')
  CategoryData? get data => throw _privateConstructorUsedError;

  /// Serializes this GetAllCategoriesResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetAllCategoriesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetAllCategoriesResponseModelCopyWith<GetAllCategoriesResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllCategoriesResponseModelCopyWith<$Res> {
  factory $GetAllCategoriesResponseModelCopyWith(
          GetAllCategoriesResponseModel value,
          $Res Function(GetAllCategoriesResponseModel) then) =
      _$GetAllCategoriesResponseModelCopyWithImpl<$Res,
          GetAllCategoriesResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Code') int code,
      @JsonKey(name: 'Message') String message,
      @JsonKey(name: 'Result') bool result,
      @JsonKey(name: 'Data') CategoryData? data});

  $CategoryDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$GetAllCategoriesResponseModelCopyWithImpl<$Res,
        $Val extends GetAllCategoriesResponseModel>
    implements $GetAllCategoriesResponseModelCopyWith<$Res> {
  _$GetAllCategoriesResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetAllCategoriesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? result = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CategoryData?,
    ) as $Val);
  }

  /// Create a copy of GetAllCategoriesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $CategoryDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetAllCategoriesResponseModelImplCopyWith<$Res>
    implements $GetAllCategoriesResponseModelCopyWith<$Res> {
  factory _$$GetAllCategoriesResponseModelImplCopyWith(
          _$GetAllCategoriesResponseModelImpl value,
          $Res Function(_$GetAllCategoriesResponseModelImpl) then) =
      __$$GetAllCategoriesResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Code') int code,
      @JsonKey(name: 'Message') String message,
      @JsonKey(name: 'Result') bool result,
      @JsonKey(name: 'Data') CategoryData? data});

  @override
  $CategoryDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$GetAllCategoriesResponseModelImplCopyWithImpl<$Res>
    extends _$GetAllCategoriesResponseModelCopyWithImpl<$Res,
        _$GetAllCategoriesResponseModelImpl>
    implements _$$GetAllCategoriesResponseModelImplCopyWith<$Res> {
  __$$GetAllCategoriesResponseModelImplCopyWithImpl(
      _$GetAllCategoriesResponseModelImpl _value,
      $Res Function(_$GetAllCategoriesResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllCategoriesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? result = null,
    Object? data = freezed,
  }) {
    return _then(_$GetAllCategoriesResponseModelImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CategoryData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetAllCategoriesResponseModelImpl
    implements _GetAllCategoriesResponseModel {
  const _$GetAllCategoriesResponseModelImpl(
      {@JsonKey(name: 'Code') this.code = 0,
      @JsonKey(name: 'Message') this.message = '',
      @JsonKey(name: 'Result') this.result = true,
      @JsonKey(name: 'Data') this.data});

  factory _$GetAllCategoriesResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GetAllCategoriesResponseModelImplFromJson(json);

  @override
  @JsonKey(name: 'Code')
  final int code;
  @override
  @JsonKey(name: 'Message')
  final String message;
  @override
  @JsonKey(name: 'Result')
  final bool result;
  @override
  @JsonKey(name: 'Data')
  final CategoryData? data;

  @override
  String toString() {
    return 'GetAllCategoriesResponseModel(code: $code, message: $message, result: $result, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllCategoriesResponseModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message, result, data);

  /// Create a copy of GetAllCategoriesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllCategoriesResponseModelImplCopyWith<
          _$GetAllCategoriesResponseModelImpl>
      get copyWith => __$$GetAllCategoriesResponseModelImplCopyWithImpl<
          _$GetAllCategoriesResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetAllCategoriesResponseModelImplToJson(
      this,
    );
  }
}

abstract class _GetAllCategoriesResponseModel
    implements GetAllCategoriesResponseModel {
  const factory _GetAllCategoriesResponseModel(
          {@JsonKey(name: 'Code') final int code,
          @JsonKey(name: 'Message') final String message,
          @JsonKey(name: 'Result') final bool result,
          @JsonKey(name: 'Data') final CategoryData? data}) =
      _$GetAllCategoriesResponseModelImpl;

  factory _GetAllCategoriesResponseModel.fromJson(Map<String, dynamic> json) =
      _$GetAllCategoriesResponseModelImpl.fromJson;

  @override
  @JsonKey(name: 'Code')
  int get code;
  @override
  @JsonKey(name: 'Message')
  String get message;
  @override
  @JsonKey(name: 'Result')
  bool get result;
  @override
  @JsonKey(name: 'Data')
  CategoryData? get data;

  /// Create a copy of GetAllCategoriesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetAllCategoriesResponseModelImplCopyWith<
          _$GetAllCategoriesResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) {
  return _CategoryData.fromJson(json);
}

/// @nodoc
mixin _$CategoryData {
  @JsonKey(name: 'Categories')
  List<Category> get categories => throw _privateConstructorUsedError;
  @JsonKey(name: 'Pager')
  Pager? get pager => throw _privateConstructorUsedError;

  /// Serializes this CategoryData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryDataCopyWith<CategoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDataCopyWith<$Res> {
  factory $CategoryDataCopyWith(
          CategoryData value, $Res Function(CategoryData) then) =
      _$CategoryDataCopyWithImpl<$Res, CategoryData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Categories') List<Category> categories,
      @JsonKey(name: 'Pager') Pager? pager});

  $PagerCopyWith<$Res>? get pager;
}

/// @nodoc
class _$CategoryDataCopyWithImpl<$Res, $Val extends CategoryData>
    implements $CategoryDataCopyWith<$Res> {
  _$CategoryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? pager = freezed,
  }) {
    return _then(_value.copyWith(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      pager: freezed == pager
          ? _value.pager
          : pager // ignore: cast_nullable_to_non_nullable
              as Pager?,
    ) as $Val);
  }

  /// Create a copy of CategoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PagerCopyWith<$Res>? get pager {
    if (_value.pager == null) {
      return null;
    }

    return $PagerCopyWith<$Res>(_value.pager!, (value) {
      return _then(_value.copyWith(pager: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CategoryDataImplCopyWith<$Res>
    implements $CategoryDataCopyWith<$Res> {
  factory _$$CategoryDataImplCopyWith(
          _$CategoryDataImpl value, $Res Function(_$CategoryDataImpl) then) =
      __$$CategoryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Categories') List<Category> categories,
      @JsonKey(name: 'Pager') Pager? pager});

  @override
  $PagerCopyWith<$Res>? get pager;
}

/// @nodoc
class __$$CategoryDataImplCopyWithImpl<$Res>
    extends _$CategoryDataCopyWithImpl<$Res, _$CategoryDataImpl>
    implements _$$CategoryDataImplCopyWith<$Res> {
  __$$CategoryDataImplCopyWithImpl(
      _$CategoryDataImpl _value, $Res Function(_$CategoryDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? pager = freezed,
  }) {
    return _then(_$CategoryDataImpl(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      pager: freezed == pager
          ? _value.pager
          : pager // ignore: cast_nullable_to_non_nullable
              as Pager?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryDataImpl implements _CategoryData {
  const _$CategoryDataImpl(
      {@JsonKey(name: 'Categories') final List<Category> categories = const [],
      @JsonKey(name: 'Pager') this.pager = null})
      : _categories = categories;

  factory _$CategoryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryDataImplFromJson(json);

  final List<Category> _categories;
  @override
  @JsonKey(name: 'Categories')
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  @JsonKey(name: 'Pager')
  final Pager? pager;

  @override
  String toString() {
    return 'CategoryData(categories: $categories, pager: $pager)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryDataImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.pager, pager) || other.pager == pager));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories), pager);

  /// Create a copy of CategoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryDataImplCopyWith<_$CategoryDataImpl> get copyWith =>
      __$$CategoryDataImplCopyWithImpl<_$CategoryDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryDataImplToJson(
      this,
    );
  }
}

abstract class _CategoryData implements CategoryData {
  const factory _CategoryData(
      {@JsonKey(name: 'Categories') final List<Category> categories,
      @JsonKey(name: 'Pager') final Pager? pager}) = _$CategoryDataImpl;

  factory _CategoryData.fromJson(Map<String, dynamic> json) =
      _$CategoryDataImpl.fromJson;

  @override
  @JsonKey(name: 'Categories')
  List<Category> get categories;
  @override
  @JsonKey(name: 'Pager')
  Pager? get pager;

  /// Create a copy of CategoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryDataImplCopyWith<_$CategoryDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryTranslation _$CategoryTranslationFromJson(Map<String, dynamic> json) {
  return _CategoryTranslation.fromJson(json);
}

/// @nodoc
mixin _$CategoryTranslation {
  @JsonKey(name: 'LanguageId')
  int get languageId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'Description')
  String get description => throw _privateConstructorUsedError;

  /// Serializes this CategoryTranslation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryTranslationCopyWith<CategoryTranslation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryTranslationCopyWith<$Res> {
  factory $CategoryTranslationCopyWith(
          CategoryTranslation value, $Res Function(CategoryTranslation) then) =
      _$CategoryTranslationCopyWithImpl<$Res, CategoryTranslation>;
  @useResult
  $Res call(
      {@JsonKey(name: 'LanguageId') int languageId,
      @JsonKey(name: 'Name') String name,
      @JsonKey(name: 'Description') String description});
}

/// @nodoc
class _$CategoryTranslationCopyWithImpl<$Res, $Val extends CategoryTranslation>
    implements $CategoryTranslationCopyWith<$Res> {
  _$CategoryTranslationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryTranslation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageId = null,
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      languageId: null == languageId
          ? _value.languageId
          : languageId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryTranslationImplCopyWith<$Res>
    implements $CategoryTranslationCopyWith<$Res> {
  factory _$$CategoryTranslationImplCopyWith(_$CategoryTranslationImpl value,
          $Res Function(_$CategoryTranslationImpl) then) =
      __$$CategoryTranslationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'LanguageId') int languageId,
      @JsonKey(name: 'Name') String name,
      @JsonKey(name: 'Description') String description});
}

/// @nodoc
class __$$CategoryTranslationImplCopyWithImpl<$Res>
    extends _$CategoryTranslationCopyWithImpl<$Res, _$CategoryTranslationImpl>
    implements _$$CategoryTranslationImplCopyWith<$Res> {
  __$$CategoryTranslationImplCopyWithImpl(_$CategoryTranslationImpl _value,
      $Res Function(_$CategoryTranslationImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryTranslation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageId = null,
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_$CategoryTranslationImpl(
      languageId: null == languageId
          ? _value.languageId
          : languageId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryTranslationImpl implements _CategoryTranslation {
  const _$CategoryTranslationImpl(
      {@JsonKey(name: 'LanguageId') this.languageId = 0,
      @JsonKey(name: 'Name') this.name = '',
      @JsonKey(name: 'Description') this.description = ''});

  factory _$CategoryTranslationImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryTranslationImplFromJson(json);

  @override
  @JsonKey(name: 'LanguageId')
  final int languageId;
  @override
  @JsonKey(name: 'Name')
  final String name;
  @override
  @JsonKey(name: 'Description')
  final String description;

  @override
  String toString() {
    return 'CategoryTranslation(languageId: $languageId, name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryTranslationImpl &&
            (identical(other.languageId, languageId) ||
                other.languageId == languageId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, languageId, name, description);

  /// Create a copy of CategoryTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryTranslationImplCopyWith<_$CategoryTranslationImpl> get copyWith =>
      __$$CategoryTranslationImplCopyWithImpl<_$CategoryTranslationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryTranslationImplToJson(
      this,
    );
  }
}

abstract class _CategoryTranslation implements CategoryTranslation {
  const factory _CategoryTranslation(
          {@JsonKey(name: 'LanguageId') final int languageId,
          @JsonKey(name: 'Name') final String name,
          @JsonKey(name: 'Description') final String description}) =
      _$CategoryTranslationImpl;

  factory _CategoryTranslation.fromJson(Map<String, dynamic> json) =
      _$CategoryTranslationImpl.fromJson;

  @override
  @JsonKey(name: 'LanguageId')
  int get languageId;
  @override
  @JsonKey(name: 'Name')
  String get name;
  @override
  @JsonKey(name: 'Description')
  String get description;

  /// Create a copy of CategoryTranslation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryTranslationImplCopyWith<_$CategoryTranslationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Picture _$PictureFromJson(Map<String, dynamic> json) {
  return _Picture.fromJson(json);
}

/// @nodoc
mixin _$Picture {
  @JsonKey(name: "Id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "MimeType")
  String get mimeType => throw _privateConstructorUsedError;
  @JsonKey(name: "Base64File")
  String get base64File => throw _privateConstructorUsedError;
  @JsonKey(name: "FileName")
  String get fileName => throw _privateConstructorUsedError;

  /// Serializes this Picture to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Picture
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PictureCopyWith<Picture> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PictureCopyWith<$Res> {
  factory $PictureCopyWith(Picture value, $Res Function(Picture) then) =
      _$PictureCopyWithImpl<$Res, Picture>;
  @useResult
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "MimeType") String mimeType,
      @JsonKey(name: "Base64File") String base64File,
      @JsonKey(name: "FileName") String fileName});
}

/// @nodoc
class _$PictureCopyWithImpl<$Res, $Val extends Picture>
    implements $PictureCopyWith<$Res> {
  _$PictureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Picture
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mimeType = null,
    Object? base64File = null,
    Object? fileName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      base64File: null == base64File
          ? _value.base64File
          : base64File // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PictureImplCopyWith<$Res> implements $PictureCopyWith<$Res> {
  factory _$$PictureImplCopyWith(
          _$PictureImpl value, $Res Function(_$PictureImpl) then) =
      __$$PictureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "MimeType") String mimeType,
      @JsonKey(name: "Base64File") String base64File,
      @JsonKey(name: "FileName") String fileName});
}

/// @nodoc
class __$$PictureImplCopyWithImpl<$Res>
    extends _$PictureCopyWithImpl<$Res, _$PictureImpl>
    implements _$$PictureImplCopyWith<$Res> {
  __$$PictureImplCopyWithImpl(
      _$PictureImpl _value, $Res Function(_$PictureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Picture
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mimeType = null,
    Object? base64File = null,
    Object? fileName = null,
  }) {
    return _then(_$PictureImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      base64File: null == base64File
          ? _value.base64File
          : base64File // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PictureImpl implements _Picture {
  const _$PictureImpl(
      {@JsonKey(name: "Id") this.id = 0,
      @JsonKey(name: "MimeType") this.mimeType = '',
      @JsonKey(name: "Base64File") this.base64File = '',
      @JsonKey(name: "FileName") this.fileName = ''});

  factory _$PictureImpl.fromJson(Map<String, dynamic> json) =>
      _$$PictureImplFromJson(json);

  @override
  @JsonKey(name: "Id")
  final int id;
  @override
  @JsonKey(name: "MimeType")
  final String mimeType;
  @override
  @JsonKey(name: "Base64File")
  final String base64File;
  @override
  @JsonKey(name: "FileName")
  final String fileName;

  @override
  String toString() {
    return 'Picture(id: $id, mimeType: $mimeType, base64File: $base64File, fileName: $fileName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PictureImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.base64File, base64File) ||
                other.base64File == base64File) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, mimeType, base64File, fileName);

  /// Create a copy of Picture
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PictureImplCopyWith<_$PictureImpl> get copyWith =>
      __$$PictureImplCopyWithImpl<_$PictureImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PictureImplToJson(
      this,
    );
  }
}

abstract class _Picture implements Picture {
  const factory _Picture(
      {@JsonKey(name: "Id") final int id,
      @JsonKey(name: "MimeType") final String mimeType,
      @JsonKey(name: "Base64File") final String base64File,
      @JsonKey(name: "FileName") final String fileName}) = _$PictureImpl;

  factory _Picture.fromJson(Map<String, dynamic> json) = _$PictureImpl.fromJson;

  @override
  @JsonKey(name: "Id")
  int get id;
  @override
  @JsonKey(name: "MimeType")
  String get mimeType;
  @override
  @JsonKey(name: "Base64File")
  String get base64File;
  @override
  @JsonKey(name: "FileName")
  String get fileName;

  /// Create a copy of Picture
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PictureImplCopyWith<_$PictureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Pager _$PagerFromJson(Map<String, dynamic> json) {
  return _Pager.fromJson(json);
}

/// @nodoc
mixin _$Pager {
  @JsonKey(name: 'PageIndex')
  int get pageIndex => throw _privateConstructorUsedError;
  @JsonKey(name: 'PageSize')
  int get pageSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalCount')
  int get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalPages')
  int get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: 'HasPreviousPage')
  bool get hasPreviousPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'HasNextPage')
  bool get hasNextPage => throw _privateConstructorUsedError;

  /// Serializes this Pager to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pager
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PagerCopyWith<Pager> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagerCopyWith<$Res> {
  factory $PagerCopyWith(Pager value, $Res Function(Pager) then) =
      _$PagerCopyWithImpl<$Res, Pager>;
  @useResult
  $Res call(
      {@JsonKey(name: 'PageIndex') int pageIndex,
      @JsonKey(name: 'PageSize') int pageSize,
      @JsonKey(name: 'TotalCount') int totalCount,
      @JsonKey(name: 'TotalPages') int totalPages,
      @JsonKey(name: 'HasPreviousPage') bool hasPreviousPage,
      @JsonKey(name: 'HasNextPage') bool hasNextPage});
}

/// @nodoc
class _$PagerCopyWithImpl<$Res, $Val extends Pager>
    implements $PagerCopyWith<$Res> {
  _$PagerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pager
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageIndex = null,
    Object? pageSize = null,
    Object? totalCount = null,
    Object? totalPages = null,
    Object? hasPreviousPage = null,
    Object? hasNextPage = null,
  }) {
    return _then(_value.copyWith(
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      hasPreviousPage: null == hasPreviousPage
          ? _value.hasPreviousPage
          : hasPreviousPage // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PagerImplCopyWith<$Res> implements $PagerCopyWith<$Res> {
  factory _$$PagerImplCopyWith(
          _$PagerImpl value, $Res Function(_$PagerImpl) then) =
      __$$PagerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'PageIndex') int pageIndex,
      @JsonKey(name: 'PageSize') int pageSize,
      @JsonKey(name: 'TotalCount') int totalCount,
      @JsonKey(name: 'TotalPages') int totalPages,
      @JsonKey(name: 'HasPreviousPage') bool hasPreviousPage,
      @JsonKey(name: 'HasNextPage') bool hasNextPage});
}

/// @nodoc
class __$$PagerImplCopyWithImpl<$Res>
    extends _$PagerCopyWithImpl<$Res, _$PagerImpl>
    implements _$$PagerImplCopyWith<$Res> {
  __$$PagerImplCopyWithImpl(
      _$PagerImpl _value, $Res Function(_$PagerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Pager
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageIndex = null,
    Object? pageSize = null,
    Object? totalCount = null,
    Object? totalPages = null,
    Object? hasPreviousPage = null,
    Object? hasNextPage = null,
  }) {
    return _then(_$PagerImpl(
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      hasPreviousPage: null == hasPreviousPage
          ? _value.hasPreviousPage
          : hasPreviousPage // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PagerImpl implements _Pager {
  const _$PagerImpl(
      {@JsonKey(name: 'PageIndex') this.pageIndex = 0,
      @JsonKey(name: 'PageSize') this.pageSize = 0,
      @JsonKey(name: 'TotalCount') this.totalCount = 0,
      @JsonKey(name: 'TotalPages') this.totalPages = 0,
      @JsonKey(name: 'HasPreviousPage') this.hasPreviousPage = false,
      @JsonKey(name: 'HasNextPage') this.hasNextPage = false});

  factory _$PagerImpl.fromJson(Map<String, dynamic> json) =>
      _$$PagerImplFromJson(json);

  @override
  @JsonKey(name: 'PageIndex')
  final int pageIndex;
  @override
  @JsonKey(name: 'PageSize')
  final int pageSize;
  @override
  @JsonKey(name: 'TotalCount')
  final int totalCount;
  @override
  @JsonKey(name: 'TotalPages')
  final int totalPages;
  @override
  @JsonKey(name: 'HasPreviousPage')
  final bool hasPreviousPage;
  @override
  @JsonKey(name: 'HasNextPage')
  final bool hasNextPage;

  @override
  String toString() {
    return 'Pager(pageIndex: $pageIndex, pageSize: $pageSize, totalCount: $totalCount, totalPages: $totalPages, hasPreviousPage: $hasPreviousPage, hasNextPage: $hasNextPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PagerImpl &&
            (identical(other.pageIndex, pageIndex) ||
                other.pageIndex == pageIndex) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.hasPreviousPage, hasPreviousPage) ||
                other.hasPreviousPage == hasPreviousPage) &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pageIndex, pageSize, totalCount,
      totalPages, hasPreviousPage, hasNextPage);

  /// Create a copy of Pager
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PagerImplCopyWith<_$PagerImpl> get copyWith =>
      __$$PagerImplCopyWithImpl<_$PagerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PagerImplToJson(
      this,
    );
  }
}

abstract class _Pager implements Pager {
  const factory _Pager(
      {@JsonKey(name: 'PageIndex') final int pageIndex,
      @JsonKey(name: 'PageSize') final int pageSize,
      @JsonKey(name: 'TotalCount') final int totalCount,
      @JsonKey(name: 'TotalPages') final int totalPages,
      @JsonKey(name: 'HasPreviousPage') final bool hasPreviousPage,
      @JsonKey(name: 'HasNextPage') final bool hasNextPage}) = _$PagerImpl;

  factory _Pager.fromJson(Map<String, dynamic> json) = _$PagerImpl.fromJson;

  @override
  @JsonKey(name: 'PageIndex')
  int get pageIndex;
  @override
  @JsonKey(name: 'PageSize')
  int get pageSize;
  @override
  @JsonKey(name: 'TotalCount')
  int get totalCount;
  @override
  @JsonKey(name: 'TotalPages')
  int get totalPages;
  @override
  @JsonKey(name: 'HasPreviousPage')
  bool get hasPreviousPage;
  @override
  @JsonKey(name: 'HasNextPage')
  bool get hasNextPage;

  /// Create a copy of Pager
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PagerImplCopyWith<_$PagerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
