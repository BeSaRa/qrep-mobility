part of 'about_bloc.dart';

@freezed
class AboutState with _$AboutState {
  const factory AboutState.loading() = __Loading;
  const factory AboutState.loaded({required AboutModels about}) = __Loaded;
  const factory AboutState.error({required String message}) = __Error;
}
