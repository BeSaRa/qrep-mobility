// ignore_for_file: use_build_context_synchronously

import 'dart:math' as math;

import 'package:easy_localization/easy_localization.dart' as local;
import 'package:ebla/app/depndency_injection.dart';

import 'package:ebla/presentations/features/home/widgets/investors_cards_widget.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/global_functions.dart';
import '../../resources/resources.dart';
import '../info/blocs/news_bloc/news_bloc.dart';

import '../main/cubit/bottom_nav_cubit.dart';
import 'widgets/news_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // final PageController _pageController = PageController();
  // final int _indexCubit = 0;

  @override
  void initState() {
    FirebaseAnalytics.instance.logEvent(name: 'open_home_view');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getFromAprilMonths(context);
    return ListView(
      children: [
        SizedBox(
          height: AppSizeH.s20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppSizeW.s40,
          children: [
            SizedBox(
              width: AppSizeW.s90,
              child: Column(
                spacing: AppSizeH.s8,
                children: [
                  HomeIcons(
                    icon: IconAssets.lawsNew,
                    title: AppStrings().laws,
                    onTap: () {
                      context.pushNamed(RoutesNames.laws);
                    },
                  ),
                  HomeIcons(
                    icon: IconAssets.calendar,
                    title: AppStrings().calendar,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              width: AppSizeW.s90,
              child: Column(
                spacing: AppSizeH.s8,
                children: [
                  HomeIcons(
                    icon: IconAssets.about,
                    title: AppStrings().aboutAuthority,
                    onTap: () {
                      context.pushNamed(RoutesNames.aboutTheAuthority,
                          pathParameters: {"pageName": "aboutTheAuthority"});
                    },
                  ),
                  HomeIcons(
                    icon: IconAssets.video,
                    title: AppStrings().video,
                    onTap: () {},
                  ),
                  // HomeIcons(
                  //   icon: IconAssets.training,
                  //   title: AppStrings().tasksAndResponsibilitiesOftheAuthority,
                  //   onTap: () {
                  //     context.pushNamed(RoutesNames.aboutTheAuthority,
                  //         pathParameters: {
                  //           "pageName": "tasksAndResponsibilitiesOftheAuthority"
                  //         });
                  //   },
                  // ),
                ],
              ),
            ),
            SizedBox(
              width: AppSizeW.s90,
              child: Column(
                spacing: AppSizeH.s8,
                children: [
                  HomeIcons(
                    icon: IconAssets.aqaratNews,
                    title: AppStrings().visionAndMission,
                    onTap: () {
                      context.pushNamed(RoutesNames.aboutTheAuthority,
                          pathParameters: {"pageName": "visionAndMission"});
                    },
                  ),
                  HomeIcons(
                    icon: IconAssets.locationIndicator,
                    title: AppStrings().authorityLocation,
                    onTap: () {
                      context.pushNamed(RoutesNames.authorityMap);
                    },
                  ),
                ],
              ),
            )
          ],
        ),

        //===========================================================
        SizedBox(
          height: AppSizeH.s14,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSizeH.s20, vertical: AppSizeH.s10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings().indicatorsAndNumbers,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              GestureDetector(
                onTap: () {
                  context.read<BottomNavCubit>().changePage(4);
                  context.goNamed(context
                      .read<BottomNavCubit>()
                      .paths[context.read<BottomNavCubit>().state]);
                },
                child: Row(
                  children: [
                    Text(
                      AppStrings().showAll,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: ColorManager.golden,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSizeW.s20, vertical: AppSizeH.s12),
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: AppSizeH.s12, horizontal: AppSizeW.s12),
            decoration: BoxDecoration(
                color: Theme.of(context).cardTheme.color,
                borderRadius: BorderRadius.circular(AppSizeR.s14),
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).shadowColor,
                      offset: const Offset(1, 1),
                      blurRadius: AppSizeW.s2,
                      spreadRadius: AppSizeW.s1),
                  BoxShadow(
                      color: Theme.of(context).shadowColor,
                      offset: const Offset(-1, -1),
                      blurRadius: AppSizeW.s2,
                      spreadRadius: AppSizeW.s1),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("3,317",
                        style: Theme.of(context).textTheme.titleLarge),
                    Text(
                      AppStrings().sellTotalTransactions,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: ColorManager.primaryBlue),
                    ),
                    Text(
                      AppStrings().forFirstThreeQuarters,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    SizedBox(
                      height: AppSizeH.s25,
                    ),
                    Text("64,955",
                        style: Theme.of(context).textTheme.titleLarge),
                    Text(
                      AppStrings().totalNumberForRent,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: ColorManager.primaryBlue),
                    ),
                    Text(
                      AppStrings().forFirstThreeQuarters,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("1,081 ",
                            style: Theme.of(context).textTheme.titleLarge),
                        Text(
                            "${Localizations.localeOf(context) == ARABIC_LOCAL ? "مليار" : "Billion"} ${AppStrings().currency} ",
                            style: Theme.of(context).textTheme.titleSmall),
                      ],
                    ),
                    Text(
                      AppStrings().totalValuesForSell,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: ColorManager.primaryBlue),
                    ),
                    Text(
                      AppStrings().forFirstThreeQuarters,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    SizedBox(
                      height: AppSizeH.s25,
                    ),
                    Row(
                      children: [
                        Text("485,6 ",
                            style: Theme.of(context).textTheme.titleLarge),
                        Text(
                            "${Localizations.localeOf(context) == ARABIC_LOCAL ? "مليون" : "Million"} ${AppStrings().currency} ",
                            style: Theme.of(context).textTheme.titleSmall),
                      ],
                    ),
                    Text(
                      AppStrings().totalValuesForRent,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: ColorManager.primaryBlue),
                    ),
                    Text(
                      AppStrings().forFirstThreeQuarters,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        //=============================================================
        const InvestorsCardsWidget(),
        SizedBox(
          height: AppSizeH.s10,
        ),
        //=============================================================
        BlocProvider(
          create: (context) =>
              instance<NewsBloc>()..add(const NewsEvent.getNewsEvent()),
          child: const NewsWidget(),
        ),
        SizedBox(
          height: AppSizeH.s20,
        ),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: AppSizeH.s20),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       InkWell(
        //         onTap: () {
        //           context.pushNamed(RoutesNames.about);
        //         },
        //         child: StaticPagesContainer(
        //           icon: IconAssets.aboutHome,
        //           title: Text(
        //             AppStrings().aboutUs,
        //             style: Theme.of(context).textTheme.bodyMedium,
        //             overflow: TextOverflow.ellipsis,
        //             maxLines: 2,
        //             softWrap: true,
        //             textAlign: TextAlign.center,
        //           ),
        //         ),
        //       ),
        //       InkWell(
        //         onTap: () {},
        //         child: StaticPagesContainer(
        //           icon: IconAssets.lawsHome,
        //           title: Text(
        //             AppStrings().lawsAndDecisions,
        //             style: Theme.of(context).textTheme.bodyMedium,
        //             overflow: TextOverflow.ellipsis,
        //             maxLines: 2,
        //             softWrap: true,
        //             textAlign: TextAlign.center,
        //           ),
        //         ),
        //       ),
        //       InkWell(
        //         onTap: () {
        //           context.pushNamed(RoutesNames.faq);
        //         },
        //         child: StaticPagesContainer(
        //           icon: IconAssets.faqHome,
        //           title: Text(
        //             AppStrings().faqs,
        //             style: Theme.of(context).textTheme.bodyMedium,
        //             overflow: TextOverflow.ellipsis,
        //             maxLines: 2,
        //             softWrap: true,
        //             textAlign: TextAlign.center,
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // SizedBox(
        //   height: AppSizeH.s24,
        // ),
      ],
    );
  }
}

class HomeIcons extends StatelessWidget {
  final String icon;
  final String title;
  final Function onTap;
  const HomeIcons({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        spacing: AppSizeH.s8,
        children: [
          Container(
            padding: EdgeInsets.all(AppSizeR.s12),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.tertiary),
            child: ImageIcon(
              AssetImage(icon),
              color: ColorManager.white,
              size: AppSizeR.s22,
            ),
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontSize: AppSizeSp.s12),
          )
        ],
      ),
    );
  }
}

