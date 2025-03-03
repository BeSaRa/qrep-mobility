import 'package:ebla/domain/models/ai_search_models/ai_search_model.dart';
import 'package:ebla/domain/models/requests/ai_search_models/ai_search_model.dart';
import 'package:ebla/domain/usecases/ai_search/ai_search_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_search_bloc.freezed.dart';
part 'ai_search_event.dart';
part 'ai_search_state.dart';

class AiSearchBloc extends Bloc<StartAiSearchEvent, AiSearchState> {
  final AiSearchUsecase aiSearchUsecase;

  AiSearchBloc(
    this.aiSearchUsecase,
  ) : super(const AiSearchState.initial()) {
    on<StartAiSearchEvent>((StartAiSearchEvent event, emit) async {
      await event.map(
        //---------------------------------------------------------------------------------------------
        makeAiSearch: (value) async {
          final currentState = state;

          // Preserve existing results if already in `done` state
          List<AiSearchItemModel> previousResults = [];
          bool isPagination = value.request.pageNumber > 1;
          if (currentState is _Done && isPagination) {
            previousResults = List.from(currentState.previousResults);
          }
          // emit(AiSearchState.loading(isPagination: isPagination));
          final requestBody = value.request;
          final failureOrSuccess = await aiSearchUsecase.execute(requestBody);
          await failureOrSuccess.when((success) async {
            emit(AiSearchState.done(
              response: success,
              previousResults: [...previousResults, ...success.rs],
            ));
          }, (error) {
            emit(AiSearchState.error(error.message));
          });
        },
        clearResults: (value) async {
          final currentState = state;
          AiSearchResponseModel lastResponse = AiSearchResponseModel();
          emit(AiSearchState.loading(isPagination: false));
          if (currentState is _Done) {
            lastResponse = currentState.response;
            emit(AiSearchState.done(
                response: lastResponse, previousResults: []));
          }
        },
      );
    });
  }
}
