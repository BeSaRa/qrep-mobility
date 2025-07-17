part of 'stop_render_bloc.dart';

@freezed
class StopRenderState with _$StopRenderState {
  const factory StopRenderState.initial() = _Initial;
  const factory StopRenderState.loading() = _Loading;
  const factory StopRenderState.done({required MainChatbotResponseModel response}) = _Done;
  const factory StopRenderState.error(String message) = _Error;
}
