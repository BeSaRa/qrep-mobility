// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'laws_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LawsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getLaws,
    required TResult Function(List<String> categories) updateSelectedCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getLaws,
    TResult? Function(List<String> categories)? updateSelectedCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getLaws,
    TResult Function(List<String> categories)? updateSelectedCategories,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLaws value) getLaws,
    required TResult Function(_UpdateSelectedCategories value)
        updateSelectedCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetLaws value)? getLaws,
    TResult? Function(_UpdateSelectedCategories value)?
        updateSelectedCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLaws value)? getLaws,
    TResult Function(_UpdateSelectedCategories value)? updateSelectedCategories,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LawsEventCopyWith<$Res> {
  factory $LawsEventCopyWith(LawsEvent value, $Res Function(LawsEvent) then) =
      _$LawsEventCopyWithImpl<$Res, LawsEvent>;
}

/// @nodoc
class _$LawsEventCopyWithImpl<$Res, $Val extends LawsEvent>
    implements $LawsEventCopyWith<$Res> {
  _$LawsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LawsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetLawsImplCopyWith<$Res> {
  factory _$$GetLawsImplCopyWith(
          _$GetLawsImpl value, $Res Function(_$GetLawsImpl) then) =
      __$$GetLawsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetLawsImplCopyWithImpl<$Res>
    extends _$LawsEventCopyWithImpl<$Res, _$GetLawsImpl>
    implements _$$GetLawsImplCopyWith<$Res> {
  __$$GetLawsImplCopyWithImpl(
      _$GetLawsImpl _value, $Res Function(_$GetLawsImpl) _then)
      : super(_value, _then);

  /// Create a copy of LawsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetLawsImpl implements _GetLaws {
  const _$GetLawsImpl();

  @override
  String toString() {
    return 'LawsEvent.getLaws()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetLawsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getLaws,
    required TResult Function(List<String> categories) updateSelectedCategories,
  }) {
    return getLaws();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getLaws,
    TResult? Function(List<String> categories)? updateSelectedCategories,
  }) {
    return getLaws?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getLaws,
    TResult Function(List<String> categories)? updateSelectedCategories,
    required TResult orElse(),
  }) {
    if (getLaws != null) {
      return getLaws();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLaws value) getLaws,
    required TResult Function(_UpdateSelectedCategories value)
        updateSelectedCategories,
  }) {
    return getLaws(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetLaws value)? getLaws,
    TResult? Function(_UpdateSelectedCategories value)?
        updateSelectedCategories,
  }) {
    return getLaws?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLaws value)? getLaws,
    TResult Function(_UpdateSelectedCategories value)? updateSelectedCategories,
    required TResult orElse(),
  }) {
    if (getLaws != null) {
      return getLaws(this);
    }
    return orElse();
  }
}

abstract class _GetLaws implements LawsEvent {
  const factory _GetLaws() = _$GetLawsImpl;
}

/// @nodoc
abstract class _$$UpdateSelectedCategoriesImplCopyWith<$Res> {
  factory _$$UpdateSelectedCategoriesImplCopyWith(
          _$UpdateSelectedCategoriesImpl value,
          $Res Function(_$UpdateSelectedCategoriesImpl) then) =
      __$$UpdateSelectedCategoriesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> categories});
}

/// @nodoc
class __$$UpdateSelectedCategoriesImplCopyWithImpl<$Res>
    extends _$LawsEventCopyWithImpl<$Res, _$UpdateSelectedCategoriesImpl>
    implements _$$UpdateSelectedCategoriesImplCopyWith<$Res> {
  __$$UpdateSelectedCategoriesImplCopyWithImpl(
      _$UpdateSelectedCategoriesImpl _value,
      $Res Function(_$UpdateSelectedCategoriesImpl) _then)
      : super(_value, _then);

  /// Create a copy of LawsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_$UpdateSelectedCategoriesImpl(
      null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$UpdateSelectedCategoriesImpl implements _UpdateSelectedCategories {
  const _$UpdateSelectedCategoriesImpl(final List<String> categories)
      : _categories = categories;

  final List<String> _categories;
  @override
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'LawsEvent.updateSelectedCategories(categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSelectedCategoriesImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  /// Create a copy of LawsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSelectedCategoriesImplCopyWith<_$UpdateSelectedCategoriesImpl>
      get copyWith => __$$UpdateSelectedCategoriesImplCopyWithImpl<
          _$UpdateSelectedCategoriesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getLaws,
    required TResult Function(List<String> categories) updateSelectedCategories,
  }) {
    return updateSelectedCategories(categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getLaws,
    TResult? Function(List<String> categories)? updateSelectedCategories,
  }) {
    return updateSelectedCategories?.call(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getLaws,
    TResult Function(List<String> categories)? updateSelectedCategories,
    required TResult orElse(),
  }) {
    if (updateSelectedCategories != null) {
      return updateSelectedCategories(categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLaws value) getLaws,
    required TResult Function(_UpdateSelectedCategories value)
        updateSelectedCategories,
  }) {
    return updateSelectedCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetLaws value)? getLaws,
    TResult? Function(_UpdateSelectedCategories value)?
        updateSelectedCategories,
  }) {
    return updateSelectedCategories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLaws value)? getLaws,
    TResult Function(_UpdateSelectedCategories value)? updateSelectedCategories,
    required TResult orElse(),
  }) {
    if (updateSelectedCategories != null) {
      return updateSelectedCategories(this);
    }
    return orElse();
  }
}

