part of 'update_favourite_bloc.dart';

@freezed
class UpdateFavouriteEvent with _$UpdateFavouriteEvent {
  const factory UpdateFavouriteEvent.started(FavouriteResponse body) = _Started;
}
