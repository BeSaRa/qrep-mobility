import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentBoardCubit extends Cubit<int> {
  CurrentBoardCubit() : super(0);

  void updateIndex(int index) => emit(index);
  void next() => emit(state + 1);
  void skipToEnd(int total) => emit(total - 1);
}
