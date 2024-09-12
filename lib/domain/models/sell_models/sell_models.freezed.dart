// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sell_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SellTransaction _$SellTransactionFromJson(Map<String, dynamic> json) {
  return _SellTransaction.fromJson(json);
}

/// @nodoc
mixin _$SellTransaction {
  int? get areaCode => throw _privateConstructorUsedError;
  String? get issueDate => throw _privateConstructorUsedError;
  int? get municipalityId => throw _privateConstructorUsedError;
  double? get priceMT => throw _privateConstructorUsedError;
  double? get priceSQ => throw _privateConstructorUsedError;
  double? get realEstateMT => throw _privateConstructorUsedError;
  double? get realEstateSQT => throw _privateConstructorUsedError;
  double? get realEstateValue => throw _privateConstructorUsedError;
  double? get roi => throw _privateConstructorUsedError;
  String? get soldTo => throw _privateConstructorUsedError;
  double? get unitNo => throw _privateConstructorUsedError;
  int? get unitStatus => throw _privateConstructorUsedError;

  /// Serializes this SellTransaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SellTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SellTransactionCopyWith<SellTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellTransactionCopyWith<$Res> {
  factory $SellTransactionCopyWith(
          SellTransaction value, $Res Function(SellTransaction) then) =
      _$SellTransactionCopyWithImpl<$Res, SellTransaction>;
  @useResult
  $Res call(
      {int? areaCode,
      String? issueDate,
      int? municipalityId,
      double? priceMT,
      double? priceSQ,
      double? realEstateMT,
      double? realEstateSQT,
      double? realEstateValue,
      double? roi,
      String? soldTo,
      double? unitNo,
      int? unitStatus});
}

