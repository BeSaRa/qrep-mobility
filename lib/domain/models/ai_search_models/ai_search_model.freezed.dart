// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_search_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AiSearchResponseModel _$AiSearchResponseModelFromJson(
    Map<String, dynamic> json) {
  return _AiSearchResponseModel.fromJson(json);
}

/// @nodoc
mixin _$AiSearchResponseModel {
  @JsonKey(name: "total_count")
  int get totalCount => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  @JsonKey(name: "page_number")
  int get pageNumber => throw _privateConstructorUsedError;
  List<AiSearchItemModel> get rs => throw _privateConstructorUsedError;

  /// Serializes this AiSearchResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiSearchResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiSearchResponseModelCopyWith<AiSearchResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiSearchResponseModelCopyWith<$Res> {
  factory $AiSearchResponseModelCopyWith(AiSearchResponseModel value,
          $Res Function(AiSearchResponseModel) then) =
      _$AiSearchResponseModelCopyWithImpl<$Res, AiSearchResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "total_count") int totalCount,
      int count,
      @JsonKey(name: "page_number") int pageNumber,
      List<AiSearchItemModel> rs});
}

/// @nodoc
class _$AiSearchResponseModelCopyWithImpl<$Res,
        $Val extends AiSearchResponseModel>
    implements $AiSearchResponseModelCopyWith<$Res> {
  _$AiSearchResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiSearchResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? count = null,
    Object? pageNumber = null,
    Object? rs = null,
  }) {
    return _then(_value.copyWith(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      rs: null == rs
          ? _value.rs
          : rs // ignore: cast_nullable_to_non_nullable
              as List<AiSearchItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AiSearchResponseModelImplCopyWith<$Res>
    implements $AiSearchResponseModelCopyWith<$Res> {
  factory _$$AiSearchResponseModelImplCopyWith(
          _$AiSearchResponseModelImpl value,
          $Res Function(_$AiSearchResponseModelImpl) then) =
      __$$AiSearchResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "total_count") int totalCount,
      int count,
      @JsonKey(name: "page_number") int pageNumber,
      List<AiSearchItemModel> rs});
}

