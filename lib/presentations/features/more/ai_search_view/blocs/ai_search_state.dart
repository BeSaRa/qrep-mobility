part of 'ai_search_bloc.dart';


@freezed
class AiSearchState with _$AiSearchState {
  const factory AiSearchState.initial() = _Initial;
const factory AiSearchState.loading({required bool isPagination}) = _Loading;
  const factory AiSearchState.done(
      {required AiSearchResponseModel response,
      @Default([]) List<AiSearchItemModel> previousResults, 
      }) = _Done;
  const factory AiSearchState.error(String message) = _Error;
}
