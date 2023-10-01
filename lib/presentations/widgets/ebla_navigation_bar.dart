import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';

class EblaNavigationBar extends StatelessWidget {
  const EblaNavigationBar(
      {super.key,
      required TabController controller,
      required this.currentPage,
      required this.onTap,
      required this.body})
      : _controller = controller;

  final Function(int index) onTap;
  final Widget body;
  final TabController _controller;

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return BottomBar(
      fit: StackFit.expand,
      body: (context, controller) => body,
      borderRadius: BorderRadius.circular(500),
      duration: const Duration(seconds: 1),
      curve: Curves.decelerate,
      showIcon: true,
      width: MediaQuery.of(context).size.width * 0.9,
      barColor: Colors.white,
      start: 2,
      barDecoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.1),
            offset: const Offset(1, 1),
            blurRadius: 15,
            blurStyle: BlurStyle.normal),
        BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.1),
            offset: const Offset(-1, -1),
            blurRadius: 15,
            blurStyle: BlurStyle.normal),
        BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.1),
            offset: const Offset(1, -1),
            blurRadius: 15,
            blurStyle: BlurStyle.normal),
        BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.1),
            offset: const Offset(-1, 1),
            blurRadius: 15,
            blurStyle: BlurStyle.normal),
      ]),
      child: TabBar(
        onTap: onTap,
        indicatorPadding: const EdgeInsets.all(2),
        controller: _controller,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 6.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(2)),
          insets: const EdgeInsets.fromLTRB(25.0, 0.0, 25, 50.0),
        ),
        tabs: [
          SizedBox(
            height: 55,
            child: Column(
              children: [
                const Spacer(),
                Icon(
                  Icons.home_outlined,
                  color: currentPage == 0
                      ? Theme.of(context).primaryColor
                      : Theme.of(context)
                          .bottomNavigationBarTheme
                          .unselectedItemColor,
                ),
                Expanded(
                  child: Text(
                    AppStrings().main.tr(),
                    style: TextStyle(
                      fontSize: 9.sp,
                      color: currentPage == 0
                          ? Theme.of(context).primaryColor
                          : Theme.of(context)
                              .bottomNavigationBarTheme
                              .unselectedItemColor,
                    ),
                  ),
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
                ImageIcon(
                  const AssetImage(
                    IconAssets.keyIcon,
                  ),
                  color: currentPage == 1
                      ? Theme.of(context).primaryColor
                      : Theme.of(context)
                          .bottomNavigationBarTheme
                          .unselectedItemColor,
                ),
                Expanded(
                    child: Text(AppStrings().rent.tr(),
                        style: TextStyle(
                          fontSize: 9.sp,
                          color: currentPage == 1
                              ? Theme.of(context).primaryColor
                              : Theme.of(context)
                                  .bottomNavigationBarTheme
                                  .unselectedItemColor,
                        ))),
                const Spacer()
              ],
            ),
          ),
          SizedBox(
            height: 55,
            child: Column(
              children: [
                const Spacer(),
                Icon(
                  Icons.sell_outlined,
                  color: currentPage == 2
                      ? Theme.of(context).primaryColor
                      : Theme.of(context)
                          .bottomNavigationBarTheme
                          .unselectedItemColor,
                ),
                Expanded(
                  child: Text(
                    AppStrings().sell.tr(),
                    style: TextStyle(
                      fontSize: 9.sp,
                      color: currentPage == 2
                          ? Theme.of(context).primaryColor
                          : Theme.of(context)
                              .bottomNavigationBarTheme
                              .unselectedItemColor,
                    ),
                  ),
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
                ImageIcon(
                  const AssetImage(IconAssets.realEstateIcon),
                  color: currentPage == 3
                      ? Theme.of(context).primaryColor
                      : Theme.of(context)
                          .bottomNavigationBarTheme
                          .unselectedItemColor,
                ),
                Expanded(
                    child: Text(
                  AppStrings().mortgage.tr(),
                  style: TextStyle(
                      fontSize: 9.sp,
                      color: currentPage == 3
                          ? Theme.of(context).primaryColor
                          : Theme.of(context)
                              .bottomNavigationBarTheme
                              .unselectedItemColor),
                )),
                const Spacer()
              ],
            ),
          ),
          SizedBox(
            height: 55,
            child: Column(
              children: [
                const Spacer(),
                ImageIcon(
                  const AssetImage(IconAssets.infoIcon),
                  color: currentPage == 4
                      ? Theme.of(context).primaryColor
                      : Theme.of(context)
                          .bottomNavigationBarTheme
                          .unselectedItemColor,
                ),
                Expanded(
                    child: Text(
                  AppStrings().more.tr(),
                  style: TextStyle(
                      fontSize: 9.sp,
                      color: currentPage == 4
                          ? Theme.of(context).primaryColor
                          : Theme.of(context)
                              .bottomNavigationBarTheme
                              .unselectedItemColor),
                )),
                const Spacer()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
