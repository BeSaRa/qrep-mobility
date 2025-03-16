// ignore_for_file: use_build_context_synchronously

import 'package:ebla/presentations/widgets/aqarat_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../app/depndency_injection.dart';
import '../../resources/resources.dart';

import '../navigation_pages/aqarat_drawer.dart';
import 'cubit/bottom_nav_cubit.dart';

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
    _controller.animateTo(context.read<BottomNavCubit>().state,
        duration: kTabScrollDuration, curve: Curves.ease);

    return BlocBuilder(
      bloc: context.read<BottomNavCubit>(),
      builder: (context, state) {
        return Scaffold(
          drawer: const AqaratDrawer(),
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            toolbarHeight: AppSizeH.s80,
            backgroundColor: Colors.transparent,
            leading: Builder(builder: (context) {
              return IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: AppSizeR.s30,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            }),
            title: SizedBox(
              height: AppSizeW.s80,
              width: AppSizeW.s226,
              child: const Image(
                image: AssetImage(ImageAssets.ministryOfMunicipalityDark),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: AppSizeR.s30,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              )
            ],
          ),
          backgroundColor: Theme.of(context).primaryColor,
          body: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(AppSizeR.s20),
                      topLeft: Radius.circular(AppSizeR.s20))),
              child: widget.child),
          bottomNavigationBar: AqaratNavigationBar(
            onTap: (index) async {
              switch (index) {
                case 0:
                  break;
                case 1:
                  break;
                case 2:
                  break;
                case 3:
                  break;
                case 4:
                  await initMortgageModule();
                  await initSellModule();
                  await initRentModule();
                  await initHomeModule();
                // initLoginModule();

                default:
                  null;
              }

              context.read<BottomNavCubit>().changePage(index);
              context.goNamed(context.read<BottomNavCubit>().paths[index]);
            },
            body: Container(
              color: Colors.transparent,
            ),
            // currentPage: context.watch<BottomNavCubit>().state,
            controller: _controller,
          ),
        );
      },
    );
  }
}
