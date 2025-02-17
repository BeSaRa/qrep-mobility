part of 'close_stream_bloc.dart';

@freezed
class CloseStreamState with _$CloseStreamState {
  //   const factory CloseStreamState.initial({
  //   @Default(false) bool isLoading,
  //   @Default(false) bool hasError,
  //   @Default('') String errorMessage,
  //   @Default(SendAnswerResponseModel()) SendAnswerResponseModel closeStreamResponse,

  //   // @Default(LawByIdResponse()) LawByIdResponse lawByIdResponse,
  // }) = _Initial;
  const factory CloseStreamState.initial() = _Initial;
  const factory CloseStreamState.loading() = _Loading;
  const factory CloseStreamState.done({required SendAnswerResponseModel response}) = _Done;
  const factory CloseStreamState.error(String message) = _Error;
}
