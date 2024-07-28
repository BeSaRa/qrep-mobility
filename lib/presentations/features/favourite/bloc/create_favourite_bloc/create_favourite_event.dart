part of 'create_favourite_bloc.dart';

@freezed
class CreateFavouriteEvent with _$CreateFavouriteEvent {
  const factory CreateFavouriteEvent.started(FavouriteResponse body) = _Started;
}
