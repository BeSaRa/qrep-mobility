import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../features/main/cubit/bottom_nav_cubit.dart';
import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';

class EblaNavigationBar extends StatefulWidget {
  const EblaNavigationBar({
    super.key,
    required TabController controller,
    required this.body,
    required this.onTap,
  }) : _controller = controller;

  final Function(int index) onTap;
  final Widget body;
  final TabController _controller;

  @override
  State<EblaNavigationBar> createState() => _EblaNavigationBarState();
}

class _EblaNavigationBarState extends State<EblaNavigationBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(" context.read<BottomNavCubit>().state");
    print(context.read<BottomNavCubit>().state);
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: AppSizeW.s12,
        end: AppSizeW.s12,
        bottom: AppSizeH.s8,
      ),
      child: Container(
        // width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            borderRadius: BorderRadius.circular(AppSizeR.s50),
            boxShadow: [
              BoxShadow(
                color: ColorManager.textBlack.withAlpha(8),
                offset: const Offset(0, 0),
                spreadRadius: AppSizeR.s8,
                blurRadius: AppSizeR.s18,
              ),
            ]),
        child: BlocBuilder(
          bloc: context.read<BottomNavCubit>(),
          builder: (context, state) {
            return Material(
              type: MaterialType.transparency,
              child: TabBar(
                onTap: widget.onTap,
                padding: EdgeInsets.symmetric(horizontal: AppSizeW.s12),
                splashBorderRadius: BorderRadius.circular(AppSizeR.s50),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: EdgeInsets.all(AppSizeW.s5),
                controller: widget._controller,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: ColorManager.golden,
                    width: AppSizeW.s6,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(AppSizeR.s2)),
                  insets: EdgeInsets.fromLTRB(
                      AppSizeH.s28, 0.0, AppSizeH.s28, AppSizeH.s65),
                ),
                tabs: [
                  SizedBox(
                    height: AppSizeH.s75,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // const Spacer(),
                        SizedBox(
                          // height: AppSizeH.s36,
                          child: SvgPicture.asset(
                            state == 0
                                ? IconAssets.homeIconFill
                                : IconAssets.homeIcon,
                            // ignore: deprecated_member_use
                            color: state == 0
                                ? Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .selectedIconTheme!
                                    .color
                                : Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .unselectedIconTheme!
                                    .color,
                          ),
                        ),
                        FittedBox(
                          child: Text(AppStrings().main,
                              style: state == 0
                                  ? Theme.of(context)
                                      .bottomNavigationBarTheme
                                      .selectedLabelStyle
                                  : Theme.of(context)
                                      .bottomNavigationBarTheme
                                      .unselectedLabelStyle),
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
                            state == 1
                                ? IconAssets.keyIconFill
                                : IconAssets.keyIcon,
                            // ignore: deprecated_member_use
                            color: state == 1
                                ? Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .selectedIconTheme!
                                    .color
                                : Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .unselectedIconTheme!
                                    .color,
                          ),
                        ),
                        FittedBox(
                          child: Text(AppStrings().rent,
                              style: state == 1
                                  ? Theme.of(context)
                                      .bottomNavigationBarTheme
                                      .selectedLabelStyle
                                  : Theme.of(context)
                                      .bottomNavigationBarTheme
                                      .unselectedLabelStyle),
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
                            state == 2
                                ? IconAssets.sellIconFill
                                : IconAssets.sellIcon,
                            // ignore: deprecated_member_use
                            color: state == 2
                                ? Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .selectedIconTheme!
                                    .color
                                : Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .unselectedIconTheme!
                                    .color,
                          ),
                        ),
                        FittedBox(
                          child: Text(
                            AppStrings().sell,
                            style: state == 2
                                ? Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .selectedLabelStyle
                                : Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .unselectedLabelStyle,
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
                              state == 3
                                  ? IconAssets.realEstateIconFill
                                  : IconAssets.realEstateIcon,
                              // ignore: deprecated_member_use
                              color: state == 3
                                  ? Theme.of(context)
                                      .bottomNavigationBarTheme
                                      .selectedIconTheme!
                                      .color
                                  : Theme.of(context)
                                      .bottomNavigationBarTheme
                                      .unselectedIconTheme!
                                      .color),
                        ),
                        FittedBox(
                          child: Text(
                            AppStrings().mortgage,
                            style: state == 3
                                ? Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .selectedLabelStyle
                                : Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .unselectedLabelStyle,
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
                              state == 4
                                  ? IconAssets.infoIconFill
                                  : IconAssets.infoIcon,
                              // ignore: deprecated_member_use
                              color: state == 4
                                  ? Theme.of(context)
                                      .bottomNavigationBarTheme
                                      .selectedIconTheme!
                                      .color
                                  : Theme.of(context)
                                      .bottomNavigationBarTheme
                                      .unselectedIconTheme!
                                      .color),
                        ),
                        FittedBox(
                          child: Text(AppStrings().more,
                              style: state == 4
                                  ? Theme.of(context)
                                      .bottomNavigationBarTheme
                                      .selectedLabelStyle
                                  : Theme.of(context)
                                      .bottomNavigationBarTheme
                                      .unselectedLabelStyle),
                        ),
                        // const Spacer()
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
