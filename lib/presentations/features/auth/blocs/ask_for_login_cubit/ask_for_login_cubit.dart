import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/auth/auth_models.dart';

import '../../../../../domain/usecases/auth_usecase/ask_for_login_usecase.dart';

part 'ask_for_login_state.dart';

class AskForLoginCubit extends Cubit<AskForLoginState> {
  final AskForLoginUseCase askForLoginUseCase;
  AskForLoginCubit(this.askForLoginUseCase) : super(AskForLoginInitial());

  Future<void> askForLogin() async {}
}
