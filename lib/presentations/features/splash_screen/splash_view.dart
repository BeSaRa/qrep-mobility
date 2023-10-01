import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  double _scale = 1.5; // Set the initial scale factor

  void _animatePicture() {
    setState(() {
      _scale = 1; // Set the target scale factor for the animation
    });
  }

  bool _isVisible = false;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        _animatePicture();
        _toggleVisibility();
      },
    );
  }

  Future<void> navigateAfterDelay() async {
    Future.delayed(
      const Duration(milliseconds: 1),
      () {
        // context.goNamed(
        //   RoutesNames.homeRoute,
        // );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Stack(
        children: [
          Image.asset(ImageAssets.splashBackground),
          Column(
            children: [
              Expanded(
                child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: _isVisible ? 1.0 : 0.0,
                    child: const AnimatedTransparentContainer()),
              ),
              SizedBox(
                height: AppSizeH.s30,
              ),
              Expanded(
                child: AnimatedScale(
                  scale: _scale,
                  duration: const Duration(milliseconds: 500),
                  alignment: FractionalOffset.bottomCenter,
                  onEnd: navigateAfterDelay,
                  child: Image.asset(
                    alignment: Alignment.bottomCenter,
                    ImageAssets.quatarTowerCitySplash,
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

class AnimatedTransparentContainer extends StatefulWidget {
  const AnimatedTransparentContainer({super.key});

  @override
  State<AnimatedTransparentContainer> createState() =>
      _AnimatedTransparentContainerState();
}

class _AnimatedTransparentContainerState
    extends State<AnimatedTransparentContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(AppSizeR.s50),
                    bottomRight: Radius.circular(AppSizeR.s50))),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text(
                'المنصة العقارية\n لدولة قطر\n',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(height: 1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 30,
                    height: 4,
                    decoration: BoxDecoration(
                      color: ColorManager.greyCloud,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppSizeH.s34,
              )
            ]),
          ),
        ),
        SizedBox(
          height: AppSizeH.s50,
        ),
        Image.asset(
          ImageAssets.ministryOfMunicipality,
        ),
      ],
    );
  }
}
