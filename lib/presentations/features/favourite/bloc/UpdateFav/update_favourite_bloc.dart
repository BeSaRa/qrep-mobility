import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/favourite/favourite_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/usecases/favourite_usecases/update_favourite_usecase.dart';

part 'update_favourite_event.dart';
part 'update_favourite_state.dart';
part 'update_favourite_bloc.freezed.dart';

class UpdateFavouriteBloc
    extends Bloc<UpdateFavouriteEvent, UpdateFavouriteState> {
  UpdateFavouriteUseCase updateFavouriteUseCase;
  UpdateFavouriteBloc({required this.updateFavouriteUseCase})
      : super(const UpdateFavouriteState.initial()) {
    on<UpdateFavouriteEvent>((event, emit) async {
      await event.map(
        started: (value) async {
          emit(const UpdateFavouriteState.loading());
          final failureOrSuccess =
              await updateFavouriteUseCase.execute(value.body);
          await failureOrSuccess.when((success) async {
            emit(const UpdateFavouriteState.done());
          }, (error) {
            emit(UpdateFavouriteState.error(error.message));
          });
        },
      );
    });
  }
}
