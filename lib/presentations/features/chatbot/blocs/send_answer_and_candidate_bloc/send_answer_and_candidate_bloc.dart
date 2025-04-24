import 'dart:developer';
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

  int _totalCandidates = 0;
  int _completedCandidates = 0;
  List<SendAnswerResponseModel> responses = [];

  SendAnswerAndCandidateBloc(
    this.sendAnswerUsecase,
    this.sendCandidateUsecase,
  ) : super(const SendAnswerAndCandidateState.initial()) {
    on<SendAnswerAndCandidateEvent>((event, emit) async {
      await event.map(
        sendAnswer: (value) async {
          emit(const SendAnswerAndCandidateState.loading());
          _completedCandidates = 0;
          responses.clear();
          final result = await sendAnswerUsecase.execute(value.request);
          await result.when(
            (success) async {
              // i didn't emit the state because i want to emit it just once, and i did that in send candidate
              // emit(SendAnswerAndCandidateState.done(
              //     startStreamResponse: success));
            },
            (error) {
              emit(SendAnswerAndCandidateState.error(
                  error.message ?? error.detail ?? AppStrings().defaultError));
            },
          );
        },
        sendCandidate: (value) async {
          _totalCandidates++; // count the request

          final result = await sendCandidateUsecase.execute(value.request);
          await result.when(
            (success) async {
              _completedCandidates++;
              responses.add(success);
              log("total candidate from bloc: ${_completedCandidates} / ${_totalCandidates} ");
              if (_completedCandidates == _totalCandidates) {
                _completedCandidates = 0;
                _totalCandidates = 0;
                emit(SendAnswerAndCandidateState.done(
                    startStreamResponse: success));
              }
              // You could emit intermediate state if needed too
            },
            (error) {
              emit(SendAnswerAndCandidateState.error(
                  error.message ?? error.detail ?? AppStrings().defaultError));
            },
          );
        },
      );
    });
  }
}
