import 'package:bloc/bloc.dart';
import 'package:ebla/domain/usecases/favourite_usecases/user_favourite_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../app/app_preferences.dart';
import '../../../../../domain/models/favourite/favourite_models.dart';
import '../../../../../domain/usecases/favourite_usecases/delete_favourite_usecase.dart';

part 'get_favourite_event.dart';
part 'get_favourite_state.dart';
part 'get_favourite_bloc.freezed.dart';

class GetFavouriteBloc extends Bloc<GetFavouriteEvent, GetFavouriteState> {
  GetUserFavouriteUseCase getUserFavouriteUseCase;
  DeleteFavouriteUseCase deleteFavouriteUseCase;
  AppPreferences appPreferences;

  GetFavouriteBloc(
      {required this.getUserFavouriteUseCase,
      required this.appPreferences,
      required this.deleteFavouriteUseCase})
      : super(const GetFavouriteState.initial()) {
    List<FavouriteResponse> fullResponse = [];
    on<GetFavouriteEvent>((event, emit) async {
      await event.map(
        started: (_Started value) async {
          emit(const GetFavouriteState.loading());
          final failureOrSuccess =
              await getUserFavouriteUseCase.execute(value.id);
          failureOrSuccess.when((success) async {
            fullResponse.addAll(success);
            emit(GetFavouriteState.done(success));
          }, (error) {
            emit(const GetFavouriteState.error());
          });
        },
        filter: (value) {
          emit(const GetFavouriteState.searchLoading());
          List<FavouriteResponse> filteredData = [];
          if (value.name == null && value.page == -1) {
            emit(GetFavouriteState.done(fullResponse));
          } else {
            fullResponse.map((e) {
              //if the user filtered on name and page
              if (e.name!.contains(value.name ?? '') &&
                  e.pageName.index == value.page &&
                  e.pageName.index != -1) {
                filteredData.add(e);
              }
              //the user is selecting all pages and search for name
              else if (value.page == -1 &&
                  value.name != null &&
                  e.name!.contains(value.name ?? '')) {
                filteredData.add(e);
              }
              // if (e.pageName.index == value.page) {}
            }).toList();
            emit(GetFavouriteState.done(filteredData));
          }
        },
        delete: (_Delete value) async {
          emit(const GetFavouriteState.searchLoading());
          final failureOrSuccess =
              await deleteFavouriteUseCase.execute(value.id ?? 0);
          await failureOrSuccess.when((success) async {
            final failureOrSuccess =
                await getUserFavouriteUseCase.execute(value.userId ?? '');
            await failureOrSuccess.when((success) async {
              fullResponse.addAll(success);
              emit(GetFavouriteState.done(success));
            }, (error) {
              emit(const GetFavouriteState.error());
            });
          }, (error) {
            emit(const GetFavouriteState.error());
          });
        },
        reload: (_Reload value) async {
          emit(const GetFavouriteState.searchLoading());
          final failureOrSuccess =
              await getUserFavouriteUseCase.execute(value.id);
          await failureOrSuccess.when((success) async {
            fullResponse.addAll(success);
            emit(GetFavouriteState.done(success));
          }, (error) {
            emit(const GetFavouriteState.error());
          });
        },
      );
    });
  }
}
