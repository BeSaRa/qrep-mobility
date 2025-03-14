// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUserInfo,
    required TResult Function(
            String id, RequestUpdateInfoModel requestUpdateInfo)
        updateUserInfo,
    required TResult Function() initialUser,
    required TResult Function() guestUser,
    required TResult Function(String useId) updateFcm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getUserInfo,
    TResult? Function(String id, RequestUpdateInfoModel requestUpdateInfo)?
        updateUserInfo,
    TResult? Function()? initialUser,
    TResult? Function()? guestUser,
    TResult? Function(String useId)? updateFcm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUserInfo,
    TResult Function(String id, RequestUpdateInfoModel requestUpdateInfo)?
        updateUserInfo,
    TResult Function()? initialUser,
    TResult Function()? guestUser,
    TResult Function(String useId)? updateFcm,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserInfoEvent value) getUserInfo,
    required TResult Function(_UpdateUserInfoEvent value) updateUserInfo,
    required TResult Function(_GetInitialUserEvent value) initialUser,
    required TResult Function(_GetGuestUserEvent value) guestUser,
    required TResult Function(_GetUpdateFcmEvent value) updateFcm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserInfoEvent value)? getUserInfo,
    TResult? Function(_UpdateUserInfoEvent value)? updateUserInfo,
    TResult? Function(_GetInitialUserEvent value)? initialUser,
    TResult? Function(_GetGuestUserEvent value)? guestUser,
    TResult? Function(_GetUpdateFcmEvent value)? updateFcm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserInfoEvent value)? getUserInfo,
    TResult Function(_UpdateUserInfoEvent value)? updateUserInfo,
    TResult Function(_GetInitialUserEvent value)? initialUser,
    TResult Function(_GetGuestUserEvent value)? guestUser,
    TResult Function(_GetUpdateFcmEvent value)? updateFcm,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res, UserEvent>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res, $Val extends UserEvent>
    implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetUserInfoEventImplCopyWith<$Res> {
  factory _$$GetUserInfoEventImplCopyWith(_$GetUserInfoEventImpl value,
          $Res Function(_$GetUserInfoEventImpl) then) =
      __$$GetUserInfoEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUserInfoEventImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$GetUserInfoEventImpl>
    implements _$$GetUserInfoEventImplCopyWith<$Res> {
  __$$GetUserInfoEventImplCopyWithImpl(_$GetUserInfoEventImpl _value,
      $Res Function(_$GetUserInfoEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetUserInfoEventImpl implements _GetUserInfoEvent {
  const _$GetUserInfoEventImpl();

  @override
  String toString() {
    return 'UserEvent.getUserInfo()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetUserInfoEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUserInfo,
    required TResult Function(
            String id, RequestUpdateInfoModel requestUpdateInfo)
        updateUserInfo,
    required TResult Function() initialUser,
    required TResult Function() guestUser,
    required TResult Function(String useId) updateFcm,
  }) {
    return getUserInfo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getUserInfo,
    TResult? Function(String id, RequestUpdateInfoModel requestUpdateInfo)?
        updateUserInfo,
    TResult? Function()? initialUser,
    TResult? Function()? guestUser,
    TResult? Function(String useId)? updateFcm,
  }) {
    return getUserInfo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUserInfo,
    TResult Function(String id, RequestUpdateInfoModel requestUpdateInfo)?
        updateUserInfo,
    TResult Function()? initialUser,
    TResult Function()? guestUser,
    TResult Function(String useId)? updateFcm,
    required TResult orElse(),
  }) {
    if (getUserInfo != null) {
      return getUserInfo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserInfoEvent value) getUserInfo,
    required TResult Function(_UpdateUserInfoEvent value) updateUserInfo,
    required TResult Function(_GetInitialUserEvent value) initialUser,
    required TResult Function(_GetGuestUserEvent value) guestUser,
    required TResult Function(_GetUpdateFcmEvent value) updateFcm,
  }) {
    return getUserInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserInfoEvent value)? getUserInfo,
    TResult? Function(_UpdateUserInfoEvent value)? updateUserInfo,
    TResult? Function(_GetInitialUserEvent value)? initialUser,
    TResult? Function(_GetGuestUserEvent value)? guestUser,
    TResult? Function(_GetUpdateFcmEvent value)? updateFcm,
  }) {
    return getUserInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserInfoEvent value)? getUserInfo,
    TResult Function(_UpdateUserInfoEvent value)? updateUserInfo,
    TResult Function(_GetInitialUserEvent value)? initialUser,
    TResult Function(_GetGuestUserEvent value)? guestUser,
    TResult Function(_GetUpdateFcmEvent value)? updateFcm,
    required TResult orElse(),
  }) {
    if (getUserInfo != null) {
      return getUserInfo(this);
    }
    return orElse();
  }
}

