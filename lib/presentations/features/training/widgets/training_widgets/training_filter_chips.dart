import 'package:ebla/presentations/features/training/bloc/get_all_training_courses_bloc/get_all_training_courses_bloc.dart';
import 'package:ebla/presentations/features/training/bloc/training_filter_cubit/training_filter_cubit.dart';
import 'package:ebla/presentations/features/training/utils/training_utils.dart';
import 'package:ebla/presentations/features/training/widgets/training_widgets/main_training_filter_bottom_sheet_widget.dart';
import 'package:ebla/presentations/features/training/widgets/training_widgets/training_filter_chip.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:ebla/presentations/widgets/bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrainingFilterChips extends StatefulWidget {
  const TrainingFilterChips({super.key});

  @override
  State<TrainingFilterChips> createState() => _TrainingFilterChipsState();
}

class _TrainingFilterChipsState extends State<TrainingFilterChips> {
  final List<FilterOption> isFreeOptions = [
    FilterOption(name: AppStrings().all, value: null),
    FilterOption(name: AppStrings().paid, value: false),
    FilterOption(name: AppStrings().free, value: true),
  ];

  final List<FilterOption> isActiveOptions = [
    FilterOption(name: AppStrings().all, value: null),
    FilterOption(name: AppStrings().inactive, value: false),
    FilterOption(name: AppStrings().active, value: true),
  ];

  final List<FilterOption> trackOptions = [
    FilterOption(name: AppStrings().all, value: null),
    FilterOption(name: AppStrings().course, value: 0),
    FilterOption(name: AppStrings().exam, value: 1),
  ];
  final List<FilterOption> locationOptions = [
    FilterOption(name: AppStrings().all, value: null),
    FilterOption(name: AppStrings().onSite, value: 0),
    FilterOption(name: AppStrings().remote, value: 1),
  ];
  final List<FilterOption> langOptions = [
    FilterOption(name: AppStrings().all, value: null),
    FilterOption(name: AppStrings().english, value: 0),
    FilterOption(name: AppStrings().arabic, value: 1),
  ];
    final List<FilterOption> isMorningOptions = [
    FilterOption(name: AppStrings().all, value: null),
    FilterOption(name: AppStrings().am, value: true),
    FilterOption(name: AppStrings().pm, value: false),
  ];

  final ValueNotifier<FilterOption> selectedTrackNotifier = ValueNotifier(FilterOption(name: AppStrings().all, value: null));
  final ValueNotifier<FilterOption> selectedIsFreeNotifier = ValueNotifier(FilterOption(name: AppStrings().all, value: null));
  final ValueNotifier<FilterOption> selectedIsActiveNotifier = ValueNotifier(FilterOption(name: AppStrings().all, value: null));
  final ValueNotifier<FilterOption> selectedLocationNotifier = ValueNotifier(FilterOption(name: AppStrings().all, value: null));
  final ValueNotifier<FilterOption> selectedLangNotifier = ValueNotifier(FilterOption(name: AppStrings().all, value: null));
  final ValueNotifier<FilterOption> selectedisMorningNotifier = ValueNotifier(FilterOption(name: AppStrings().all, value: null));
  final ValueNotifier<DateTime?> startDateNotifier = ValueNotifier<DateTime?>(null);
  final ValueNotifier<DateTime?> endDateNotifier = ValueNotifier<DateTime?>(null);
  final ValueNotifier<bool> isEndDateEnabledNotifier = ValueNotifier<bool>(false);
  @override
  void initState() {
    super.initState();
    // Initialize with first options
    selectedTrackNotifier.value = trackOptions[0];
    selectedIsFreeNotifier.value = isFreeOptions[0];
    selectedIsActiveNotifier.value = isActiveOptions[0];
    selectedLocationNotifier.value = locationOptions[0];
    selectedLangNotifier.value = langOptions[0];
    selectedisMorningNotifier.value = isMorningOptions[0];
  }