/// @nodoc
class __$$AiSearchResponseModelImplCopyWithImpl<$Res>
    extends _$AiSearchResponseModelCopyWithImpl<$Res,
        _$AiSearchResponseModelImpl>
    implements _$$AiSearchResponseModelImplCopyWith<$Res> {
  __$$AiSearchResponseModelImplCopyWithImpl(_$AiSearchResponseModelImpl _value,
      $Res Function(_$AiSearchResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AiSearchResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? count = null,
    Object? pageNumber = null,
    Object? rs = null,
  }) {
    return _then(_$AiSearchResponseModelImpl(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      rs: null == rs
          ? _value._rs
          : rs // ignore: cast_nullable_to_non_nullable
              as List<AiSearchItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AiSearchResponseModelImpl implements _AiSearchResponseModel {
  _$AiSearchResponseModelImpl(
      {@JsonKey(name: "total_count") this.totalCount = 0,
      this.count = 0,
      @JsonKey(name: "page_number") this.pageNumber = 0,
      final List<AiSearchItemModel> rs = const []})
      : _rs = rs;

  factory _$AiSearchResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiSearchResponseModelImplFromJson(json);

  @override
  @JsonKey(name: "total_count")
  final int totalCount;
  @override
  @JsonKey()
  final int count;
  @override
  @JsonKey(name: "page_number")
  final int pageNumber;
  final List<AiSearchItemModel> _rs;
  @override
  @JsonKey()
  List<AiSearchItemModel> get rs {
    if (_rs is EqualUnmodifiableListView) return _rs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rs);
  }

  @override
  String toString() {
    return 'AiSearchResponseModel(totalCount: $totalCount, count: $count, pageNumber: $pageNumber, rs: $rs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiSearchResponseModelImpl &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            const DeepCollectionEquality().equals(other._rs, _rs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalCount, count, pageNumber,
      const DeepCollectionEquality().hash(_rs));

  /// Create a copy of AiSearchResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiSearchResponseModelImplCopyWith<_$AiSearchResponseModelImpl>
      get copyWith => __$$AiSearchResponseModelImplCopyWithImpl<
          _$AiSearchResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AiSearchResponseModelImplToJson(
      this,
    );
  }
}

abstract class _AiSearchResponseModel implements AiSearchResponseModel {
  factory _AiSearchResponseModel(
      {@JsonKey(name: "total_count") final int totalCount,
      final int count,
      @JsonKey(name: "page_number") final int pageNumber,
      final List<AiSearchItemModel> rs}) = _$AiSearchResponseModelImpl;

  factory _AiSearchResponseModel.fromJson(Map<String, dynamic> json) =
      _$AiSearchResponseModelImpl.fromJson;

  @override
  @JsonKey(name: "total_count")
  int get totalCount;
  @override
  int get count;
  @override
  @JsonKey(name: "page_number")
  int get pageNumber;
  @override
  List<AiSearchItemModel> get rs;

  /// Create a copy of AiSearchResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiSearchResponseModelImplCopyWith<_$AiSearchResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AiSearchItemModel _$AiSearchItemModelFromJson(Map<String, dynamic> json) {
  return _AiSearchItemModel.fromJson(json);
}

/// @nodoc
mixin _$AiSearchItemModel {
  @JsonKey(name: "website_url")
  String get websiteUrl => throw _privateConstructorUsedError;
  String get chunk => throw _privateConstructorUsedError;
  @JsonKey(name: "ref_url")
  String get refUrl => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: "parent_id")
  String get parentId => throw _privateConstructorUsedError;
  @JsonKey(name: "chunk_id")
  String get chunkId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "indexing_type")
  String get indexingType => throw _privateConstructorUsedError;
  @JsonKey(name: "@search.score")
  double get searchScore => throw _privateConstructorUsedError;
  @JsonKey(name: "@search.reranker_score")
  double get searchRerankerScore => throw _privateConstructorUsedError;
  @JsonKey(name: "@search.highlights")
  String? get searchHighlights => throw _privateConstructorUsedError;
  @JsonKey(name: "@search.captions")
  String? get searchCaptions => throw _privateConstructorUsedError;

  /// Serializes this AiSearchItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiSearchItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiSearchItemModelCopyWith<AiSearchItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiSearchItemModelCopyWith<$Res> {
  factory $AiSearchItemModelCopyWith(
          AiSearchItemModel value, $Res Function(AiSearchItemModel) then) =
      _$AiSearchItemModelCopyWithImpl<$Res, AiSearchItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "website_url") String websiteUrl,
      String chunk,
      @JsonKey(name: "ref_url") String refUrl,
      String type,
      @JsonKey(name: "parent_id") String parentId,
      @JsonKey(name: "chunk_id") String chunkId,
      String title,
      @JsonKey(name: "indexing_type") String indexingType,
      @JsonKey(name: "@search.score") double searchScore,
      @JsonKey(name: "@search.reranker_score") double searchRerankerScore,
      @JsonKey(name: "@search.highlights") String? searchHighlights,
      @JsonKey(name: "@search.captions") String? searchCaptions});
}

/// @nodoc
class _$AiSearchItemModelCopyWithImpl<$Res, $Val extends AiSearchItemModel>
    implements $AiSearchItemModelCopyWith<$Res> {
  _$AiSearchItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiSearchItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? websiteUrl = null,
    Object? chunk = null,
    Object? refUrl = null,
    Object? type = null,
    Object? parentId = null,
    Object? chunkId = null,
    Object? title = null,
    Object? indexingType = null,
    Object? searchScore = null,
    Object? searchRerankerScore = null,
    Object? searchHighlights = freezed,
    Object? searchCaptions = freezed,
  }) {
    return _then(_value.copyWith(
      websiteUrl: null == websiteUrl
          ? _value.websiteUrl
          : websiteUrl // ignore: cast_nullable_to_non_nullable
              as String,
      chunk: null == chunk
          ? _value.chunk
          : chunk // ignore: cast_nullable_to_non_nullable
              as String,
      refUrl: null == refUrl
          ? _value.refUrl
          : refUrl // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String,
      chunkId: null == chunkId
          ? _value.chunkId
          : chunkId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      indexingType: null == indexingType
          ? _value.indexingType
          : indexingType // ignore: cast_nullable_to_non_nullable
              as String,
      searchScore: null == searchScore
          ? _value.searchScore
          : searchScore // ignore: cast_nullable_to_non_nullable
              as double,
      searchRerankerScore: null == searchRerankerScore
          ? _value.searchRerankerScore
          : searchRerankerScore // ignore: cast_nullable_to_non_nullable
              as double,
      searchHighlights: freezed == searchHighlights
          ? _value.searchHighlights
          : searchHighlights // ignore: cast_nullable_to_non_nullable
              as String?,
      searchCaptions: freezed == searchCaptions
          ? _value.searchCaptions
          : searchCaptions // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AiSearchItemModelImplCopyWith<$Res>
    implements $AiSearchItemModelCopyWith<$Res> {
  factory _$$AiSearchItemModelImplCopyWith(_$AiSearchItemModelImpl value,
          $Res Function(_$AiSearchItemModelImpl) then) =
      __$$AiSearchItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "website_url") String websiteUrl,
      String chunk,
      @JsonKey(name: "ref_url") String refUrl,
      String type,
      @JsonKey(name: "parent_id") String parentId,
      @JsonKey(name: "chunk_id") String chunkId,
      String title,
      @JsonKey(name: "indexing_type") String indexingType,
      @JsonKey(name: "@search.score") double searchScore,
      @JsonKey(name: "@search.reranker_score") double searchRerankerScore,
      @JsonKey(name: "@search.highlights") String? searchHighlights,
      @JsonKey(name: "@search.captions") String? searchCaptions});
}

