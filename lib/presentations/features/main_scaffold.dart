
import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/presentations/features/home/home_view.dart';
import 'package:ebla/presentations/features/more/more_view.dart';
import 'package:ebla/presentations/features/mortagage/mortgage_view.dart';
import 'package:ebla/presentations/features/rent/rent_view.dart';
import 'package:ebla/presentations/features/sell/sell_view.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold>  with TickerProviderStateMixin{
  late int currentPage;
  late TabController _controller;
  final List<Widget> screens = [HomeView(),RentView(),SellView(),MortgageView(),MoreView()];

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

class EblaNavigationBar extends StatelessWidget {
  const EblaNavigationBar({
    super.key,
    required TabController controller,
    required this.screens,
    required this.currentPage,
  }) : _controller = controller;

  final TabController _controller;
  final List<Widget> screens;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return BottomBar(
      fit: StackFit.expand,
      body: (context, controller) => TabBarView(
    controller: _controller,
    dragStartBehavior: DragStartBehavior.down,
    physics: const BouncingScrollPhysics(),
    children: screens,
    ),
      borderRadius: BorderRadius.circular(500),
      duration: const Duration(seconds: 1),
      curve: Curves.decelerate,
      showIcon: true,
      width: MediaQuery.of(context).size.width * 0.9,
      barColor:  Colors.white,
      start: 2,
      barDecoration:BoxDecoration(boxShadow: [
        BoxShadow(color: Theme.of(context).shadowColor.withOpacity(0.1),offset: Offset(1,1),blurRadius:15 ,blurStyle: BlurStyle.normal ),
        BoxShadow(color: Theme.of(context).shadowColor.withOpacity(0.1),offset: Offset(-1,-1), blurRadius: 15 ,blurStyle: BlurStyle.normal),
        BoxShadow(color: Theme.of(context).shadowColor.withOpacity(0.1),offset: Offset(1,-1), blurRadius: 15 ,blurStyle: BlurStyle.normal),
        BoxShadow(color: Theme.of(context).shadowColor.withOpacity(0.1),offset: Offset(-1,1), blurRadius: 15 ,blurStyle: BlurStyle.normal),
      ]),
      child: TabBar(
        indicatorPadding: const EdgeInsets.all(2),
        controller: _controller,
        indicator:  UnderlineTabIndicator(
          borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 6.0,),
          borderRadius: const BorderRadius.all(Radius.circular(2)),
          insets: const EdgeInsets.fromLTRB(25.0, 0.0, 25, 50.0),),
        tabs: [
          SizedBox(
            height: 55,
            child: Column(
              children: [
                Spacer(),
                Icon(
                  Icons.home_outlined,
                  color: currentPage == 0 ? Theme.of(context).primaryColor : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
                ),
                Expanded(
                  child: Text(AppStrings().main.tr(),style: TextStyle(fontSize:9.sp,color:currentPage == 0 ? Theme.of(context).primaryColor : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
                  ),),
                ),
                Spacer()
              ],
            ),
          ),
          SizedBox(
            height: 55,

            child: Column(
              children: [
                Spacer(),
                ImageIcon(AssetImage(IconAssets.keyIcon,),color: currentPage == 1 ? Theme.of(context).primaryColor : Theme.of(context)  .bottomNavigationBarTheme.unselectedItemColor,),
                Expanded(child: Text(AppStrings().rent.tr(),style: TextStyle(fontSize:9.sp,color: currentPage == 1 ? Theme.of(context).primaryColor : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,))),
                Spacer()
              ],
            ),
          ),
          SizedBox(
            height: 55,

            child: Column(
              children: [
                Spacer(),
                Icon(
                  Icons.sell_outlined,
                  color: currentPage == 2  ? Theme.of(context).primaryColor : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
                 ),
                Expanded(
                  child: Text(AppStrings().sell.tr(),style: TextStyle(fontSize:9.sp,color: currentPage == 2  ? Theme.of(context).primaryColor : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
                  ),),
                ),
                Spacer()
              ],
            ),
          ),
          SizedBox(
            height: 55,

            child: Column(
              children: [
                Spacer(),
                ImageIcon(AssetImage(IconAssets.realEstateIcon), color: currentPage == 3  ? Theme.of(context).primaryColor : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor ,),
                Expanded(child: Text(AppStrings().mortgage.tr(),style: TextStyle(fontSize:9.sp,color: currentPage == 3  ? Theme.of(context).primaryColor : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor),)),
                Spacer()
              ],
            ),
          ),
          SizedBox(
            height: 55,

            child: Column(
              children: [

                Spacer(),
                ImageIcon(AssetImage(IconAssets.infoIcon), color: currentPage == 4 ? Theme.of(context).primaryColor : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor ,),
                Expanded(child: Text(AppStrings().more.tr(),style: TextStyle(fontSize:9.sp,color:  currentPage == 4 ? Theme.of(context).primaryColor : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor),)),
                Spacer()
              ],
            ),
          ),
        ],

      ),

    );
  }
}
