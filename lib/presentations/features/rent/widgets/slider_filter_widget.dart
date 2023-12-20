import 'package:flutter/material.dart';

import '../../../resources/resources.dart';

class SliderWidget extends StatefulWidget {
  final Function(RangeValues)? onChanges;
  final RangeValues values;
  final double min;
  final double max;
  final String startValue;
  final String endValue;
  final String title;

  const SliderWidget(
      {super.key,
      this.onChanges,
      required this.values,
      required this.min,
      required this.max,
      required this.startValue,
      required this.endValue,
      required this.title});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSizeH.s12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title, style: Theme.of(context).textTheme.labelMedium),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizeW.s8),
              child: RangeSlider(
                onChanged: widget.onChanges,
                values: widget.values,
                min: widget.min,
                max: widget.max,
              ),
            ),
          ],
        ),
        Row(children: [
          Expanded(
            child: Container(
              height: AppSizeH.s36,
              decoration: ShapeDecoration(
                  color: Theme.of(context).canvasColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: ColorManager.silver),
                    borderRadius: BorderRadius.circular(AppSizeR.s5),
                  )),
              child: Center(
                child: Text(
                  widget.startValue,
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
                  color: Theme.of(context).canvasColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: ColorManager.silver),
                    borderRadius: BorderRadius.circular(AppSizeR.s5),
                  )),
              child: Center(
                child: Text(
                  widget.endValue,
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
