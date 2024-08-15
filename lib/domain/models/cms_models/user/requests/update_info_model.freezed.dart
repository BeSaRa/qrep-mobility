// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestUpdateInfoModel _$RequestUpdateInfoModelFromJson(
    Map<String, dynamic> json) {
  return _RequestUpdateInfoModel.fromJson(json);
}

/// @nodoc
mixin _$RequestUpdateInfoModel {
  @JsonKey(name: "first_name")
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "last_name")
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: "fcm_token")
  String? get fcmToken => throw _privateConstructorUsedError;
  @JsonKey(name: "email_notifications")
  bool? get emailNotifications => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestUpdateInfoModelCopyWith<RequestUpdateInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestUpdateInfoModelCopyWith<$Res> {
  factory $RequestUpdateInfoModelCopyWith(RequestUpdateInfoModel value,
          $Res Function(RequestUpdateInfoModel) then) =
      _$RequestUpdateInfoModelCopyWithImpl<$Res, RequestUpdateInfoModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: "fcm_token") String? fcmToken,
      @JsonKey(name: "email_notifications") bool? emailNotifications,
      @JsonKey(name: "title") String? title});
}

/// @nodoc
class _$RequestUpdateInfoModelCopyWithImpl<$Res,
        $Val extends RequestUpdateInfoModel>
    implements $RequestUpdateInfoModelCopyWith<$Res> {
  _$RequestUpdateInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? fcmToken = freezed,
    Object? emailNotifications = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      emailNotifications: freezed == emailNotifications
          ? _value.emailNotifications
          : emailNotifications // ignore: cast_nullable_to_non_nullable
              as bool?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestUpdateInfoModelImplCopyWith<$Res>
    implements $RequestUpdateInfoModelCopyWith<$Res> {
  factory _$$RequestUpdateInfoModelImplCopyWith(
          _$RequestUpdateInfoModelImpl value,
          $Res Function(_$RequestUpdateInfoModelImpl) then) =
      __$$RequestUpdateInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: "fcm_token") String? fcmToken,
      @JsonKey(name: "email_notifications") bool? emailNotifications,
      @JsonKey(name: "title") String? title});
}

/// @nodoc
class __$$RequestUpdateInfoModelImplCopyWithImpl<$Res>
    extends _$RequestUpdateInfoModelCopyWithImpl<$Res,
        _$RequestUpdateInfoModelImpl>
    implements _$$RequestUpdateInfoModelImplCopyWith<$Res> {
  __$$RequestUpdateInfoModelImplCopyWithImpl(
      _$RequestUpdateInfoModelImpl _value,
      $Res Function(_$RequestUpdateInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? fcmToken = freezed,
    Object? emailNotifications = freezed,
    Object? title = freezed,
  }) {
    return _then(_$RequestUpdateInfoModelImpl(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      emailNotifications: freezed == emailNotifications
          ? _value.emailNotifications
          : emailNotifications // ignore: cast_nullable_to_non_nullable
              as bool?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestUpdateInfoModelImpl implements _RequestUpdateInfoModel {
  _$RequestUpdateInfoModelImpl(
      {@JsonKey(name: "first_name") this.firstName,
      @JsonKey(name: "last_name") this.lastName,
      @JsonKey(name: "fcm_token") this.fcmToken,
      @JsonKey(name: "email_notifications") this.emailNotifications,
      @JsonKey(name: "title") this.title});

  factory _$RequestUpdateInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestUpdateInfoModelImplFromJson(json);

  @override
  @JsonKey(name: "first_name")
  final String? firstName;
  @override
  @JsonKey(name: "last_name")
  final String? lastName;
  @override
  @JsonKey(name: "fcm_token")
  final String? fcmToken;
  @override
  @JsonKey(name: "email_notifications")
  final bool? emailNotifications;
  @override
  @JsonKey(name: "title")
  final String? title;

  @override
  String toString() {
    return 'RequestUpdateInfoModel(firstName: $firstName, lastName: $lastName, fcmToken: $fcmToken, emailNotifications: $emailNotifications, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestUpdateInfoModelImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.emailNotifications, emailNotifications) ||
                other.emailNotifications == emailNotifications) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, firstName, lastName, fcmToken, emailNotifications, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestUpdateInfoModelImplCopyWith<_$RequestUpdateInfoModelImpl>
      get copyWith => __$$RequestUpdateInfoModelImplCopyWithImpl<
          _$RequestUpdateInfoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestUpdateInfoModelImplToJson(
      this,
    );
  }
}

abstract class _RequestUpdateInfoModel implements RequestUpdateInfoModel {
  factory _RequestUpdateInfoModel(
          {@JsonKey(name: "first_name") final String? firstName,
          @JsonKey(name: "last_name") final String? lastName,
          @JsonKey(name: "fcm_token") final String? fcmToken,
          @JsonKey(name: "email_notifications") final bool? emailNotifications,
          @JsonKey(name: "title") final String? title}) =
      _$RequestUpdateInfoModelImpl;

  factory _RequestUpdateInfoModel.fromJson(Map<String, dynamic> json) =
      _$RequestUpdateInfoModelImpl.fromJson;

  @override
  @JsonKey(name: "first_name")
  String? get firstName;
  @override
  @JsonKey(name: "last_name")
  String? get lastName;
  @override
  @JsonKey(name: "fcm_token")
  String? get fcmToken;
  @override
  @JsonKey(name: "email_notifications")
  bool? get emailNotifications;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(ignore: true)
  _$$RequestUpdateInfoModelImplCopyWith<_$RequestUpdateInfoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
