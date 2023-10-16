import 'dart:math';

import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';

import 'package:ebla/presentations/widgets/range_slider_widget.dart';
import 'package:flutter/material.dart';

typedef ValueChangedCallback = void Function(num startValue, num endValue);

class RangeSliderFilterWidget extends StatefulWidget {
  final String title;
  final RangeValues rangeValues;
  final double min;
  final double max;
  final ValueChangedCallback onValueChanged;
  const RangeSliderFilterWidget(
      {super.key,
      required this.title,
      required this.rangeValues,
      required this.onValueChanged,
      required this.min,
      required this.max});

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
                min: widget.min,
                max: widget.max,
                rangeValues: widget.rangeValues,
                onChanged: (rangeValues) {
                  setState(() {
                    start = rangeValues.start;
                    end = rangeValues.end;
                  });
                  widget.onValueChanged(start, end);
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

extension NumberFormatting on num {
  String formatWithCommas() {
    return toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }
}
