import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/usecases/auth_usecase/forget_password_usecase.dart';

part 'forget_password_bloc.freezed.dart';
part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  final ForgetPasswordUseCase forgetPasswordUseCase;

  ForgetPasswordBloc(this.forgetPasswordUseCase)
      : super(const ForgetPasswordState.initial()) {
    on<ForgetPasswordEvent>((event, emit) async {
      await event.map(started: (value) async {
        emit(const ForgetPasswordState.loading());
        final failureOrSuccess =
            await forgetPasswordUseCase.execute(value.email);
        failureOrSuccess.when((success) async {
          emit(ForgetPasswordState.done(success.token));
        }, (error) {
          emit(ForgetPasswordState.error(
            error.errors[0].message,
          ));
        });
      });
    });
  }
}
