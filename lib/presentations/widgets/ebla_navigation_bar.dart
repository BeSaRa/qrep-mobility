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
      borderRadius: BorderRadius.circular(35),
      duration: const Duration(seconds: 1),
      curve: Curves.decelerate,
      showIcon: true,
      width: MediaQuery.of(context).size.width * 0.9,

      barColor: Colors.white,
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
      start: 2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(500),
        child: Material(
          type: MaterialType.transparency,
          child: TabBar(
            onTap: onTap,
            indicatorPadding: const EdgeInsets.all(2),
            controller: _controller,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                color: ColorManager.golden,
                width: AppSizeW.s6,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(2)),
              insets: EdgeInsets.fromLTRB(
                  AppSizeH.s30, 0.0, AppSizeH.s30, AppSizeH.s65),
            ),
            tabs: [
              SizedBox(
                height: AppSizeH.s72,
                child: Column(
                  children: [
                    const Spacer(),
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
                    Expanded(
                      child: Text(
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
                    ),
                    const Spacer()
                  ],
                ),
              ),
              SizedBox(
                height: AppSizeH.s72,
                child: Column(
                  children: [
                    const Spacer(),
                    SizedBox(
                      height: AppSizeH.s36,
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
                    Expanded(
                        child: Text(AppStrings().rent,
                            style: TextStyle(
                              fontSize: AppSizeSp.s10,
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
                height: AppSizeH.s72,
                child: Column(
                  children: [
                    const Spacer(),
                    SizedBox(
                      height: AppSizeH.s36,
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
                    Expanded(
                      child: Text(
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
                    ),
                    const Spacer()
                  ],
                ),
              ),
              SizedBox(
                height: AppSizeH.s72,
                child: Column(
                  children: [
                    const Spacer(),
                    SizedBox(
                      height: AppSizeH.s36,
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
                    Expanded(
                        child: Text(
                      AppStrings().mortgage,
                      style: TextStyle(
                          fontSize: AppSizeSp.s10,
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
                height: AppSizeH.s72,
                child: Column(
                  children: [
                    const Spacer(),
                    SizedBox(
                      height: AppSizeH.s36,
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
                    Expanded(
                        child: Text(
                      AppStrings().more,
                      style: TextStyle(
                          fontSize: AppSizeSp.s10,
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
        ),
      ),
    );
  }
}
