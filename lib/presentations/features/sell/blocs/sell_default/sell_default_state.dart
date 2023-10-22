part of 'sell_default_bloc.dart';

@freezed
class SellDefaultState with _$SellDefaultState {
  const factory SellDefaultState.initial() = _Initial;

  const factory SellDefaultState.loading() = _Loading;

  const factory SellDefaultState.done(RentDefault response) = _Done;

  const factory SellDefaultState.error(String message) = _Error;
}
