import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:ebla/domain/models/requests/chatbot_requests/chatbot_request_model.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/send_answer_usecase.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/send_candidate_usecase.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/start_stream_usecase.dart';


import 'stream_event.dart';
import 'stream_state.dart';

class StreamBloc extends Bloc<StreamEvent, StreamState> {
  final StartStreamUsecase startStreamUsecase;
  final SendAnswerUsecase sendAnswerUsecase;
  final SendCandidateUsecase sendCandidateUsecase;

  StreamBloc({
    required this.startStreamUsecase,
    required this.sendAnswerUsecase,
    required this.sendCandidateUsecase,
  }) : super(StreamInitial()) {
    on<StartStreamRequested>(_onStartStream);
    on<SendAnswerToBackend>(_onSendAnswerToBackend);
    on<SendCandidateToBackend>(_onSendCandidateToBackend);
    on<StreamFailed>(_onStreamFailed);
  }

  Future<void> _onStartStream(
    StartStreamRequested event,
    Emitter<StreamState> emit,
  ) async {
    emit(StreamLoading());

    try {
      final result = await startStreamUsecase.execute();
      StartStreamModel startStreamModel = const StartStreamModel();

      await result.when((success) async {
        startStreamModel = success;
        emit(StreamStarted(startStreamModel));
      }, (error) {
        emit(StreamError(error.message));
      });
    } catch (e) {
      emit(StreamError(e.toString()));
    }
  }
  Future<void> _onSendAnswerToBackend(
    SendAnswerToBackend event,
    Emitter<StreamState> emit,
  ) async {
    try {
      final sendAnswerResult =
          await sendAnswerUsecase.execute(MainSendAnswerRequestModelById(
        id: event.streamId,
        request: MainSendAnswerRequestModel(
          answer: SendAnswerRequestModel(
            sdp: event.sdp,
            type: event.type,
          ),
        ),
      ));

      sendAnswerResult.when(
        (success) => log("Answer sent successfully"),
        (error) => throw Exception(error.message ?? "Send answer failed"),
      );
    } catch (e) {
      emit(StreamError('Failed to send answer: ${e.toString()}'));
    }
  }

  Future<void> _onSendCandidateToBackend(
    SendCandidateToBackend event,
    Emitter<StreamState> emit,
  ) async {
    try {
      final sendCandidateResult =
          await sendCandidateUsecase.execute(MainSendCandidateRequestModelById(
        id: event.streamId,
        request: MainSendCandidateRequestModel(
          candidate: SendCandidateRequestModel(
            candidate: event.candidate,
            sdpMid: event.sdpMid,
            sdpMLineIndex: event.sdpMLineIndex,
          ),
        ),
      ));

      sendCandidateResult.when(
        (success) => log("Candidate sent successfully"),
        (error) => log("Error sending candidate: ${error.message}"),
      );
    } catch (e) {
      log('Failed to send candidate: ${e.toString()}');
    }
  }

  void _onStreamFailed(StreamFailed event, Emitter<StreamState> emit) {
    emit(StreamError(event.message));
  }
}