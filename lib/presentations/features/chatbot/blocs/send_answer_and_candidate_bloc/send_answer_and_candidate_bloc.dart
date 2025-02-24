import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/send_answer_usecase.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/send_candidate_usecase.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_answer_and_candidate_bloc.freezed.dart';
part 'send_answer_and_candidate_state.dart';
part 'send_answer_and_candidate_event.dart';

class SendAnswerAndCandidateBloc
    extends Bloc<SendAnswerAndCandidateEvent, SendAnswerAndCandidateState> {
  final SendAnswerUsecase sendAnswerUsecase;
  final SendCandidateUsecase sendCandidateUsecase;

  SendAnswerAndCandidateBloc(
    this.sendAnswerUsecase,
    this.sendCandidateUsecase,

  ) : super(const SendAnswerAndCandidateState.initial()) {
    on<SendAnswerAndCandidateEvent>(
        (SendAnswerAndCandidateEvent event, emit) async {
      await event.map(
        //---------------------------------------------------------------------------------------------
        sendAnswer: (value) async {
          emit(const SendAnswerAndCandidateState.loading());
          final requestBody = value.request;
          final failureOrSuccess = await sendAnswerUsecase.execute(requestBody);
          await failureOrSuccess.when((success) async {
            emit(
                SendAnswerAndCandidateState.done(startStreamResponse: success));
          }, (error) {
            emit(SendAnswerAndCandidateState.error(
                error.message ?? error.detail ?? AppStrings().defaultError));
          });
        },
        sendCandidate: (value) async {
          emit(const SendAnswerAndCandidateState.loading());

          final requestBody = value.request;
          final failureOrSuccess =
              await sendCandidateUsecase.execute(requestBody);
          await failureOrSuccess.when((success) async {
            emit(
                SendAnswerAndCandidateState.done(startStreamResponse: success));
          }, (error) {
            emit(SendAnswerAndCandidateState.error(
                error.message ?? error.detail ?? AppStrings().defaultError));
          });
        },
      );
    });
  }
}
