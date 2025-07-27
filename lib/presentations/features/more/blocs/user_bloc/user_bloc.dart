import 'package:bloc/bloc.dart';
import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/domain/models/cms_models/user/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../app/app_preferences.dart';
import '../../../../../app/constants.dart';
import '../../../../../app/notifications/firebase_helper.dart';
import '../../../../../domain/models/cms_models/user/requests/update_info_model.dart';
import '../../../../../domain/usecases/usecases.dart';

part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserUsecase userUsecase;
  UpdateInfoUsecase updateInfoUsecase;
  UpdateFcmTokenUseCase updateFcmUseCase = instance<UpdateFcmTokenUseCase>();
  final GetCmsTokenUseCase getCmsTokenUsecase;
  final AppPreferences appPreferences;
  UserModel? user;

  UserBloc({
    required this.userUsecase,
    required this.updateInfoUsecase,
    required this.getCmsTokenUsecase,
    required this.appPreferences,
  }) : super(const UserState.loading()) {
    on<UserEvent>((event, emit) async {
      await event.map(getUserInfo: (value) async {
        emit(const UserState.loading());
        final failureOrUser = await userUsecase.execute();
        failureOrUser.when((userInfo) {
          user = userInfo.data;
          emit(UserState.loaded(user: userInfo));
        }, (error) {
          emit(UserState.error(message: error.message));
        });
      },
      
       updateUserInfo: (value) async {

        emit(const UserState.loading());
        final failureOrUser = await updateInfoUsecase.execute(
            (id: value.id, requestUpdateInfo: value.requestUpdateInfo));
        failureOrUser.when((userInfo) async {
          user = userInfo.data;
          emit(UserState.loaded(user: userInfo));
          String fcmToken = await registerFCMToken();
          FcmInput input = FcmInput(id: userInfo.data.id, fcm: fcmToken);
          updateFcmUseCase.execute(input);
        }, (error) {
          emit(UserState.error(message: error.errors[0].message));
        });
      }, initialUser: (value) {
        userUsecase = instance<UserUsecase>();
        emit(const UserState.loading());
      }, guestUser: (value) async {
        final getTokenSuccess = await getCmsTokenUsecase.execute();
        getTokenSuccess.when((success) {
          appPreferences.setCmsUserToken(Constant.guestToken);
          appPreferences.setUserToken(success);
          resetAllModules();
          emit(const UserState.initial());
        }, (error) {});
      }, updateFcm: (_GetUpdateFcmEvent value) async {
        String fcmToken = await registerFCMToken();
        FcmInput input = FcmInput(id: value.useId, fcm: fcmToken);
        updateFcmUseCase.execute(input);
      });
    });
  }
}
