import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/language_manager.dart';
import 'package:ebla/presentations/resources/routes_manager.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:ebla/presentations/resources/theme_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:ebla/utils/global_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;

class InvestorsCardsWidget extends StatelessWidget {
  const InvestorsCardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: AppSizeH.s120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          InkWell(
            onTap: () {
              context.pushNamed(RoutesNames.investorJourney,
                  pathParameters: {"stepNumber": "0"});
            },
            child: InvestorsCard(
                color: Theme.of(context).primaryColor,
                icon: IconAssets.investorJourney,
                title: AppStrings().investorJourney),
          ),
          VerticalDivider(
            endIndent: AppSizeH.s15,
            color: ColorManager.golden.withAlpha(50),
            indent: AppSizeH.s15,
          ),
          InkWell(
            onTap: () {
              context.pushNamed(RoutesNames.investorJourney,
                  pathParameters: {"stepNumber": "1"});
            },
            child: InvestorsCard(
                color: ColorManager.primaryBlue,
                icon: IconAssets.propertyDeveloper,
                title: AppStrings().propertyDevelopers),
          ),
          VerticalDivider(
            endIndent: AppSizeH.s15,
            color: ColorManager.golden.withAlpha(50),
            indent: AppSizeH.s15,
          ),
          InkWell(
            onTap: () {
              context.pushNamed(RoutesNames.investorJourney,
                  pathParameters: {"stepNumber": "2"});
            },
            child: InvestorsCard(
                color: ColorManager.golden,
                icon: IconAssets.totalSellTransactionsValue,
                title: AppStrings().professionPracticers),
          ),
          VerticalDivider(
            endIndent: AppSizeH.s15,
            color: ColorManager.golden.withAlpha(50),
            indent: AppSizeH.s15,
          ),
          InkWell(
            onTap: () {
              context.pushNamed(RoutesNames.aboutTheAuthority, pathParameters: {
                "pageName": "tasksAndResponsibilitiesOftheAuthority"
              });
            },
            child: InvestorsCard(
                color: ColorManager.golden,
                icon: IconAssets.aboutHome,
                title: AppStrings().tasksAndResponsibilitiesOftheAuthority),
          ),
        ],
      ),
    );
  }
}

class InvestorsCard extends StatelessWidget {
  final String icon;
  final String title;
  final Color color;

  const InvestorsCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: AppSizeH.s150,
          width: isTablet ? AppSizeW.s226 : AppSizeW.s130,
          padding: EdgeInsets.symmetric(
              horizontal: AppSizeH.s6, vertical: AppSizeH.s10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppSizeH.s15,
              children: [
                if (icon.toLowerCase().endsWith("svg"))
                  SvgPicture.asset(
                    icon,
                    height: AppSizeH.s42,
                    width: AppSizeW.s42,
                    color: ColorManager.golden,
                  ),
                if (!icon.toLowerCase().endsWith("svg"))
                  ImageIcon(
                    AssetImage(icon),
                    color: ColorManager.golden,
                  ),
                Flexible(
                  child: SizedBox(
                    width: AppSizeW.s90,
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ColorManager.primaryBlue,
                          fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      softWrap: true,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Positioned(
        //   left: context.locale == ARABIC_LOCAL ? 0 : null,
        //   right: context.locale != ARABIC_LOCAL ? 0 : null,
        //   child: Container(
        //     padding: EdgeInsets.all(AppSizeH.s3),
        //     margin: EdgeInsets.all(AppSizeH.s8),
        //     decoration: BoxDecoration(
        //       color: ColorManager.platinum.withOpacity(.3),
        //       borderRadius: BorderRadius.circular(AppSizeR.s20),
        //     ),
        //     child: Transform.rotate(
        //         angle:
        //             context.locale == ARABIC_LOCAL ? -45 : 45 * math.pi / 180,
        //         child: Icon(
        //           size: AppSizeH.s12,
        //           Icons.arrow_upward_rounded,
        //           color: ColorManager.white,
        //         )),
        //   ),
        // ),
      ],
    );
  }
}
