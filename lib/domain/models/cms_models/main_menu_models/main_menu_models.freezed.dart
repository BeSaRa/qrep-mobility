// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_menu_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MainMenuResponse _$MainMenuResponseFromJson(Map<String, dynamic> json) {
  return _MainMenuResponse.fromJson(json);
}

/// @nodoc
mixin _$MainMenuResponse {
  @JsonKey(name: "main_menu")
  MainMenuModel get mainMenu => throw _privateConstructorUsedError;

  /// Serializes this MainMenuResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MainMenuResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MainMenuResponseCopyWith<MainMenuResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainMenuResponseCopyWith<$Res> {
  factory $MainMenuResponseCopyWith(
          MainMenuResponse value, $Res Function(MainMenuResponse) then) =
      _$MainMenuResponseCopyWithImpl<$Res, MainMenuResponse>;
  @useResult
  $Res call({@JsonKey(name: "main_menu") MainMenuModel mainMenu});

  $MainMenuModelCopyWith<$Res> get mainMenu;
}

/// @nodoc
class _$MainMenuResponseCopyWithImpl<$Res, $Val extends MainMenuResponse>
    implements $MainMenuResponseCopyWith<$Res> {
  _$MainMenuResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainMenuResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainMenu = null,
  }) {
    return _then(_value.copyWith(
      mainMenu: null == mainMenu
          ? _value.mainMenu
          : mainMenu // ignore: cast_nullable_to_non_nullable
              as MainMenuModel,
    ) as $Val);
  }

  /// Create a copy of MainMenuResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MainMenuModelCopyWith<$Res> get mainMenu {
    return $MainMenuModelCopyWith<$Res>(_value.mainMenu, (value) {
      return _then(_value.copyWith(mainMenu: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MainMenuResponseImplCopyWith<$Res>
    implements $MainMenuResponseCopyWith<$Res> {
  factory _$$MainMenuResponseImplCopyWith(_$MainMenuResponseImpl value,
          $Res Function(_$MainMenuResponseImpl) then) =
      __$$MainMenuResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "main_menu") MainMenuModel mainMenu});

  @override
  $MainMenuModelCopyWith<$Res> get mainMenu;
}

/// @nodoc
class __$$MainMenuResponseImplCopyWithImpl<$Res>
    extends _$MainMenuResponseCopyWithImpl<$Res, _$MainMenuResponseImpl>
    implements _$$MainMenuResponseImplCopyWith<$Res> {
  __$$MainMenuResponseImplCopyWithImpl(_$MainMenuResponseImpl _value,
      $Res Function(_$MainMenuResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainMenuResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainMenu = null,
  }) {
    return _then(_$MainMenuResponseImpl(
      mainMenu: null == mainMenu
          ? _value.mainMenu
          : mainMenu // ignore: cast_nullable_to_non_nullable
              as MainMenuModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MainMenuResponseImpl implements _MainMenuResponse {
  _$MainMenuResponseImpl(
      {@JsonKey(name: "main_menu") this.mainMenu = const MainMenuModel()});

  factory _$MainMenuResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MainMenuResponseImplFromJson(json);

  @override
  @JsonKey(name: "main_menu")
  final MainMenuModel mainMenu;

  @override
  String toString() {
    return 'MainMenuResponse(mainMenu: $mainMenu)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainMenuResponseImpl &&
            (identical(other.mainMenu, mainMenu) ||
                other.mainMenu == mainMenu));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mainMenu);

  /// Create a copy of MainMenuResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MainMenuResponseImplCopyWith<_$MainMenuResponseImpl> get copyWith =>
      __$$MainMenuResponseImplCopyWithImpl<_$MainMenuResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MainMenuResponseImplToJson(
      this,
    );
  }
}

abstract class _MainMenuResponse implements MainMenuResponse {
  factory _MainMenuResponse(
          {@JsonKey(name: "main_menu") final MainMenuModel mainMenu}) =
      _$MainMenuResponseImpl;

  factory _MainMenuResponse.fromJson(Map<String, dynamic> json) =
      _$MainMenuResponseImpl.fromJson;

  @override
  @JsonKey(name: "main_menu")
  MainMenuModel get mainMenu;

  /// Create a copy of MainMenuResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MainMenuResponseImplCopyWith<_$MainMenuResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MainMenuModel _$MainMenuModelFromJson(Map<String, dynamic> json) {
  return _MainMenuModel.fromJson(json);
}

/// @nodoc
mixin _$MainMenuModel {
  List<LinkModel> get links => throw _privateConstructorUsedError;

  /// Serializes this MainMenuModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MainMenuModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MainMenuModelCopyWith<MainMenuModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainMenuModelCopyWith<$Res> {
  factory $MainMenuModelCopyWith(
          MainMenuModel value, $Res Function(MainMenuModel) then) =
      _$MainMenuModelCopyWithImpl<$Res, MainMenuModel>;
  @useResult
  $Res call({List<LinkModel> links});
}

/// @nodoc
class _$MainMenuModelCopyWithImpl<$Res, $Val extends MainMenuModel>
    implements $MainMenuModelCopyWith<$Res> {
  _$MainMenuModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainMenuModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? links = null,
  }) {
    return _then(_value.copyWith(
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<LinkModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainMenuModelImplCopyWith<$Res>
    implements $MainMenuModelCopyWith<$Res> {
  factory _$$MainMenuModelImplCopyWith(
          _$MainMenuModelImpl value, $Res Function(_$MainMenuModelImpl) then) =
      __$$MainMenuModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LinkModel> links});
}

/// @nodoc
class __$$MainMenuModelImplCopyWithImpl<$Res>
    extends _$MainMenuModelCopyWithImpl<$Res, _$MainMenuModelImpl>
    implements _$$MainMenuModelImplCopyWith<$Res> {
  __$$MainMenuModelImplCopyWithImpl(
      _$MainMenuModelImpl _value, $Res Function(_$MainMenuModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainMenuModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? links = null,
  }) {
    return _then(_$MainMenuModelImpl(
      links: null == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<LinkModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MainMenuModelImpl implements _MainMenuModel {
  const _$MainMenuModelImpl({final List<LinkModel> links = const []})
      : _links = links;

  factory _$MainMenuModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MainMenuModelImplFromJson(json);

  final List<LinkModel> _links;
  @override
  @JsonKey()
  List<LinkModel> get links {
    if (_links is EqualUnmodifiableListView) return _links;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_links);
  }

  @override
  String toString() {
    return 'MainMenuModel(links: $links)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainMenuModelImpl &&
            const DeepCollectionEquality().equals(other._links, _links));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_links));

  /// Create a copy of MainMenuModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MainMenuModelImplCopyWith<_$MainMenuModelImpl> get copyWith =>
      __$$MainMenuModelImplCopyWithImpl<_$MainMenuModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MainMenuModelImplToJson(
      this,
    );
  }
}

abstract class _MainMenuModel implements MainMenuModel {
  const factory _MainMenuModel({final List<LinkModel> links}) =
      _$MainMenuModelImpl;

  factory _MainMenuModel.fromJson(Map<String, dynamic> json) =
      _$MainMenuModelImpl.fromJson;

  @override
  List<LinkModel> get links;

  /// Create a copy of MainMenuModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MainMenuModelImplCopyWith<_$MainMenuModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LinkModel _$LinkModelFromJson(Map<String, dynamic> json) {
  return _LinkModel.fromJson(json);
}

/// @nodoc
mixin _$LinkModel {
  int get id => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: "datasource_message_id")
  DataSourceMessageModel get dataSourceMessage =>
      throw _privateConstructorUsedError;

  /// Serializes this LinkModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LinkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LinkModelCopyWith<LinkModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinkModelCopyWith<$Res> {
  factory $LinkModelCopyWith(LinkModel value, $Res Function(LinkModel) then) =
      _$LinkModelCopyWithImpl<$Res, LinkModel>;
  @useResult
  $Res call(
      {int id,
      String url,
      @JsonKey(name: "datasource_message_id")
      DataSourceMessageModel dataSourceMessage});

  $DataSourceMessageModelCopyWith<$Res> get dataSourceMessage;
}

/// @nodoc
class _$LinkModelCopyWithImpl<$Res, $Val extends LinkModel>
    implements $LinkModelCopyWith<$Res> {
  _$LinkModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LinkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? dataSourceMessage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      dataSourceMessage: null == dataSourceMessage
          ? _value.dataSourceMessage
          : dataSourceMessage // ignore: cast_nullable_to_non_nullable
              as DataSourceMessageModel,
    ) as $Val);
  }

  /// Create a copy of LinkModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataSourceMessageModelCopyWith<$Res> get dataSourceMessage {
    return $DataSourceMessageModelCopyWith<$Res>(_value.dataSourceMessage,
        (value) {
      return _then(_value.copyWith(dataSourceMessage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LinkModelImplCopyWith<$Res>
    implements $LinkModelCopyWith<$Res> {
  factory _$$LinkModelImplCopyWith(
          _$LinkModelImpl value, $Res Function(_$LinkModelImpl) then) =
      __$$LinkModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String url,
      @JsonKey(name: "datasource_message_id")
      DataSourceMessageModel dataSourceMessage});

  @override
  $DataSourceMessageModelCopyWith<$Res> get dataSourceMessage;
}

/// @nodoc
class __$$LinkModelImplCopyWithImpl<$Res>
    extends _$LinkModelCopyWithImpl<$Res, _$LinkModelImpl>
    implements _$$LinkModelImplCopyWith<$Res> {
  __$$LinkModelImplCopyWithImpl(
      _$LinkModelImpl _value, $Res Function(_$LinkModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LinkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? dataSourceMessage = null,
  }) {
    return _then(_$LinkModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      dataSourceMessage: null == dataSourceMessage
          ? _value.dataSourceMessage
          : dataSourceMessage // ignore: cast_nullable_to_non_nullable
              as DataSourceMessageModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LinkModelImpl implements _LinkModel {
  const _$LinkModelImpl(
      {this.id = 0,
      this.url = "",
      @JsonKey(name: "datasource_message_id")
      this.dataSourceMessage = const DataSourceMessageModel()});

  factory _$LinkModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LinkModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String url;
  @override
  @JsonKey(name: "datasource_message_id")
  final DataSourceMessageModel dataSourceMessage;

  @override
  String toString() {
    return 'LinkModel(id: $id, url: $url, dataSourceMessage: $dataSourceMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LinkModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.dataSourceMessage, dataSourceMessage) ||
                other.dataSourceMessage == dataSourceMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, url, dataSourceMessage);

  /// Create a copy of LinkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LinkModelImplCopyWith<_$LinkModelImpl> get copyWith =>
      __$$LinkModelImplCopyWithImpl<_$LinkModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LinkModelImplToJson(
      this,
    );
  }
}

abstract class _LinkModel implements LinkModel {
  const factory _LinkModel(
      {final int id,
      final String url,
      @JsonKey(name: "datasource_message_id")
      final DataSourceMessageModel dataSourceMessage}) = _$LinkModelImpl;

  factory _LinkModel.fromJson(Map<String, dynamic> json) =
      _$LinkModelImpl.fromJson;

  @override
  int get id;
  @override
  String get url;
  @override
  @JsonKey(name: "datasource_message_id")
  DataSourceMessageModel get dataSourceMessage;

  /// Create a copy of LinkModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LinkModelImplCopyWith<_$LinkModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataSourceMessageModel _$DataSourceMessageModelFromJson(
    Map<String, dynamic> json) {
  return _DataSourceMessageModel.fromJson(json);
}

/// @nodoc
mixin _$DataSourceMessageModel {
  int get id => throw _privateConstructorUsedError;
  String get arMessage => throw _privateConstructorUsedError;
  String get enMessage => throw _privateConstructorUsedError;

  /// Serializes this DataSourceMessageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DataSourceMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataSourceMessageModelCopyWith<DataSourceMessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataSourceMessageModelCopyWith<$Res> {
  factory $DataSourceMessageModelCopyWith(DataSourceMessageModel value,
          $Res Function(DataSourceMessageModel) then) =
      _$DataSourceMessageModelCopyWithImpl<$Res, DataSourceMessageModel>;
  @useResult
  $Res call({int id, String arMessage, String enMessage});
}

/// @nodoc
class _$DataSourceMessageModelCopyWithImpl<$Res,
        $Val extends DataSourceMessageModel>
    implements $DataSourceMessageModelCopyWith<$Res> {
  _$DataSourceMessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataSourceMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? arMessage = null,
    Object? enMessage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      arMessage: null == arMessage
          ? _value.arMessage
          : arMessage // ignore: cast_nullable_to_non_nullable
              as String,
      enMessage: null == enMessage
          ? _value.enMessage
          : enMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataSourceMessageModelImplCopyWith<$Res>
    implements $DataSourceMessageModelCopyWith<$Res> {
  factory _$$DataSourceMessageModelImplCopyWith(
          _$DataSourceMessageModelImpl value,
          $Res Function(_$DataSourceMessageModelImpl) then) =
      __$$DataSourceMessageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String arMessage, String enMessage});
}

/// @nodoc
class __$$DataSourceMessageModelImplCopyWithImpl<$Res>
    extends _$DataSourceMessageModelCopyWithImpl<$Res,
        _$DataSourceMessageModelImpl>
    implements _$$DataSourceMessageModelImplCopyWith<$Res> {
  __$$DataSourceMessageModelImplCopyWithImpl(
      _$DataSourceMessageModelImpl _value,
      $Res Function(_$DataSourceMessageModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataSourceMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? arMessage = null,
    Object? enMessage = null,
  }) {
    return _then(_$DataSourceMessageModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      arMessage: null == arMessage
          ? _value.arMessage
          : arMessage // ignore: cast_nullable_to_non_nullable
              as String,
      enMessage: null == enMessage
          ? _value.enMessage
          : enMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataSourceMessageModelImpl implements _DataSourceMessageModel {
  const _$DataSourceMessageModelImpl(
      {this.id = 0, this.arMessage = "", this.enMessage = ""});

  factory _$DataSourceMessageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataSourceMessageModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String arMessage;
  @override
  @JsonKey()
  final String enMessage;

  @override
  String toString() {
    return 'DataSourceMessageModel(id: $id, arMessage: $arMessage, enMessage: $enMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataSourceMessageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.arMessage, arMessage) ||
                other.arMessage == arMessage) &&
            (identical(other.enMessage, enMessage) ||
                other.enMessage == enMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, arMessage, enMessage);

  /// Create a copy of DataSourceMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataSourceMessageModelImplCopyWith<_$DataSourceMessageModelImpl>
      get copyWith => __$$DataSourceMessageModelImplCopyWithImpl<
          _$DataSourceMessageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataSourceMessageModelImplToJson(
      this,
    );
  }
}

abstract class _DataSourceMessageModel implements DataSourceMessageModel {
  const factory _DataSourceMessageModel(
      {final int id,
      final String arMessage,
      final String enMessage}) = _$DataSourceMessageModelImpl;

  factory _DataSourceMessageModel.fromJson(Map<String, dynamic> json) =
      _$DataSourceMessageModelImpl.fromJson;

  @override
  int get id;
  @override
  String get arMessage;
  @override
  String get enMessage;

  /// Create a copy of DataSourceMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataSourceMessageModelImplCopyWith<_$DataSourceMessageModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
