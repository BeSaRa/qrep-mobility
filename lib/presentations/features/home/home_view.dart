import 'dart:math' as math;

import 'package:easy_localization/easy_localization.dart' as local;
import 'package:ebla/app/depndency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../resources/resources.dart';
import '../info/blocs/news_bloc/news_bloc.dart';
import '../more/more_view.dart';
import 'widgets/news_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, this.title = 'press'});

  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // final PageController _pageController = PageController();
  // final int _indexCubit = 0;
  @override
  void didChangeDependencies() {
    print("did change dependencies");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageAssets.homeBg), fit: BoxFit.fill)),
      child: Scaffold(
        appBar: const TitleAppBar(),
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizeH.s20),
                child: SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 2.5,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.goNamed(RoutesNames.sales);
                              },
                              child: _HomeContainer(
                                isBig: true,
                                title: AppStrings().sellIndicators,
                                color: ColorManager.white,
                                image: IconAssets.sellHome,
                                isShadow: true,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                context.goNamed(RoutesNames.mortgage);
                              },
                              child: _HomeContainer(
                                isBig: false,
                                title: AppStrings().mortgageIndicators,
                                color: ColorManager.silver,
                                image: IconAssets.mortagageHome,
                                iconColor: ColorManager.white,
                                isShadow: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.goNamed(RoutesNames.rent);
                              },
                              child: _HomeContainer(
                                isBig: false,
                                title: AppStrings().rentIndicators,
                                color: ColorManager.cloudyGrey,
                                image: IconAssets.rentHome,
                                imageColor: ColorManager.white,
                                textColor: ColorManager.white,
                                iconColor: ColorManager.silver,
                                isShadow: true,
                              ),
                            ),
                            _HomeContainer(
                              isBig: true,
                              title: AppStrings().realEstateBrokers,
                              color: Colors.white.withOpacity(0.8),
                              image: IconAssets.inMiddleHome,
                              isShadow: true,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            SizedBox(
              height: AppSizeH.s10,
            ),
            BlocProvider(
              create: (context) =>
              instance<NewsBloc>()
                ..add(const NewsEvent.getNewsEvent()),
              child: const NewsWidget(),
            ),
            SizedBox(
              height: AppSizeH.s20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizeH.s20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      context.pushNamed(RoutesNames.about);
                    },
                    child: StaticPagesContainer(
                      icon: IconAssets.aboutHome,
                      title: AppStrings().aboutUs,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.pushNamed(RoutesNames.laws);
                    },
                    child: StaticPagesContainer(
                      icon: IconAssets.lawsHome,
                      title: AppStrings().lawsAndDecisions,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.pushNamed(RoutesNames.faq);
                    },
                    child: StaticPagesContainer(
                      icon: IconAssets.faqHome,
                      title: AppStrings().faqs,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StaticPagesContainer extends StatelessWidget {
  final String icon;
  final String title;

  const StaticPagesContainer({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizeH.s125,
      width: AppSizeW.s100,
      padding: EdgeInsets.symmetric(
          horizontal: AppSizeH.s15, vertical: AppSizeH.s10),
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppSizeW.s14),
          border: Border.all(color: ColorManager.golden, width: AppSizeH.s1)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: AppSizeH.s60,
              width: AppSizeW.s60,
            ),
            Text(
              title,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeContainer extends StatelessWidget {
  final bool isBig;
  final String title;
  final Color color;
  final String image;
  final Color? imageColor;
  final Color? iconColor;
  final Color? textColor;
  final bool isShadow;
  // final BuildContext context;

  const _HomeContainer({
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
      (MediaQuery
          .of(context)
          .size
          .height / 2.5) * (isBig ? 0.50 : 0.36),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppSizeR.s20),
          border: isShadow ? null : Border.all(color: ColorManager.grey),
          boxShadow: [
            BoxShadow(
                color: ColorManager.grey,
                offset: const Offset(1, 1),
                blurRadius: AppSizeW.s2,
                spreadRadius: AppSizeW.s1),
            BoxShadow(
                color: ColorManager.grey,
                offset: const Offset(-1, -1),
                blurRadius: AppSizeW.s2,
                spreadRadius: AppSizeW.s1),
          ]),
      child: Row(
        children: [
          if (!isBig)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 6,
                  softWrap: true,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: textColor, fontWeight: FontWeight.w800),
                ),
              ),
            ),
          if (!isBig)
            SizedBox(
              width: AppSizeH.s4,
            ),
          Expanded(
            child: Column(
              crossAxisAlignment:
              isBig ? CrossAxisAlignment.center : CrossAxisAlignment.end,
              children: [
                Align(
                  // alignment: context.locale == ARABIC_LOCAL
                  //     ? Alignment.topLeft
                  //     : Alignment.topRight,
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
                if (!isBig)
                  SizedBox(
                    height: AppSizeH.s10,
                  ),
                Align(
                  alignment: isBig ? Alignment.center : Alignment.bottomLeft,
                  child: SvgPicture.asset(
                    image,
                    height: AppSizeH.s70,
                    width: AppSizeW.s70,
                    color: imageColor ?? Theme
                        .of(context)
                        .primaryColor,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                if (isBig)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: true,
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
