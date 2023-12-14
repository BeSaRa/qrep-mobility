import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/values_manager.dart';
import 'shimmer_placeholder.dart';

class StatisticsRentWidget extends StatelessWidget {
  final List<StatisticsModel> statistics;

  const StatisticsRentWidget({
    super.key,
    required this.statistics,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> mywidgets = [];
    for (int i = 0; i < statistics.length; i++) {
      mywidgets.add(Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  statistics[i].title,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              const Spacer(),
              Text(
                statistics[i].number,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          SizedBox(height: AppSizeH.s5),
          i == (statistics.length - 1)
              ? const SizedBox()
              : Divider(
                  color: ColorManager.mercury,
                  height: AppSizeH.s1,
                ),
        ],
      ));
    }
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: AppSizeH.s13, horizontal: AppSizeW.s21),
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppSizeR.s12),
          boxShadow: [
            BoxShadow(
                offset: const Offset(1, 1),
                spreadRadius: AppSizeR.s2,
                blurRadius: AppSizeR.s11,
                color: ColorManager.textBlack.withAlpha(6))
          ]),
      child: Column(children: mywidgets),
    );
  }
}

class StatisticsModel {
  final String title;
  final String number;

  StatisticsModel({required this.title, required this.number});
}

class StatisticsShimmerWidget extends StatelessWidget {
  const StatisticsShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> mywidgets = [];
    for (int i = 0; i < 3; i++) {
      mywidgets.add(Column(
        children: [
          SizedBox(height: AppSizeH.s5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ShimmerPlaceholder(
                  child: Container(
                    // width: double.infinity,
                    height: AppSizeH.s12,
                    decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(AppSizeR.s12)),
                  ),
                ),
              ),
              const Spacer(),
              ShimmerPlaceholder(
                child: Container(
                  width: AppSizeW.s30,
                  height: AppSizeH.s12,
                  decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(AppSizeR.s12)),
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizeH.s10),
          i == (3 - 1)
              ? const SizedBox()
              : Divider(
                  color: ColorManager.mercury,
                  height: AppSizeH.s1,
                ),
        ],
      ));
    }
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: AppSizeH.s13, horizontal: AppSizeW.s21),
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppSizeR.s12),
          boxShadow: [
            BoxShadow(
                offset: const Offset(1, 1),
                spreadRadius: AppSizeR.s2,
                blurRadius: AppSizeR.s11,
                color: ColorManager.textBlack.withAlpha(6))
          ]),
      child: Column(children: mywidgets),
    );
  }
}
