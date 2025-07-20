import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:ebla/presentations/resources/values_manager.dart';

class BoardingWidget extends StatelessWidget {
  final String title;
  final String? supTitle;
  final Widget viewContent;
  final int totalPages;
  final int currentIndex;

  const BoardingWidget({
    super.key,
    required this.title,
    required this.supTitle,
    required this.viewContent,
    required this.totalPages,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // Title
      Padding(
        padding: EdgeInsets.symmetric(horizontal: currentIndex == 4 ? AppSizeW.s20 : 0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).brightness == Brightness.dark
                  ? null
                  : ColorManager.primary),
        ),
      ),
      SizedBox(height: AppSizeH.s8),
      if (supTitle != null)
        Text(
          supTitle!,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).brightness == Brightness.dark
                  ? null
                  : ColorManager.primary),
        ),
      SizedBox(height: AppSizeH.s40),
      // Content
      viewContent,
    ]);
  }
}
