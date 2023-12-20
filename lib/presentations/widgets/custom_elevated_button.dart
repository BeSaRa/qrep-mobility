import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function()? onPress;
  final String title;
  final ButtonStyle? style;
  final Color? backgroundColor;
  final TextStyle? titleStyle;
  final bool isPrimary;

  const CustomElevatedButton({
    super.key,
    this.onPress,
    required this.title,
    this.style,
    this.backgroundColor,
    this.titleStyle,
    required this.isPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizeH.s36,
      child: ElevatedButton(
          onPressed: onPress,
          style: style ??
              ButtonStyle(
                backgroundColor: MaterialStateProperty.all(isPrimary
                    ? backgroundColor ?? ColorManager.primary
                    : backgroundColor ?? ColorManager.porcelain),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppSizeR.s5),
                    ),
                  ),
                ),
              ),
          child: Text(title,
              style: isPrimary
                  ? titleStyle ?? Theme.of(context).textTheme.displaySmall
                  : titleStyle ??
                      Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: ColorManager.golden))),
    );
  }
}
