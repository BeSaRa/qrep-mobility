part of 'news_item_bloc.dart';

@freezed
class NewsItemState with _$NewsItemState {
  const factory NewsItemState.loading() = _Loading;
  const factory NewsItemState.success({required NewsByIdResponse item}) =
      _Success;
  const factory NewsItemState.error({required String message}) = _Error;
}