class StaticPagesContainer extends StatelessWidget {
  final String icon;
  final Widget title;

  const StaticPagesContainer({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizeH.s100,
      width: isTablet ? AppSizeW.s226 : AppSizeW.s112,
      padding:
          EdgeInsets.symmetric(horizontal: AppSizeH.s6, vertical: AppSizeH.s10),
      decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(AppSizeW.s14),
          border: Border.all(
              color: Theme.of(context).dividerColor, width: AppSizeH.s1)),
      child: Center(
        child: Column(
          mainAxisAlignment: title is Text
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: AppSizeH.s36,
              width: AppSizeW.s32,
            ),
            Flexible(child: title),
          ],
        ),
      ),
    );
  }
}

class HomeContainer extends StatelessWidget {
  final bool isBig;
  final String title;
  final Color color;
  final String image;
  final Color? imageColor;
  final Color? iconColor;
  final Color? textColor;
  final bool isShadow;

  // final BuildContext context;

  const HomeContainer({
    super.key,
    required this.isBig,
    required this.title,
    required this.color,
    required this.image,
    this.imageColor,
    this.iconColor,
    this.textColor,
    required this.isShadow,
    // required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: AppSizeW.s10, vertical: AppSizeH.s10),
      height:
          (MediaQuery.of(context).size.height / 2.5) * (isBig ? 0.50 : 0.36),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppSizeR.s20),
          border: isShadow ? null : Border.all(color: ColorManager.grey),
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).shadowColor,
                offset: const Offset(1, 1),
                blurRadius: AppSizeW.s2,
                spreadRadius: AppSizeW.s1),
            BoxShadow(
                color: Theme.of(context).shadowColor,
                offset: const Offset(-1, -1),
                blurRadius: AppSizeW.s2,
                spreadRadius: AppSizeW.s1),
          ]),
      child: Stack(
        children: [
          if (!isBig)
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: isTablet ? AppSizeW.s100 : AppSizeW.s70,
                  child: Text(
                    title,
                    maxLines: 6,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.w800,
                        fontSize: AppSizeSp.s16),
                  ),
                ),
              ),
            ),
          Stack(
            // crossAxisAlignment:
            //     isBig ? CrossAxisAlignment.center : CrossAxisAlignment.end,
            children: [
              Align(
                alignment: context.locale == ARABIC_LOCAL
                    ? Alignment.topLeft
                    : Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Transform.rotate(
                      angle: context.locale == ARABIC_LOCAL
                          ? -45
                          : 45 * math.pi / 180,
                      child: Icon(
                        Icons.arrow_upward_rounded,
                        color: isBig ? ColorManager.greyCloud : iconColor,
                      )),
                ),
              ),
              Align(
                alignment: isBig ? Alignment.center : Alignment.bottomLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(AppSizeR.s20)),
                  child: SvgPicture.asset(
                    image,
                    height: AppSizeH.s70,
                    width: AppSizeW.s70,
                    color: imageColor ?? Theme.of(context).colorScheme.primary,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              if (isBig)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSizeH.s12),
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w700, fontSize: AppSizeSp.s16),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