abstract class _GetUserInfoEvent implements UserEvent {
  const factory _GetUserInfoEvent() = _$GetUserInfoEventImpl;
}

/// @nodoc
abstract class _$$UpdateUserInfoEventImplCopyWith<$Res> {
  factory _$$UpdateUserInfoEventImplCopyWith(_$UpdateUserInfoEventImpl value,
          $Res Function(_$UpdateUserInfoEventImpl) then) =
      __$$UpdateUserInfoEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, RequestUpdateInfoModel requestUpdateInfo});

  $RequestUpdateInfoModelCopyWith<$Res> get requestUpdateInfo;
}

/// @nodoc
class __$$UpdateUserInfoEventImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UpdateUserInfoEventImpl>
    implements _$$UpdateUserInfoEventImplCopyWith<$Res> {
  __$$UpdateUserInfoEventImplCopyWithImpl(_$UpdateUserInfoEventImpl _value,
      $Res Function(_$UpdateUserInfoEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? requestUpdateInfo = null,
  }) {
    return _then(_$UpdateUserInfoEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      requestUpdateInfo: null == requestUpdateInfo
          ? _value.requestUpdateInfo
          : requestUpdateInfo // ignore: cast_nullable_to_non_nullable
              as RequestUpdateInfoModel,
    ));
  }

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RequestUpdateInfoModelCopyWith<$Res> get requestUpdateInfo {
    return $RequestUpdateInfoModelCopyWith<$Res>(_value.requestUpdateInfo,
        (value) {
      return _then(_value.copyWith(requestUpdateInfo: value));
    });
  }
}

/// @nodoc

class _$UpdateUserInfoEventImpl implements _UpdateUserInfoEvent {
  const _$UpdateUserInfoEventImpl(
      {required this.id, required this.requestUpdateInfo});

  @override
  final String id;
  @override
  final RequestUpdateInfoModel requestUpdateInfo;

  @override
  String toString() {
    return 'UserEvent.updateUserInfo(id: $id, requestUpdateInfo: $requestUpdateInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserInfoEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.requestUpdateInfo, requestUpdateInfo) ||
                other.requestUpdateInfo == requestUpdateInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, requestUpdateInfo);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserInfoEventImplCopyWith<_$UpdateUserInfoEventImpl> get copyWith =>
      __$$UpdateUserInfoEventImplCopyWithImpl<_$UpdateUserInfoEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUserInfo,
    required TResult Function(
            String id, RequestUpdateInfoModel requestUpdateInfo)
        updateUserInfo,
    required TResult Function() initialUser,
    required TResult Function() guestUser,
    required TResult Function(String useId) updateFcm,
  }) {
    return updateUserInfo(id, requestUpdateInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getUserInfo,
    TResult? Function(String id, RequestUpdateInfoModel requestUpdateInfo)?
        updateUserInfo,
    TResult? Function()? initialUser,
    TResult? Function()? guestUser,
    TResult? Function(String useId)? updateFcm,
  }) {
    return updateUserInfo?.call(id, requestUpdateInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUserInfo,
    TResult Function(String id, RequestUpdateInfoModel requestUpdateInfo)?
        updateUserInfo,
    TResult Function()? initialUser,
    TResult Function()? guestUser,
    TResult Function(String useId)? updateFcm,
    required TResult orElse(),
  }) {
    if (updateUserInfo != null) {
      return updateUserInfo(id, requestUpdateInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserInfoEvent value) getUserInfo,
    required TResult Function(_UpdateUserInfoEvent value) updateUserInfo,
    required TResult Function(_GetInitialUserEvent value) initialUser,
    required TResult Function(_GetGuestUserEvent value) guestUser,
    required TResult Function(_GetUpdateFcmEvent value) updateFcm,
  }) {
    return updateUserInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserInfoEvent value)? getUserInfo,
    TResult? Function(_UpdateUserInfoEvent value)? updateUserInfo,
    TResult? Function(_GetInitialUserEvent value)? initialUser,
    TResult? Function(_GetGuestUserEvent value)? guestUser,
    TResult? Function(_GetUpdateFcmEvent value)? updateFcm,
  }) {
    return updateUserInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserInfoEvent value)? getUserInfo,
    TResult Function(_UpdateUserInfoEvent value)? updateUserInfo,
    TResult Function(_GetInitialUserEvent value)? initialUser,
    TResult Function(_GetGuestUserEvent value)? guestUser,
    TResult Function(_GetUpdateFcmEvent value)? updateFcm,
    required TResult orElse(),
  }) {
    if (updateUserInfo != null) {
      return updateUserInfo(this);
    }
    return orElse();
  }
}

