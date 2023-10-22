part of 'about_bloc.dart';

@freezed
class AboutEvent with _$AboutEvent {
  const factory AboutEvent.getAbout() = _GetAboutEvent;
}
