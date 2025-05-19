import 'package:easy_localization/easy_localization.dart' as local;
import 'package:ebla/app/depndency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;
import '../../resources/resources.dart';

class IndicatorsView extends StatefulWidget {
  const IndicatorsView({super.key});

  @override
  State<IndicatorsView> createState() => _IndicatorsViewState();
}

class _IndicatorsViewState extends State<IndicatorsView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _slide;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _opacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.05), // small slide from bottom
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _controller.forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: _opacity,
        child: SlideTransition(
          position: _slide,
          child: Column(
            spacing: AppSizeH.s12,
            children: [
              SizedBox(
                height: AppSizeH.s20,
              ),
              IndicatorWidget(
                title: AppStrings().sellIndicators,
                image: IconAssets.sellHome,
                onTap: () async {
                  await initSellModule();
                  context.pushNamed(RoutesNames.sales);
                },
              ),
              IndicatorWidget(
                title: AppStrings().rentIndicators,
                image: IconAssets.rentHome,
                onTap: () async {
                  await initRentModule();
                  context.pushNamed(RoutesNames.rent);
                },
              ),
              IndicatorWidget(
                title: AppStrings().mortgageIndicators,
                image: IconAssets.mortagageHome,
                onTap: () async {
                  await initMortgageModule();
                  context.pushNamed(RoutesNames.mortgage);
                },
              ),
            ],
          ),
        ));
  }
}

class IndicatorWidget extends StatelessWidget {
  final String title;
  final String image;
  final Function onTap;
  const IndicatorWidget({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
            horizontal: AppSizeW.s10, vertical: AppSizeH.s10),
        height: AppSizeH.s100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizeR.s20),
            color: Theme.of(context).cardTheme.color,
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
        child: GestureDetector(
          onTap: () {
            onTap();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: AppSizeW.s12, vertical: AppSizeH.s8),
                padding: EdgeInsets.symmetric(
                    horizontal: AppSizeW.s6, vertical: AppSizeH.s10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSizeR.s12),
                    color: ColorManager.golden.withAlpha(90)),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(AppSizeR.s20)),
                  child: SvgPicture.asset(
                    image,
                    height: AppSizeH.s70,
                    width: AppSizeW.s70,
                    color: Theme.of(context).colorScheme.primary,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Text(
                title,
                maxLines: 6,
                softWrap: true,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w800, fontSize: AppSizeSp.s16),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Transform.rotate(
                    angle: context.locale == ARABIC_LOCAL
                        ? -45
                        : 45 * math.pi / 180,
                    child: Icon(
                      Icons.arrow_upward_rounded,
                      color: ColorManager.golden,
                    )),
              ),
            ],
          ),
        ));
  }
}