abstract class _UpdateUserInfoEvent implements UserEvent {
  const factory _UpdateUserInfoEvent(
          {required final String id,
          required final RequestUpdateInfoModel requestUpdateInfo}) =
      _$UpdateUserInfoEventImpl;

  String get id;
  RequestUpdateInfoModel get requestUpdateInfo;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUserInfoEventImplCopyWith<_$UpdateUserInfoEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetInitialUserEventImplCopyWith<$Res> {
  factory _$$GetInitialUserEventImplCopyWith(_$GetInitialUserEventImpl value,
          $Res Function(_$GetInitialUserEventImpl) then) =
      __$$GetInitialUserEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetInitialUserEventImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$GetInitialUserEventImpl>
    implements _$$GetInitialUserEventImplCopyWith<$Res> {
  __$$GetInitialUserEventImplCopyWithImpl(_$GetInitialUserEventImpl _value,
      $Res Function(_$GetInitialUserEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetInitialUserEventImpl implements _GetInitialUserEvent {
  const _$GetInitialUserEventImpl();

  @override
  String toString() {
    return 'UserEvent.initialUser()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetInitialUserEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUserInfo,
    required TResult Function(
            String id, RequestUpdateInfoModel requestUpdateInfo)
        updateUserInfo,
    required TResult Function() initialUser,
    required TResult Function() guestUser,
    required TResult Function(String useId) updateFcm,
  }) {
    return initialUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getUserInfo,
    TResult? Function(String id, RequestUpdateInfoModel requestUpdateInfo)?
        updateUserInfo,
    TResult? Function()? initialUser,
    TResult? Function()? guestUser,
    TResult? Function(String useId)? updateFcm,
  }) {
    return initialUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUserInfo,
    TResult Function(String id, RequestUpdateInfoModel requestUpdateInfo)?
        updateUserInfo,
    TResult Function()? initialUser,
    TResult Function()? guestUser,
    TResult Function(String useId)? updateFcm,
    required TResult orElse(),
  }) {
    if (initialUser != null) {
      return initialUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserInfoEvent value) getUserInfo,
    required TResult Function(_UpdateUserInfoEvent value) updateUserInfo,
    required TResult Function(_GetInitialUserEvent value) initialUser,
    required TResult Function(_GetGuestUserEvent value) guestUser,
    required TResult Function(_GetUpdateFcmEvent value) updateFcm,
  }) {
    return initialUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserInfoEvent value)? getUserInfo,
    TResult? Function(_UpdateUserInfoEvent value)? updateUserInfo,
    TResult? Function(_GetInitialUserEvent value)? initialUser,
    TResult? Function(_GetGuestUserEvent value)? guestUser,
    TResult? Function(_GetUpdateFcmEvent value)? updateFcm,
  }) {
    return initialUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserInfoEvent value)? getUserInfo,
    TResult Function(_UpdateUserInfoEvent value)? updateUserInfo,
    TResult Function(_GetInitialUserEvent value)? initialUser,
    TResult Function(_GetGuestUserEvent value)? guestUser,
    TResult Function(_GetUpdateFcmEvent value)? updateFcm,
    required TResult orElse(),
  }) {
    if (initialUser != null) {
      return initialUser(this);
    }
    return orElse();
  }
}

