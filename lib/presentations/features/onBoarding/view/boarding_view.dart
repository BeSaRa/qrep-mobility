import 'package:ebla/app/app_preferences.dart';
import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/presentations/features/onBoarding/cubits/current_board_cubit.dart';
import 'package:ebla/presentations/features/onBoarding/helper/boarding_data.dart';
import 'package:ebla/presentations/features/onBoarding/widgets/boarding_widget.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:ebla/presentations/resources/routes_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
class BoardingView extends StatelessWidget {
  final PageController _pageController = PageController();

  BoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final totalPages = boardingData.length;

    return Scaffold(
        backgroundColor: ColorManager.primary,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0.0,
        ),
        body: Padding(
          padding: EdgeInsets.only(bottom: AppSizeH.s20),
          child: BlocProvider(
            create: (_) => CurrentBoardCubit(),
            child: Column(
              children: [
                // PageView
                Expanded(
                  child: BlocBuilder<CurrentBoardCubit, int>(
                    builder: (context, currentIndex) {
                      return PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (index) => context
                            .read<CurrentBoardCubit>()
                            .updateIndex(index),
                        itemCount: totalPages,
                        itemBuilder: (context, index) {
                          final page = boardingData[index];
                          return Padding(
                            padding: index != totalPages - 1
                                ? EdgeInsets.only(
                                    right: AppSizeW.s25, left: AppSizeW.s25)
                                : const EdgeInsets.all(0),
                            child: BoardingWidget(
                              title: page['title'],
                              supTitle: page['subtitle'],
                              viewContent: page['view'],
                              totalPages: totalPages,
                              currentIndex: currentIndex,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: AppSizeH.s45),
                // Navigation Buttons
                Padding(
                  padding:
                      EdgeInsets.only(right: AppSizeW.s25, left: AppSizeW.s25),
                  child: BlocBuilder<CurrentBoardCubit, int>(
                    builder: (context, currentIndex) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Indicators
                              Row(
                                children: List.generate(totalPages, (index) {
                                  bool isActive = currentIndex == index;
                                  return AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    margin: EdgeInsets.only(
                                        right:
                                            //  index != 0
                                            //     ?
                                            AppSizeW.s3
                                        // : AppSizeW.s0,
                                        ),
                                    width:
                                        isActive ? AppSizeW.s20 : AppSizeW.s6,
                                    height: AppSizeH.s6,
                                    decoration: BoxDecoration(
                                      color: isActive
                                          ? ColorManager.white
                                          : Colors.grey,
                                      borderRadius:
                                          BorderRadius.circular(AppSizeR.s3),
                                    ),
                                  );
                                }),
                              ),
                              SizedBox(height: AppSizeH.s15),
                              TextButton(
                                onPressed: () async {
                                  final AppPreferences prefs =
                                      instance<AppPreferences>();
                                  await prefs.setOnboardingSeen(true);
                                  context.goNamed(RoutesNames.home);
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: const Size(0, 0),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                  AppStrings().skip,
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: AppSizeW.s50),
                          Expanded(
                            child: ElevatedButton(
                              style: Theme.of(context)
                                  .elevatedButtonTheme
                                  .style
                                  ?.copyWith(
                                      backgroundColor: WidgetStateProperty.all(
                                          ColorManager.white),
                                      textStyle: WidgetStatePropertyAll(
                                        TextStyle(
                                          color: ColorManager.primary,
                                        ),
                                      )),
                              onPressed: () async {
                                if (currentIndex < totalPages - 1) {
                                  context.read<CurrentBoardCubit>().next();
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeInOut,
                                  );
                                } else {
                                  final AppPreferences prefs =
                                      instance<AppPreferences>();
                                  await prefs.setOnboardingSeen(true);
                                  context.goNamed(RoutesNames.home);
                                }
                              },
                              child: Text(
                                  currentIndex < totalPages - 1
                                      ? AppStrings().next
                                      : AppStrings().getStarted,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: ColorManager.primary)),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
