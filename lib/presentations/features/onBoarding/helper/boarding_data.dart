import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/language_manager.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';

final List<Map<String, dynamic>> boardingData = [
  {
    'title': 'Xmap',
    'subtitle': AppStrings().onBoardingXmapSubtitle,
    'view': const OnboardingXMapVideoPlayer(
      assetPath: 'assets/videos/xmap.mp4',
    ),
  },
  {
    'title': AppStrings().realEstateIndicators,
    'subtitle': AppStrings().onBoardingInddecatorsSubtitle,
    'view': const OnboardignRealEstateIndecatorsWidget(),
  },
  {
    'title': AppStrings().investorJourney,
    'subtitle': '',
    'view': const OnBoardingInvestorJourneyWidget(),
  },
  {
    'title': AppStrings().aiAvatar,
    'subtitle': '',
    'view': const OnboardingAiAvatar()
  },
  {
    'title': AppStrings().aiSearch,
    'subtitle': '',
    'view': const OnBoardingAiSearch(),
  },
];

//=======================================================================

class OnBoardingAiSearch extends StatefulWidget {
  const OnBoardingAiSearch({super.key});

  @override
  State<OnBoardingAiSearch> createState() => _OnBoardingAiSearchState();
}

class _OnBoardingAiSearchState extends State<OnBoardingAiSearch>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _circleScale;
  late final Animation<double> _iconScale;
  late final Animation<double> _textScale;
  Alignment _iconAlignment = Alignment.centerLeft;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _circleScale = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _iconScale = Tween<double>(begin: 1.0, end: 4.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _textScale = Tween<double>(begin: 1.0, end: 1.4).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final isArabic = context.locale.languageCode == 'ar';

      setState(() {
        _iconAlignment =
            isArabic ? Alignment.centerRight : Alignment.centerLeft;
      });

      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Transform.scale(
          scale: _circleScale.value,
          child: Container(
            width: width,
            height: width,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? ColorManager.white.withValues(alpha: .1)
                  : ColorManager.grey.withValues(alpha: .6),
              borderRadius: BorderRadius.circular(1000),
            ),
            child: Center(
              child: IntrinsicHeight(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: AppSizeW.s20),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizeW.s40,
                    vertical: AppSizeH.s20,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? ColorManager.primary
                        : ColorManager.golden,
                    borderRadius: BorderRadius.circular(AppSizeR.s10),
                  ),
                  child: SizedBox(
                    height: AppSizeH.s100,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: AppSizeW.s40), // لحجز مكان الأيقونة
                            Transform.scale(
                              scale: _textScale.value,
                              child: Text(
                                AppStrings().searchTheWebsite,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? null
                                            : ColorManager.primary
                                                .withValues(alpha: .5)),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: _iconAlignment,
                          child: Transform.scale(
                            scale: _iconScale.value,
                            child: Image.asset(
                              IconAssets.onboardingSearch,
                              width: AppSizeW.s20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

//=======================================================================

class OnboardignRealEstateIndecatorsWidget extends StatelessWidget {
  const OnboardignRealEstateIndecatorsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (context.locale != ARABIC_LOCAL) SizedBox(width: AppSizeW.s30),
        Flexible(
          child: Align(
            alignment: Alignment.center,
            child: Transform.scale(
              scale: 1.3,
              child: Lottie.asset(
                ImageAssets.realEstateIndicators,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        if (context.locale == ARABIC_LOCAL) SizedBox(width: AppSizeW.s30),
      ],
    );
  }
}

//=======================================================================

class OnBoardingInvestorJourneyWidget extends StatefulWidget {
  const OnBoardingInvestorJourneyWidget({super.key});

  @override
  State<OnBoardingInvestorJourneyWidget> createState() =>
      _OnBoardingInvestorJourneyWidgetState();
}

class _OnBoardingInvestorJourneyWidgetState
    extends State<OnBoardingInvestorJourneyWidget>
    with TickerProviderStateMixin {
  final List<Map<String, String>> items = [
    {
      'image': IconAssets.onboardingStudyIdea,
      'title': AppStrings().studyTheIdea,
      'subtitle': AppStrings().investorJourneySubtitle,
    },
    {
      'image': IconAssets.contactWithExperts,
      'title': AppStrings().connectWithExperts,
      'subtitle': AppStrings().onboardingContactWithExperts,
    },
    {
      'image': IconAssets.chooseProject,
      'title': AppStrings().chooseYourProject,
      'subtitle': AppStrings().onboardingChooseProject,
    },
    {
      'image': IconAssets.ownRealestate,
      'title': AppStrings().ownYourRealEstate,
      'subtitle': AppStrings().onboardingOwnProject,
    },
    {
      'image': IconAssets.manageRealestate,
      'title': AppStrings().manageYourProperty,
      'subtitle': AppStrings().onboardingManageRealestate,
    },
  ];

  final ValueNotifier<int> currentIndex = ValueNotifier(0);
  late final AnimationController _animController;
  late Animation<Offset> _slideAnimation;
  late final Animation<double> _scaleAnimation;

  Timer? _loopTimer;
  Offset getEntryOffset(int index) {
    switch (index) {
      case 0:
        return const Offset(2.0, -1.5); // من الأعلى تمامًا
      case 1:
        return const Offset(2.4, -0.8); // من الأعلى قليلاً
      case 2:
        return const Offset(2.6, 0.0); // من اليمين بشكل أفقي
      case 3:
        return const Offset(2.4, 0.8); // أقرب إلى الوسط السفلي
      case 4:
        return const Offset(2.0, 1.5); // زاوية حادة من اليمين السفلي
      default:
        return const Offset(2.6, 0.0);
    }
  }

  Offset getExitOffset(int index) {
    switch (index) {
      case 0:
        return const Offset(-2.0, 1.5);
      case 1:
        return const Offset(-2.4, 0.8);
      case 2:
        return const Offset(-2.6, 0.0);
      case 3:
        return const Offset(-2.4, -0.8);

      case 4:
        return const Offset(-2.0, -1.5); // يخرج لأعلى يسار
      default:
        return const Offset(-2.6, 0.0);
    }
  }

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeOut),
    );

    _startLoop();
  }

  void _startLoop() {
    final index = currentIndex.value;

    // Entry animation
    _slideAnimation = Tween<Offset>(
      begin: getEntryOffset(index),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animController, curve: Curves.easeOut));

    _animController.forward();

    _loopTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      final index = currentIndex.value;

      // Exit animation
      _slideAnimation = Tween<Offset>(
        begin: Offset.zero,
        end: getExitOffset(index),
      ).animate(CurvedAnimation(parent: _animController, curve: Curves.easeIn));

      _animController.reverse().then((_) {
        if (!mounted) return;

        // Prepare next entry
        final nextIndex = (index + 1) % items.length;
        currentIndex.value = nextIndex;

        _slideAnimation = Tween<Offset>(
          begin: getEntryOffset(nextIndex),
          end: Offset.zero,
        ).animate(
            CurvedAnimation(parent: _animController, curve: Curves.easeOut));

        _animController.forward();
      });
    });
  }

  @override
  void dispose() {
    _loopTimer?.cancel();
    _animController.dispose();
    currentIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Spacer(flex: 1),
          Image.asset(
            IconAssets.investorJourneyPng,
            width: AppSizeW.s150,
          ),
          SizedBox(height: AppSizeH.s100),
          Container(
            padding: EdgeInsets.all(AppSizeW.s20),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? ColorManager.white.withValues(alpha: 0.1)
                  : ColorManager.blackBG.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppSizeR.s15),
            ),
            child: ValueListenableBuilder<int>(
              valueListenable: currentIndex,
              builder: (context, index, _) {
                final item = items[index];

                return SlideTransition(
                  position: _slideAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    alignment: Alignment.bottomRight,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          item['image']!,
                          width: AppSizeW.s40,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? null
                              : ColorManager.primary,
                        ),
                        SizedBox(width: AppSizeW.s20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title']!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? null
                                            : ColorManager.primary),
                              ),
                              SizedBox(height: AppSizeH.s10),
                              Text(
                                item['subtitle']!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? ColorManager.greyCloud
                                          : ColorManager.primary
                                              .withValues(alpha: .5),
                                    ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}

//=======================================================================

class OnboardingXMapVideoPlayer extends StatefulWidget {
  final String assetPath;

  const OnboardingXMapVideoPlayer({super.key, required this.assetPath});

  @override
  State<OnboardingXMapVideoPlayer> createState() =>
      _OnboardingXMapVideoPlayerState();
}

class _OnboardingXMapVideoPlayerState extends State<OnboardingXMapVideoPlayer>
    with TickerProviderStateMixin {
  late VideoPlayerController _controller;

  final ValueNotifier<bool> show = ValueNotifier(false);
  late Timer _loopTimer;

  late AnimationController _whiteScaleController;
  late AnimationController _blackScaleController;

  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(widget.assetPath)
      ..initialize().then((_) {
        if (_isDisposed) return;
        _controller.setLooping(true);
        _controller.play();
        _startLoopingAnimation();
      });

    _whiteScaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
      lowerBound: 0.0,
      upperBound: 1.0,
    );

    _blackScaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
      lowerBound: 0.0,
      upperBound: 1.0,
    );
  }

  void _startLoopingAnimation() {
    if (_isDisposed) return;

    show.value = true;
    _whiteScaleController.forward();

    Future.delayed(const Duration(milliseconds: 300), () {
      if (_isDisposed) return;
      _blackScaleController.forward();
    });

    _loopTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_isDisposed) return;

      show.value = true;
      _whiteScaleController.forward(from: 0.0);

      Future.delayed(const Duration(milliseconds: 300), () {
        if (_isDisposed) return;
        _blackScaleController.forward(from: 0.0);
      });

      // Hide after 2 seconds
      Future.delayed(const Duration(seconds: 2), () {
        if (_isDisposed) return;
        _blackScaleController.reverse();

        Future.delayed(const Duration(milliseconds: 300), () {
          if (_isDisposed) return;
          _whiteScaleController.reverse();
          show.value = false;
        });
      });
    });
  }

  @override
  void dispose() {
    _isDisposed = true;

    _controller.dispose();
    _whiteScaleController.dispose();
    _blackScaleController.dispose();
    _loopTimer.cancel();
    show.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Video section
        ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSizeR.s15),
          ),
          child: FittedBox(
            fit: BoxFit.cover,
            clipBehavior: Clip.hardEdge,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: AppSizeH.s354,
              child: VideoPlayer(_controller),
            ),
          ),
        ),

        // Animated message section
        Container(
          padding: EdgeInsets.symmetric(horizontal: AppSizeW.s15),
          height: AppSizeH.s150,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? ColorManager.white.withValues(alpha: 0.1)
                : ColorManager.blackBG.withValues(alpha: 0.1),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(AppSizeR.s15),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // First message - bottom right scale in/out
              Row(
                mainAxisAlignment: context.locale == ARABIC_LOCAL
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.end,
                children: [
                  ScaleTransition(
                    alignment: Alignment.bottomRight,
                    scale: _whiteScaleController,
                    child: Image.asset(
                      ImageAssets.whiteMessage,
                      width: MediaQuery.sizeOf(context).width * 0.5,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizeH.s16),

              // Second message - bottom left scale in/out
              Row(
                mainAxisAlignment: context.locale == ARABIC_LOCAL
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  ScaleTransition(
                    alignment: Alignment.bottomLeft,
                    scale: _blackScaleController,
                    child: Image.asset(
                      ImageAssets.blackMessage,
                      width: MediaQuery.sizeOf(context).width * 0.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//=======================================================================

class OnboardingAiAvatar extends StatefulWidget {
  const OnboardingAiAvatar({super.key});

  @override
  State<OnboardingAiAvatar> createState() => _OnboardingAiAvatarState();
}

class _OnboardingAiAvatarState extends State<OnboardingAiAvatar>
    with TickerProviderStateMixin {
  late final AnimationController _white1ScaleController;
  late final AnimationController _black1ScaleController;
  late final AnimationController _white2FadeController;
  late final AnimationController _black2FadeController;

  final ValueNotifier<bool> show = ValueNotifier(false);
  late Timer _loopTimer;

  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();

    _white1ScaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
      lowerBound: 0.0,
      upperBound: 1.0,
    );

    _black1ScaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
      lowerBound: 0.0,
      upperBound: 1.0,
    );

    _white2FadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _black2FadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _startLoopingAnimation();
  }

  void _startLoopingAnimation() {
    if (_isDisposed) return;

    show.value = true;
    _white1ScaleController.forward();

    Future.delayed(const Duration(milliseconds: 300), () {
      if (_isDisposed) return;
      _black1ScaleController.forward();
    });

    Future.delayed(const Duration(milliseconds: 600), () {
      if (_isDisposed) return;
      _white2FadeController.forward();
    });

    Future.delayed(const Duration(milliseconds: 900), () {
      if (_isDisposed) return;
      _black2FadeController.forward();
    });

    _loopTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (_isDisposed) return;

      show.value = true;
      _white1ScaleController.forward(from: 0.0);

      Future.delayed(const Duration(milliseconds: 300), () {
        if (_isDisposed) return;
        _black1ScaleController.forward(from: 0.0);
      });

      Future.delayed(const Duration(milliseconds: 600), () {
        if (_isDisposed) return;
        _white2FadeController.forward(from: 0.0);
      });

      Future.delayed(const Duration(milliseconds: 900), () {
        if (_isDisposed) return;
        _black2FadeController.forward(from: 0.0);
      });

      // Hide all after 2 seconds
      Future.delayed(const Duration(seconds: 2), () {
        if (_isDisposed) return;
        _black2FadeController.reverse();

        Future.delayed(const Duration(milliseconds: 200), () {
          if (_isDisposed) return;
          _white2FadeController.reverse();

          Future.delayed(const Duration(milliseconds: 200), () {
            if (_isDisposed) return;
            _black1ScaleController.reverse();

            Future.delayed(const Duration(milliseconds: 300), () {
              if (_isDisposed) return;
              _white1ScaleController.reverse();
              show.value = false;
            });
          });
        });
      });
    });
  }

  @override
  void dispose() {
    _isDisposed = true;
    _loopTimer.cancel();
    show.dispose();

    _white1ScaleController.dispose();
    _black1ScaleController.dispose();
    _white2FadeController.dispose();
    _black2FadeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: AppSizeH.s304,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppSizeR.s15),
            ),
            image: const DecorationImage(
              image: AssetImage(ImageAssets.theAvatarPerson),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Message container
        Container(
          padding: EdgeInsets.symmetric(horizontal: AppSizeW.s15),
          height: AppSizeH.s200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? ColorManager.white.withValues(alpha: 0.1)
                : ColorManager.blackBG.withValues(alpha: 0.1),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(AppSizeR.s15),
            ),
          ),
          child: ValueListenableBuilder<bool>(
            valueListenable: show,
            builder: (_, visible, __) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // white1 - scale from bottomRight
                  Row(
                    mainAxisAlignment: context.locale == ARABIC_LOCAL
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                    children: [
                      ScaleTransition(
                        alignment: Alignment.bottomRight,
                        scale: _white1ScaleController,
                        child: Image.asset(
                          ImageAssets.whiteMessage,
                          width: MediaQuery.sizeOf(context).width * 0.4,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizeH.s8),

                  // black1 - scale from bottomLeft
                  Row(
                    mainAxisAlignment: context.locale == ARABIC_LOCAL
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      ScaleTransition(
                        alignment: Alignment.bottomLeft,
                        scale: _black1ScaleController,
                        child: Image.asset(
                          ImageAssets.blackMessage,
                          width: MediaQuery.sizeOf(context).width * 0.4,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizeH.s8),

                  // white2 - fade only
                  Row(
                    mainAxisAlignment: context.locale == ARABIC_LOCAL
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                    children: [
                      FadeTransition(
                        opacity: _white2FadeController,
                        child: Image.asset(
                          ImageAssets.whiteMessage,
                          width: MediaQuery.sizeOf(context).width * 0.4,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizeH.s8),

                  // black2 - fade only
                  Row(
                    mainAxisAlignment: context.locale == ARABIC_LOCAL
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      FadeTransition(
                        opacity: _black2FadeController,
                        child: Image.asset(
                          ImageAssets.blackMessage,
                          width: MediaQuery.sizeOf(context).width * 0.4,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

//=======================================================================
