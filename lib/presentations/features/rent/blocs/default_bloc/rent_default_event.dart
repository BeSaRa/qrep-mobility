part of 'rent_default_bloc.dart';

@freezed
class RentDefaultEvent with _$RentDefaultEvent {
  const factory RentDefaultEvent.started({required RentRequest request}) =
      _Started;
}
