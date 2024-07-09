part of 'get_favourite_bloc.dart';

@freezed
class GetFavouriteEvent with _$GetFavouriteEvent {
  const factory GetFavouriteEvent.started(String id) = _Started;
  const factory GetFavouriteEvent.filter(int? page, String? name) = _Filter;
}
