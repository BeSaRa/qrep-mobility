// ignore_for_file: use_build_context_synchronously

import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/presentations/features/auth/blocs/cubits/logged_in_user_cubit.dart';
import 'package:ebla/presentations/features/more/blocs/user_bloc/user_bloc.dart';
import 'package:ebla/presentations/features/splash_screen/widgets/animated_transparent_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../app/app_preferences.dart';
import '../../resources/resources.dart';
import 'bloc/app_bloc/guest_token_bloc.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  // late AnimationController _animationController;
  // scale: used for the towers image
  double _scale = 1.5;

  // backgroundImageBottomPosition: used for the golden background image
  double backgroundImageBottomPosition = 0;

  // isVisible: used for the transparent container
  bool _isVisible = false;
  bool isRed = false;
  late GuestTokenBloc guestToken;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            instance<AppPreferences>().getTheme().brightness == Brightness.light
                ? Brightness.light
                : Brightness.dark));
    guestToken = instance<GuestTokenBloc>()
      ..add(const GuestTokenEvent.tokenGuest());
  }

  Future<void> _startAnimation() async {
    context.read<LoggedInUserCubit>().checkLoggedIn();
    setState(() {
      _scale = 1;
      _isVisible = !_isVisible;
      backgroundImageBottomPosition = -15;
    });
    // if (context.read<LoggedInUserCubit>().state) {
    //   context.read<UserBloc>().add(const UserEvent.getUserInfo());
    // } else {
    //   context.read<UserBloc>().add(const UserEvent.guestUser());
    // }
  }

  void navigateAfterDelay() {
    Future.delayed(const Duration(milliseconds: 200)).then((value) async {
      await initHomeModule();
      context.goNamed(RoutesNames.home);
    });
  }

  Future<void> showRedScreenAfterDelay() async {
    await Future.delayed(const Duration(milliseconds: 1500))
        .then((value) => showRedScreen());
  }

  Future<void> showRedScreen() async {
    setState(() {
      isRed = !isRed;
    });

    await Future.delayed(const Duration(milliseconds: 800))
        .then((value) => navigateAfterDelay());
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        switchInCurve: Curves.easeInOut,
        duration: const Duration(milliseconds: 60000),
        child: !isRed
            ? BlocConsumer<GuestTokenBloc, GuestTokenState>(
                bloc: guestToken,
                listener: (context, state) {
                  print("quest token listener $state");
                  state.map(
                      initial: (initial) {
                        WidgetsBinding.instance
                            .addPostFrameCallback((timeStamp) {
                          Future.delayed(
                            const Duration(milliseconds: 1000),
                            () {
                              _startAnimation();
                            },
                          );
                        });
                      },
                      loading: (loading) {
                        context.read<LoggedInUserCubit>().checkLoggedIn();
                      },
                      success: (success) {
                        if (context.read<LoggedInUserCubit>().state) {
                          print(
                              "quest token listener ${context.read<LoggedInUserCubit>().state}");
                          context
                              .read<UserBloc>()
                              .add(const UserEvent.getUserInfo());
                        } else {
                          print(
                              "quest token quest user ${context.read<LoggedInUserCubit>().state}");
                          context
                              .read<UserBloc>()
                              .add(const UserEvent.guestUser());
                        }
                        if (success.canUpdate) {
                          // here you can add a warning dialog to upgrade
                        } else {
                          WidgetsBinding.instance
                              .addPostFrameCallback((timeStamp) {
                            Future.delayed(
                              const Duration(milliseconds: 200),
                              () {
                                _startAnimation();
                              },
                            );
                          });
                        }
                      },
                      shouldUpdate: (shouldUpdate) {});
                },
                builder: (context, state) {
                  return state.map(initial: (val) {
                    return SplashScaffold(
                      backgroundImageBottomPosition:
                          backgroundImageBottomPosition,
                      isVisible: _isVisible,
                      scale: _scale,
                      showRedScreen: () {},
                    );
                  }, loading: (val) {
                    return SplashScaffold(
                      backgroundImageBottomPosition:
                          backgroundImageBottomPosition,
                      isVisible: _isVisible,
                      scale: _scale,
                      showRedScreen: () {},
                    );
                  }, success: (val) {
                    return SplashScaffold(
                      backgroundImageBottomPosition:
                          backgroundImageBottomPosition,
                      isVisible: _isVisible,
                      scale: _scale,
                      showRedScreen: showRedScreenAfterDelay,
                    );
                  }, shouldUpdate: (val) {
                    return Scaffold(
                      body: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: SizedBox(
                                height: AppSizeH.s304,
                                width: AppSizeH.s304,
                                child: Lottie.asset(ImageAssets.upgrade)),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: AppSizeH.s20,
                                horizontal: AppSizeW.s40),
                            child: Text(
                              AppStrings().shouldUpdateApplication,
                              style: Theme.of(context).textTheme.titleLarge,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    );
                  });
                },
              )
            : Scaffold(
                key: UniqueKey(),
                backgroundColor: ColorManager.primary,
              ));
  }

// @override
// void dispose() {
//   _animationController.dispose();
//   super.dispose();
// }
}

class SplashScaffold extends StatelessWidget {
  final double backgroundImageBottomPosition;
  final bool isVisible;
  final double scale;
  final Function showRedScreen;

  const SplashScaffold(
      {super.key,
      required this.backgroundImageBottomPosition,
      required this.isVisible,
      required this.scale,
      required this.showRedScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          AnimatedPositioned(
              top: backgroundImageBottomPosition,
              duration: const Duration(milliseconds: 800),
              child: Image.asset(ImageAssets.appbarBg)),
          Column(
            children: [
              Expanded(
                child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 800),
                    opacity: isVisible ? 1.0 : 0.0,
                    child: const AnimatedTransparentContainer()),
              ),
              SizedBox(
                height: AppSizeH.s30,
              ),
              Expanded(
                child: AnimatedScale(
                  scale: scale,
                  duration: const Duration(milliseconds: 800),
                  alignment: FractionalOffset.bottomCenter,
                  // onEnd: navigateAfterDelay,
                  onEnd: () {
                    showRedScreen();
                  },
                  child: SvgPicture.asset(
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
