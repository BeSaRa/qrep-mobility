part of 'start_stream_bloc.dart';

@freezed
class StartStreamState with _$StartStreamState {
  const factory StartStreamState.initial() = _Initial;
  const factory StartStreamState.loading() = _Loading;
  const factory StartStreamState.done({required StartStreamModel startStreamResponse}) = _Done;
  const factory StartStreamState.error(String message) = _Error;
}
  //   const factory StartStreamState.initial({
  //   @Default(false) bool isLoading,
  //   @Default(false) bool hasError,
  //   @Default('') String errorMessage,
  //   @Default(StartStreamModel()) StartStreamModel startStreamResponse,
  //   @Default(SendAnswerResponseModel()) SendAnswerResponseModel sendAnswerResponse,
  //   @Default(SendAnswerResponseModel()) SendAnswerResponseModel sendCandidateResponse,
  //   // @Default(SendAnswerResponseModel()) SendAnswerResponseModel closeStreamResponse,

  //   // @Default(LawByIdResponse()) LawByIdResponse lawByIdResponse,
  // }) = _Initial;
