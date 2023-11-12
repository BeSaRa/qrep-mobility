import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../widgets/ebla_navigation_bar.dart';
import 'blocs/cubit/bottom_nav_cubit.dart';

class MainScaffold extends StatefulWidget {
  // final StatefulNavigationShell navigationShell;
  final Widget child;

  const MainScaffold({super.key, required this.child});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold>
    with TickerProviderStateMixin {
  // late int currentPage;
  late TabController _controller;

  @override
  void initState() {
    super.initState();

    // currentPage = context.read<BottomNavCubit>().currentPage;
    _controller = TabController(
      length: 5,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    _controller.animateTo(context.read<BottomNavCubit>().currentPage,
        duration: kTabScrollDuration, curve: Curves.ease);
    return Scaffold(
      bottomNavigationBar: EblaNavigationBar(
        onTap: (index) {
          context.read<BottomNavCubit>().changePage(index);
          context.goNamed(context.read<BottomNavCubit>().paths[index]);

          // widget.navigationShell.goBranch(
          //   index,
          //   initialLocation: index == widget.navigationShell.currentIndex,
          // );
        },
        body: widget.child,
        currentPage: context.read<BottomNavCubit>().currentPage,
        controller: _controller,
      ),
    );
  }
}
