// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_training_course_providers_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetTrainingCourseProvidersResponseModel
    _$GetTrainingCourseProvidersResponseModelFromJson(
        Map<String, dynamic> json) {
  return _GetTrainingCourseProvider.fromJson(json);
}

/// @nodoc
mixin _$GetTrainingCourseProvidersResponseModel {
  @JsonKey(name: "Code")
  int get code => throw _privateConstructorUsedError;
  @JsonKey(name: "Message")
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: "Result")
  bool get result => throw _privateConstructorUsedError;
  @JsonKey(name: "Data")
  TrainingCourseProviderData? get data => throw _privateConstructorUsedError;

  /// Serializes this GetTrainingCourseProvidersResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetTrainingCourseProvidersResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetTrainingCourseProvidersResponseModelCopyWith<
          GetTrainingCourseProvidersResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetTrainingCourseProvidersResponseModelCopyWith<$Res> {
  factory $GetTrainingCourseProvidersResponseModelCopyWith(
          GetTrainingCourseProvidersResponseModel value,
          $Res Function(GetTrainingCourseProvidersResponseModel) then) =
      _$GetTrainingCourseProvidersResponseModelCopyWithImpl<$Res,
          GetTrainingCourseProvidersResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "Code") int code,
      @JsonKey(name: "Message") String message,
      @JsonKey(name: "Result") bool result,
      @JsonKey(name: "Data") TrainingCourseProviderData? data});

  $TrainingCourseProviderDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$GetTrainingCourseProvidersResponseModelCopyWithImpl<$Res,
        $Val extends GetTrainingCourseProvidersResponseModel>
    implements $GetTrainingCourseProvidersResponseModelCopyWith<$Res> {
  _$GetTrainingCourseProvidersResponseModelCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetTrainingCourseProvidersResponseModel
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
              as TrainingCourseProviderData?,
    ) as $Val);
  }

  /// Create a copy of GetTrainingCourseProvidersResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TrainingCourseProviderDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $TrainingCourseProviderDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetTrainingCourseProviderImplCopyWith<$Res>
    implements $GetTrainingCourseProvidersResponseModelCopyWith<$Res> {
  factory _$$GetTrainingCourseProviderImplCopyWith(
          _$GetTrainingCourseProviderImpl value,
          $Res Function(_$GetTrainingCourseProviderImpl) then) =
      __$$GetTrainingCourseProviderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Code") int code,
      @JsonKey(name: "Message") String message,
      @JsonKey(name: "Result") bool result,
      @JsonKey(name: "Data") TrainingCourseProviderData? data});

  @override
  $TrainingCourseProviderDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$GetTrainingCourseProviderImplCopyWithImpl<$Res>
    extends _$GetTrainingCourseProvidersResponseModelCopyWithImpl<$Res,
        _$GetTrainingCourseProviderImpl>
    implements _$$GetTrainingCourseProviderImplCopyWith<$Res> {
  __$$GetTrainingCourseProviderImplCopyWithImpl(
      _$GetTrainingCourseProviderImpl _value,
      $Res Function(_$GetTrainingCourseProviderImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetTrainingCourseProvidersResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? result = null,
    Object? data = freezed,
  }) {
    return _then(_$GetTrainingCourseProviderImpl(
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
              as TrainingCourseProviderData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetTrainingCourseProviderImpl implements _GetTrainingCourseProvider {
  const _$GetTrainingCourseProviderImpl(
      {@JsonKey(name: "Code") this.code = 0,
      @JsonKey(name: "Message") this.message = '',
      @JsonKey(name: "Result") this.result = true,
      @JsonKey(name: "Data") this.data});

  factory _$GetTrainingCourseProviderImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetTrainingCourseProviderImplFromJson(json);

  @override
  @JsonKey(name: "Code")
  final int code;
  @override
  @JsonKey(name: "Message")
  final String message;
  @override
  @JsonKey(name: "Result")
  final bool result;
  @override
  @JsonKey(name: "Data")
  final TrainingCourseProviderData? data;

  @override
  String toString() {
    return 'GetTrainingCourseProvidersResponseModel(code: $code, message: $message, result: $result, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTrainingCourseProviderImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message, result, data);

  /// Create a copy of GetTrainingCourseProvidersResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTrainingCourseProviderImplCopyWith<_$GetTrainingCourseProviderImpl>
      get copyWith => __$$GetTrainingCourseProviderImplCopyWithImpl<
          _$GetTrainingCourseProviderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetTrainingCourseProviderImplToJson(
      this,
    );
  }
}

abstract class _GetTrainingCourseProvider
    implements GetTrainingCourseProvidersResponseModel {
  const factory _GetTrainingCourseProvider(
          {@JsonKey(name: "Code") final int code,
          @JsonKey(name: "Message") final String message,
          @JsonKey(name: "Result") final bool result,
          @JsonKey(name: "Data") final TrainingCourseProviderData? data}) =
      _$GetTrainingCourseProviderImpl;

  factory _GetTrainingCourseProvider.fromJson(Map<String, dynamic> json) =
      _$GetTrainingCourseProviderImpl.fromJson;

  @override
  @JsonKey(name: "Code")
  int get code;
  @override
  @JsonKey(name: "Message")
  String get message;
  @override
  @JsonKey(name: "Result")
  bool get result;
  @override
  @JsonKey(name: "Data")
  TrainingCourseProviderData? get data;

  /// Create a copy of GetTrainingCourseProvidersResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetTrainingCourseProviderImplCopyWith<_$GetTrainingCourseProviderImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TrainingCourseProviderData _$TrainingCourseProviderDataFromJson(
    Map<String, dynamic> json) {
  return _TrainingCourseProviderData.fromJson(json);
}

/// @nodoc
mixin _$TrainingCourseProviderData {
  @JsonKey(name: "TrainingCourseProviders")
  List<TrainingCourseProvider> get providers =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "Pager")
  Pager get pager => throw _privateConstructorUsedError;

  /// Serializes this TrainingCourseProviderData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrainingCourseProviderData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrainingCourseProviderDataCopyWith<TrainingCourseProviderData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainingCourseProviderDataCopyWith<$Res> {
  factory $TrainingCourseProviderDataCopyWith(TrainingCourseProviderData value,
          $Res Function(TrainingCourseProviderData) then) =
      _$TrainingCourseProviderDataCopyWithImpl<$Res,
          TrainingCourseProviderData>;
  @useResult
  $Res call(
      {@JsonKey(name: "TrainingCourseProviders")
      List<TrainingCourseProvider> providers,
      @JsonKey(name: "Pager") Pager pager});

  $PagerCopyWith<$Res> get pager;
}

/// @nodoc
class _$TrainingCourseProviderDataCopyWithImpl<$Res,
        $Val extends TrainingCourseProviderData>
    implements $TrainingCourseProviderDataCopyWith<$Res> {
  _$TrainingCourseProviderDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrainingCourseProviderData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? providers = null,
    Object? pager = null,
  }) {
    return _then(_value.copyWith(
      providers: null == providers
          ? _value.providers
          : providers // ignore: cast_nullable_to_non_nullable
              as List<TrainingCourseProvider>,
      pager: null == pager
          ? _value.pager
          : pager // ignore: cast_nullable_to_non_nullable
              as Pager,
    ) as $Val);
  }

  /// Create a copy of TrainingCourseProviderData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PagerCopyWith<$Res> get pager {
    return $PagerCopyWith<$Res>(_value.pager, (value) {
      return _then(_value.copyWith(pager: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TrainingCourseProviderDataImplCopyWith<$Res>
    implements $TrainingCourseProviderDataCopyWith<$Res> {
  factory _$$TrainingCourseProviderDataImplCopyWith(
          _$TrainingCourseProviderDataImpl value,
          $Res Function(_$TrainingCourseProviderDataImpl) then) =
      __$$TrainingCourseProviderDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "TrainingCourseProviders")
      List<TrainingCourseProvider> providers,
      @JsonKey(name: "Pager") Pager pager});

  @override
  $PagerCopyWith<$Res> get pager;
}

/// @nodoc
class __$$TrainingCourseProviderDataImplCopyWithImpl<$Res>
    extends _$TrainingCourseProviderDataCopyWithImpl<$Res,
        _$TrainingCourseProviderDataImpl>
    implements _$$TrainingCourseProviderDataImplCopyWith<$Res> {
  __$$TrainingCourseProviderDataImplCopyWithImpl(
      _$TrainingCourseProviderDataImpl _value,
      $Res Function(_$TrainingCourseProviderDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrainingCourseProviderData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? providers = null,
    Object? pager = null,
  }) {
    return _then(_$TrainingCourseProviderDataImpl(
      providers: null == providers
          ? _value._providers
          : providers // ignore: cast_nullable_to_non_nullable
              as List<TrainingCourseProvider>,
      pager: null == pager
          ? _value.pager
          : pager // ignore: cast_nullable_to_non_nullable
              as Pager,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrainingCourseProviderDataImpl implements _TrainingCourseProviderData {
  const _$TrainingCourseProviderDataImpl(
      {@JsonKey(name: "TrainingCourseProviders")
      final List<TrainingCourseProvider> providers = const [],
      @JsonKey(name: "Pager") required this.pager})
      : _providers = providers;

  factory _$TrainingCourseProviderDataImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TrainingCourseProviderDataImplFromJson(json);

  final List<TrainingCourseProvider> _providers;
  @override
  @JsonKey(name: "TrainingCourseProviders")
  List<TrainingCourseProvider> get providers {
    if (_providers is EqualUnmodifiableListView) return _providers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_providers);
  }

  @override
  @JsonKey(name: "Pager")
  final Pager pager;

  @override
  String toString() {
    return 'TrainingCourseProviderData(providers: $providers, pager: $pager)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrainingCourseProviderDataImpl &&
            const DeepCollectionEquality()
                .equals(other._providers, _providers) &&
            (identical(other.pager, pager) || other.pager == pager));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_providers), pager);

  /// Create a copy of TrainingCourseProviderData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrainingCourseProviderDataImplCopyWith<_$TrainingCourseProviderDataImpl>
      get copyWith => __$$TrainingCourseProviderDataImplCopyWithImpl<
          _$TrainingCourseProviderDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrainingCourseProviderDataImplToJson(
      this,
    );
  }
}

abstract class _TrainingCourseProviderData
    implements TrainingCourseProviderData {
  const factory _TrainingCourseProviderData(
          {@JsonKey(name: "TrainingCourseProviders")
          final List<TrainingCourseProvider> providers,
          @JsonKey(name: "Pager") required final Pager pager}) =
      _$TrainingCourseProviderDataImpl;

  factory _TrainingCourseProviderData.fromJson(Map<String, dynamic> json) =
      _$TrainingCourseProviderDataImpl.fromJson;

  @override
  @JsonKey(name: "TrainingCourseProviders")
  List<TrainingCourseProvider> get providers;
  @override
  @JsonKey(name: "Pager")
  Pager get pager;

  /// Create a copy of TrainingCourseProviderData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrainingCourseProviderDataImplCopyWith<_$TrainingCourseProviderDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TrainingCourseProvider _$TrainingCourseProviderFromJson(
    Map<String, dynamic> json) {
  return _TrainingCourseProvider.fromJson(json);
}

/// @nodoc
mixin _$TrainingCourseProvider {
  @JsonKey(name: "IsActive")
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: "CanDeleted")
  bool get canDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: "Id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "Translations")
  List<Translation> get translations => throw _privateConstructorUsedError;

  /// Serializes this TrainingCourseProvider to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrainingCourseProvider
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrainingCourseProviderCopyWith<TrainingCourseProvider> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainingCourseProviderCopyWith<$Res> {
  factory $TrainingCourseProviderCopyWith(TrainingCourseProvider value,
          $Res Function(TrainingCourseProvider) then) =
      _$TrainingCourseProviderCopyWithImpl<$Res, TrainingCourseProvider>;
  @useResult
  $Res call(
      {@JsonKey(name: "IsActive") bool isActive,
      @JsonKey(name: "CanDeleted") bool canDeleted,
      @JsonKey(name: "Id") int id,
      @JsonKey(name: "Translations") List<Translation> translations});
}

/// @nodoc
class _$TrainingCourseProviderCopyWithImpl<$Res,
        $Val extends TrainingCourseProvider>
    implements $TrainingCourseProviderCopyWith<$Res> {
  _$TrainingCourseProviderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrainingCourseProvider
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isActive = null,
    Object? canDeleted = null,
    Object? id = null,
    Object? translations = null,
  }) {
    return _then(_value.copyWith(
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      canDeleted: null == canDeleted
          ? _value.canDeleted
          : canDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      translations: null == translations
          ? _value.translations
          : translations // ignore: cast_nullable_to_non_nullable
              as List<Translation>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrainingCourseProviderImplCopyWith<$Res>
    implements $TrainingCourseProviderCopyWith<$Res> {
  factory _$$TrainingCourseProviderImplCopyWith(
          _$TrainingCourseProviderImpl value,
          $Res Function(_$TrainingCourseProviderImpl) then) =
      __$$TrainingCourseProviderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "IsActive") bool isActive,
      @JsonKey(name: "CanDeleted") bool canDeleted,
      @JsonKey(name: "Id") int id,
      @JsonKey(name: "Translations") List<Translation> translations});
}

/// @nodoc
class __$$TrainingCourseProviderImplCopyWithImpl<$Res>
    extends _$TrainingCourseProviderCopyWithImpl<$Res,
        _$TrainingCourseProviderImpl>
    implements _$$TrainingCourseProviderImplCopyWith<$Res> {
  __$$TrainingCourseProviderImplCopyWithImpl(
      _$TrainingCourseProviderImpl _value,
      $Res Function(_$TrainingCourseProviderImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrainingCourseProvider
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isActive = null,
    Object? canDeleted = null,
    Object? id = null,
    Object? translations = null,
  }) {
    return _then(_$TrainingCourseProviderImpl(
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      canDeleted: null == canDeleted
          ? _value.canDeleted
          : canDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      translations: null == translations
          ? _value._translations
          : translations // ignore: cast_nullable_to_non_nullable
              as List<Translation>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrainingCourseProviderImpl implements _TrainingCourseProvider {
  const _$TrainingCourseProviderImpl(
      {@JsonKey(name: "IsActive") required this.isActive,
      @JsonKey(name: "CanDeleted") required this.canDeleted,
      @JsonKey(name: "Id") required this.id,
      @JsonKey(name: "Translations")
      final List<Translation> translations = const []})
      : _translations = translations;

  factory _$TrainingCourseProviderImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrainingCourseProviderImplFromJson(json);

  @override
  @JsonKey(name: "IsActive")
  final bool isActive;
  @override
  @JsonKey(name: "CanDeleted")
  final bool canDeleted;
  @override
  @JsonKey(name: "Id")
  final int id;
  final List<Translation> _translations;
  @override
  @JsonKey(name: "Translations")
  List<Translation> get translations {
    if (_translations is EqualUnmodifiableListView) return _translations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_translations);
  }

  @override
  String toString() {
    return 'TrainingCourseProvider(isActive: $isActive, canDeleted: $canDeleted, id: $id, translations: $translations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrainingCourseProviderImpl &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.canDeleted, canDeleted) ||
                other.canDeleted == canDeleted) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._translations, _translations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isActive, canDeleted, id,
      const DeepCollectionEquality().hash(_translations));

  /// Create a copy of TrainingCourseProvider
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrainingCourseProviderImplCopyWith<_$TrainingCourseProviderImpl>
      get copyWith => __$$TrainingCourseProviderImplCopyWithImpl<
          _$TrainingCourseProviderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrainingCourseProviderImplToJson(
      this,
    );
  }
}

abstract class _TrainingCourseProvider implements TrainingCourseProvider {
  const factory _TrainingCourseProvider(
      {@JsonKey(name: "IsActive") required final bool isActive,
      @JsonKey(name: "CanDeleted") required final bool canDeleted,
      @JsonKey(name: "Id") required final int id,
      @JsonKey(name: "Translations")
      final List<Translation> translations}) = _$TrainingCourseProviderImpl;

  factory _TrainingCourseProvider.fromJson(Map<String, dynamic> json) =
      _$TrainingCourseProviderImpl.fromJson;

  @override
  @JsonKey(name: "IsActive")
  bool get isActive;
  @override
  @JsonKey(name: "CanDeleted")
  bool get canDeleted;
  @override
  @JsonKey(name: "Id")
  int get id;
  @override
  @JsonKey(name: "Translations")
  List<Translation> get translations;

  /// Create a copy of TrainingCourseProvider
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrainingCourseProviderImplCopyWith<_$TrainingCourseProviderImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Translation _$TranslationFromJson(Map<String, dynamic> json) {
  return _Translation.fromJson(json);
}

/// @nodoc
mixin _$Translation {
  @JsonKey(name: "LanguageId")
  int get languageId => throw _privateConstructorUsedError;
  @JsonKey(name: "Name")
  String get name => throw _privateConstructorUsedError;

  /// Serializes this Translation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Translation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TranslationCopyWith<Translation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranslationCopyWith<$Res> {
  factory $TranslationCopyWith(
          Translation value, $Res Function(Translation) then) =
      _$TranslationCopyWithImpl<$Res, Translation>;
  @useResult
  $Res call(
      {@JsonKey(name: "LanguageId") int languageId,
      @JsonKey(name: "Name") String name});
}

/// @nodoc
class _$TranslationCopyWithImpl<$Res, $Val extends Translation>
    implements $TranslationCopyWith<$Res> {
  _$TranslationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Translation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageId = null,
    Object? name = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TranslationImplCopyWith<$Res>
    implements $TranslationCopyWith<$Res> {
  factory _$$TranslationImplCopyWith(
          _$TranslationImpl value, $Res Function(_$TranslationImpl) then) =
      __$$TranslationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "LanguageId") int languageId,
      @JsonKey(name: "Name") String name});
}

/// @nodoc
class __$$TranslationImplCopyWithImpl<$Res>
    extends _$TranslationCopyWithImpl<$Res, _$TranslationImpl>
    implements _$$TranslationImplCopyWith<$Res> {
  __$$TranslationImplCopyWithImpl(
      _$TranslationImpl _value, $Res Function(_$TranslationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Translation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageId = null,
    Object? name = null,
  }) {
    return _then(_$TranslationImpl(
      languageId: null == languageId
          ? _value.languageId
          : languageId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TranslationImpl implements _Translation {
  const _$TranslationImpl(
      {@JsonKey(name: "LanguageId") required this.languageId,
      @JsonKey(name: "Name") required this.name});

  factory _$TranslationImpl.fromJson(Map<String, dynamic> json) =>
      _$$TranslationImplFromJson(json);

  @override
  @JsonKey(name: "LanguageId")
  final int languageId;
  @override
  @JsonKey(name: "Name")
  final String name;

  @override
  String toString() {
    return 'Translation(languageId: $languageId, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranslationImpl &&
            (identical(other.languageId, languageId) ||
                other.languageId == languageId) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, languageId, name);

  /// Create a copy of Translation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranslationImplCopyWith<_$TranslationImpl> get copyWith =>
      __$$TranslationImplCopyWithImpl<_$TranslationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TranslationImplToJson(
      this,
    );
  }
}

abstract class _Translation implements Translation {
  const factory _Translation(
      {@JsonKey(name: "LanguageId") required final int languageId,
      @JsonKey(name: "Name") required final String name}) = _$TranslationImpl;

  factory _Translation.fromJson(Map<String, dynamic> json) =
      _$TranslationImpl.fromJson;

  @override
  @JsonKey(name: "LanguageId")
  int get languageId;
  @override
  @JsonKey(name: "Name")
  String get name;

  /// Create a copy of Translation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranslationImplCopyWith<_$TranslationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Pager _$PagerFromJson(Map<String, dynamic> json) {
  return _Pager.fromJson(json);
}

/// @nodoc
mixin _$Pager {
  @JsonKey(name: "PageIndex")
  int get pageIndex => throw _privateConstructorUsedError;
  @JsonKey(name: "PageSize")
  int get pageSize => throw _privateConstructorUsedError;
  @JsonKey(name: "TotalCount")
  int get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: "TotalPages")
  int get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: "HasPreviousPage")
  bool get hasPreviousPage => throw _privateConstructorUsedError;
  @JsonKey(name: "HasNextPage")
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
      {@JsonKey(name: "PageIndex") int pageIndex,
      @JsonKey(name: "PageSize") int pageSize,
      @JsonKey(name: "TotalCount") int totalCount,
      @JsonKey(name: "TotalPages") int totalPages,
      @JsonKey(name: "HasPreviousPage") bool hasPreviousPage,
      @JsonKey(name: "HasNextPage") bool hasNextPage});
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
      {@JsonKey(name: "PageIndex") int pageIndex,
      @JsonKey(name: "PageSize") int pageSize,
      @JsonKey(name: "TotalCount") int totalCount,
      @JsonKey(name: "TotalPages") int totalPages,
      @JsonKey(name: "HasPreviousPage") bool hasPreviousPage,
      @JsonKey(name: "HasNextPage") bool hasNextPage});
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
      {@JsonKey(name: "PageIndex") required this.pageIndex,
      @JsonKey(name: "PageSize") required this.pageSize,
      @JsonKey(name: "TotalCount") required this.totalCount,
      @JsonKey(name: "TotalPages") required this.totalPages,
      @JsonKey(name: "HasPreviousPage") required this.hasPreviousPage,
      @JsonKey(name: "HasNextPage") required this.hasNextPage});

  factory _$PagerImpl.fromJson(Map<String, dynamic> json) =>
      _$$PagerImplFromJson(json);

  @override
  @JsonKey(name: "PageIndex")
  final int pageIndex;
  @override
  @JsonKey(name: "PageSize")
  final int pageSize;
  @override
  @JsonKey(name: "TotalCount")
  final int totalCount;
  @override
  @JsonKey(name: "TotalPages")
  final int totalPages;
  @override
  @JsonKey(name: "HasPreviousPage")
  final bool hasPreviousPage;
  @override
  @JsonKey(name: "HasNextPage")
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
          {@JsonKey(name: "PageIndex") required final int pageIndex,
          @JsonKey(name: "PageSize") required final int pageSize,
          @JsonKey(name: "TotalCount") required final int totalCount,
          @JsonKey(name: "TotalPages") required final int totalPages,
          @JsonKey(name: "HasPreviousPage") required final bool hasPreviousPage,
          @JsonKey(name: "HasNextPage") required final bool hasNextPage}) =
      _$PagerImpl;

  factory _Pager.fromJson(Map<String, dynamic> json) = _$PagerImpl.fromJson;

  @override
  @JsonKey(name: "PageIndex")
  int get pageIndex;
  @override
  @JsonKey(name: "PageSize")
  int get pageSize;
  @override
  @JsonKey(name: "TotalCount")
  int get totalCount;
  @override
  @JsonKey(name: "TotalPages")
  int get totalPages;
  @override
  @JsonKey(name: "HasPreviousPage")
  bool get hasPreviousPage;
  @override
  @JsonKey(name: "HasNextPage")
  bool get hasNextPage;

  /// Create a copy of Pager
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PagerImplCopyWith<_$PagerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