abstract class _GetInitialUserEvent implements UserEvent {
  const factory _GetInitialUserEvent() = _$GetInitialUserEventImpl;
}

/// @nodoc
abstract class _$$GetGuestUserEventImplCopyWith<$Res> {
  factory _$$GetGuestUserEventImplCopyWith(_$GetGuestUserEventImpl value,
          $Res Function(_$GetGuestUserEventImpl) then) =
      __$$GetGuestUserEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetGuestUserEventImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$GetGuestUserEventImpl>
    implements _$$GetGuestUserEventImplCopyWith<$Res> {
  __$$GetGuestUserEventImplCopyWithImpl(_$GetGuestUserEventImpl _value,
      $Res Function(_$GetGuestUserEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetGuestUserEventImpl implements _GetGuestUserEvent {
  const _$GetGuestUserEventImpl();

  @override
  String toString() {
    return 'UserEvent.guestUser()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetGuestUserEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUserInfo,
    required TResult Function(
            String id, RequestUpdateInfoModel requestUpdateInfo)
        updateUserInfo,
    required TResult Function() initialUser,
    required TResult Function() guestUser,
    required TResult Function(String useId) updateFcm,
  }) {
    return guestUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getUserInfo,
    TResult? Function(String id, RequestUpdateInfoModel requestUpdateInfo)?
        updateUserInfo,
    TResult? Function()? initialUser,
    TResult? Function()? guestUser,
    TResult? Function(String useId)? updateFcm,
  }) {
    return guestUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUserInfo,
    TResult Function(String id, RequestUpdateInfoModel requestUpdateInfo)?
        updateUserInfo,
    TResult Function()? initialUser,
    TResult Function()? guestUser,
    TResult Function(String useId)? updateFcm,
    required TResult orElse(),
  }) {
    if (guestUser != null) {
      return guestUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserInfoEvent value) getUserInfo,
    required TResult Function(_UpdateUserInfoEvent value) updateUserInfo,
    required TResult Function(_GetInitialUserEvent value) initialUser,
    required TResult Function(_GetGuestUserEvent value) guestUser,
    required TResult Function(_GetUpdateFcmEvent value) updateFcm,
  }) {
    return guestUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserInfoEvent value)? getUserInfo,
    TResult? Function(_UpdateUserInfoEvent value)? updateUserInfo,
    TResult? Function(_GetInitialUserEvent value)? initialUser,
    TResult? Function(_GetGuestUserEvent value)? guestUser,
    TResult? Function(_GetUpdateFcmEvent value)? updateFcm,
  }) {
    return guestUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserInfoEvent value)? getUserInfo,
    TResult Function(_UpdateUserInfoEvent value)? updateUserInfo,
    TResult Function(_GetInitialUserEvent value)? initialUser,
    TResult Function(_GetGuestUserEvent value)? guestUser,
    TResult Function(_GetUpdateFcmEvent value)? updateFcm,
    required TResult orElse(),
  }) {
    if (guestUser != null) {
      return guestUser(this);
    }
    return orElse();
  }
}

abstract class _GetGuestUserEvent implements UserEvent {
  const factory _GetGuestUserEvent() = _$GetGuestUserEventImpl;
}

/// @nodoc
abstract class _$$GetUpdateFcmEventImplCopyWith<$Res> {
  factory _$$GetUpdateFcmEventImplCopyWith(_$GetUpdateFcmEventImpl value,
          $Res Function(_$GetUpdateFcmEventImpl) then) =
      __$$GetUpdateFcmEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String useId});
}

