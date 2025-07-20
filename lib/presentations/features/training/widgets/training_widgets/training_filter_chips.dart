import 'package:ebla/presentations/features/training/bloc/get_all_training_courses_bloc/get_all_training_courses_bloc.dart';
import 'package:ebla/presentations/features/training/bloc/training_filter_cubit/training_filter_cubit.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterOption {
  final String name;
  final dynamic value;

  FilterOption({required this.name, this.value});
}

class TrainingFilterChips extends StatefulWidget {
  const TrainingFilterChips({super.key});

  @override
  State<TrainingFilterChips> createState() => _TrainingFilterChipsState();
}

class _TrainingFilterChipsState extends State<TrainingFilterChips> {
  final List<FilterOption> isFreeOptions = [
    FilterOption(name: 'الكل', value: null),
    FilterOption(name: 'مدفوعة', value: false),
    FilterOption(name: 'مجانية', value: true),
  ];

  final List<FilterOption> isActiveOptions = [
    FilterOption(name: 'الكل', value: null),
    FilterOption(name: 'غير نشط', value: false),
    FilterOption(name: 'نشط', value: true),
  ];

  final List<FilterOption> trackOptions = [
    FilterOption(name: 'الكل', value: null),
    FilterOption(name: 'دورة', value: 0),
    FilterOption(name: 'امتحان', value: 1),
  ];

  // القيم المختارة
  late FilterOption selectedTrack = trackOptions[0];
  late FilterOption selectedIsFree = isFreeOptions[0];
  late FilterOption selectedIsActive = isActiveOptions[0];

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
                children: [
                  TrainingFilterChip(
                    mainLabel: "النوع",
                    label: selectedTrack.name,
                    onTap: () => _showFilterOptions(
                      context,
                      trackOptions,
                      (FilterOption selected) {
                        // Update filters
                        filterCubit.updateFilters(
                          track: selected.value,
                          pageIndex: 1,
                        );
                        // Trigger new request
                        context.read<GetAllTrainingCoursesBloc>().add(
                              GetAllTrainingCoursesEvent.applyFilters(
                                filterCubit.state,
                              ),
                            );

                        setState(() {
                          selectedTrack = selected;
                        });
                        // context.read<TrainingBloc>().add(FilterByTrack(selected.value));
                      },
                    ),
                    icon: Icons.keyboard_arrow_down,
                  ),
                  SizedBox(width: AppSizeW.s8),
                  TrainingFilterChip(
                    mainLabel: "رسوم الدورة",
                    label: selectedIsFree.name,
                    onTap: () => _showFilterOptions(
                      context,
                      isFreeOptions,
                      (FilterOption selected) {
                        // Update filters
                        filterCubit.updateFilters(
                          isFree: selected.value,
                          pageIndex: 1,
                        );
                        // Trigger new request
                        context.read<GetAllTrainingCoursesBloc>().add(
                              GetAllTrainingCoursesEvent.applyFilters(
                                filterCubit.state,
                              ),
                            );
                        setState(() {
                          selectedIsFree = selected;
                        });
                        // context.read<TrainingBloc>().add(FilterByIsFree(selected.value));
                      },
                    ),
                    icon: Icons.keyboard_arrow_down,
                  ),
                  SizedBox(width: AppSizeW.s8),
                  TrainingFilterChip(
                    mainLabel: "الحالة",
                    label: selectedIsActive.name,
                    onTap: () => _showFilterOptions(
                      context,
                      isActiveOptions,
                      (FilterOption selected) {
                        // Update filters
                        filterCubit.updateFilters(
                          isActive: selected.value,
                          pageIndex: 1,
                        );
                        // Trigger new request
                        context.read<GetAllTrainingCoursesBloc>().add(
                              GetAllTrainingCoursesEvent.applyFilters(
                                filterCubit.state,
                              ),
                            );
                        setState(() {
                          selectedIsActive = selected;
                        });
                        // context.read<TrainingBloc>().add(FilterByIsActive(selected.value));
                      },
                    ),
                    icon: Icons.keyboard_arrow_down,
                  ),
                  SizedBox(width: AppSizeW.s8),
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: Container(
                  //     padding: EdgeInsets.symmetric(
                  //       horizontal: AppSizeW.s16,
                  //       vertical: AppSizeH.s8,
                  //     ),
                  //     decoration: BoxDecoration(
                  //         boxShadow: [
                  //           BoxShadow(
                  //             color:
                  //                 ColorManager.blackBG.withValues(alpha: 0.2),
                  //             blurRadius: 2,
                  //             offset: const Offset(0, 1),
                  //           )
                  //         ],
                  //         borderRadius: BorderRadius.circular(AppSizeR.s10),
                  //         color: Theme.of(context).brightness == Brightness.dark
                  //             ? ColorManager.textFieldGrey
                  //             : Theme.of(context).scaffoldBackgroundColor),
                  //     child: Row(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: [
                  //         Text(AppStrings().more,
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .bodySmall
                  //                 ?.copyWith(
                  //                   fontWeight: FontWeight.w500,
                  //                   color: Theme.of(context).brightness ==
                  //                           Brightness.dark
                  //                       ? ColorManager.golden
                  //                       : ColorManager.primaryBlue,
                  //                 )),
                  //         SizedBox(width: AppSizeW.s20),
                  //         Image.asset(
                  //           IconAssets.filter,
                  //           width: AppSizeSp.s16,
                  //           color: ColorManager.primary,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
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

class TrainingFilterChip extends StatelessWidget {
  final String label;
  final String mainLabel;
  final void Function()? onTap;
  final IconData icon;

  const TrainingFilterChip({
    super.key,
    required this.label,
    required this.mainLabel,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSizeH.s5,
      children: [
        Text(
          mainLabel,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).brightness == Brightness.dark
                  ? ColorManager.golden
                  : ColorManager.primaryBlue,
              fontSize: AppSizeSp.s11),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: AppSizeH.s5),
            padding: EdgeInsets.symmetric(
              horizontal: AppSizeW.s10,
              vertical: AppSizeH.s8,
            ),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.blackBG.withValues(alpha: 0.2),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  )
                ],
                borderRadius: BorderRadius.circular(AppSizeR.s10),
                color: Theme.of(context).brightness == Brightness.dark
                    ? ColorManager.textFieldGrey
                    : Theme.of(context).scaffoldBackgroundColor),
            child: Row(
              children: [
                Text(label,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? ColorManager.golden
                              : ColorManager.primaryBlue,
                        )),
                SizedBox(width: AppSizeW.s40),
                Icon(
                  icon,
                  size: AppSizeSp.s16,
                  color: ColorManager.primary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
