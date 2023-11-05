import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';

class EblaNavigationBar extends StatelessWidget {
  const EblaNavigationBar({
    super.key,
    required TabController controller,
    required this.currentPage,
    required this.body,
    required this.onTap,
  }) : _controller = controller;

  final Function(int index) onTap;
  final Widget body;
  final TabController _controller;

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return BottomBar(
      fit: StackFit.expand,
      body: (context, controller) => Padding(
        padding: EdgeInsets.only(bottom: AppSizeH.s80, top: AppSizeH.s10),
        child: body,
      ),
      borderRadius: BorderRadius.circular(AppSizeR.s50),
      duration: const Duration(seconds: 1),
      curve: Curves.decelerate,
      showIcon: true,
      width: MediaQuery.of(context).size.width * 0.9,
      barColor: Colors.white,
      barDecoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: ColorManager.black.withAlpha(8),
          offset: const Offset(0, 0),
          spreadRadius: AppSizeR.s8,
          blurRadius: AppSizeR.s18,
        ),
      ]),
      start: 2,
      child: Material(
        type: MaterialType.transparency,
        child: TabBar(
          onTap: onTap,
          splashBorderRadius: BorderRadius.circular(AppSizeR.s50),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(AppSizeW.s5),
          controller: _controller,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              color: ColorManager.golden,
              width: AppSizeW.s6,
            ),
            borderRadius: BorderRadius.all(Radius.circular(AppSizeR.s2)),
            insets: EdgeInsets.fromLTRB(
                AppSizeH.s30, 0.0, AppSizeH.s30, AppSizeH.s65),
          ),
          tabs: [
            SizedBox(
              height: AppSizeH.s75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const Spacer(),
                  SizedBox(
                    height: AppSizeH.s36,
                    child: SvgPicture.asset(
                      currentPage == 0
                          ? IconAssets.homeIconFill
                          : IconAssets.homeIcon,
                      // ignore: deprecated_member_use
                      color: currentPage == 0
                          ? Theme.of(context).primaryColor
                          : Theme.of(context)
                              .bottomNavigationBarTheme
                              .unselectedItemColor,
                    ),
                  ),
                  Text(
                    AppStrings().main,
                    style: TextStyle(
                      fontSize: AppSizeSp.s10,
                      color: currentPage == 0
                          ? Theme.of(context).primaryColor
                          : Theme.of(context)
                              .bottomNavigationBarTheme
                              .unselectedItemColor,
                    ),
                  ),
                  // const Spacer()
                ],
              ),
            ),
            SizedBox(
              height: AppSizeH.s75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const Spacer(),
                  SizedBox(
                    // height: AppSizeH.s36,
                    child: SvgPicture.asset(
                      currentPage == 1
                          ? IconAssets.keyIconFill
                          : IconAssets.keyIcon,
                      // ignore: deprecated_member_use
                      color: currentPage == 1
                          ? Theme.of(context).primaryColor
                          : Theme.of(context)
                              .bottomNavigationBarTheme
                              .unselectedItemColor,
                    ),
                  ),
                  Text(AppStrings().rent,
                      style: TextStyle(
                        fontSize: AppSizeSp.s10,
                        color: currentPage == 1
                            ? Theme.of(context).primaryColor
                            : Theme.of(context)
                                .bottomNavigationBarTheme
                                .unselectedItemColor,
                      )),
                  // const Spacer()
                ],
              ),
            ),
            SizedBox(
              height: AppSizeH.s75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const Spacer(),
                  SizedBox(
                    // height: AppSizeH.s36,
                    child: SvgPicture.asset(
                      currentPage == 2
                          ? IconAssets.sellIconFill
                          : IconAssets.sellIcon,
                      // ignore: deprecated_member_use
                      color: currentPage == 2
                          ? Theme.of(context).primaryColor
                          : Theme.of(context)
                              .bottomNavigationBarTheme
                              .unselectedItemColor,
                    ),
                  ),
                  Text(
                    AppStrings().sell,
                    style: TextStyle(
                      fontSize: AppSizeSp.s10,
                      color: currentPage == 2
                          ? Theme.of(context).primaryColor
                          : Theme.of(context)
                              .bottomNavigationBarTheme
                              .unselectedItemColor,
                    ),
                  ),
                  // const Spacer()
                ],
              ),
            ),
            SizedBox(
              height: AppSizeH.s75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const Spacer(),
                  SizedBox(
                    // height: AppSizeH.s36,
                    child: SvgPicture.asset(
                        currentPage == 3
                            ? IconAssets.realEstateIconFill
                            : IconAssets.realEstateIcon,
                        // ignore: deprecated_member_use
                        color: currentPage == 3
                            ? Theme.of(context).primaryColor
                            : Theme.of(context)
                                .bottomNavigationBarTheme
                                .unselectedItemColor),
                  ),
                  Text(
                    AppStrings().mortgage,
                    style: TextStyle(
                        fontSize: AppSizeSp.s10,
                        color: currentPage == 3
                            ? Theme.of(context).primaryColor
                            : Theme.of(context)
                                .bottomNavigationBarTheme
                                .unselectedItemColor),
                  ),
                  // const Spacer()
                ],
              ),
            ),
            SizedBox(
              height: AppSizeH.s75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const Spacer(),
                  SizedBox(
                    // height: AppSizeH.s36,
                    child: SvgPicture.asset(
                        currentPage == 4
                            ? IconAssets.infoIconFill
                            : IconAssets.infoIcon,
                        // ignore: deprecated_member_use
                        color: currentPage == 4
                            ? Theme.of(context).primaryColor
                            : Theme.of(context)
                                .bottomNavigationBarTheme
                                .unselectedItemColor),
                  ),
                  Text(
                    AppStrings().more,
                    style: TextStyle(
                        fontSize: AppSizeSp.s10,
                        color: currentPage == 4
                            ? Theme.of(context).primaryColor
                            : Theme.of(context)
                                .bottomNavigationBarTheme
                                .unselectedItemColor),
                  ),
                  // const Spacer()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
