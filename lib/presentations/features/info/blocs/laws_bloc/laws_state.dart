part of 'laws_bloc.dart';

@freezed
class LawsState with _$LawsState {
  const factory LawsState.initial({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    @Default('') String errorMessage,
    @Default([]) List<LawsModel> lawsResponse,
    // @Default(LawByIdResponse()) LawByIdResponse lawByIdResponse,
  }) = _Initial;
}
