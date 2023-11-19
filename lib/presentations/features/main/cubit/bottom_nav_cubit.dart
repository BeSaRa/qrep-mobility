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

  // List<Future<void>> diMethod = [
  //   initHomeModule(),
  //   initRentModule(),
  //   initSellModule(),
  //   initMortgageModule(),
  //   initLoginModule()
  // ];
  void changePage(int index) {
    currentPage = index;
    emit(currentPage);
  }
}
