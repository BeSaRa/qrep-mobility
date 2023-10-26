part of 'laws_bloc.dart';

@freezed
class LawsEvent with _$LawsEvent {
  const factory LawsEvent.getLaws() = _Started;
}