abstract class _UpdateSelectedCategories implements LawsEvent {
  const factory _UpdateSelectedCategories(final List<String> categories) =
      _$UpdateSelectedCategoriesImpl;

  List<String> get categories;

  /// Create a copy of LawsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateSelectedCategoriesImplCopyWith<_$UpdateSelectedCategoriesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LawsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  List<LawsModel> get lawsResponse => throw _privateConstructorUsedError;
  List<String> get selectedCategories => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoading,
            bool hasError,
            String errorMessage,
            List<LawsModel> lawsResponse,
            List<String> selectedCategories)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, bool hasError, String errorMessage,
            List<LawsModel> lawsResponse, List<String> selectedCategories)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, bool hasError, String errorMessage,
            List<LawsModel> lawsResponse, List<String> selectedCategories)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of LawsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LawsStateCopyWith<LawsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LawsStateCopyWith<$Res> {
  factory $LawsStateCopyWith(LawsState value, $Res Function(LawsState) then) =
      _$LawsStateCopyWithImpl<$Res, LawsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      String errorMessage,
      List<LawsModel> lawsResponse,
      List<String> selectedCategories});
}

/// @nodoc
class _$LawsStateCopyWithImpl<$Res, $Val extends LawsState>
    implements $LawsStateCopyWith<$Res> {
  _$LawsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LawsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? errorMessage = null,
    Object? lawsResponse = null,
    Object? selectedCategories = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      lawsResponse: null == lawsResponse
          ? _value.lawsResponse
          : lawsResponse // ignore: cast_nullable_to_non_nullable
              as List<LawsModel>,
      selectedCategories: null == selectedCategories
          ? _value.selectedCategories
          : selectedCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $LawsStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      String errorMessage,
      List<LawsModel> lawsResponse,
      List<String> selectedCategories});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$LawsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of LawsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? errorMessage = null,
    Object? lawsResponse = null,
    Object? selectedCategories = null,
  }) {
    return _then(_$InitialImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      lawsResponse: null == lawsResponse
          ? _value._lawsResponse
          : lawsResponse // ignore: cast_nullable_to_non_nullable
              as List<LawsModel>,
      selectedCategories: null == selectedCategories
          ? _value._selectedCategories
          : selectedCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.isLoading = false,
      this.hasError = false,
      this.errorMessage = '',
      final List<LawsModel> lawsResponse = const [],
      final List<String> selectedCategories = const []})
      : _lawsResponse = lawsResponse,
        _selectedCategories = selectedCategories;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasError;
  @override
  @JsonKey()
  final String errorMessage;
  final List<LawsModel> _lawsResponse;
  @override
  @JsonKey()
  List<LawsModel> get lawsResponse {
    if (_lawsResponse is EqualUnmodifiableListView) return _lawsResponse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lawsResponse);
  }

  final List<String> _selectedCategories;
  @override
  @JsonKey()
  List<String> get selectedCategories {
    if (_selectedCategories is EqualUnmodifiableListView)
      return _selectedCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedCategories);
  }

  @override
  String toString() {
    return 'LawsState.initial(isLoading: $isLoading, hasError: $hasError, errorMessage: $errorMessage, lawsResponse: $lawsResponse, selectedCategories: $selectedCategories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._lawsResponse, _lawsResponse) &&
            const DeepCollectionEquality()
                .equals(other._selectedCategories, _selectedCategories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      hasError,
      errorMessage,
      const DeepCollectionEquality().hash(_lawsResponse),
      const DeepCollectionEquality().hash(_selectedCategories));

  /// Create a copy of LawsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoading,
            bool hasError,
            String errorMessage,
            List<LawsModel> lawsResponse,
            List<String> selectedCategories)
        initial,
  }) {
    return initial(
        isLoading, hasError, errorMessage, lawsResponse, selectedCategories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, bool hasError, String errorMessage,
            List<LawsModel> lawsResponse, List<String> selectedCategories)?
        initial,
  }) {
    return initial?.call(
        isLoading, hasError, errorMessage, lawsResponse, selectedCategories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, bool hasError, String errorMessage,
            List<LawsModel> lawsResponse, List<String> selectedCategories)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          isLoading, hasError, errorMessage, lawsResponse, selectedCategories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LawsState {
  const factory _Initial(
      {final bool isLoading,
      final bool hasError,
      final String errorMessage,
      final List<LawsModel> lawsResponse,
      final List<String> selectedCategories}) = _$InitialImpl;

  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  String get errorMessage;
  @override
  List<LawsModel> get lawsResponse;
  @override
  List<String> get selectedCategories;

  /// Create a copy of LawsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
