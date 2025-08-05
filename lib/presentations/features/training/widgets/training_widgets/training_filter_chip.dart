import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter/material.dart';

class TrainingFilterChip extends StatelessWidget {
  final String label;
  final String mainLabel;
  final void Function()? onTap;
  final IconData icon;

  const TrainingFilterChip({
    super.key,
    required this.label,
    required this.mainLabel,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSizeH.s5,
      children: [
        Text(
          mainLabel,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).brightness == Brightness.dark
                  ? ColorManager.golden
                  : ColorManager.primaryBlue,
              fontSize: AppSizeSp.s11),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: AppSizeH.s5),
            padding: EdgeInsets.symmetric(
              horizontal: AppSizeW.s10,
              vertical: AppSizeH.s8,
            ),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.blackBG.withValues(alpha: 0.2),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  )
                ],
                borderRadius: BorderRadius.circular(AppSizeR.s10),
                color: Theme.of(context).brightness == Brightness.dark
                    ? ColorManager.textFieldGrey
                    : Theme.of(context).scaffoldBackgroundColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(label,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? ColorManager.golden
                              : ColorManager.primaryBlue,
                        )),
                SizedBox(width: AppSizeW.s40),
                Icon(
                  icon,
                  size: AppSizeSp.s16,
                  color: ColorManager.primary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
