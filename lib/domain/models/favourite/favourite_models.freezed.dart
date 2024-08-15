// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favourite_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FavouriteResponse _$FavouriteResponseFromJson(Map<String, dynamic> json) {
  return _FavouriteResponse.fromJson(json);
}

/// @nodoc
mixin _$FavouriteResponse {
  String? get creationTime => throw _privateConstructorUsedError;
  String? get criteria => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get lastModifiedTime => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get pageDescription => throw _privateConstructorUsedError;
  Indicators get pageName => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavouriteResponseCopyWith<FavouriteResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouriteResponseCopyWith<$Res> {
  factory $FavouriteResponseCopyWith(
          FavouriteResponse value, $Res Function(FavouriteResponse) then) =
      _$FavouriteResponseCopyWithImpl<$Res, FavouriteResponse>;
  @useResult
  $Res call(
      {String? creationTime,
      String? criteria,
      int? id,
      String? lastModifiedTime,
      String? name,
      String? pageDescription,
      Indicators pageName,
      String? userId});
}

/// @nodoc
class _$FavouriteResponseCopyWithImpl<$Res, $Val extends FavouriteResponse>
    implements $FavouriteResponseCopyWith<$Res> {
  _$FavouriteResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creationTime = freezed,
    Object? criteria = freezed,
    Object? id = freezed,
    Object? lastModifiedTime = freezed,
    Object? name = freezed,
    Object? pageDescription = freezed,
    Object? pageName = null,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      creationTime: freezed == creationTime
          ? _value.creationTime
          : creationTime // ignore: cast_nullable_to_non_nullable
              as String?,
      criteria: freezed == criteria
          ? _value.criteria
          : criteria // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      lastModifiedTime: freezed == lastModifiedTime
          ? _value.lastModifiedTime
          : lastModifiedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      pageDescription: freezed == pageDescription
          ? _value.pageDescription
          : pageDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      pageName: null == pageName
          ? _value.pageName
          : pageName // ignore: cast_nullable_to_non_nullable
              as Indicators,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavouriteResponseImplCopyWith<$Res>
    implements $FavouriteResponseCopyWith<$Res> {
  factory _$$FavouriteResponseImplCopyWith(_$FavouriteResponseImpl value,
          $Res Function(_$FavouriteResponseImpl) then) =
      __$$FavouriteResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? creationTime,
      String? criteria,
      int? id,
      String? lastModifiedTime,
      String? name,
      String? pageDescription,
      Indicators pageName,
      String? userId});
}

/// @nodoc
class __$$FavouriteResponseImplCopyWithImpl<$Res>
    extends _$FavouriteResponseCopyWithImpl<$Res, _$FavouriteResponseImpl>
    implements _$$FavouriteResponseImplCopyWith<$Res> {
  __$$FavouriteResponseImplCopyWithImpl(_$FavouriteResponseImpl _value,
      $Res Function(_$FavouriteResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creationTime = freezed,
    Object? criteria = freezed,
    Object? id = freezed,
    Object? lastModifiedTime = freezed,
    Object? name = freezed,
    Object? pageDescription = freezed,
    Object? pageName = null,
    Object? userId = freezed,
  }) {
    return _then(_$FavouriteResponseImpl(
      creationTime: freezed == creationTime
          ? _value.creationTime
          : creationTime // ignore: cast_nullable_to_non_nullable
              as String?,
      criteria: freezed == criteria
          ? _value.criteria
          : criteria // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      lastModifiedTime: freezed == lastModifiedTime
          ? _value.lastModifiedTime
          : lastModifiedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      pageDescription: freezed == pageDescription
          ? _value.pageDescription
          : pageDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      pageName: null == pageName
          ? _value.pageName
          : pageName // ignore: cast_nullable_to_non_nullable
              as Indicators,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$FavouriteResponseImpl implements _FavouriteResponse {
  const _$FavouriteResponseImpl(
      {this.creationTime,
      this.criteria = "",
      this.id,
      this.lastModifiedTime,
      this.name = "",
      this.pageDescription,
      this.pageName = Indicators.sell,
      this.userId});

  factory _$FavouriteResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavouriteResponseImplFromJson(json);

  @override
  final String? creationTime;
  @override
  @JsonKey()
  final String? criteria;
  @override
  final int? id;
  @override
  final String? lastModifiedTime;
  @override
  @JsonKey()
  final String? name;
  @override
  final String? pageDescription;
  @override
  @JsonKey()
  final Indicators pageName;
  @override
  final String? userId;

  @override
  String toString() {
    return 'FavouriteResponse(creationTime: $creationTime, criteria: $criteria, id: $id, lastModifiedTime: $lastModifiedTime, name: $name, pageDescription: $pageDescription, pageName: $pageName, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavouriteResponseImpl &&
            (identical(other.creationTime, creationTime) ||
                other.creationTime == creationTime) &&
            (identical(other.criteria, criteria) ||
                other.criteria == criteria) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lastModifiedTime, lastModifiedTime) ||
                other.lastModifiedTime == lastModifiedTime) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.pageDescription, pageDescription) ||
                other.pageDescription == pageDescription) &&
            (identical(other.pageName, pageName) ||
                other.pageName == pageName) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, creationTime, criteria, id,
      lastModifiedTime, name, pageDescription, pageName, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavouriteResponseImplCopyWith<_$FavouriteResponseImpl> get copyWith =>
      __$$FavouriteResponseImplCopyWithImpl<_$FavouriteResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavouriteResponseImplToJson(
      this,
    );
  }
}

