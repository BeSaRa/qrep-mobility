part of 'stop_render_bloc.dart';

@freezed
class StopRenderEvent with _$StopRenderEvent {
  const factory StopRenderEvent.stopRender(String id) = _StopRender;
}
