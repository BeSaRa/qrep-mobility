part of 'update_favourite_bloc.dart';

@freezed
class UpdateFavouriteState with _$UpdateFavouriteState {
  const factory UpdateFavouriteState.initial() = _Initial;
  const factory UpdateFavouriteState.loading() = _Loading;
  const factory UpdateFavouriteState.done() = _Done;
  const factory UpdateFavouriteState.error(String message) = _Error;
}