abstract class _FavouriteResponse implements FavouriteResponse {
  const factory _FavouriteResponse(
      {final String? creationTime,
      final String? criteria,
      final int? id,
      final String? lastModifiedTime,
      final String? name,
      final String? pageDescription,
      final Indicators pageName,
      final String? userId}) = _$FavouriteResponseImpl;

  factory _FavouriteResponse.fromJson(Map<String, dynamic> json) =
      _$FavouriteResponseImpl.fromJson;

  @override
  String? get creationTime;
  @override
  String? get criteria;
  @override
  int? get id;
  @override
  String? get lastModifiedTime;
  @override
  String? get name;
  @override
  String? get pageDescription;
  @override
  Indicators get pageName;
  @override
  String? get userId;
  @override
  @JsonKey(ignore: true)
  _$$FavouriteResponseImplCopyWith<_$FavouriteResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CriteriaObject _$CriteriaObjectFromJson(Map<String, dynamic> json) {
  return _CriteriaObject.fromJson(json);
}

/// @nodoc
mixin _$CriteriaObject {
  int? get municipalityId => throw _privateConstructorUsedError;
  int? get areaCode => throw _privateConstructorUsedError;
  List<int>? get propertyTypeList => throw _privateConstructorUsedError;
  List<int>? get purposeList => throw _privateConstructorUsedError;
  List<int>? get issueDateQuarterList => throw _privateConstructorUsedError;
  List<int>? get premiseCategoryList => throw _privateConstructorUsedError;
  int? get bedRoomsCount => throw _privateConstructorUsedError;
  int? get furnitureStatus => throw _privateConstructorUsedError;
  int? get issueDateYear => throw _privateConstructorUsedError;
  int? get issueDateMonth => throw _privateConstructorUsedError;
  int? get issueDateStartMonth => throw _privateConstructorUsedError;
  int? get issueDateEndMonth => throw _privateConstructorUsedError;
  int? get rentPaymentMonthlyPerUnitFrom => throw _privateConstructorUsedError;
  int? get rentPaymentMonthlyPerUnitTo => throw _privateConstructorUsedError;
  int? get zoneId => throw _privateConstructorUsedError;
  int? get durationType => throw _privateConstructorUsedError;
  double? get realEstateValueFrom => throw _privateConstructorUsedError;
  double? get realEstateValueTo => throw _privateConstructorUsedError;
  int? get halfYearDuration => throw _privateConstructorUsedError;
  double? get areaFrom => throw _privateConstructorUsedError;
  double? get areaTo => throw _privateConstructorUsedError;
  int? get occupancyStatus => throw _privateConstructorUsedError;
  int? get unit => throw _privateConstructorUsedError;
  int? get periodId => throw _privateConstructorUsedError;
  String? get issueDateFrom => throw _privateConstructorUsedError;
  String? get issueDateTo => throw _privateConstructorUsedError;
  List<int>? get premiseTypeList => throw _privateConstructorUsedError;
  String? get ownerCategoryCode => throw _privateConstructorUsedError;
  String? get brokerName => throw _privateConstructorUsedError;
  int? get brokerCategoryId => throw _privateConstructorUsedError;
  int? get nationalityCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CriteriaObjectCopyWith<CriteriaObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CriteriaObjectCopyWith<$Res> {
  factory $CriteriaObjectCopyWith(
          CriteriaObject value, $Res Function(CriteriaObject) then) =
      _$CriteriaObjectCopyWithImpl<$Res, CriteriaObject>;
  @useResult
  $Res call(
      {int? municipalityId,
      int? areaCode,
      List<int>? propertyTypeList,
      List<int>? purposeList,
      List<int>? issueDateQuarterList,
      List<int>? premiseCategoryList,
      int? bedRoomsCount,
      int? furnitureStatus,
      int? issueDateYear,
      int? issueDateMonth,
      int? issueDateStartMonth,
      int? issueDateEndMonth,
      int? rentPaymentMonthlyPerUnitFrom,
      int? rentPaymentMonthlyPerUnitTo,
      int? zoneId,
      int? durationType,
      double? realEstateValueFrom,
      double? realEstateValueTo,
      int? halfYearDuration,
      double? areaFrom,
      double? areaTo,
      int? occupancyStatus,
      int? unit,
      int? periodId,
      String? issueDateFrom,
      String? issueDateTo,
      List<int>? premiseTypeList,
      String? ownerCategoryCode,
      String? brokerName,
      int? brokerCategoryId,
      int? nationalityCode});
}

/// @nodoc
class _$CriteriaObjectCopyWithImpl<$Res, $Val extends CriteriaObject>
    implements $CriteriaObjectCopyWith<$Res> {
  _$CriteriaObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? municipalityId = freezed,
    Object? areaCode = freezed,
    Object? propertyTypeList = freezed,
    Object? purposeList = freezed,
    Object? issueDateQuarterList = freezed,
    Object? premiseCategoryList = freezed,
    Object? bedRoomsCount = freezed,
    Object? furnitureStatus = freezed,
    Object? issueDateYear = freezed,
    Object? issueDateMonth = freezed,
    Object? issueDateStartMonth = freezed,
    Object? issueDateEndMonth = freezed,
    Object? rentPaymentMonthlyPerUnitFrom = freezed,
    Object? rentPaymentMonthlyPerUnitTo = freezed,
    Object? zoneId = freezed,
    Object? durationType = freezed,
    Object? realEstateValueFrom = freezed,
    Object? realEstateValueTo = freezed,
    Object? halfYearDuration = freezed,
    Object? areaFrom = freezed,
    Object? areaTo = freezed,
    Object? occupancyStatus = freezed,
    Object? unit = freezed,
    Object? periodId = freezed,
    Object? issueDateFrom = freezed,
    Object? issueDateTo = freezed,
    Object? premiseTypeList = freezed,
    Object? ownerCategoryCode = freezed,
    Object? brokerName = freezed,
    Object? brokerCategoryId = freezed,
    Object? nationalityCode = freezed,
  }) {
    return _then(_value.copyWith(
      municipalityId: freezed == municipalityId
          ? _value.municipalityId
          : municipalityId // ignore: cast_nullable_to_non_nullable
              as int?,
      areaCode: freezed == areaCode
          ? _value.areaCode
          : areaCode // ignore: cast_nullable_to_non_nullable
              as int?,
      propertyTypeList: freezed == propertyTypeList
          ? _value.propertyTypeList
          : propertyTypeList // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      purposeList: freezed == purposeList
          ? _value.purposeList
          : purposeList // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      issueDateQuarterList: freezed == issueDateQuarterList
          ? _value.issueDateQuarterList
          : issueDateQuarterList // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      premiseCategoryList: freezed == premiseCategoryList
          ? _value.premiseCategoryList
          : premiseCategoryList // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      bedRoomsCount: freezed == bedRoomsCount
          ? _value.bedRoomsCount
          : bedRoomsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      furnitureStatus: freezed == furnitureStatus
          ? _value.furnitureStatus
          : furnitureStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      issueDateYear: freezed == issueDateYear
          ? _value.issueDateYear
          : issueDateYear // ignore: cast_nullable_to_non_nullable
              as int?,
      issueDateMonth: freezed == issueDateMonth
          ? _value.issueDateMonth
          : issueDateMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      issueDateStartMonth: freezed == issueDateStartMonth
          ? _value.issueDateStartMonth
          : issueDateStartMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      issueDateEndMonth: freezed == issueDateEndMonth
          ? _value.issueDateEndMonth
          : issueDateEndMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      rentPaymentMonthlyPerUnitFrom: freezed == rentPaymentMonthlyPerUnitFrom
          ? _value.rentPaymentMonthlyPerUnitFrom
          : rentPaymentMonthlyPerUnitFrom // ignore: cast_nullable_to_non_nullable
              as int?,
      rentPaymentMonthlyPerUnitTo: freezed == rentPaymentMonthlyPerUnitTo
          ? _value.rentPaymentMonthlyPerUnitTo
          : rentPaymentMonthlyPerUnitTo // ignore: cast_nullable_to_non_nullable
              as int?,
      zoneId: freezed == zoneId
          ? _value.zoneId
          : zoneId // ignore: cast_nullable_to_non_nullable
              as int?,
      durationType: freezed == durationType
          ? _value.durationType
          : durationType // ignore: cast_nullable_to_non_nullable
              as int?,
      realEstateValueFrom: freezed == realEstateValueFrom
          ? _value.realEstateValueFrom
          : realEstateValueFrom // ignore: cast_nullable_to_non_nullable
              as double?,
      realEstateValueTo: freezed == realEstateValueTo
          ? _value.realEstateValueTo
          : realEstateValueTo // ignore: cast_nullable_to_non_nullable
              as double?,
      halfYearDuration: freezed == halfYearDuration
          ? _value.halfYearDuration
          : halfYearDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      areaFrom: freezed == areaFrom
          ? _value.areaFrom
          : areaFrom // ignore: cast_nullable_to_non_nullable
              as double?,
      areaTo: freezed == areaTo
          ? _value.areaTo
          : areaTo // ignore: cast_nullable_to_non_nullable
              as double?,
      occupancyStatus: freezed == occupancyStatus
          ? _value.occupancyStatus
          : occupancyStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as int?,
      periodId: freezed == periodId
          ? _value.periodId
          : periodId // ignore: cast_nullable_to_non_nullable
              as int?,
      issueDateFrom: freezed == issueDateFrom
          ? _value.issueDateFrom
          : issueDateFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      issueDateTo: freezed == issueDateTo
          ? _value.issueDateTo
          : issueDateTo // ignore: cast_nullable_to_non_nullable
              as String?,
      premiseTypeList: freezed == premiseTypeList
          ? _value.premiseTypeList
          : premiseTypeList // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      ownerCategoryCode: freezed == ownerCategoryCode
          ? _value.ownerCategoryCode
          : ownerCategoryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      brokerName: freezed == brokerName
          ? _value.brokerName
          : brokerName // ignore: cast_nullable_to_non_nullable
              as String?,
      brokerCategoryId: freezed == brokerCategoryId
          ? _value.brokerCategoryId
          : brokerCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      nationalityCode: freezed == nationalityCode
          ? _value.nationalityCode
          : nationalityCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CriteriaObjectImplCopyWith<$Res>
    implements $CriteriaObjectCopyWith<$Res> {
  factory _$$CriteriaObjectImplCopyWith(_$CriteriaObjectImpl value,
          $Res Function(_$CriteriaObjectImpl) then) =
      __$$CriteriaObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? municipalityId,
      int? areaCode,
      List<int>? propertyTypeList,
      List<int>? purposeList,
      List<int>? issueDateQuarterList,
      List<int>? premiseCategoryList,
      int? bedRoomsCount,
      int? furnitureStatus,
      int? issueDateYear,
      int? issueDateMonth,
      int? issueDateStartMonth,
      int? issueDateEndMonth,
      int? rentPaymentMonthlyPerUnitFrom,
      int? rentPaymentMonthlyPerUnitTo,
      int? zoneId,
      int? durationType,
      double? realEstateValueFrom,
      double? realEstateValueTo,
      int? halfYearDuration,
      double? areaFrom,
      double? areaTo,
      int? occupancyStatus,
      int? unit,
      int? periodId,
      String? issueDateFrom,
      String? issueDateTo,
      List<int>? premiseTypeList,
      String? ownerCategoryCode,
      String? brokerName,
      int? brokerCategoryId,
      int? nationalityCode});
}

/// @nodoc
class __$$CriteriaObjectImplCopyWithImpl<$Res>
    extends _$CriteriaObjectCopyWithImpl<$Res, _$CriteriaObjectImpl>
    implements _$$CriteriaObjectImplCopyWith<$Res> {
  __$$CriteriaObjectImplCopyWithImpl(
      _$CriteriaObjectImpl _value, $Res Function(_$CriteriaObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? municipalityId = freezed,
    Object? areaCode = freezed,
    Object? propertyTypeList = freezed,
    Object? purposeList = freezed,
    Object? issueDateQuarterList = freezed,
    Object? premiseCategoryList = freezed,
    Object? bedRoomsCount = freezed,
    Object? furnitureStatus = freezed,
    Object? issueDateYear = freezed,
    Object? issueDateMonth = freezed,
    Object? issueDateStartMonth = freezed,
    Object? issueDateEndMonth = freezed,
    Object? rentPaymentMonthlyPerUnitFrom = freezed,
    Object? rentPaymentMonthlyPerUnitTo = freezed,
    Object? zoneId = freezed,
    Object? durationType = freezed,
    Object? realEstateValueFrom = freezed,
    Object? realEstateValueTo = freezed,
    Object? halfYearDuration = freezed,
    Object? areaFrom = freezed,
    Object? areaTo = freezed,
    Object? occupancyStatus = freezed,
    Object? unit = freezed,
    Object? periodId = freezed,
    Object? issueDateFrom = freezed,
    Object? issueDateTo = freezed,
    Object? premiseTypeList = freezed,
    Object? ownerCategoryCode = freezed,
    Object? brokerName = freezed,
    Object? brokerCategoryId = freezed,
    Object? nationalityCode = freezed,
  }) {
    return _then(_$CriteriaObjectImpl(
      municipalityId: freezed == municipalityId
          ? _value.municipalityId
          : municipalityId // ignore: cast_nullable_to_non_nullable
              as int?,
      areaCode: freezed == areaCode
          ? _value.areaCode
          : areaCode // ignore: cast_nullable_to_non_nullable
              as int?,
      propertyTypeList: freezed == propertyTypeList
          ? _value._propertyTypeList
          : propertyTypeList // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      purposeList: freezed == purposeList
          ? _value._purposeList
          : purposeList // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      issueDateQuarterList: freezed == issueDateQuarterList
          ? _value._issueDateQuarterList
          : issueDateQuarterList // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      premiseCategoryList: freezed == premiseCategoryList
          ? _value._premiseCategoryList
          : premiseCategoryList // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      bedRoomsCount: freezed == bedRoomsCount
          ? _value.bedRoomsCount
          : bedRoomsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      furnitureStatus: freezed == furnitureStatus
          ? _value.furnitureStatus
          : furnitureStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      issueDateYear: freezed == issueDateYear
          ? _value.issueDateYear
          : issueDateYear // ignore: cast_nullable_to_non_nullable
              as int?,
      issueDateMonth: freezed == issueDateMonth
          ? _value.issueDateMonth
          : issueDateMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      issueDateStartMonth: freezed == issueDateStartMonth
          ? _value.issueDateStartMonth
          : issueDateStartMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      issueDateEndMonth: freezed == issueDateEndMonth
          ? _value.issueDateEndMonth
          : issueDateEndMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      rentPaymentMonthlyPerUnitFrom: freezed == rentPaymentMonthlyPerUnitFrom
          ? _value.rentPaymentMonthlyPerUnitFrom
          : rentPaymentMonthlyPerUnitFrom // ignore: cast_nullable_to_non_nullable
              as int?,
      rentPaymentMonthlyPerUnitTo: freezed == rentPaymentMonthlyPerUnitTo
          ? _value.rentPaymentMonthlyPerUnitTo
          : rentPaymentMonthlyPerUnitTo // ignore: cast_nullable_to_non_nullable
              as int?,
      zoneId: freezed == zoneId
          ? _value.zoneId
          : zoneId // ignore: cast_nullable_to_non_nullable
              as int?,
      durationType: freezed == durationType
          ? _value.durationType
          : durationType // ignore: cast_nullable_to_non_nullable
              as int?,
      realEstateValueFrom: freezed == realEstateValueFrom
          ? _value.realEstateValueFrom
          : realEstateValueFrom // ignore: cast_nullable_to_non_nullable
              as double?,
      realEstateValueTo: freezed == realEstateValueTo
          ? _value.realEstateValueTo
          : realEstateValueTo // ignore: cast_nullable_to_non_nullable
              as double?,
      halfYearDuration: freezed == halfYearDuration
          ? _value.halfYearDuration
          : halfYearDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      areaFrom: freezed == areaFrom
          ? _value.areaFrom
          : areaFrom // ignore: cast_nullable_to_non_nullable
              as double?,
      areaTo: freezed == areaTo
          ? _value.areaTo
          : areaTo // ignore: cast_nullable_to_non_nullable
              as double?,
      occupancyStatus: freezed == occupancyStatus
          ? _value.occupancyStatus
          : occupancyStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as int?,
      periodId: freezed == periodId
          ? _value.periodId
          : periodId // ignore: cast_nullable_to_non_nullable
              as int?,
      issueDateFrom: freezed == issueDateFrom
          ? _value.issueDateFrom
          : issueDateFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      issueDateTo: freezed == issueDateTo
          ? _value.issueDateTo
          : issueDateTo // ignore: cast_nullable_to_non_nullable
              as String?,
      premiseTypeList: freezed == premiseTypeList
          ? _value._premiseTypeList
          : premiseTypeList // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      ownerCategoryCode: freezed == ownerCategoryCode
          ? _value.ownerCategoryCode
          : ownerCategoryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      brokerName: freezed == brokerName
          ? _value.brokerName
          : brokerName // ignore: cast_nullable_to_non_nullable
              as String?,
      brokerCategoryId: freezed == brokerCategoryId
          ? _value.brokerCategoryId
          : brokerCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      nationalityCode: freezed == nationalityCode
          ? _value.nationalityCode
          : nationalityCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$CriteriaObjectImpl implements _CriteriaObject {
  const _$CriteriaObjectImpl(
      {this.municipalityId,
      this.areaCode,
      final List<int>? propertyTypeList,
      final List<int>? purposeList,
      final List<int>? issueDateQuarterList,
      final List<int>? premiseCategoryList,
      this.bedRoomsCount,
      this.furnitureStatus,
      this.issueDateYear,
      this.issueDateMonth,
      this.issueDateStartMonth,
      this.issueDateEndMonth,
      this.rentPaymentMonthlyPerUnitFrom,
      this.rentPaymentMonthlyPerUnitTo,
      this.zoneId,
      this.durationType,
      this.realEstateValueFrom,
      this.realEstateValueTo,
      this.halfYearDuration,
      this.areaFrom,
      this.areaTo,
      this.occupancyStatus,
      this.unit,
      this.periodId,
      this.issueDateFrom,
      this.issueDateTo,
      final List<int>? premiseTypeList,
      this.ownerCategoryCode,
      this.brokerName,
      this.brokerCategoryId,
      this.nationalityCode})
      : _propertyTypeList = propertyTypeList,
        _purposeList = purposeList,
        _issueDateQuarterList = issueDateQuarterList,
        _premiseCategoryList = premiseCategoryList,
        _premiseTypeList = premiseTypeList;

  factory _$CriteriaObjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$CriteriaObjectImplFromJson(json);

  @override
  final int? municipalityId;
  @override
  final int? areaCode;
  final List<int>? _propertyTypeList;
  @override
  List<int>? get propertyTypeList {
    final value = _propertyTypeList;
    if (value == null) return null;
    if (_propertyTypeList is EqualUnmodifiableListView)
      return _propertyTypeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _purposeList;
  @override
  List<int>? get purposeList {
    final value = _purposeList;
    if (value == null) return null;
    if (_purposeList is EqualUnmodifiableListView) return _purposeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _issueDateQuarterList;
  @override
  List<int>? get issueDateQuarterList {
    final value = _issueDateQuarterList;
    if (value == null) return null;
    if (_issueDateQuarterList is EqualUnmodifiableListView)
      return _issueDateQuarterList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _premiseCategoryList;
  @override
  List<int>? get premiseCategoryList {
    final value = _premiseCategoryList;
    if (value == null) return null;
    if (_premiseCategoryList is EqualUnmodifiableListView)
      return _premiseCategoryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? bedRoomsCount;
  @override
  final int? furnitureStatus;
  @override
  final int? issueDateYear;
  @override
  final int? issueDateMonth;
  @override
  final int? issueDateStartMonth;
  @override
  final int? issueDateEndMonth;
  @override
  final int? rentPaymentMonthlyPerUnitFrom;
  @override
  final int? rentPaymentMonthlyPerUnitTo;
  @override
  final int? zoneId;
  @override
  final int? durationType;
  @override
  final double? realEstateValueFrom;
  @override
  final double? realEstateValueTo;
  @override
  final int? halfYearDuration;
  @override
  final double? areaFrom;
  @override
  final double? areaTo;
  @override
  final int? occupancyStatus;
  @override
  final int? unit;
  @override
  final int? periodId;
  @override
  final String? issueDateFrom;
  @override
  final String? issueDateTo;
  final List<int>? _premiseTypeList;
  @override
  List<int>? get premiseTypeList {
    final value = _premiseTypeList;
    if (value == null) return null;
    if (_premiseTypeList is EqualUnmodifiableListView) return _premiseTypeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? ownerCategoryCode;
  @override
  final String? brokerName;
  @override
  final int? brokerCategoryId;
  @override
  final int? nationalityCode;

  @override
  String toString() {
    return 'CriteriaObject(municipalityId: $municipalityId, areaCode: $areaCode, propertyTypeList: $propertyTypeList, purposeList: $purposeList, issueDateQuarterList: $issueDateQuarterList, premiseCategoryList: $premiseCategoryList, bedRoomsCount: $bedRoomsCount, furnitureStatus: $furnitureStatus, issueDateYear: $issueDateYear, issueDateMonth: $issueDateMonth, issueDateStartMonth: $issueDateStartMonth, issueDateEndMonth: $issueDateEndMonth, rentPaymentMonthlyPerUnitFrom: $rentPaymentMonthlyPerUnitFrom, rentPaymentMonthlyPerUnitTo: $rentPaymentMonthlyPerUnitTo, zoneId: $zoneId, durationType: $durationType, realEstateValueFrom: $realEstateValueFrom, realEstateValueTo: $realEstateValueTo, halfYearDuration: $halfYearDuration, areaFrom: $areaFrom, areaTo: $areaTo, occupancyStatus: $occupancyStatus, unit: $unit, periodId: $periodId, issueDateFrom: $issueDateFrom, issueDateTo: $issueDateTo, premiseTypeList: $premiseTypeList, ownerCategoryCode: $ownerCategoryCode, brokerName: $brokerName, brokerCategoryId: $brokerCategoryId, nationalityCode: $nationalityCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CriteriaObjectImpl &&
            (identical(other.municipalityId, municipalityId) ||
                other.municipalityId == municipalityId) &&
            (identical(other.areaCode, areaCode) ||
                other.areaCode == areaCode) &&
            const DeepCollectionEquality()
                .equals(other._propertyTypeList, _propertyTypeList) &&
            const DeepCollectionEquality()
                .equals(other._purposeList, _purposeList) &&
            const DeepCollectionEquality()
                .equals(other._issueDateQuarterList, _issueDateQuarterList) &&
            const DeepCollectionEquality()
                .equals(other._premiseCategoryList, _premiseCategoryList) &&
            (identical(other.bedRoomsCount, bedRoomsCount) ||
                other.bedRoomsCount == bedRoomsCount) &&
            (identical(other.furnitureStatus, furnitureStatus) ||
                other.furnitureStatus == furnitureStatus) &&
            (identical(other.issueDateYear, issueDateYear) ||
                other.issueDateYear == issueDateYear) &&
            (identical(other.issueDateMonth, issueDateMonth) ||
                other.issueDateMonth == issueDateMonth) &&
            (identical(other.issueDateStartMonth, issueDateStartMonth) ||
                other.issueDateStartMonth == issueDateStartMonth) &&
            (identical(other.issueDateEndMonth, issueDateEndMonth) ||
                other.issueDateEndMonth == issueDateEndMonth) &&
            (identical(other.rentPaymentMonthlyPerUnitFrom,
                    rentPaymentMonthlyPerUnitFrom) ||
                other.rentPaymentMonthlyPerUnitFrom ==
                    rentPaymentMonthlyPerUnitFrom) &&
            (identical(other.rentPaymentMonthlyPerUnitTo, rentPaymentMonthlyPerUnitTo) ||
                other.rentPaymentMonthlyPerUnitTo ==
                    rentPaymentMonthlyPerUnitTo) &&
            (identical(other.zoneId, zoneId) || other.zoneId == zoneId) &&
            (identical(other.durationType, durationType) ||
                other.durationType == durationType) &&
            (identical(other.realEstateValueFrom, realEstateValueFrom) ||
                other.realEstateValueFrom == realEstateValueFrom) &&
            (identical(other.realEstateValueTo, realEstateValueTo) ||
                other.realEstateValueTo == realEstateValueTo) &&
            (identical(other.halfYearDuration, halfYearDuration) ||
                other.halfYearDuration == halfYearDuration) &&
            (identical(other.areaFrom, areaFrom) ||
                other.areaFrom == areaFrom) &&
            (identical(other.areaTo, areaTo) || other.areaTo == areaTo) &&
            (identical(other.occupancyStatus, occupancyStatus) ||
                other.occupancyStatus == occupancyStatus) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.periodId, periodId) ||
                other.periodId == periodId) &&
            (identical(other.issueDateFrom, issueDateFrom) ||
                other.issueDateFrom == issueDateFrom) &&
            (identical(other.issueDateTo, issueDateTo) ||
                other.issueDateTo == issueDateTo) &&
            const DeepCollectionEquality()
                .equals(other._premiseTypeList, _premiseTypeList) &&
            (identical(other.ownerCategoryCode, ownerCategoryCode) ||
                other.ownerCategoryCode == ownerCategoryCode) &&
            (identical(other.brokerName, brokerName) ||
                other.brokerName == brokerName) &&
            (identical(other.brokerCategoryId, brokerCategoryId) ||
                other.brokerCategoryId == brokerCategoryId) &&
            (identical(other.nationalityCode, nationalityCode) ||
                other.nationalityCode == nationalityCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        municipalityId,
        areaCode,
        const DeepCollectionEquality().hash(_propertyTypeList),
        const DeepCollectionEquality().hash(_purposeList),
        const DeepCollectionEquality().hash(_issueDateQuarterList),
        const DeepCollectionEquality().hash(_premiseCategoryList),
        bedRoomsCount,
        furnitureStatus,
        issueDateYear,
        issueDateMonth,
        issueDateStartMonth,
        issueDateEndMonth,
        rentPaymentMonthlyPerUnitFrom,
        rentPaymentMonthlyPerUnitTo,
        zoneId,
        durationType,
        realEstateValueFrom,
        realEstateValueTo,
        halfYearDuration,
        areaFrom,
        areaTo,
        occupancyStatus,
        unit,
        periodId,
        issueDateFrom,
        issueDateTo,
        const DeepCollectionEquality().hash(_premiseTypeList),
        ownerCategoryCode,
        brokerName,
        brokerCategoryId,
        nationalityCode
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CriteriaObjectImplCopyWith<_$CriteriaObjectImpl> get copyWith =>
      __$$CriteriaObjectImplCopyWithImpl<_$CriteriaObjectImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CriteriaObjectImplToJson(
      this,
    );
  }
}

abstract class _CriteriaObject implements CriteriaObject {
  const factory _CriteriaObject(
      {final int? municipalityId,
      final int? areaCode,
      final List<int>? propertyTypeList,
      final List<int>? purposeList,
      final List<int>? issueDateQuarterList,
      final List<int>? premiseCategoryList,
      final int? bedRoomsCount,
      final int? furnitureStatus,
      final int? issueDateYear,
      final int? issueDateMonth,
      final int? issueDateStartMonth,
      final int? issueDateEndMonth,
      final int? rentPaymentMonthlyPerUnitFrom,
      final int? rentPaymentMonthlyPerUnitTo,
      final int? zoneId,
      final int? durationType,
      final double? realEstateValueFrom,
      final double? realEstateValueTo,
      final int? halfYearDuration,
      final double? areaFrom,
      final double? areaTo,
      final int? occupancyStatus,
      final int? unit,
      final int? periodId,
      final String? issueDateFrom,
      final String? issueDateTo,
      final List<int>? premiseTypeList,
      final String? ownerCategoryCode,
      final String? brokerName,
      final int? brokerCategoryId,
      final int? nationalityCode}) = _$CriteriaObjectImpl;

  factory _CriteriaObject.fromJson(Map<String, dynamic> json) =
      _$CriteriaObjectImpl.fromJson;

  @override
  int? get municipalityId;
  @override
  int? get areaCode;
  @override
  List<int>? get propertyTypeList;
  @override
  List<int>? get purposeList;
  @override
  List<int>? get issueDateQuarterList;
  @override
  List<int>? get premiseCategoryList;
  @override
  int? get bedRoomsCount;
  @override
  int? get furnitureStatus;
  @override
  int? get issueDateYear;
  @override
  int? get issueDateMonth;
  @override
  int? get issueDateStartMonth;
  @override
  int? get issueDateEndMonth;
  @override
  int? get rentPaymentMonthlyPerUnitFrom;
  @override
  int? get rentPaymentMonthlyPerUnitTo;
  @override
  int? get zoneId;
  @override
  int? get durationType;
  @override
  double? get realEstateValueFrom;
  @override
  double? get realEstateValueTo;
  @override
  int? get halfYearDuration;
  @override
  double? get areaFrom;
  @override
  double? get areaTo;
  @override
  int? get occupancyStatus;
  @override
  int? get unit;
  @override
  int? get periodId;
  @override
  String? get issueDateFrom;
  @override
  String? get issueDateTo;
  @override
  List<int>? get premiseTypeList;
  @override
  String? get ownerCategoryCode;
  @override
  String? get brokerName;
  @override
  int? get brokerCategoryId;
  @override
  int? get nationalityCode;
  @override
  @JsonKey(ignore: true)
  _$$CriteriaObjectImplCopyWith<_$CriteriaObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
