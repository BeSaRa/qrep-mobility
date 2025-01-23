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
          print('failureOrSuccess: ${failureOrSuccess}');
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

    // (_onSendMessageEvent);
  }
}
//   // Handler for SendMessageEvent
//   Future<void> _onSendMessageEvent(SendMessageEvent event, emit) async {
  
// }



// import 'dart:async';
// import 'dart:developer';

// import 'package:chatgpt_app/blocs/chat_history_cubit.dart';
// import 'package:chatgpt_app/models/chat_message_request.dart';
// import 'package:chatgpt_app/services/elai_api_service.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'chat_event.dart';
// import 'chat_state.dart';

// class ChatBloc extends Bloc<ChatEvent, ChatState> {
//   final ElaiApiService _elaiApiService;
//   final ChatHistoryCubit _chatHistoryCubit;

//   ChatBloc(this._elaiApiService, this._chatHistoryCubit) : super(ChatInitialState()) {
//     on<SendMessageEvent>(_onSendMessageEvent);
//   }

//   Future<void> _onSendMessageEvent(
//       SendMessageEvent event, Emitter<ChatState> emit) async {
//     emit(ChatLoadingState());

//     // Add the user's message to history
//     final userMessage = event.messageList.first;
//     _chatHistoryCubit.addMessage(userMessage);

//     try {
//       // Create a stream controller to handle bot responses
//       final responseStream = StreamController<String>();

//       // Listen to the stream and emit states
//       await emit.forEach<String>(
//         responseStream.stream,
//         onData: (botMessage) {
//           // Add bot's response to history
//           _chatHistoryCubit.addMessage(ChatMessageRequestModel(
//             role: 'assistant',
//             content: botMessage,
//           ));
//           return ChatLoadedState(botMessage);
//         },
//         onError: (error, stackTrace) {
//           log('Error in response stream: $error');
//           return ChatErrorState(error.toString());
//         },
//       );

//       // Request the assistant's response from Elai API
//       await _elaiApiService.getElaiResponse(event.messageList, responseStream);

//       // Close the stream when done
//       await responseStream.close();
//     } catch (e, stackTrace) {
//       log('Error in SendMessageEvent handler: $e', stackTrace: stackTrace);
//       emit(ChatErrorState(e.toString()));
//     }
//   }
// }
