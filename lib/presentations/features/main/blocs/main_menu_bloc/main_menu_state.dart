part of 'main_menu_bloc.dart';

@freezed
class MainMenuState with _$MainMenuState {
  const factory MainMenuState.loading() = _Loading;
  const factory MainMenuState.success({
    required MainMenuResponse success,
  }) = _Success;
  const factory MainMenuState.error({required String message}) = _Error;
}