/// @nodoc
class _$SellTransactionCopyWithImpl<$Res, $Val extends SellTransaction>
    implements $SellTransactionCopyWith<$Res> {
  _$SellTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SellTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? areaCode = freezed,
    Object? issueDate = freezed,
    Object? municipalityId = freezed,
    Object? priceMT = freezed,
    Object? priceSQ = freezed,
    Object? realEstateMT = freezed,
    Object? realEstateSQT = freezed,
    Object? realEstateValue = freezed,
    Object? roi = freezed,
    Object? soldTo = freezed,
    Object? unitNo = freezed,
    Object? unitStatus = freezed,
  }) {
    return _then(_value.copyWith(
      areaCode: freezed == areaCode
          ? _value.areaCode
          : areaCode // ignore: cast_nullable_to_non_nullable
              as int?,
      issueDate: freezed == issueDate
          ? _value.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      municipalityId: freezed == municipalityId
          ? _value.municipalityId
          : municipalityId // ignore: cast_nullable_to_non_nullable
              as int?,
      priceMT: freezed == priceMT
          ? _value.priceMT
          : priceMT // ignore: cast_nullable_to_non_nullable
              as double?,
      priceSQ: freezed == priceSQ
          ? _value.priceSQ
          : priceSQ // ignore: cast_nullable_to_non_nullable
              as double?,
      realEstateMT: freezed == realEstateMT
          ? _value.realEstateMT
          : realEstateMT // ignore: cast_nullable_to_non_nullable
              as double?,
      realEstateSQT: freezed == realEstateSQT
          ? _value.realEstateSQT
          : realEstateSQT // ignore: cast_nullable_to_non_nullable
              as double?,
      realEstateValue: freezed == realEstateValue
          ? _value.realEstateValue
          : realEstateValue // ignore: cast_nullable_to_non_nullable
              as double?,
      roi: freezed == roi
          ? _value.roi
          : roi // ignore: cast_nullable_to_non_nullable
              as double?,
      soldTo: freezed == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String?,
      unitNo: freezed == unitNo
          ? _value.unitNo
          : unitNo // ignore: cast_nullable_to_non_nullable
              as double?,
      unitStatus: freezed == unitStatus
          ? _value.unitStatus
          : unitStatus // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SellTransactionImplCopyWith<$Res>
    implements $SellTransactionCopyWith<$Res> {
  factory _$$SellTransactionImplCopyWith(_$SellTransactionImpl value,
          $Res Function(_$SellTransactionImpl) then) =
      __$$SellTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? areaCode,
      String? issueDate,
      int? municipalityId,
      double? priceMT,
      double? priceSQ,
      double? realEstateMT,
      double? realEstateSQT,
      double? realEstateValue,
      double? roi,
      String? soldTo,
      double? unitNo,
      int? unitStatus});
}

/// @nodoc
class __$$SellTransactionImplCopyWithImpl<$Res>
    extends _$SellTransactionCopyWithImpl<$Res, _$SellTransactionImpl>
    implements _$$SellTransactionImplCopyWith<$Res> {
  __$$SellTransactionImplCopyWithImpl(
      _$SellTransactionImpl _value, $Res Function(_$SellTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of SellTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? areaCode = freezed,
    Object? issueDate = freezed,
    Object? municipalityId = freezed,
    Object? priceMT = freezed,
    Object? priceSQ = freezed,
    Object? realEstateMT = freezed,
    Object? realEstateSQT = freezed,
    Object? realEstateValue = freezed,
    Object? roi = freezed,
    Object? soldTo = freezed,
    Object? unitNo = freezed,
    Object? unitStatus = freezed,
  }) {
    return _then(_$SellTransactionImpl(
      areaCode: freezed == areaCode
          ? _value.areaCode
          : areaCode // ignore: cast_nullable_to_non_nullable
              as int?,
      issueDate: freezed == issueDate
          ? _value.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      municipalityId: freezed == municipalityId
          ? _value.municipalityId
          : municipalityId // ignore: cast_nullable_to_non_nullable
              as int?,
      priceMT: freezed == priceMT
          ? _value.priceMT
          : priceMT // ignore: cast_nullable_to_non_nullable
              as double?,
      priceSQ: freezed == priceSQ
          ? _value.priceSQ
          : priceSQ // ignore: cast_nullable_to_non_nullable
              as double?,
      realEstateMT: freezed == realEstateMT
          ? _value.realEstateMT
          : realEstateMT // ignore: cast_nullable_to_non_nullable
              as double?,
      realEstateSQT: freezed == realEstateSQT
          ? _value.realEstateSQT
          : realEstateSQT // ignore: cast_nullable_to_non_nullable
              as double?,
      realEstateValue: freezed == realEstateValue
          ? _value.realEstateValue
          : realEstateValue // ignore: cast_nullable_to_non_nullable
              as double?,
      roi: freezed == roi
          ? _value.roi
          : roi // ignore: cast_nullable_to_non_nullable
              as double?,
      soldTo: freezed == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String?,
      unitNo: freezed == unitNo
          ? _value.unitNo
          : unitNo // ignore: cast_nullable_to_non_nullable
              as double?,
      unitStatus: freezed == unitStatus
          ? _value.unitStatus
          : unitStatus // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SellTransactionImpl implements _SellTransaction {
  const _$SellTransactionImpl(
      {this.areaCode = 0,
      this.issueDate = '',
      this.municipalityId = 0,
      this.priceMT = 0,
      this.priceSQ = 0,
      this.realEstateMT = 0,
      this.realEstateSQT = 0,
      this.realEstateValue = 0,
      this.roi = 0,
      this.soldTo = '',
      this.unitNo = 0,
      this.unitStatus = 0});

  factory _$SellTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SellTransactionImplFromJson(json);

  @override
  @JsonKey()
  final int? areaCode;
  @override
  @JsonKey()
  final String? issueDate;
  @override
  @JsonKey()
  final int? municipalityId;
  @override
  @JsonKey()
  final double? priceMT;
  @override
  @JsonKey()
  final double? priceSQ;
  @override
  @JsonKey()
  final double? realEstateMT;
  @override
  @JsonKey()
  final double? realEstateSQT;
  @override
  @JsonKey()
  final double? realEstateValue;
  @override
  @JsonKey()
  final double? roi;
  @override
  @JsonKey()
  final String? soldTo;
  @override
  @JsonKey()
  final double? unitNo;
  @override
  @JsonKey()
  final int? unitStatus;

  @override
  String toString() {
    return 'SellTransaction(areaCode: $areaCode, issueDate: $issueDate, municipalityId: $municipalityId, priceMT: $priceMT, priceSQ: $priceSQ, realEstateMT: $realEstateMT, realEstateSQT: $realEstateSQT, realEstateValue: $realEstateValue, roi: $roi, soldTo: $soldTo, unitNo: $unitNo, unitStatus: $unitStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellTransactionImpl &&
            (identical(other.areaCode, areaCode) ||
                other.areaCode == areaCode) &&
            (identical(other.issueDate, issueDate) ||
                other.issueDate == issueDate) &&
            (identical(other.municipalityId, municipalityId) ||
                other.municipalityId == municipalityId) &&
            (identical(other.priceMT, priceMT) || other.priceMT == priceMT) &&
            (identical(other.priceSQ, priceSQ) || other.priceSQ == priceSQ) &&
            (identical(other.realEstateMT, realEstateMT) ||
                other.realEstateMT == realEstateMT) &&
            (identical(other.realEstateSQT, realEstateSQT) ||
                other.realEstateSQT == realEstateSQT) &&
            (identical(other.realEstateValue, realEstateValue) ||
                other.realEstateValue == realEstateValue) &&
            (identical(other.roi, roi) || other.roi == roi) &&
            (identical(other.soldTo, soldTo) || other.soldTo == soldTo) &&
            (identical(other.unitNo, unitNo) || other.unitNo == unitNo) &&
            (identical(other.unitStatus, unitStatus) ||
                other.unitStatus == unitStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      areaCode,
      issueDate,
      municipalityId,
      priceMT,
      priceSQ,
      realEstateMT,
      realEstateSQT,
      realEstateValue,
      roi,
      soldTo,
      unitNo,
      unitStatus);

  /// Create a copy of SellTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SellTransactionImplCopyWith<_$SellTransactionImpl> get copyWith =>
      __$$SellTransactionImplCopyWithImpl<_$SellTransactionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SellTransactionImplToJson(
      this,
    );
  }
}

abstract class _SellTransaction implements SellTransaction {
  const factory _SellTransaction(
      {final int? areaCode,
      final String? issueDate,
      final int? municipalityId,
      final double? priceMT,
      final double? priceSQ,
      final double? realEstateMT,
      final double? realEstateSQT,
      final double? realEstateValue,
      final double? roi,
      final String? soldTo,
      final double? unitNo,
      final int? unitStatus}) = _$SellTransactionImpl;

  factory _SellTransaction.fromJson(Map<String, dynamic> json) =
      _$SellTransactionImpl.fromJson;

  @override
  int? get areaCode;
  @override
  String? get issueDate;
  @override
  int? get municipalityId;
  @override
  double? get priceMT;
  @override
  double? get priceSQ;
  @override
  double? get realEstateMT;
  @override
  double? get realEstateSQT;
  @override
  double? get realEstateValue;
  @override
  double? get roi;
  @override
  String? get soldTo;
  @override
  double? get unitNo;
  @override
  int? get unitStatus;

  /// Create a copy of SellTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SellTransactionImplCopyWith<_$SellTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SellTransactionResponse _$SellTransactionResponseFromJson(
    Map<String, dynamic> json) {
  return _SellResponse.fromJson(json);
}

/// @nodoc
mixin _$SellTransactionResponse {
  int get count => throw _privateConstructorUsedError;
  List<SellTransaction> get transactionList =>
      throw _privateConstructorUsedError;

  /// Serializes this SellTransactionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SellTransactionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SellTransactionResponseCopyWith<SellTransactionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellTransactionResponseCopyWith<$Res> {
  factory $SellTransactionResponseCopyWith(SellTransactionResponse value,
          $Res Function(SellTransactionResponse) then) =
      _$SellTransactionResponseCopyWithImpl<$Res, SellTransactionResponse>;
  @useResult
  $Res call({int count, List<SellTransaction> transactionList});
}

/// @nodoc
class _$SellTransactionResponseCopyWithImpl<$Res,
        $Val extends SellTransactionResponse>
    implements $SellTransactionResponseCopyWith<$Res> {
  _$SellTransactionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SellTransactionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? transactionList = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      transactionList: null == transactionList
          ? _value.transactionList
          : transactionList // ignore: cast_nullable_to_non_nullable
              as List<SellTransaction>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SellResponseImplCopyWith<$Res>
    implements $SellTransactionResponseCopyWith<$Res> {
  factory _$$SellResponseImplCopyWith(
          _$SellResponseImpl value, $Res Function(_$SellResponseImpl) then) =
      __$$SellResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, List<SellTransaction> transactionList});
}

/// @nodoc
class __$$SellResponseImplCopyWithImpl<$Res>
    extends _$SellTransactionResponseCopyWithImpl<$Res, _$SellResponseImpl>
    implements _$$SellResponseImplCopyWith<$Res> {
  __$$SellResponseImplCopyWithImpl(
      _$SellResponseImpl _value, $Res Function(_$SellResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SellTransactionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? transactionList = null,
  }) {
    return _then(_$SellResponseImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      transactionList: null == transactionList
          ? _value._transactionList
          : transactionList // ignore: cast_nullable_to_non_nullable
              as List<SellTransaction>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SellResponseImpl implements _SellResponse {
  const _$SellResponseImpl(
      {this.count = 0, final List<SellTransaction> transactionList = const []})
      : _transactionList = transactionList;

  factory _$SellResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SellResponseImplFromJson(json);

  @override
  @JsonKey()
  final int count;
  final List<SellTransaction> _transactionList;
  @override
  @JsonKey()
  List<SellTransaction> get transactionList {
    if (_transactionList is EqualUnmodifiableListView) return _transactionList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactionList);
  }

  @override
  String toString() {
    return 'SellTransactionResponse(count: $count, transactionList: $transactionList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellResponseImpl &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality()
                .equals(other._transactionList, _transactionList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, count,
      const DeepCollectionEquality().hash(_transactionList));

  /// Create a copy of SellTransactionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SellResponseImplCopyWith<_$SellResponseImpl> get copyWith =>
      __$$SellResponseImplCopyWithImpl<_$SellResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SellResponseImplToJson(
      this,
    );
  }
}

abstract class _SellResponse implements SellTransactionResponse {
  const factory _SellResponse(
      {final int count,
      final List<SellTransaction> transactionList}) = _$SellResponseImpl;

  factory _SellResponse.fromJson(Map<String, dynamic> json) =
      _$SellResponseImpl.fromJson;

  @override
  int get count;
  @override
  List<SellTransaction> get transactionList;

  /// Create a copy of SellTransactionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SellResponseImplCopyWith<_$SellResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
