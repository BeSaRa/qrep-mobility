import 'package:flutter/material.dart';

import '../../../resources/resources.dart';

class SelectedYearWidget extends StatefulWidget {
  final String year;

  const SelectedYearWidget({super.key, required this.year});

  @override
  State<SelectedYearWidget> createState() => _SelectedYearWidgetState();
}

class _SelectedYearWidgetState extends State<SelectedYearWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppSizeW.s12),
        alignment: AlignmentDirectional.centerStart,
        height: AppSizeH.s38,
        width: AppSizeW.s100,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: const Offset(1, 1),
                spreadRadius: AppSizeR.s2,
                blurRadius: AppSizeR.s11,
                color: ColorManager.black.withAlpha(6))
          ],
          color: ColorManager.white,
          border: Border.all(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(AppSizeR.s25),
        ),
        child: Text(
          widget.year,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
    );
  }
}
