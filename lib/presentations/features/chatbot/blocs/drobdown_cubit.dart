import 'package:bloc/bloc.dart';
import 'package:ebla/presentations/features/chatbot/utility/chatbot_enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropdownCubit extends Cubit<ChatTypeEnum> {
  DropdownCubit() : super(ChatTypeEnum.authority);

  void selectOption(ChatTypeEnum option) {
    emit(option);
  }
}
