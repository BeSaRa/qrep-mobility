import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  @override
  void initState() {
    super.initState();

    currentPage = widget.navigationShell.currentIndex;
    _controller = TabController(
      length: 5,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    print("building");
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // todo: when dark mode is ready change statusBarIconBrightness according to the theme
      statusBarColor: Colors.transparent,

      statusBarIconBrightness: Brightness.dark,
    ));
    _controller.animateTo(widget.navigationShell.currentIndex,
        duration: kTabScrollDuration, curve: Curves.ease);
    return Scaffold(
      bottomNavigationBar: EblaNavigationBar(
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
    );
  }
}
