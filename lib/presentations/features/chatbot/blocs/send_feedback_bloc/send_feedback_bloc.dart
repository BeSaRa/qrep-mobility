import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/send_feedback_usecase.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_feedback_bloc.freezed.dart';
part 'send_feedback_state.dart';
part 'send_feedback_event.dart';

class SendFeedbackBloc extends Bloc<SendFeedbackEvent, SendFeedbackState> {
  final SendFeedbackUsecase sendFeedbackUsecase;

  SendFeedbackBloc(
    this.sendFeedbackUsecase,
  ) : super(const SendFeedbackState.initial()) {
    on<SendFeedbackEvent>((SendFeedbackEvent event, emit) async {
      await event.map(
        //---------------------------------------------------------------------------------------------
        sendFeedBack: (value) async {
          emit(const SendFeedbackState.loading());
          final requestBody = value.request;
          final failureOrSuccess = await sendFeedbackUsecase.execute(requestBody);
          await failureOrSuccess.when((success) async {
            emit(SendFeedbackState.done(sendFeedbackResponse: success,isRated: true));
          }, (error) {
            emit(SendFeedbackState.error(
                error.message ?? error.detail ?? AppStrings().defaultError));
          });
        },

      );
    });
  }
}
