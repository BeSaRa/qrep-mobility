import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/chat_faq_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_faq_bloc.freezed.dart';
part 'chat_faq_state.dart';
part 'chat_faq_event.dart';

class ChatFaqBloc extends Bloc<ChatFaqEvent, ChatFaqState> {
  final Chatfaqusecase chatfaqusecase;

  ChatFaqBloc(this.chatfaqusecase,)
      : super(const ChatFaqState.initial()) {
    on<ChatFaqEvent>((ChatFaqEvent event, emit) async {
      await event.map(
        started: (value) async {
          emit(const ChatFaqState.loading());

          final String botName = value.botName;
          final failureOrSuccess = await chatfaqusecase.execute(botName);
          await failureOrSuccess.when((success) async {
            emit(ChatFaqState.done(response: success));
          }, (error) {
            emit(ChatFaqState.error(error.message));
          });
        },
      );
    });
  }
}
