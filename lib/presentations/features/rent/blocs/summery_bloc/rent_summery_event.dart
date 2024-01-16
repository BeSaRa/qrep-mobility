part of 'rent_summery_bloc.dart';

@freezed
abstract class RentSummeryEvent with _$RentSummeryEvent {
  const factory RentSummeryEvent.getRentSummary(
      {required RentRequest request}) = _RentSummaryEvent;
}
