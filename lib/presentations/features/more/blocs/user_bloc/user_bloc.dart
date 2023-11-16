import 'package:bloc/bloc.dart';
import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/domain/models/cms_models/user/user_model.dart';
import 'package:ebla/domain/usecases/CMS/user_usecases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserUsecase userUsecase;
  UserModel? user;
  UserBloc({required this.userUsecase}) : super(const UserState.loading()) {
    on<UserEvent>((event, emit) async {
      await event.map(
        getUserInfo: (value) async {
          emit(const UserState.loading());
          final failureOrUser = await userUsecase.execute();
          failureOrUser.when((userInfo) {
            user = userInfo.data;
            emit(UserState.loaded(user: userInfo));
          }, (error) {
            emit(UserState.error(message: error.message));
          });
        },
        initialUser: (_GetInitialUserEvent value) {
          userUsecase = instance<UserUsecase>();
          emit(const UserState.loading());
        },
      );
    });
  }
}
