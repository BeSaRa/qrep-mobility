import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../app/app_preferences.dart';
import '../../../../../app/depndency_injection.dart';

part 'guest_token_event.dart';
part 'guest_token_state.dart';
part 'guest_token_bloc.freezed.dart';

class GuestTokenBloc extends Bloc<GuestTokenEvent, GuestTokenState> {
  AppPreferences appPreferences;
  GuestTokenBloc({required this.appPreferences}) : super(const _Initial()) {
    on<GuestTokenEvent>((event, emit) async {
      await event.map(
        tokenGuest: (value) async {
          emit(const GuestTokenState.loading());
          var token = await appPreferences.getUserToken();
          if (token.isEmpty) {
            await appPreferences
                .setUserToken("lyHWSTHj1SBm9IRECnLAHviNHnXGaS27");
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
