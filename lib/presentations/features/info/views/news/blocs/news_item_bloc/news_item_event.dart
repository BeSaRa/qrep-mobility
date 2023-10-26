part of 'news_item_bloc.dart';

@freezed
class NewsItemEvent with _$NewsItemEvent {
  const factory NewsItemEvent.getNewsItem({required int id}) = _GetNewsItem;
}
