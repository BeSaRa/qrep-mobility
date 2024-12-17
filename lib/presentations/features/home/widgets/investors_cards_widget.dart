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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizeH.s20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              context.pushNamed(RoutesNames.investorJourney,
                  pathParameters: {"stepNumber": "0"});
            },
            child: InvestorsCard(
              color: Theme.of(context).primaryColor,
              icon: IconAssets.investorJourney,
              title: SizedBox(
                width: AppSizeW.s90,
                child: Text(
                  AppStrings().investorJourney,
                  style: TextStyle(
                      fontFamily: FontConstants.fontFamily,
                      color: ColorManager.white,
                      fontSize: AppSizeSp.s15,
                      fontWeight: FontWeight.w700),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // context.pushNamed(RoutesNames.investorJourney,
              //     pathParameters: {"stepNumber": "1"});
            },
            child: InvestorsCard(
              color: ColorManager.primaryBlue,
              icon: IconAssets.propertyDeveloper,
              title: SizedBox(
                width: AppSizeW.s90,
                child: Text(
                  AppStrings().propertyDevelopers,
                  style: TextStyle(
                      fontFamily: FontConstants.fontFamily,
                      color: ColorManager.white,
                      fontSize: AppSizeSp.s15,
                      fontWeight: FontWeight.w700),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // context.pushNamed(RoutesNames.investorJourney,
              //     pathParameters: {"stepNumber": "2"});
            },
            child: InvestorsCard(
              color: ColorManager.golden,
              icon: IconAssets.totalSellTransactionsValue,
              title: SizedBox(
                width: AppSizeW.s80,
                child: Text(
                  AppStrings().professionPracticers,
                  style: TextStyle(
                      fontFamily: FontConstants.fontFamily,
                      color: ColorManager.white,
                      fontSize: AppSizeSp.s15,
                      fontWeight: FontWeight.w700),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InvestorsCard extends StatelessWidget {
  final String icon;
  final Widget title;
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
          width: isTablet ? AppSizeW.s226 : AppSizeW.s115,
          padding: EdgeInsets.symmetric(
              horizontal: AppSizeH.s6, vertical: AppSizeH.s10),
          decoration: BoxDecoration(
              color: color,
              // color: Theme.of(context).cardTheme.color,
              borderRadius: BorderRadius.circular(AppSizeW.s14),
              border: Border.all(
                  color: Theme.of(context).dividerColor, width: AppSizeH.s1)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  icon,
                  height: AppSizeH.s36,
                  width: AppSizeW.s32,
                  color: ColorManager.white,
                ),
                SizedBox(height: AppSizeH.s20),
                Flexible(child: title),
              ],
            ),
          ),
        ),
        Positioned(
          left: context.locale == ARABIC_LOCAL ? 0 : null,
          right: context.locale != ARABIC_LOCAL ? 0 : null,
          child: Container(
            padding: EdgeInsets.all(AppSizeH.s3),
            margin: EdgeInsets.all(AppSizeH.s8),
            decoration: BoxDecoration(
              color: ColorManager.platinum.withOpacity(.3),
              borderRadius: BorderRadius.circular(AppSizeR.s20),
            ),
            child: Transform.rotate(
                angle:
                    context.locale == ARABIC_LOCAL ? -45 : 45 * math.pi / 180,
                child: Icon(
                  size: AppSizeH.s12,
                  Icons.arrow_upward_rounded,
                  color: ColorManager.white,
                )),
          ),
        ),
      ],
    );
  }
}
