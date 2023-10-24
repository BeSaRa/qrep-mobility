part of 'sell_bloc.dart';

@freezed
class SellState with _$SellState {
  const factory SellState.loadingSellLookup() = _LoadingSellLookUp;
  const factory SellState.loadedSellLookup(
      {required RentLookupResponse sellLookup}) = _LoadedSellLookUp;
  const factory SellState.errorSellLookUp({required String message}) =
      _ErrorSellLookUp;
}
