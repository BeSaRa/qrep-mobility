
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';

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
      body: (context, controller) => SizedBox(
        height: MediaQuery.of(context).size.height-100,
        child: TabBarView(
          controller: _controller,
          dragStartBehavior: DragStartBehavior.down,
          physics: const BouncingScrollPhysics(),
          children: screens,
        ),
      ),
      borderRadius: BorderRadius.circular(500),
      duration: const Duration(seconds: 1),
      curve: Curves.decelerate,
      showIcon: true,
      width: MediaQuery.of(context).size.width * 0.9,
      barColor:  Colors.white,
      start: 2,
      barDecoration:BoxDecoration(boxShadow: [
        BoxShadow(color: Theme.of(context).shadowColor.withOpacity(0.1),offset: const Offset(1,1),blurRadius:15 ,blurStyle: BlurStyle.normal ),
        BoxShadow(color: Theme.of(context).shadowColor.withOpacity(0.1),offset: const Offset(-1,-1), blurRadius: 15 ,blurStyle: BlurStyle.normal),
        BoxShadow(color: Theme.of(context).shadowColor.withOpacity(0.1),offset: const Offset(1,-1), blurRadius: 15 ,blurStyle: BlurStyle.normal),
        BoxShadow(color: Theme.of(context).shadowColor.withOpacity(0.1),offset: const Offset(-1,1), blurRadius: 15 ,blurStyle: BlurStyle.normal),
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
                const Spacer(),
                SizedBox(height: 24,
                  child: SvgPicture.asset(
                    IconAssets.homeIcon,
                    // ignore: deprecated_member_use
                    color:currentPage == 0 ? Theme.of(context).primaryColor : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor, ),
                ),
                Expanded(
                  child: Text(AppStrings().main,style: TextStyle(fontSize:9.sp,color:currentPage == 0 ? Theme.of(context).primaryColor : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
                  ),),
                ),
                const Spacer()
              ],
            ),
          ),
          SizedBox(
            height: 55,

            child: Column(
              children: [
                const Spacer(),
            SizedBox(height: 24,
              child: SvgPicture.asset(
                  IconAssets.keyIcon,
                 // ignore: deprecated_member_use
                 color:currentPage == 1 ? Theme.of(context).primaryColor : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor, ),
            ),

                Expanded(child: Text(AppStrings().rent ,style: TextStyle(fontSize:9.sp,color: currentPage == 1 ? Theme.of(context).primaryColor : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,))),
                const Spacer()
              ],
            ),
          ),
          SizedBox(
            height: 55,

            child: Column(
              children: [
                const Spacer(),
                SizedBox(height: 24,
                  child: SvgPicture.asset(
                    IconAssets.sellIcon,
                    // ignore: deprecated_member_use
                    color:currentPage == 2 ? Theme.of(context).primaryColor : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor, ),
                ),
                Expanded(
                  child: Text(AppStrings().sell ,style: TextStyle(fontSize:9.sp,color: currentPage == 2  ? Theme.of(context).primaryColor : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
                  ),),
                ),
                const Spacer()
              ],
            ),
          ),
          SizedBox(
            height: 55,

            child: Column(
              children: [
                const Spacer(),

                SizedBox(height: 24,
                  child: SvgPicture.asset(
                    IconAssets.realEstateIcon,
                    // ignore: deprecated_member_use
                    color:currentPage == 3  ? Theme.of(context).primaryColor : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor  ),
                ),

                Expanded(child: Text(AppStrings().mortgage ,style: TextStyle(fontSize:9.sp,color: currentPage == 3  ? Theme.of(context).primaryColor : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor),)),
                const Spacer()
              ],
            ),
          ),
          SizedBox(
            height: 55,

            child: Column(
              children: [

                const Spacer(),
                SizedBox(height: 22,
                  width: 22,
                  child: SvgPicture.asset(
                      IconAssets.infoIcon,
                    // ignore: deprecated_member_use
                    color: currentPage == 4 ? Theme.of(context).primaryColor : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor),
                ),
                Expanded(child: Text(AppStrings().more ,style: TextStyle(fontSize:9.sp,color:  currentPage == 4 ? Theme.of(context).primaryColor : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor),)),
                const Spacer()
              ],
            ),
          ),
        ],

      ),

    );
  }
}