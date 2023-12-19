import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class AnimatedPulesLogo extends StatefulWidget {
  const AnimatedPulesLogo({super.key});

  @override
  State<AnimatedPulesLogo> createState() => _AnimatedPulesLogoState();
}

class _AnimatedPulesLogoState extends State<AnimatedPulesLogo>
    with TickerProviderStateMixin {
  late AnimationController motionController;

  double size = 20;

  @override
  void initState() {
    super.initState();
    motionController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
      lowerBound: 0.5,
    );
    motionController.forward();
    motionController.addListener(() {
      setState(() {
        size = motionController.value * 250;
      });
    });
    motionController.addStatusListener((status) {
      setState(() {
        if (status == AnimationStatus.completed) {
          motionController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          motionController.forward();
        }
      });
    });
    // motionController.forward();
  }

  @override
  void dispose() {
    motionController.dispose();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // todo: when dark mode is ready change statusBarIconBrightness according to the theme
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          // todo: when dark mode is ready change statusBarIconBrightness according to the theme
          statusBarColor: ColorManager.primary,
          statusBarIconBrightness: Brightness.light),
    );
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            ColorManager.primary,
            Theme.of(context).scaffoldBackgroundColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.2, 1.0],
        )),
        child: Center(
            child: SizedBox(
          height: AppSizeW.s200,
          child: Stack(children: <Widget>[
            Center(
              child: Container(
                height: size - AppSizeW.s5,
                padding: EdgeInsets.all(AppSizeW.s5 * (0.009 * size)),
                decoration: BoxDecoration(
                    color: ColorManager.white.withOpacity(0.4),
                    shape: BoxShape.circle),
                child: Container(
                  height: size - AppSizeW.s5,
                  padding: EdgeInsets.all(AppSizeW.s5 * (0.007 * size)),
                  decoration: BoxDecoration(
                      color: ColorManager.white.withOpacity(0.6),
                      shape: BoxShape.circle),
                  child: Container(
                    padding: EdgeInsets.all(AppSizeW.s5),
                    decoration: BoxDecoration(
                        color: ColorManager.white, shape: BoxShape.circle),
                    height: size,
                    child: Image.asset(ImageAssets.logoPng),
                  ),
                ),
              ),
            )
          ]),
        )),
      ),
    );
  }
}

class GreyLinerContainer extends StatelessWidget {
  const GreyLinerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: AppSizeW.s170, vertical: AppSizeH.s20),
      height: AppSizeH.s5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizeR.s5),
          color: ColorManager.lightSilver),
    );
  }
}
