import 'package:flutter/material.dart';

import '../../utils/global_functions.dart';
import '../resources/resources.dart';
import 'selected_municipality_widget.dart';

class SelectedYearWidget extends StatefulWidget {
  final Function(int?)? onChanged;
  final int value;

  const SelectedYearWidget({super.key, this.onChanged, required this.value});

  @override
  State<SelectedYearWidget> createState() => _SelectedYearWidgetState();
}

class _SelectedYearWidgetState extends State<SelectedYearWidget> {
  List<int> years = [];

  @override
  void initState() {
    generateYears(2019, DateTime.now().year).forEach((element) {
      years.add(element);
    });
    super.initState();
  }

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
                color: ColorManager.textBlack.withAlpha(6))
          ],
          color: ColorManager.white,
          border: Border.all(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(AppSizeR.s25),
        ),
        child: SingleDrowDown<int>(
          list: years,
          value: widget.value,
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
