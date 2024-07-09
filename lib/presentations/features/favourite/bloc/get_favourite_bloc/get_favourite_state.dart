part of 'get_favourite_bloc.dart';

@freezed
class GetFavouriteState with _$GetFavouriteState {
  const factory GetFavouriteState.initial() = _Initial;
  const factory GetFavouriteState.loading() = _Loading;
  const factory GetFavouriteState.searchLoading() = _SearchLoading;
  const factory GetFavouriteState.done(List<FavouriteResponse> response) =
      _Done;
  const factory GetFavouriteState.error() = _Error;
}
