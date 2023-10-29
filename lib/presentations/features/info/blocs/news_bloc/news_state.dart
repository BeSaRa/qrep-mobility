part of 'news_bloc.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState.loading() = __Loading;
  const factory NewsState.loaded({required List<NewsModel> news}) = __Loaded;
  const factory NewsState.error({required String message}) = __Error;
}
