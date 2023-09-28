import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';

class StaggeredGridItemWidget extends StatelessWidget {
  final Widget child;
  final bool hasLinearGradient;
  final double? borderRadius;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final BoxShadow? boxShadow;
  const StaggeredGridItemWidget(
      {super.key,
      required this.child,
      required this.hasLinearGradient,
      this.backgroundColor,
      this.width,
      this.height,
      this.borderRadius,
      this.boxShadow});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width ?? AppSizeH.s154,
      width: height ?? AppSizeW.s140,
      decoration: BoxDecoration(
        boxShadow: boxShadow != null ? [boxShadow!] : [],
        color: backgroundColor,
        borderRadius:
            BorderRadius.all(Radius.circular(borderRadius ?? AppSizeR.s20)),
        gradient: hasLinearGradient
            ? LinearGradient(
                colors: [
                  ColorManager.platinum,
                  ColorManager.white,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.2, 1.0],
              )
            : null,
      ),
      child: child,
    );
  }
}

//todo: this should be removed once we have real data from api
class GridItemData {
  final String title;
  final String value;
  final String imagePath;
  final String valueUnit;
  const GridItemData(
      {required this.title,
      required this.value,
      required this.imagePath,
      required this.valueUnit});
}
