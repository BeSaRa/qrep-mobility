import 'package:bloc/bloc.dart';

class ExpandedTileIndexCubit extends Cubit<int> {
  ExpandedTileIndexCubit() : super(-1);

  void setIndex(int index) {
    emit(index);
  }
}
