part of 'get_favourite_bloc.dart';

@freezed
class GetFavouriteEvent with _$GetFavouriteEvent {
  const factory GetFavouriteEvent.started(String id) = _Started;
  const factory GetFavouriteEvent.filter(int? page, String? name) = _Filter;
  const factory GetFavouriteEvent.delete(int? id, String? userId) = _Delete;
  const factory GetFavouriteEvent.reload(String id) = _Reload;
}
