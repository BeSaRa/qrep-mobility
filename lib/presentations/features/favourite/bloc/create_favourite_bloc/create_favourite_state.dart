part of 'create_favourite_bloc.dart';

@freezed
class CreateFavouriteState with _$CreateFavouriteState {
  const factory CreateFavouriteState.initial() = _Initial;
  const factory CreateFavouriteState.loading() = _Loading;
  const factory CreateFavouriteState.done() = _Done;
  const factory CreateFavouriteState.error(String message) = _Error;
}