/// @nodoc
class __$$AiSearchItemModelImplCopyWithImpl<$Res>
    extends _$AiSearchItemModelCopyWithImpl<$Res, _$AiSearchItemModelImpl>
    implements _$$AiSearchItemModelImplCopyWith<$Res> {
  __$$AiSearchItemModelImplCopyWithImpl(_$AiSearchItemModelImpl _value,
      $Res Function(_$AiSearchItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AiSearchItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? websiteUrl = null,
    Object? chunk = null,
    Object? refUrl = null,
    Object? type = null,
    Object? parentId = null,
    Object? chunkId = null,
    Object? title = null,
    Object? indexingType = null,
    Object? searchScore = null,
    Object? searchRerankerScore = null,
    Object? searchHighlights = freezed,
    Object? searchCaptions = freezed,
  }) {
    return _then(_$AiSearchItemModelImpl(
      websiteUrl: null == websiteUrl
          ? _value.websiteUrl
          : websiteUrl // ignore: cast_nullable_to_non_nullable
              as String,
      chunk: null == chunk
          ? _value.chunk
          : chunk // ignore: cast_nullable_to_non_nullable
              as String,
      refUrl: null == refUrl
          ? _value.refUrl
          : refUrl // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String,
      chunkId: null == chunkId
          ? _value.chunkId
          : chunkId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      indexingType: null == indexingType
          ? _value.indexingType
          : indexingType // ignore: cast_nullable_to_non_nullable
              as String,
      searchScore: null == searchScore
          ? _value.searchScore
          : searchScore // ignore: cast_nullable_to_non_nullable
              as double,
      searchRerankerScore: null == searchRerankerScore
          ? _value.searchRerankerScore
          : searchRerankerScore // ignore: cast_nullable_to_non_nullable
              as double,
      searchHighlights: freezed == searchHighlights
          ? _value.searchHighlights
          : searchHighlights // ignore: cast_nullable_to_non_nullable
              as String?,
      searchCaptions: freezed == searchCaptions
          ? _value.searchCaptions
          : searchCaptions // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AiSearchItemModelImpl implements _AiSearchItemModel {
  _$AiSearchItemModelImpl(
      {@JsonKey(name: "website_url") this.websiteUrl = "",
      this.chunk = "",
      @JsonKey(name: "ref_url") this.refUrl = "",
      this.type = "",
      @JsonKey(name: "parent_id") this.parentId = "",
      @JsonKey(name: "chunk_id") this.chunkId = "",
      this.title = "",
      @JsonKey(name: "indexing_type") this.indexingType = "",
      @JsonKey(name: "@search.score") this.searchScore = 0.0,
      @JsonKey(name: "@search.reranker_score") this.searchRerankerScore = 0.0,
      @JsonKey(name: "@search.highlights") this.searchHighlights = "",
      @JsonKey(name: "@search.captions") this.searchCaptions = ""});

  factory _$AiSearchItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiSearchItemModelImplFromJson(json);

  @override
  @JsonKey(name: "website_url")
  final String websiteUrl;
  @override
  @JsonKey()
  final String chunk;
  @override
  @JsonKey(name: "ref_url")
  final String refUrl;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey(name: "parent_id")
  final String parentId;
  @override
  @JsonKey(name: "chunk_id")
  final String chunkId;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey(name: "indexing_type")
  final String indexingType;
  @override
  @JsonKey(name: "@search.score")
  final double searchScore;
  @override
  @JsonKey(name: "@search.reranker_score")
  final double searchRerankerScore;
  @override
  @JsonKey(name: "@search.highlights")
  final String? searchHighlights;
  @override
  @JsonKey(name: "@search.captions")
  final String? searchCaptions;

  @override
  String toString() {
    return 'AiSearchItemModel(websiteUrl: $websiteUrl, chunk: $chunk, refUrl: $refUrl, type: $type, parentId: $parentId, chunkId: $chunkId, title: $title, indexingType: $indexingType, searchScore: $searchScore, searchRerankerScore: $searchRerankerScore, searchHighlights: $searchHighlights, searchCaptions: $searchCaptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiSearchItemModelImpl &&
            (identical(other.websiteUrl, websiteUrl) ||
                other.websiteUrl == websiteUrl) &&
            (identical(other.chunk, chunk) || other.chunk == chunk) &&
            (identical(other.refUrl, refUrl) || other.refUrl == refUrl) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.chunkId, chunkId) || other.chunkId == chunkId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.indexingType, indexingType) ||
                other.indexingType == indexingType) &&
            (identical(other.searchScore, searchScore) ||
                other.searchScore == searchScore) &&
            (identical(other.searchRerankerScore, searchRerankerScore) ||
                other.searchRerankerScore == searchRerankerScore) &&
            (identical(other.searchHighlights, searchHighlights) ||
                other.searchHighlights == searchHighlights) &&
            (identical(other.searchCaptions, searchCaptions) ||
                other.searchCaptions == searchCaptions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      websiteUrl,
      chunk,
      refUrl,
      type,
      parentId,
      chunkId,
      title,
      indexingType,
      searchScore,
      searchRerankerScore,
      searchHighlights,
      searchCaptions);

  /// Create a copy of AiSearchItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiSearchItemModelImplCopyWith<_$AiSearchItemModelImpl> get copyWith =>
      __$$AiSearchItemModelImplCopyWithImpl<_$AiSearchItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AiSearchItemModelImplToJson(
      this,
    );
  }
}

