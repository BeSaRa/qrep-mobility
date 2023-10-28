import 'package:countup/countup.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/app/extensions.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter/material.dart';

class GridValueWithUnitWidget extends StatelessWidget {
  final bool countUp;
  final int duration;
  final String unit;
  final num? value;
  final num? begin;
  final num? end;
  final bool dataCollectedAndAudited;
  const GridValueWithUnitWidget(
      {super.key,
      this.unit = '',
      required this.countUp,
      this.duration = 1,
      this.value = 0,
      this.begin = 0,
      this.end = 0,
      this.dataCollectedAndAudited = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: !dataCollectedAndAudited,
            replacement: Flexible(
                child: Text(
              textAlign: TextAlign.center,
              maxLines: 3,
              AppStrings().dataBeingCollectedAndAudited,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: AppSizeSp.s12),
            )),
            child: Flexible(
              child: Visibility(
                visible: !countUp,
                replacement: Countup(
                    duration: Duration(seconds: duration),
                    separator: ',',
                    begin: (begin ?? 0).ceil().toDouble(),
                    end: (end ?? 0).ceil().toDouble(),
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: AppSizeSp.s18, height: 1)),
                child: Text((value ?? 0).ceil().formatWithCommas().toString(),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: AppSizeSp.s18, height: 1)),
              ),
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
