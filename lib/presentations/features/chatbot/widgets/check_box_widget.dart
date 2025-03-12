import 'package:ebla/presentations/features/chatbot/blocs/drobdown_cubit.dart';
import 'package:ebla/presentations/features/chatbot/blocs/messages_history_bloc/chat_history_cubit.dart';
import 'package:ebla/presentations/features/chatbot/utility/chatbot_enums.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget(
      {super.key,
      required this.text,
      required this.onPlatformTapAndAvatarIsOpen,
      required this.value,
      required this.isChecked,
      required this.scrollController});
  final String text;
  final ChatTypeEnum value;
  final bool isChecked;
  final ScrollController scrollController;
  final void Function()? onPlatformTapAndAvatarIsOpen;

  void scrollPageWhenCheck() {
    //--------------
    //to make the data shown dirctly when message send
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent + AppSizeH.s30,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
    //--------------
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        scrollPageWhenCheck();
        context.read<DropdownCubit>().selectOption(value);
        //----- switch the chat ----
        context.read<ChatHistoryCubit>().switchChat(value);
     
     //---- close stream ----
     if(onPlatformTapAndAvatarIsOpen !=null){
     onPlatformTapAndAvatarIsOpen!();

     }
        Navigator.pop(context);
      },
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (bool? newValue) {
              scrollPageWhenCheck();

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
