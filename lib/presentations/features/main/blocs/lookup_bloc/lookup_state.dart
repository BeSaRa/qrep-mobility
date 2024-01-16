part of 'lookup_bloc.dart';

@freezed
class LookupState with _$LookupState {
  const factory LookupState.loadingLookup() = _LoadingLookUp;

  const factory LookupState.loadedLookup({required LookupResponse lookup}) =
      _LoadedLookUp;

  const factory LookupState.errorLookUp({required String message}) =
      _ErrorLookUp;
}