/// @nodoc
class __$$GetUpdateFcmEventImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$GetUpdateFcmEventImpl>
    implements _$$GetUpdateFcmEventImplCopyWith<$Res> {
  __$$GetUpdateFcmEventImplCopyWithImpl(_$GetUpdateFcmEventImpl _value,
      $Res Function(_$GetUpdateFcmEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? useId = null,
  }) {
    return _then(_$GetUpdateFcmEventImpl(
      null == useId
          ? _value.useId
          : useId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetUpdateFcmEventImpl implements _GetUpdateFcmEvent {
  const _$GetUpdateFcmEventImpl(this.useId);

  @override
  final String useId;

  @override
  String toString() {
    return 'UserEvent.updateFcm(useId: $useId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUpdateFcmEventImpl &&
            (identical(other.useId, useId) || other.useId == useId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, useId);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUpdateFcmEventImplCopyWith<_$GetUpdateFcmEventImpl> get copyWith =>
      __$$GetUpdateFcmEventImplCopyWithImpl<_$GetUpdateFcmEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUserInfo,
    required TResult Function(
            String id, RequestUpdateInfoModel requestUpdateInfo)
        updateUserInfo,
    required TResult Function() initialUser,
    required TResult Function() guestUser,
    required TResult Function(String useId) updateFcm,
  }) {
    return updateFcm(useId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getUserInfo,
    TResult? Function(String id, RequestUpdateInfoModel requestUpdateInfo)?
        updateUserInfo,
    TResult? Function()? initialUser,
    TResult? Function()? guestUser,
    TResult? Function(String useId)? updateFcm,
  }) {
    return updateFcm?.call(useId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUserInfo,
    TResult Function(String id, RequestUpdateInfoModel requestUpdateInfo)?
        updateUserInfo,
    TResult Function()? initialUser,
    TResult Function()? guestUser,
    TResult Function(String useId)? updateFcm,
    required TResult orElse(),
  }) {
    if (updateFcm != null) {
      return updateFcm(useId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserInfoEvent value) getUserInfo,
    required TResult Function(_UpdateUserInfoEvent value) updateUserInfo,
    required TResult Function(_GetInitialUserEvent value) initialUser,
    required TResult Function(_GetGuestUserEvent value) guestUser,
    required TResult Function(_GetUpdateFcmEvent value) updateFcm,
  }) {
    return updateFcm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserInfoEvent value)? getUserInfo,
    TResult? Function(_UpdateUserInfoEvent value)? updateUserInfo,
    TResult? Function(_GetInitialUserEvent value)? initialUser,
    TResult? Function(_GetGuestUserEvent value)? guestUser,
    TResult? Function(_GetUpdateFcmEvent value)? updateFcm,
  }) {
    return updateFcm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserInfoEvent value)? getUserInfo,
    TResult Function(_UpdateUserInfoEvent value)? updateUserInfo,
    TResult Function(_GetInitialUserEvent value)? initialUser,
    TResult Function(_GetGuestUserEvent value)? guestUser,
    TResult Function(_GetUpdateFcmEvent value)? updateFcm,
    required TResult orElse(),
  }) {
    if (updateFcm != null) {
      return updateFcm(this);
    }
    return orElse();
  }
}

abstract class _GetUpdateFcmEvent implements UserEvent {
  const factory _GetUpdateFcmEvent(final String useId) =
      _$GetUpdateFcmEventImpl;

  String get useId;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetUpdateFcmEventImplCopyWith<_$GetUpdateFcmEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserResponse user) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserResponse user)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserResponse user)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'UserState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserResponse user) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserResponse user)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserResponse user)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements UserState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'UserState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserResponse user) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserResponse user)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserResponse user)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements UserState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserResponse user});

  $UserResponseCopyWith<$Res> get user;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$LoadedImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserResponse,
    ));
  }

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserResponseCopyWith<$Res> get user {
    return $UserResponseCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl({required this.user});

  @override
  final UserResponse user;

  @override
  String toString() {
    return 'UserState.loaded(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserResponse user) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserResponse user)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserResponse user)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements UserState {
  const factory _Loaded({required final UserResponse user}) = _$LoadedImpl;

  UserResponse get user;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'UserState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserResponse user) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserResponse user)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserResponse user)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements UserState {
  const factory _Error({required final String message}) = _$ErrorImpl;

  String get message;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
