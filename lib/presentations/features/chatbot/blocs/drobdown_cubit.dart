import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum OptionSelected { qatarRealEstatePlatform, authority }

class DropdownCubit extends Cubit<OptionSelected> {
  DropdownCubit() : super(OptionSelected.qatarRealEstatePlatform);

  void selectOption(OptionSelected option) {
    emit(option);
  }
}
