import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class NewsItemWidget extends StatelessWidget {
  final String label;
  final String date;

  const NewsItemWidget({
    super.key,
    required this.label,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppSizeW.s7, vertical: AppSizeH.s7),
        decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(AppSizeR.s14),
            boxShadow: [
              BoxShadow(
                  color: ColorManager.silver,
                  offset: Offset(2, 2),
                  spreadRadius: 0.5,
                  blurRadius: AppSizeW.s4),
              BoxShadow(
                  color: ColorManager.silver,
                  offset: Offset(-2, 2),
                  spreadRadius: 0.5,
                  blurRadius: AppSizeW.s4),
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizeR.s10),
                  border: Border.all(width: 1, color: ColorManager.golden),
                ),
                child: const Image(
                  image: AssetImage(
                    ImageAssets.test,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(width: AppSizeW.s14),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  ReadMoreText(
                    label,
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: AppSizeSp.s8,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline),
                    style: Theme.of(context).textTheme.bodySmall,
                    lessStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: AppSizeSp.s8,
                        decoration: TextDecoration.underline),
                  ),
                  SizedBox(height: AppSizeH.s6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            size: AppSizeSp.s12,
                            color: ColorManager.cloudyGrey,
                          ),
                          SizedBox(width: AppSizeW.s5),
                          Text(
                            date,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    fontSize: AppSizeSp.s11,
                                    fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(AppSizeW.s5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: ColorManager.golden),
                        child: Icon(Icons.arrow_back_ios_new_rounded,
                            size: AppSizeSp.s12, color: ColorManager.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
