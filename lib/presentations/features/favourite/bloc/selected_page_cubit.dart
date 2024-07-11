import 'package:bloc/bloc.dart';

import '../fav_widgets.dart';

class SelectedPageCubit extends Cubit<int> {
  SelectedPageCubit(super.initialState);

  PagesNames page = PagesNames(-1, "الكل", "ALL");
  void save(int val) => emit(val);

  void savePage(PagesNames newPage) {
    page = newPage;
    emit(newPage.num);
  }
}
