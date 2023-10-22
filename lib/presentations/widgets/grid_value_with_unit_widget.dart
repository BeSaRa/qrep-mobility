import 'package:countup/countup.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter/material.dart';

class GridValueWithUnitWidget extends StatelessWidget {
  final bool countUp;
  final int duration;
  final String value;
  final String unit;
  final double begin;
  final double end;
  const GridValueWithUnitWidget(
      {super.key,
      this.value = '',
      this.unit = '',
      required this.countUp,
      this.duration = 1,
      this.begin = 0,
      this.end = 0});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Visibility(
              visible: !countUp,
              replacement: Countup(
                  duration: Duration(seconds: duration),
                  separator: ',',
                  begin: begin,
                  end: end,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: AppSizeSp.s18, height: 1)),
              child: Text(value,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: AppSizeSp.s18, height: 1)),
            ),
          ),
          Text(unit.tr(),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: AppSizeSp.s18, height: 1)),
          // SizedBox(
          //   height: AppSizeW.s25,
          // )
        ],
      ),
    );
  }
}
