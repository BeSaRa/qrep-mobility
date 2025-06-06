import 'package:bloc/bloc.dart';
import '../../../resources/resources.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit(super.initialState);

  int currentPage = 0;
  List<String> paths = [
    RoutesNames.home,
    RoutesNames.services,
    RoutesNames.chatbot,
    RoutesNames.map,
    RoutesNames.indicators,
  ];

  // List<Future<void>> diMethod = [
  //   initHomeModule(),
  //   initRentModule(),
  //   initSellModule(),
  //   initMortgageModule(),
  //   initLoginModule()
  // ];
  void changePage(int index) {
    print("in change page $index");
    currentPage = index;
    emit(index);
  }
}
