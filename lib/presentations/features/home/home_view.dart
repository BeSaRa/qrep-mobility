// ignore_for_file: use_build_context_synchronously

import 'dart:math' as math;

import 'package:easy_localization/easy_localization.dart' as local;
import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/domain/models/requests/chatbot_requests/chatbot_request_model.dart';
import 'package:ebla/presentations/features/chatbot/blocs/messages_history_bloc/chat_history_cubit.dart';
import 'package:ebla/presentations/features/home/widgets/investors_cards_widget.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../app/app_preferences.dart';
import '../../../utils/global_functions.dart';
import '../../resources/resources.dart';
import '../info/blocs/news_bloc/news_bloc.dart';
import '../main/cubit/bottom_nav_cubit.dart';
import '../main/mains.dart';
import '../more/more_view.dart';
import 'widgets/news_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // final PageController _pageController = PageController();
  // final int _indexCubit = 0;
  late ChatHistoryCubit chatHistoryCubit;

  @override
  void initState() {
    FirebaseAnalytics.instance.logEvent(name: 'open_home_view');
    chatHistoryCubit = ChatHistoryCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getFromAprilMonths(context);
    return Scaffold(
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizeR.s100),
        child: BlocProvider<ChatHistoryCubit>.value(
          value: chatHistoryCubit
            ..addMessage(MessageRequestModel(
              role: 'assistant',
              content: AppStrings().defultBotMessage,
            )),
          child: FloatingActionButton(
            onPressed: () {
              context.pushNamed(RoutesNames.chatbot, extra: chatHistoryCubit);
            },
            backgroundColor: Theme.of(context).primaryColor,
            child: Image(
              image: const AssetImage(ImageAssets.chatBot),
              width: AppSizeW.s40,
              height: AppSizeH.s40,
            ),
          ),
        ),
      ),
      appBar: const TitleAppBar(),
      // backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageAssets.homeBg), fit: BoxFit.fill)),
        child: ListView(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizeH.s20),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await initSellModule();
                                context.read<BottomNavCubit>().changePage(2);
                                context.goNamed(
                                    context.read<BottomNavCubit>().paths[
                                        context.read<BottomNavCubit>().state]);
                              },
                              child: HomeContainer(
                                isBig: false,
                                title: AppStrings().sellIndicators,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                image: IconAssets.sellHome,
                                isShadow: instance<AppPreferences>()
                                            .getTheme()
                                            .brightness ==
                                        Brightness.light
                                    ? true
                                    : false,
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await initMortgageModule();
                                // context.goNamed(RoutesNames.mortgage);
                                context.read<BottomNavCubit>().changePage(3);
                                context.goNamed(
                                    context.read<BottomNavCubit>().paths[
                                        context.read<BottomNavCubit>().state]);
                              },
                              child: HomeContainer(
                                isBig: false,
                                title: AppStrings().mortgageIndicators,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onTertiaryContainer,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await initRentModule();
                                // context.goNamed(RoutesNames.rent);
                                context.read<BottomNavCubit>().changePage(1);
                                context.goNamed(
                                    context.read<BottomNavCubit>().paths[
                                        context.read<BottomNavCubit>().state]);
                              },
                              child: HomeContainer(
                                isBig: true,
                                title: AppStrings().rentIndicators,
                                color: Theme.of(context).cardColor,
                                image: IconAssets.rentHome,
                                imageColor: ColorManager.white,
                                textColor: ColorManager.white,
                                iconColor: ColorManager.silver,
                                isShadow: true,
                              ),
                            ),
                            // GestureDetector(
                            //   onTap: () {
                            //     context
                            //         .pushNamed(RoutesNames.realEstateBrokers);
                            //   },
                            //   child: HomeContainer(
                            //     isBig: true,
                            //     title: AppStrings().realEstateBrokers,
                            //     color:
                            //         Theme.of(context).scaffoldBackgroundColor,
                            //     image: IconAssets.inMiddleHome,
                            //     isShadow: instance<AppPreferences>()
                            //                 .getTheme()
                            //                 .brightness ==
                            //             Brightness.light
                            //         ? true
                            //         : false,
                            //   ),
                            // ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            //=============================================================
            const InvestorsCardsWidget(),
            SizedBox(
              height: AppSizeH.s20,
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
                      title: Text(
                        AppStrings().aboutUs,
                        style: Theme.of(context).textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.pushNamed(RoutesNames.laws);
                    },
                    child: StaticPagesContainer(
                      icon: IconAssets.lawsHome,
                      title: Text(
                        AppStrings().lawsAndDecisions,
                        style: Theme.of(context).textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.pushNamed(RoutesNames.faq);
                    },
                    child: StaticPagesContainer(
                      icon: IconAssets.faqHome,
                      title: Text(
                        AppStrings().faqs,
                        style: Theme.of(context).textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppSizeH.s24,
            ),
          ],
        ),
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
