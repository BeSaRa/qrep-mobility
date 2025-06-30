
import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/stop_render_usecase.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stop_render_bloc.freezed.dart';
part 'stop_render_state.dart';
part 'stop_render_event.dart';

class StopRenderBloc extends Bloc<StopRenderEvent, StopRenderState> {
  final StopRenderUsecase stopRenderUsecase;

  StopRenderBloc(
    this.stopRenderUsecase,
  ) : super(const StopRenderState.initial()) {
    on<StopRenderEvent>((StopRenderEvent event, emit) async {
      emit(const StopRenderState.loading());

      await event.map(
        stopRender: (value) async {
          final failureOrSuccess = await stopRenderUsecase.execute(value.id);
          await failureOrSuccess.when((success) async {
            emit(StopRenderState.done(response: success));
          }, (error) {
            emit(StopRenderState.error(
                (error.message != null && error.message!.isNotEmpty)
                    ? error.message!
                    : (error.detail ?? AppStrings().defaultError)));
          });
        },
      );
    });
  }
}