abstract class _AiSearchItemModel implements AiSearchItemModel {
  factory _AiSearchItemModel(
      {@JsonKey(name: "website_url") final String websiteUrl,
      final String chunk,
      @JsonKey(name: "ref_url") final String refUrl,
      final String type,
      @JsonKey(name: "parent_id") final String parentId,
      @JsonKey(name: "chunk_id") final String chunkId,
      final String title,
      @JsonKey(name: "indexing_type") final String indexingType,
      @JsonKey(name: "@search.score") final double searchScore,
      @JsonKey(name: "@search.reranker_score") final double searchRerankerScore,
      @JsonKey(name: "@search.highlights") final String? searchHighlights,
      @JsonKey(name: "@search.captions")
      final String? searchCaptions}) = _$AiSearchItemModelImpl;

  factory _AiSearchItemModel.fromJson(Map<String, dynamic> json) =
      _$AiSearchItemModelImpl.fromJson;

  @override
  @JsonKey(name: "website_url")
  String get websiteUrl;
  @override
  String get chunk;
  @override
  @JsonKey(name: "ref_url")
  String get refUrl;
  @override
  String get type;
  @override
  @JsonKey(name: "parent_id")
  String get parentId;
  @override
  @JsonKey(name: "chunk_id")
  String get chunkId;
  @override
  String get title;
  @override
  @JsonKey(name: "indexing_type")
  String get indexingType;
  @override
  @JsonKey(name: "@search.score")
  double get searchScore;
  @override
  @JsonKey(name: "@search.reranker_score")
  double get searchRerankerScore;
  @override
  @JsonKey(name: "@search.highlights")
  String? get searchHighlights;
  @override
  @JsonKey(name: "@search.captions")
  String? get searchCaptions;

  /// Create a copy of AiSearchItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiSearchItemModelImplCopyWith<_$AiSearchItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
