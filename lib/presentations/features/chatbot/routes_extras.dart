import 'package:ebla/presentations/features/chatbot/blocs/drobdown_cubit.dart';
import 'package:ebla/presentations/features/chatbot/blocs/messages_history_bloc/chat_history_cubit.dart';
import 'package:ebla/presentations/features/chatbot/blocs/record_cubit/voice_cubit.dart';
import 'package:ebla/presentations/features/chatbot/blocs/send_feedback_bloc/send_feedback_bloc.dart';

class RouteExtras {
  final ChatHistoryCubit chatHistoryCubit;
  final DropdownCubit dropdownCubit;
  final SendFeedbackBloc sendFeedbackBloc;
  final VoiceCubit voiceCubit;

  RouteExtras({
    required this.chatHistoryCubit,
    required this.dropdownCubit,
    required this.sendFeedbackBloc,
    required this.voiceCubit,
  });
}
