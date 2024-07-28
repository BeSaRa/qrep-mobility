import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/favourite/favourite_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/usecases/favourite_usecases/create_favourite_usecase.dart';
import '../../../../resources/resources.dart';

part 'create_favourite_event.dart';
part 'create_favourite_state.dart';
part 'create_favourite_bloc.freezed.dart';

class CreateFavouriteBloc
    extends Bloc<CreateFavouriteEvent, CreateFavouriteState> {
  CreateFavouriteUseCase createFavouriteUseCase;

  CreateFavouriteBloc({required this.createFavouriteUseCase})
      : super(const CreateFavouriteState.initial()) {
    on<CreateFavouriteEvent>((event, emit) async {
      await event.map(started: (value) async {
        emit(const CreateFavouriteState.loading());
        final failureOrSuccess =
            await createFavouriteUseCase.execute(value.body);
        failureOrSuccess.when((success) async {
          emit(const CreateFavouriteState.done());
        }, (error) {
          emit(CreateFavouriteState.error(AppStrings().somethingWentWrong));
        });
      });
    });
  }
}
