import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:ebla/domain/models/chatboot/new_chatbot_response_models/new_chatbot_response_model.dart';
import 'package:ebla/domain/models/requests/chatbot_requests/chatbot_request_model.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/chatbot_usecase.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/platform_chatbot_usecases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_bloc.freezed.dart';
part 'chat_event.dart';
part 'chat_state.dart';

class ChatBotBloc extends Bloc<SendMessageEvent, ChatBotState> {
  final ChatbotUsecase chatbotUsecase;
  final PlatformChatbotUsecases platformChatbotUsecases;

  StreamSubscription<FullNewChatbotResponseModel>? _streamSubscription;

  ChatBotBloc(this.chatbotUsecase, this.platformChatbotUsecases)
      : super(const ChatBotState.initial()) {
    on<SendMessageEvent>(_handleEvent);
    on<_StreamDataReceived>(_handleStreamData);
    // on<_StreamComplete>(_handleStreamComplete);
  }

  Future<void> _handleEvent(
      SendMessageEvent event, Emitter<ChatBotState> emit) async {
    await event.map(
      started: (value) async {
        emit(const ChatBotState.loading());

        final failureOrSuccess = await chatbotUsecase.execute(value.message);

        await failureOrSuccess.when(
          (success) async {
            await _streamSubscription?.cancel();

            _streamSubscription = success.listen(
              (chunk) {
                add(_StreamDataReceived(chunk.data));
              },
              onError: (error) {
                if (!isClosed) addError(error);
              },
              onDone: () {
                if (!isClosed) {
                  add(const _StreamComplete());
                }
              },
              cancelOnError: true,
            );
          },
          (error) {
            emit(ChatBotState.error(error.message));
          },
        );
      },
      platformStarted: (value) async {
        emit(const ChatBotState.loading());

        final failureOrSuccess =
            await platformChatbotUsecases.execute(value.platformMessage);

        await failureOrSuccess.when(
          (success) async {
            emit(ChatBotState.done(platformResponse: success));
          },
          (error) {
            emit(ChatBotState.error(error.message));
          },
        );
      },
      streamDataReceived: (_) async {}, // dummy handler
      streamComplete: (_) async {}, // dummy handler
    );
  }

  void _handleStreamData(
      _StreamDataReceived event, Emitter<ChatBotState> emit) {
    if (isClosed) return;

    final data = event.chunk;

    // Always update the state with the latest chunk
    if (data.event == 'chunks') {
      final currentState = state;
      if (currentState is _Streaming) {
        emit(currentState.copyWith(
          accumulatedContent:
              currentState.accumulatedContent + data.data.content,
        ));
      } else {
        // Start a new streaming state if we're not already streaming
        emit(ChatBotState.streaming(
          accumulatedContent: data.data.content,
          citations: data.data.citations ?? [],
          conversationId: data.data.conversationId,
          streamId: data.data.streamId,
          userId: data.data.userId,
          actionResults: data.data.actionResults,
        ));
      }
    }
    // When we get a complete event, update with final data
    else if (data.event == 'complete') {
      emit(ChatBotState.done(
        response: data,
      ));
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
