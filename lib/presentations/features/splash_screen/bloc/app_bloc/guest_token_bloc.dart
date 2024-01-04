import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:ebla/app/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../../app/app_preferences.dart';
import '../../../../../app/depndency_injection.dart';
import '../../../../../domain/models/cms_models/app_settings/app_settings.dart';
import '../../../../../domain/usecases/CMS/app_settings_usecase.dart';

part 'guest_token_bloc.freezed.dart';
part 'guest_token_event.dart';
part 'guest_token_state.dart';

class GuestTokenBloc extends Bloc<GuestTokenEvent, GuestTokenState> {
  final AppPreferences appPreferences;
  final AppSettingsUseCase appSettingsUseCase;

  GuestTokenBloc(
      {required this.appPreferences, required this.appSettingsUseCase})
      : super(const _Initial()) {
    AppSettingsResponse projectDataResponse;
    on<GuestTokenEvent>((event, emit) async {
      await event.map(
        tokenGuest: (value) async {
          emit(const GuestTokenState.loading());
          var token = await appPreferences.getUserToken();
          PackageInfo packageInfo = await PackageInfo.fromPlatform();
          bool update = false;
          bool canUpdate = false;
          final failureOrSuccess = await appSettingsUseCase.execute();
          failureOrSuccess.when((success) async {
            projectDataResponse = success;
            if (token.isEmpty) {
              await appPreferences.setUserToken(Constant.guestToken);
              await resetAllModules();
            }
            String version = packageInfo.version;
            String buildNumber = packageInfo.buildNumber;
            if (Platform.isAndroid) {
              update = int.parse(buildNumber) < success.data.android_version &&
                  success.data.force_update;
              canUpdate =
                  int.parse(buildNumber) < success.data.android_version &&
                      success.data.force_update == false;
            } else {
              update = version != success.data.ios_version &&
                  success.data.force_update;
              canUpdate = version != success.data.ios_version &&
                  success.data.force_update == false;
            }
            if (update == true) {
              emit(const GuestTokenState.shouldUpdate());
            } else {
              emit(GuestTokenState.success(canUpdate));
            }
          }, (error) {
            emit(const GuestTokenState.initial());
          });
        },
      );
    });
  }
}
