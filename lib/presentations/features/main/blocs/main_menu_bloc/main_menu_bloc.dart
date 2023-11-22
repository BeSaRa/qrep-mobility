import 'package:bloc/bloc.dart';
import 'package:ebla/domain/usecases/CMS/user_usecases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/cms_models/main_menu_models/main_menu_models.dart';

part 'main_menu_event.dart';
part 'main_menu_state.dart';
part 'main_menu_bloc.freezed.dart';

class MainMenuBloc extends Bloc<MainMenuEvent, MainMenuState> {
  final MainMenuUsecase mainMenuUsecase;
  MainMenuResponse mainMenu = MainMenuResponse();
  MainMenuBloc({required this.mainMenuUsecase})
      : super(const MainMenuState.loading()) {
    on<MainMenuEvent>((event, emit) async {
      await event.map(
        getMainMenu: (value) async {
          emit(const MainMenuState.loading());
          final failureOrSuccess = await mainMenuUsecase.execute();
          failureOrSuccess.when((success) {
            mainMenu = success;
            emit(MainMenuState.success(success: success));
          }, (error) {
            emit(MainMenuState.error(message: error.errors[0].message));
          });
        },
      );
    });
  }
}
