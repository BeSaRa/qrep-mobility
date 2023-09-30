

import 'package:ebla/presentations/features/home/home_view.dart';
import 'package:ebla/presentations/features/more/more_view.dart';
import 'package:ebla/presentations/features/mortagage/mortgage_view.dart';
import 'package:ebla/presentations/features/rent/rent_view.dart';
import 'package:ebla/presentations/features/sell/sell_view.dart';


import 'package:flutter/material.dart';


import '../widgets/ebla_navigation_bar.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold>  with TickerProviderStateMixin{
  late int currentPage;
  late TabController _controller;
  final List<Widget> screens = [const HomeView(),const RentView(),const SellView(),const MortgageView(),const MoreView()];

  @override
  void initState() {
    currentPage = 0;
    _controller =  TabController(length: 5, vsync: this, );
    _controller.animation!.addListener(
          () {
        final value = _controller.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    super.initState();
  }


  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: EblaNavigationBar(controller: _controller, screens: screens, currentPage: currentPage)
    );

  }
}


