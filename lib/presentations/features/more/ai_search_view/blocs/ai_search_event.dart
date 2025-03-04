part of 'ai_search_bloc.dart';

@freezed
class StartAiSearchEvent with _$StartAiSearchEvent{
  const factory StartAiSearchEvent.makeAiSearch(
      {required AiSearchRequestModel request}) = _MakeAiSearch;
       const factory StartAiSearchEvent.clearResults() = _ClearAiSearchEvent;
}
