import 'package:bloc/bloc.dart';

import '../../../resources/resources.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit(super.initialState);
  int currentPage = 0;
  List<String> paths = [
    RoutesNames.home,
    RoutesNames.rent,
    RoutesNames.sales,
    RoutesNames.mortgage,
    RoutesNames.more,
  ];
  void changePage(int index) {
    currentPage = index;
    emit(currentPage);
  }
}
