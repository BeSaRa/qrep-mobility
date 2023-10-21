import 'package:ebla/presentations/features/rent/blocs/active_nav_bar_index_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../widgets/ebla_navigation_bar.dart';

class MainScaffold extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainScaffold({super.key, required this.navigationShell});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold>
    with TickerProviderStateMixin {
  late int currentPage;
  late TabController _controller;
  late ActiveNavBarIndexCubit activeNavBarIndexCubit;

  @override
  void initState() {
    super.initState();
    activeNavBarIndexCubit =
        ActiveNavBarIndexCubit(widget.navigationShell.currentIndex);
    currentPage = widget.navigationShell.currentIndex;
    _controller = TabController(
      length: 5,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    _controller.animateTo(widget.navigationShell.currentIndex,
        duration: kTabScrollDuration, curve: Curves.ease);
    return Scaffold(
      bottomNavigationBar: BlocProvider.value(
        value: activeNavBarIndexCubit,
        child: EblaNavigationBar(
          onTap: (index) {
            widget.navigationShell.goBranch(
              index,
              initialLocation: index == widget.navigationShell.currentIndex,
            );
          },
          body: widget.navigationShell,
          currentPage: widget.navigationShell.currentIndex,
          controller: _controller,
        ),
      ),
    );
  }
}
