import 'package:bloc/bloc.dart';
import 'package:ebla/app/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../app/app_preferences.dart';
import '../../../../../app/depndency_injection.dart';
import '../../../../../domain/usecases/CMS/app_settings_usecase.dart';

part 'guest_token_bloc.freezed.dart';
part 'guest_token_event.dart';
part 'guest_token_state.dart';

class GuestTokenBloc extends Bloc<GuestTokenEvent, GuestTokenState> {
  AppPreferences appPreferences;
  AppSettingsUseCase appSettingsUseCase;

  GuestTokenBloc(
      {required this.appPreferences, required this.appSettingsUseCase})
      : super(const _Initial()) {
    on<GuestTokenEvent>((event, emit) async {
      await event.map(
        tokenGuest: (value) async {
          emit(const GuestTokenState.loading());
          var token = await appPreferences.getUserToken();
          
          if (token.isEmpty) {
            await appPreferences.setUserToken(Constant.guestToken);
            await resetAllModules();
            emit(const GuestTokenState.success());
          } else {
            emit(const GuestTokenState.initial());
          }
        },
      );
    });
  }
}
