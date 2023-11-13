part of 'lookup_bloc.dart';

@freezed
class LookupEvent with _$LookupEvent {
  const factory LookupEvent.getRentLookupEvent() = _GetRentLookupEvent;
  const factory LookupEvent.getMortgageLookupEvent() = __GetMortgageLookupEvent;
  const factory LookupEvent.getSellLookupEvent() = _GetSellLookupEvent;
}
