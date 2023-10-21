// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAbout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAbout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAbout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNewsEvent value) getAbout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNewsEvent value)? getAbout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNewsEvent value)? getAbout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsEventCopyWith<$Res> {
  factory $NewsEventCopyWith(NewsEvent value, $Res Function(NewsEvent) then) =
      _$NewsEventCopyWithImpl<$Res, NewsEvent>;
}

/// @nodoc
class _$NewsEventCopyWithImpl<$Res, $Val extends NewsEvent>
    implements $NewsEventCopyWith<$Res> {
  _$NewsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetNewsEventImplCopyWith<$Res> {
  factory _$$GetNewsEventImplCopyWith(
          _$GetNewsEventImpl value, $Res Function(_$GetNewsEventImpl) then) =
      __$$GetNewsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetNewsEventImplCopyWithImpl<$Res>
    extends _$NewsEventCopyWithImpl<$Res, _$GetNewsEventImpl>
    implements _$$GetNewsEventImplCopyWith<$Res> {
  __$$GetNewsEventImplCopyWithImpl(
      _$GetNewsEventImpl _value, $Res Function(_$GetNewsEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetNewsEventImpl implements _GetNewsEvent {
  const _$GetNewsEventImpl();

  @override
  String toString() {
    return 'NewsEvent.getAbout()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetNewsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAbout,
  }) {
    return getAbout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAbout,
  }) {
    return getAbout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAbout,
    required TResult orElse(),
  }) {
    if (getAbout != null) {
      return getAbout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNewsEvent value) getAbout,
  }) {
    return getAbout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNewsEvent value)? getAbout,
  }) {
    return getAbout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNewsEvent value)? getAbout,
    required TResult orElse(),
  }) {
    if (getAbout != null) {
      return getAbout(this);
    }
    return orElse();
  }
}

abstract class _GetNewsEvent implements NewsEvent {
  const factory _GetNewsEvent() = _$GetNewsEventImpl;
}

/// @nodoc
mixin _$NewsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<NewsModel> news) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<NewsModel> news)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<NewsModel> news)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(__Loading value) loading,
    required TResult Function(__Loaded value) loaded,
    required TResult Function(__Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(__Loading value)? loading,
    TResult? Function(__Loaded value)? loaded,
    TResult? Function(__Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(__Loading value)? loading,
    TResult Function(__Loaded value)? loaded,
    TResult Function(__Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsStateCopyWith<$Res> {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) then) =
      _$NewsStateCopyWithImpl<$Res, NewsState>;
}

/// @nodoc
class _$NewsStateCopyWithImpl<$Res, $Val extends NewsState>
    implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoadingImplCopyWith<$Res> {
  factory _$$_LoadingImplCopyWith(
          _$_LoadingImpl value, $Res Function(_$_LoadingImpl) then) =
      __$$_LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingImplCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$_LoadingImpl>
    implements _$$_LoadingImplCopyWith<$Res> {
  __$$_LoadingImplCopyWithImpl(
      _$_LoadingImpl _value, $Res Function(_$_LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadingImpl implements __Loading {
  const _$_LoadingImpl();

  @override
  String toString() {
    return 'NewsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<NewsModel> news) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<NewsModel> news)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<NewsModel> news)? loaded,
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
    required TResult Function(__Loading value) loading,
    required TResult Function(__Loaded value) loaded,
    required TResult Function(__Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(__Loading value)? loading,
    TResult? Function(__Loaded value)? loaded,
    TResult? Function(__Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(__Loading value)? loading,
    TResult Function(__Loaded value)? loaded,
    TResult Function(__Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class __Loading implements NewsState {
  const factory __Loading() = _$_LoadingImpl;
}

/// @nodoc
abstract class _$$_LoadedImplCopyWith<$Res> {
  factory _$$_LoadedImplCopyWith(
          _$_LoadedImpl value, $Res Function(_$_LoadedImpl) then) =
      __$$_LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<NewsModel> news});
}

/// @nodoc
class __$$_LoadedImplCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$_LoadedImpl>
    implements _$$_LoadedImplCopyWith<$Res> {
  __$$_LoadedImplCopyWithImpl(
      _$_LoadedImpl _value, $Res Function(_$_LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? news = null,
  }) {
    return _then(_$_LoadedImpl(
      news: null == news
          ? _value._news
          : news // ignore: cast_nullable_to_non_nullable
              as List<NewsModel>,
    ));
  }
}

/// @nodoc

class _$_LoadedImpl implements __Loaded {
  const _$_LoadedImpl({required final List<NewsModel> news}) : _news = news;

  final List<NewsModel> _news;
  @override
  List<NewsModel> get news {
    if (_news is EqualUnmodifiableListView) return _news;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_news);
  }

  @override
  String toString() {
    return 'NewsState.loaded(news: $news)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadedImpl &&
            const DeepCollectionEquality().equals(other._news, _news));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_news));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedImplCopyWith<_$_LoadedImpl> get copyWith =>
      __$$_LoadedImplCopyWithImpl<_$_LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<NewsModel> news) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(news);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<NewsModel> news)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(news);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<NewsModel> news)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(news);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(__Loading value) loading,
    required TResult Function(__Loaded value) loaded,
    required TResult Function(__Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(__Loading value)? loading,
    TResult? Function(__Loaded value)? loaded,
    TResult? Function(__Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(__Loading value)? loading,
    TResult Function(__Loaded value)? loaded,
    TResult Function(__Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class __Loaded implements NewsState {
  const factory __Loaded({required final List<NewsModel> news}) = _$_LoadedImpl;

  List<NewsModel> get news;
  @JsonKey(ignore: true)
  _$$_LoadedImplCopyWith<_$_LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorImplCopyWith<$Res> {
  factory _$$_ErrorImplCopyWith(
          _$_ErrorImpl value, $Res Function(_$_ErrorImpl) then) =
      __$$_ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_ErrorImplCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$_ErrorImpl>
    implements _$$_ErrorImplCopyWith<$Res> {
  __$$_ErrorImplCopyWithImpl(
      _$_ErrorImpl _value, $Res Function(_$_ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_ErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ErrorImpl implements __Error {
  const _$_ErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'NewsState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorImplCopyWith<_$_ErrorImpl> get copyWith =>
      __$$_ErrorImplCopyWithImpl<_$_ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<NewsModel> news) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<NewsModel> news)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<NewsModel> news)? loaded,
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
    required TResult Function(__Loading value) loading,
    required TResult Function(__Loaded value) loaded,
    required TResult Function(__Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(__Loading value)? loading,
    TResult? Function(__Loaded value)? loaded,
    TResult? Function(__Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(__Loading value)? loading,
    TResult Function(__Loaded value)? loaded,
    TResult Function(__Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class __Error implements NewsState {
  const factory __Error({required final String message}) = _$_ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$_ErrorImplCopyWith<_$_ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
