import 'package:bloc/bloc.dart';
import 'package:ebla/app/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../app/app_preferences.dart';
import '../../../../../app/depndency_injection.dart';
import '../../../../../domain/usecases/usecases.dart';

part 'guest_token_bloc.freezed.dart';
part 'guest_token_event.dart';
part 'guest_token_state.dart';

class GuestTokenBloc extends Bloc<GuestTokenEvent, GuestTokenState> {
  final AppPreferences appPreferences;
  final AppSettingsUseCase appSettingsUseCase;
  final GetCmsTokenUseCase getCmsTokenUsecase;

  GuestTokenBloc({
    required this.appPreferences,
    required this.appSettingsUseCase,
    required this.getCmsTokenUsecase,
  }) : super(const _Initial()) {
    // AppSettingsResponse projectDataResponse;
    on<GuestTokenEvent>((event, emit) async {
      await event.map(
        tokenGuest: (value) async {
          //1-  should get the token from cms which will be the backend token
          //2-  should check if the user is logged in or not
          //3-  should check the app setting if should update
          //for the scenario check the app preference for the token if null then get the

          emit(const GuestTokenState.loading());
          bool token = appPreferences.getUserLoggedIn();
          // PackageInfo packageInfo = await PackageInfo.fromPlatform();
          // bool update = false;
          // bool canUpdate = false;
          if (!token) {
            final getTokenSuccess = await getCmsTokenUsecase.execute();
            getTokenSuccess.when((success) {
              appPreferences.setCmsUserToken(Constant.guestToken);
              appPreferences.setUserToken(success);
              resetAllModules();
            }, (error) {});
          }
          // final failureOrSuccess = await appSettingsUseCase.execute();
          // failureOrSuccess.when((success) async {
          //   projectDataResponse = success;
          //   String version = packageInfo.version;
          //   String buildNumber = packageInfo.buildNumber;
          //   if (Platform.isAndroid) {
          //     update = int.parse(buildNumber) < success.data.android_version &&
          //         success.data.force_update;
          //     canUpdate =
          //         int.parse(buildNumber) < success.data.android_version &&
          //             success.data.force_update == false;
          //   } else {
          //     update = version != success.data.ios_version &&
          //         success.data.force_update;
          //     canUpdate = version != success.data.ios_version &&
          //         success.data.force_update == false;
          //   }
          //   if (update == true) {
          //     emit(const GuestTokenState.shouldUpdate());
          //   } else {
          //     successState(canUpdate);
          //   }
          // }, (error) {
          //   emit(const GuestTokenState.initial());
          // });
          successState(false);
        },
      );
    });
  }

  void successState(bool canUpdate) {
    emit(GuestTokenState.success(canUpdate));
  }
}
