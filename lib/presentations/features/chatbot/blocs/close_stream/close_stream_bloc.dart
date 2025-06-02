import 'dart:developer';

import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/close_stream_usecase.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'close_stream_bloc.freezed.dart';
part 'close_stream_state.dart';
part 'close_stream_event.dart';

class CloseStreamBloc extends Bloc<CloseStreamEvent, CloseStreamState> {
  final CloseStreamUsecase closeStreamUsecase;
  // final ChatHistoryCubit chatHistoryCubit;

  CloseStreamBloc(
    this.closeStreamUsecase,
    //  this.chatHistoryCubit
  ) : super(const CloseStreamState.initial()) {
    log("close initialized ===========================");
    on<CloseStreamEvent>((CloseStreamEvent event, emit) async {
      emit(const CloseStreamState.loading());

      log("close loading ===========================");
      await event.map(
        closeStream: (value) async {
          // emit(state.copyWith(
          //   isLoading: true,
          //   hasError: false,
          //   sendAnswerResponse: const SendAnswerResponseModel(),
          //   sendCandidateResponse: const SendAnswerResponseModel(),
          //   startStreamResponse: const StartStreamModel(),
          //   closeStreamResponse: const SendAnswerResponseModel(),
          // ));
          log("close before request ===========================");
          final failureOrSuccess = await closeStreamUsecase.execute(value.id);
          log('chatHistoryCubit: $failureOrSuccess');
          log("close after after ===========================");
          await failureOrSuccess.when((success) async {
            emit(CloseStreamState.done(response: success));
            // emit(
            //   state.copyWith(
            //     isLoading: false,
            //     hasError: false,
            //     closeStreamResponse: success,
            //   ),
            // );
          }, (error) {
            print('Error: ${error.message}');
            emit(CloseStreamState.error(
                (error.message != null && error.message!.isNotEmpty)
                    ? error.message!
                    : (error.detail ?? AppStrings().defaultError)));

            // emit(
            //   state.copyWith(
            //     isLoading: false,
            //     hasError: true,
            //     errorMessage: error.message,
            //     sendAnswerResponse: const SendAnswerResponseModel(),
            //     sendCandidateResponse: const SendAnswerResponseModel(),
            //     startStreamResponse: const StartStreamModel(),
            //     closeStreamResponse: const SendAnswerResponseModel(),
            //   ),
            // );
          });
        },
      );
    });
  }
}
