import 'package:ebla/presentations/features/chatbot/blocs/drobdown_cubit.dart';
import 'package:ebla/presentations/features/chatbot/blocs/messages_history_bloc/chat_history_cubit.dart';

class RouteExtras {
  final ChatHistoryCubit chatHistoryCubit;
  final DropdownCubit dropdownCubit;

  RouteExtras({
    required this.chatHistoryCubit,
    required this.dropdownCubit,
  });
}
