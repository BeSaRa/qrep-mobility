import 'package:ebla/presentations/features/chatbot/widgets/rera_text_faild.dart';
import 'dart:ui' as ui;
import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../main/cubit/bottom_nav_cubit.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        context.read<BottomNavCubit>().changePage(0);
        context.goNamed(context.read<BottomNavCubit>().paths[0]);
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Theme.of(context).scaffoldBackgroundColor
                  : Theme.of(context).canvasColor,
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(AppSizeR.s20))),
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Padding(
            padding: EdgeInsets.all(AppSizeH.s20),
            child: Column(
              spacing: AppSizeH.s15,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Title
                Text(
                  AppStrings().services,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).textTheme.bodySmall?.color),
                ),

                // 2. Search Field
                ReraTextFaild(
                  hint: "${AppStrings().search} ...",
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: Theme.of(context).disabledColor,
                  ),
                ),
//zak delete this
                InkWell(
                  onTap: () {
                    context.pushNamed(RoutesNames.training);
                  },
                  child: Container(
                    // padding: EdgeInsets.symmetric(vertical: AppSizeH.s20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage(ImageAssets.trainingCity),
                          colorFilter:
                              Theme.of(context).brightness == Brightness.dark
                                  ? ColorFilter.mode(
                                      ColorManager.golden,
                                      BlendMode.srcIn,
                                    )
                                  : null,
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).brightness ==
                                    Brightness.dark
                                ? ColorManager.white.withValues(alpha: 0.2)
                                : ColorManager.primary.withValues(alpha: 0.2),
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          )
                        ],
                        borderRadius: BorderRadius.circular(AppSizeR.s10),
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Theme.of(context).cardTheme.color
                            : Theme.of(context).scaffoldBackgroundColor),
                    child: Row(
                      textDirection: ui.TextDirection.ltr,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Image.asset(IconAssets.training),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Text(AppStrings().realEstateTrainingPortal,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? ColorManager.white
                                        : ColorManager.primaryBlue,
                                  )),
                        ),
                      ],
                    ),
                  ),
                ),
                // InvestorsCard(
                //     color: ColorManager.golden,
                //     icon: IconAssets.training,
                //     title: AppStrings().realEstateTrainingPortal),
                // ),
                // 3. Horizontal Selectable List
                const SelectableHorizontalList(),

                // 4. Bordered Container with Shadow
                const GreyShadowContainer(text: "Searched data"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SelectableHorizontalList extends StatefulWidget {
  const SelectableHorizontalList({super.key});

  @override
  State<SelectableHorizontalList> createState() =>
      _SelectableHorizontalListState();
}

class _SelectableHorizontalListState extends State<SelectableHorizontalList> {
  final ValueNotifier<int> selectedIndex = ValueNotifier<int>(-1);
  final ScrollController _scrollController = ScrollController();

  final List<String> items = [
    'الخدمات العقارية',
    'الشركات العقارية',
    'المثمنون العقاريون',
    'Item 4',
    'Item 5'
  ];

  void scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 100,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 100,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Left arrow
        GestureDetector(
          onTap: scrollLeft,
          child: const Icon(Icons.chevron_left),
        ),
        Expanded(
          child: ValueListenableBuilder<int>(
            valueListenable: selectedIndex,
            builder: (context, value, _) {
              return SizedBox(
                height: AppSizeH.s70,
                child: ListView.separated(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  separatorBuilder: (_, __) => SizedBox(width: AppSizeW.s10),
                  itemBuilder: (context, index) {
                    final isSelected = index == value;
                    return GestureDetector(
                      onTap: () => selectedIndex.value = index,
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(vertical: AppSizeH.s10),
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizeW.s10, vertical: AppSizeH.s10),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color:
                                    ColorManager.primary.withValues(alpha: 0.2),
                                blurRadius: 2,
                                offset: const Offset(0, 1),
                              )
                            ],
                            border: Border.all(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? isSelected
                                      ? ColorManager.white
                                      : ColorManager.golden
                                  : isSelected
                                      ? ColorManager.primary
                                      : Colors.transparent,
                              width: AppSizeW.s1,
                            ),
                            borderRadius: BorderRadius.circular(AppSizeR.s10),
                            color: Theme.of(context).brightness ==
                                    Brightness.dark
                                ? ColorManager.textFieldGrey
                                : Theme.of(context).scaffoldBackgroundColor),
                        child: Text(items[index],
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? isSelected
                                              ? ColorManager.white
                                              : ColorManager.golden
                                          : isSelected
                                              ? ColorManager.primary
                                              : ColorManager.primaryBlue,
                                    )),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),

        // Right arrow
        GestureDetector(
          onTap: scrollRight,
          child: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}

class GreyShadowContainer extends StatelessWidget {
  final String text;
  const GreyShadowContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: EdgeInsets.all(AppSizeW.s16),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? ColorManager.textFieldGrey
              : Theme.of(context).scaffoldBackgroundColor,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(AppSizeR.s10),
          boxShadow: [
            BoxShadow(
              color: ColorManager.primary.withValues(alpha: 0.1),
              blurRadius: 3,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).brightness != Brightness.dark
                  ? ColorManager.primary.withValues(alpha: .6)
                  : ColorManager.golden.withValues(alpha: .6),
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
