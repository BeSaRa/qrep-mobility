import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Column(
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

              // transform: Matrix4.diagonal3Values(_scale, _scale, 1.0),
              alignment: FractionalOffset.bottomCenter,
              child: Image.asset(
                alignment: Alignment.bottomCenter,
                ImageAssets.quatarTowerCitySplash,
                // height: AppSizeH.s447,
              ),
            ),
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
            decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(AppSizeR.s50),
                    bottomRight: Radius.circular(AppSizeR.s50))),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              // Text(
              //   'المنصة العقارية',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 33,
              //     fontFamily: 'Noto Sans',
              //     fontWeight: FontWeight.w700,
              //   ),
              // ),
              // Text(
              //   'لدولة قطر',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 33,
              //     height: 1,
              //     fontFamily: 'Noto Sans',
              //     fontWeight: FontWeight.w700,
              //   ),
              // ),

              Text(
                'المنصة العقارية\n لدولة قطر\n',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 33,
                  fontFamily: 'Noto Sans',
                  fontWeight: FontWeight.w700,
                  height: 1,
                ),
              ),
              // SizedBox(
              //   height: AppSizeH.s10,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 30,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Color(0xFFB6B6B6),
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
          // height: AppSizeH.s125,
        ),
      ],
    );
  }
}
