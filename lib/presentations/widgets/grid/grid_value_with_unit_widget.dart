import 'package:countup/countup.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter/material.dart';

class GridValueWithUnitWidget extends StatelessWidget {
  final num begin;
  final num end;
  final String unit;
  final int duration;
  final bool dataCollectedAndAudited;
  const GridValueWithUnitWidget(
      {super.key,
      this.unit = '',
      this.duration = 1,
      this.begin = 0,
      this.end = 0,
      this.dataCollectedAndAudited = false});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizeW.s12),
        child: Wrap(
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            Visibility(
              visible: !dataCollectedAndAudited,
              replacement: Text(
                textAlign: TextAlign.center,
                maxLines: 3,
                AppStrings().dataBeingCollectedAndAudited,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              child: Countup(
                  duration: Duration(seconds: duration),
                  separator: ',',
                  begin: begin.round().toDouble(),
                  end: end.round().toDouble(),
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: AppSizeSp.s18, height: 1)),
            ),
            SizedBox(width: unit.isNotEmpty ? AppSizeW.s4 : 0),
            unit.isNotEmpty
                ? Text(unit.tr(),
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: AppSizeSp.s16, height: 1))
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
