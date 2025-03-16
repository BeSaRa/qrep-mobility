import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/global_functions.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class EblaTabBarWidget extends StatefulWidget {
  const EblaTabBarWidget(
      {super.key,
      required this.onPressed,
      this.initialIndex = 0,
      required this.firstTab,
      required this.secondTab});

  final Function onPressed;
  final int initialIndex;
  final Widget firstTab;
  final Widget secondTab;

  @override
  State<EblaTabBarWidget> createState() => _EblaTabBarWidgetState();
}

class _EblaTabBarWidgetState extends State<EblaTabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: widget.initialIndex,
      child: Container(
        height: AppSizeH.s50,
        width: isTablet ? AppSizeW.s226 : AppSizeW.s160,
        padding: EdgeInsets.symmetric(
            vertical: AppSizeH.s5, horizontal: AppSizeW.s8),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(AppSizeR.s12),
          color: Theme.of(context).canvasColor,
        ),
        child: TabBar(
          automaticIndicatorColorAdjustment: false,
          physics: const NeverScrollableScrollPhysics(),
          indicatorColor: Colors.transparent,
          indicator: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(AppSizeR.s8),
            color: Theme.of(context).primaryColor,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: ColorManager.white,
          unselectedLabelColor: Theme.of(context).colorScheme.onSurface,
          unselectedLabelStyle: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(
                  color: ColorManager.white,
                  fontSize:
                      MediaQuery.of(context).size.width > 620 ? 11.sp : 12.sp),
          //text theme
          labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize:
                  MediaQuery.of(context).size.width > 620 ? 11.sp : 12.sp),
          onTap: (index) {
            widget.onPressed(index);
          },
          isScrollable: false,
          tabs: [
            widget.firstTab,
            widget.secondTab,
          ],
        ),
      ),
    );
  }
}
