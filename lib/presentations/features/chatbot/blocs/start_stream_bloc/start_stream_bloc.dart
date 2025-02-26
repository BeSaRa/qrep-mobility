
import 'dart:developer';

import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/start_stream_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'start_stream_bloc.freezed.dart';
part 'start_stream_state.dart';
part 'start_stream_event.dart';

class StartStreamBloc extends Bloc<StartStreamEvent, StartStreamState> {
  final StartStreamUsecase startStreamUsecase;

  StartStreamBloc(
    this.startStreamUsecase,


    //  this.chatHistoryCubit
  ) : super(const StartStreamState.initial()) {
    on<StartStreamEvent>((StartStreamEvent event, emit) async {
      await event.map(
        started: (value) async {
          emit(const StartStreamState.loading());
          //----------------------------------
          final failureOrSuccess = await startStreamUsecase.execute();
          await failureOrSuccess.when((success) async {
            log('success.data!.id: ${success.data!.id}');
            emit(StartStreamState.done(startStreamResponse: success));
          }, (error) {
            emit(StartStreamState.error(error.message));
          });
        },
      );
    });
  }
}
