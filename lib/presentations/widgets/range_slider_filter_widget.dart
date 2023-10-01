import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';

import 'package:ebla/presentations/widgets/range_slider_widget.dart';
import 'package:flutter/material.dart';

class RangeSliderFilterWidget extends StatefulWidget {
  final String title;
  final RangeValues rangeValues;
  const RangeSliderFilterWidget(
      {super.key, required this.title, required this.rangeValues});

  @override
  State<RangeSliderFilterWidget> createState() =>
      _RangeSliderFilterWidgetState();
}

class _RangeSliderFilterWidgetState extends State<RangeSliderFilterWidget> {
  late double start;
  late double end;
  @override
  void initState() {
    super.initState();
    start = widget.rangeValues.start;
    end = widget.rangeValues.end;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSizeH.s12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title, style: Theme.of(context).textTheme.labelMedium),
            RangeSliderWidget(
                rangeValues: widget.rangeValues,
                onChanged: (rangeValues) {
                  setState(() {
                    start = rangeValues.start;
                    end = rangeValues.end;
                  });
                }),
          ],
        ),
        Row(children: [
          Expanded(
            child: Container(
              height: AppSizeH.s36,
              decoration: ShapeDecoration(
                  color: ColorManager.whiteSmoke,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: ColorManager.silver),
                    borderRadius: BorderRadius.circular(AppSizeR.s5),
                  )),
              child: Center(
                child: Text(
                  start.toInt().formatWithCommas().toString(),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ),
          ),
          SizedBox(width: AppSizeW.s8),
          Expanded(
            child: Container(
              height: AppSizeH.s36,
              decoration: ShapeDecoration(
                  color: ColorManager.whiteSmoke,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: ColorManager.silver),
                    borderRadius: BorderRadius.circular(AppSizeR.s5),
                  )),
              child: Center(
                child: Text(
                  end.toInt().formatWithCommas().toString(),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ),
          ),
        ]),
      ],
    );
  }
}

extension NumberFormatting on int {
  String formatWithCommas() {
    return toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }
}
