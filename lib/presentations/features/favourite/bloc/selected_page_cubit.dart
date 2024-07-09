import 'package:bloc/bloc.dart';
import 'package:ebla/presentations/features/favourite/fav_view.dart';

class SelectedPageCubit extends Cubit<int> {
  SelectedPageCubit(super.initialState);

  PagesNames page = PagesNames(-1, "الكل", "ALL");
  void save(int val) => emit(val);

  void savePage(PagesNames newPage) {
    page = newPage;
    emit(newPage.num);
  }
}
