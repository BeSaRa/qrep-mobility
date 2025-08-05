import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/presentations/features/training/bloc/training_filter_cubit/training_filter_cubit.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/language_manager.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/get_all_training_courses_bloc/get_all_training_courses_bloc.dart';

class TrainingSelectableCatigoriesList extends StatefulWidget {
  const TrainingSelectableCatigoriesList({super.key});

  @override
  State<TrainingSelectableCatigoriesList> createState() =>
      _TrainingSelectableCatigoriesListState();
}

class _TrainingSelectableCatigoriesListState
    extends State<TrainingSelectableCatigoriesList> {
  final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ValueListenableBuilder<int>(
              valueListenable: selectedIndex,
              builder: (context, value, _) {
                return BlocBuilder<GetAllTrainingCoursesBloc,
                        GetAllTrainingCoursesState>(
                    bloc: BlocProvider.of<GetAllTrainingCoursesBloc>(context),
                    builder: (context, state) {
                      return state.maybeMap(
                        done: (value1) {
                          return SizedBox(
                            height: AppSizeH.s60,
                            child: ListView.separated(
                              controller: _scrollController,
                              scrollDirection: Axis.horizontal,
                              itemCount: value1.categoriesResponse.data!
                                      .categories.length +
                                  1,
                              separatorBuilder: (_, __) =>
                                  SizedBox(width: AppSizeW.s10),
                              itemBuilder: (context, index) {
                                final isSelected = index == value;
                                final categoryName = index == 0
                                    ? AppStrings().all
                                    : value1.categoriesResponse.data!
                                        .categories[index - 1].translations
                                        .firstWhere(
                                          (e) =>
                                              e.languageId ==
                                              (context.locale == ARABIC_LOCAL
                                                  ? 2
                                                  : 1),
                                          orElse: () => value1
                                              .categoriesResponse
                                              .data!
                                              .categories[index - 1]
                                              .translations
                                              .first,
                                        )
                                        .name;

                                return GestureDetector(
                                  onTap: () {
                                    selectedIndex.value = index;
                                    final filterCubit =
                                        context.read<TrainingFilterCubit>();
                                    final newCategories = index == 0
                                        ? null
                                        : [
                                            value1.categoriesResponse.data!
                                                .categories[index - 1].id
                                          ];
                                    final currentFilters = context
                                        .read<TrainingFilterCubit>()
                                        .state;
                                    filterCubit.updateFilters(
                                      isActive: currentFilters.isActive,
                                      pageIndex: 1,
                                      track: currentFilters.track,
                                      isFree: currentFilters.isFree,
                                      name: currentFilters.name,
                                      categories: newCategories,
                                      pageSize: currentFilters.pageSize,
                                    );

                                    context
                                        .read<GetAllTrainingCoursesBloc>()
                                        .add(
                                          GetAllTrainingCoursesEvent
                                              .applyFilters(
                                            filterCubit.state,
                                          ),
                                        );
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.symmetric(
                                        vertical: AppSizeH.s5),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: AppSizeW.s10,
                                        vertical: AppSizeH.s10),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: ColorManager.primary
                                                .withValues(alpha: 0.2),
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
                                        borderRadius:
                                            BorderRadius.circular(AppSizeR.s10),
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? ColorManager.textFieldGrey
                                            : Theme.of(context)
                                                .scaffoldBackgroundColor),
                                    child: Text(categoryName,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? isSelected
                                                      ? ColorManager.white
                                                      : ColorManager.golden
                                                  : isSelected
                                                      ? ColorManager.primary
                                                      : ColorManager
                                                          .primaryBlue,
                                            )),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        orElse: () {
                          return const SizedBox.shrink();
                        },
                      );
                    });
              }),
        ),
      ],
    );
  }
}