  @override
  void dispose() {
    selectedTrackNotifier.dispose();
    selectedIsFreeNotifier.dispose();
    selectedIsActiveNotifier.dispose();
    selectedisMorningNotifier.dispose();
    selectedLangNotifier.dispose();
    selectedLocationNotifier.dispose();
    startDateNotifier.dispose();
    endDateNotifier.dispose();
    isEndDateEnabledNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: BlocBuilder<GetAllTrainingCoursesBloc, GetAllTrainingCoursesState>(
        bloc: BlocProvider.of<GetAllTrainingCoursesBloc>(context),
        builder: (context, state) {
          final filterCubit = context.read<TrainingFilterCubit>();

          return state.maybeMap(
            done: (_) {
              return Row(
                // crossAxisAlignment: CrossAxisAlignment.end
                children: [
                  ValueListenableBuilder<FilterOption>(
                    valueListenable: selectedTrackNotifier,
                    builder: (context, selectedTrack, _) {
                      return TrainingFilterChip(
                        mainLabel: AppStrings().type,
                        label: selectedTrack.name,
                        onTap: () => _showFilterOptions(
                          context,
                          trackOptions,
                          (FilterOption selected) {
                            // Get current filters
                            final currentFilters = context.read<TrainingFilterCubit>().state;
                            // Update filters - preserve all existing values
                            filterCubit.updateFilters(
                              track: selected.value,
                              pageIndex: 1, // Reset to first page when changing filters
                              isFree: currentFilters.isFree,
                              isActive: currentFilters.isActive,
                              name: currentFilters.name,
                              categories: currentFilters.categories,
                              pageSize: currentFilters.pageSize,
                            );
                            // Trigger new request
                            context.read<GetAllTrainingCoursesBloc>().add(
                                  GetAllTrainingCoursesEvent.applyFilters(
                                    filterCubit.state,
                                  ),
                                );

                            selectedTrackNotifier.value = selected;
                          },
                        ),
                        icon: Icons.keyboard_arrow_down,
                      );
                    },
                  ),
                  SizedBox(width: AppSizeW.s8),
                  ValueListenableBuilder<FilterOption>(
                    valueListenable: selectedIsFreeNotifier,
                    builder: (context, selectedIsFree, _) {
                      return TrainingFilterChip(
                        mainLabel: AppStrings().courseFees,
                        label: selectedIsFree.name,
                        onTap: () => _showFilterOptions(
                          context,
                          isFreeOptions,
                          (FilterOption selected) {
                            // Get current filters
                            final currentFilters = context.read<TrainingFilterCubit>().state;
                            filterCubit.updateFilters(
                              isFree: selected.value,
                              pageIndex: 1,
                              track: currentFilters.track,
                              isActive: currentFilters.isActive,
                              name: currentFilters.name,
                              categories: currentFilters.categories,
                              pageSize: currentFilters.pageSize,
                            );
                            context.read<GetAllTrainingCoursesBloc>().add(
                                  GetAllTrainingCoursesEvent.applyFilters(
                                    filterCubit.state,
                                  ),
                                );
                            selectedIsFreeNotifier.value = selected;
                          },
                        ),
                        icon: Icons.keyboard_arrow_down,
                      );
                    },
                  ),
                  // SizedBox(width: AppSizeW.s8),
                  // ValueListenableBuilder<FilterOption>(
                  //   valueListenable: selectedIsActiveNotifier,
                  //   builder: (context, selectedIsActive, _) {
                  //     return TrainingFilterChip(
                  //       mainLabel: AppStrings().status,
                  //       label: selectedIsActive.name,
                  //       onTap: () => _showFilterOptions(
                  //         context,
                  //         isActiveOptions,
                  //         (FilterOption selected) {
                  //           final currentFilters =
                  //               context.read<TrainingFilterCubit>().state;
                  //           filterCubit.updateFilters(
                  //             isActive: selected.value,
                  //             pageIndex: 1,
                  //             track: currentFilters.track,
                  //             isFree: currentFilters.isFree,
                  //             name: currentFilters.name,
                  //             categories: currentFilters.categories,
                  //             pageSize: currentFilters.pageSize,
                  //           );
                  //           context.read<GetAllTrainingCoursesBloc>().add(
                  //                 GetAllTrainingCoursesEvent.applyFilters(
                  //                   filterCubit.state,
                  //                 ),
                  //               );
                  //           selectedIsActiveNotifier.value = selected;
                  //         },
                  //       ),
                  //       icon: Icons.keyboard_arrow_down,
                  //     );
                  //   },
                  // ),
                  SizedBox(width: AppSizeW.s8),
                  GestureDetector(
                    onTap: () async {
                        var res = await bottomSheetWidget(
                          context,
                          child: MultiBlocProvider(
                            providers: [BlocProvider.value(value: filterCubit)],
                            child:  MainTrainingFilterBottomSheetWidget(
                              startDateNotifier: startDateNotifier,
                              endDateNotifier: endDateNotifier,
                              isEndDateEnabledNotifier: isEndDateEnabledNotifier,
                              langOptions: langOptions,
                              locationOptions: locationOptions,
                              isMorningOptions: isMorningOptions,
                              selectedLangNotifier: selectedLangNotifier,
                              selectedLocationNotifier: selectedLocationNotifier,
                              selectedisMorningNotifier: selectedisMorningNotifier,
                              selectedTrackNotifier: selectedTrackNotifier,
                              selectedIsActiveNotifier: selectedIsActiveNotifier,
                              selectedIsFreeNotifier: selectedIsFreeNotifier,
                              isActiveOptions: isActiveOptions,
                              isFreeOptions: isFreeOptions,
                              trackOptions: trackOptions,
                            ))
                        );
                          if (res != null && res) {
                            
                          //zak here make the request to back-end with data
                        }
                      },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSizeW.s16,
                        vertical: AppSizeH.s8,
                      ),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color:
                                  ColorManager.blackBG.withValues(alpha: 0.2),
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            )
                          ],
                          borderRadius: BorderRadius.circular(AppSizeR.s10),
                          color: Theme.of(context).brightness == Brightness.dark
                              ? ColorManager.textFieldGrey
                              : Theme.of(context).scaffoldBackgroundColor),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(AppStrings().more,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? ColorManager.golden
                                        : ColorManager.primaryBlue,
                                  )),
                          SizedBox(width: AppSizeW.s20),
                          Image.asset(
                            IconAssets.filter,
                            width: AppSizeSp.s16,
                            color: ColorManager.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            orElse: () {
              return const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }

  void _showFilterOptions(
    BuildContext context,
    List<FilterOption> options,
    Function(FilterOption) onSelected,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: ColorManager.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizeR.s20)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(AppSizeW.s16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: options
              .map(
                (option) => ListTile(
                  title: Text(
                    "- ${option.name}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    onSelected(option);
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}