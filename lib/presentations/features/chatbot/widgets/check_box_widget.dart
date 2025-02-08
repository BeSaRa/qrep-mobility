import 'package:ebla/presentations/features/chatbot/blocs/drobdown_cubit.dart';
import 'package:ebla/presentations/features/chatbot/blocs/messages_history_bloc/chat_history_cubit.dart';
import 'package:ebla/presentations/features/chatbot/utility/chatbot_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget(
      {super.key,
      required this.text,
      required this.value,
      required this.isChecked});
  final String text;
  final ChatTypeEnum value;
  final bool isChecked;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<DropdownCubit>().selectOption(value);
        //----- switch the chat ----
          context.read<ChatHistoryCubit>().switchChat(value);
        Navigator.pop(context);
      },
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (bool? newValue) {
              context.read<DropdownCubit>().selectOption(value);
              //----- switch the chat ----
          context.read<ChatHistoryCubit>().switchChat(value);
              Navigator.pop(context);
            },
          ),
          Flexible(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
