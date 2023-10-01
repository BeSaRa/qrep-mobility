import 'package:ebla/presentations/features/splash_screen/widgets/animated_transparent_container.dart';
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
  // scale: used for the towers image
  double _scale = 1.5;
  // backgroundImageBottomPosition: used for the golden background image
  double backgroundImageBottomPosition = 0;
  // isVisible: used for the transparent container
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 1400),
      () {
        _startAnimation();
      },
    );
  }

  void _startAnimation() {
    setState(() {
      _scale = 1;
      _isVisible = !_isVisible;
      backgroundImageBottomPosition = -15;
    });
  }

  Future<void> navigateAfterDelay() async {
    Future.delayed(
      const Duration(milliseconds: 1),
      () {
        context.goNamed(
          RoutesNames.homeRoute,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Stack(
        children: [
          AnimatedPositioned(
              top: backgroundImageBottomPosition,
              duration: const Duration(milliseconds: 500),
              child: Image.asset(ImageAssets.splashBackground)),
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
