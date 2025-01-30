import 'dart:developer';

import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:ebla/domain/models/requests/chatbot_requests/chatbot_request_model.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/chatbot_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_bloc.freezed.dart';
part 'chat_state.dart';
part 'chat_event.dart';

class ChatBotBloc extends Bloc<SendMessageEvent, ChatBotState> {
  final ChatbotUsecase chatbotUsecase;
  // final ChatHistoryCubit chatHistoryCubit;

  ChatBotBloc(this.chatbotUsecase,
  //  this.chatHistoryCubit
   )
      : super(const ChatBotState.initial()) {
    on<SendMessageEvent>((SendMessageEvent event, emit) async {

      await event.map(
        started: (value) async {
          emit(const ChatBotState.loading());

          final requestBody = ChatbotRequestModel(
              streamId: value.message.streamId,
              messages: value.message.messages);
          print('requestBody: ${requestBody}');

          final failureOrSuccess = await chatbotUsecase.execute(requestBody);
   

          await failureOrSuccess.when((success) async {

            // print(
            //     'chatHistoryCubit: ${chatHistoryCubit.state.messages.length}');

            emit(ChatBotState.done(response: success));
          }, (error) {
            print('Error: ${error.message}');
            emit(ChatBotState.error(error.message));
          });
        },
      );
    });

  }
}
