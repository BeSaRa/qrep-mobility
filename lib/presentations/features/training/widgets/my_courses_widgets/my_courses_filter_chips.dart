import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/presentations/features/training/bloc/get_my_training_courses_bloc/get_my_training_courses_bloc.dart';
import 'package:ebla/presentations/features/training/bloc/training_filter_cubit/training_filter_cubit.dart';
import 'package:ebla/presentations/features/training/utils/training_utils.dart';
import 'package:ebla/presentations/features/training/widgets/my_courses_widgets/date_range_picker_filed.dart';
import 'package:ebla/presentations/features/training/widgets/training_widgets/training_filter_chip.dart';
// import 'package:ebla/presentations/features/training/widgets/training_widgets/training_filter_chips.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCoursesFilterChips extends StatefulWidget {
  const MyCoursesFilterChips({super.key});

  @override
  State<MyCoursesFilterChips> createState() => _MyCoursesFilterChipsState();
}

class _MyCoursesFilterChipsState extends State<MyCoursesFilterChips> {
  final List<FilterOption> trackOptions = [
    FilterOption(name: AppStrings().all, value: null),
    FilterOption(name:AppStrings().course, value: 0),
    FilterOption(name:AppStrings().exam, value: 1),
  ];

  // late FilterOption selectedTrack = trackOptions[0];

  late final ValueNotifier<FilterOption> selectedTrack = ValueNotifier<FilterOption>(trackOptions[0]);
  final ValueNotifier<DateTime?> startDateNotifier = ValueNotifier<DateTime?>(null);
  final ValueNotifier<DateTime?> endDateNotifier = ValueNotifier<DateTime?>(null);
  final ValueNotifier<bool> isEndDateEnabledNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    startDateNotifier.dispose();
    endDateNotifier.dispose();
    isEndDateEnabledNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: BlocBuilder<GetMyTrainingCoursesBloc, GetMyTrainingCoursesState>(
        bloc: BlocProvider.of<GetMyTrainingCoursesBloc>(context),
        builder: (context, state) {
          final filterCubit = context.read<TrainingFilterCubit>();

          return state.maybeMap(
            done: (_) {
                  return Row(
                    children: [
                      // Existing Type Filter
                          ValueListenableBuilder<FilterOption>(
                          valueListenable: selectedTrack,
                          builder: (context, selectedTrackValue, child) {
                          return TrainingFilterChip(
                            mainLabel: AppStrings().type,
                            label: selectedTrackValue.name,
                            onTap: () => _showFilterOptions(
                              context,
                              trackOptions,
                              (FilterOption selected) {
                                final currentFilters = context.read<TrainingFilterCubit>().state;
                                            
                                filterCubit.updateFilters(
                                  track: selected.value,
                                  pageIndex: 1,
                                  isFree: currentFilters.isFree,
                                  isActive: currentFilters.isActive,
                                  name: currentFilters.name,
                                  categories: currentFilters.categories,
                                  pageSize: currentFilters.pageSize,
                                );
                                
                                context.read<GetMyTrainingCoursesBloc>().add(
                                  GetMyTrainingCoursesEvent.applyFilters(filterCubit.state),
                                );
                                            
                                  selectedTrack.value = selected;
                                // setState(() {
                                // });
                              },
                            ),
                            icon: Icons.keyboard_arrow_down,
                          );
                        }
                      ),
                      
                      SizedBox(width: AppSizeW.s8),
                      
                      // Start Date Picker
                      DateRangePickerField(
                        isComingFromMyCourses: true,
                        isEndDateEnabledNotifier:  isEndDateEnabledNotifier,
                        mainLabel: AppStrings().startDate,
                        endDateNotifier: startDateNotifier,
                        onDateSelected: (DateTime date) {
                          startDateNotifier.value = date;
                          isEndDateEnabledNotifier.value = true;
                          
                          // Clear end date if it's before the new start date
                          if (endDateNotifier.value != null && 
                              endDateNotifier.value!.isBefore(date)) {
                            endDateNotifier.value = null;
                          }
                          _handleDateRangeChange();
                        },
                        isStartDate: true,
                        startDateNotifier: endDateNotifier,
                        isEnabled: true,
                      ),
                      
                      // SizedBox(width: AppSizeW.s8),
                      
                      // End Date Picker
                      ValueListenableBuilder<bool>(
                        valueListenable: isEndDateEnabledNotifier,
                        builder: (context, isEnabled, child) {
                          
                          return DateRangePickerField(
                            isComingFromMyCourses: true,
                            isEndDateEnabledNotifier:  isEndDateEnabledNotifier,
                            mainLabel: AppStrings().endDate,
                            endDateNotifier: endDateNotifier,
                            onDateSelected: (DateTime date) {
                              endDateNotifier.value = date;
                              _handleDateRangeChange();
                            },
                            isStartDate: false,
                            startDateNotifier: startDateNotifier,
                            isEnabled: isEnabled,
                          );
                        },
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

  void _handleDateRangeChange() {
    final startDate = startDateNotifier.value;
    final endDate = endDateNotifier.value;
    
    if (startDate != null && endDate != null) {  
      final filterCubit = context.read<TrainingFilterCubit>();
      final currentFilters = filterCubit.state;      
      filterCubit.updateFilters(
        startDate: DateFormat('yyyy-MM-dd').format(startDate),
        endDate: DateFormat('yyyy-MM-dd').format(endDate),
        isActive: currentFilters.isActive,
        pageIndex: 1,
        track: currentFilters.track,
        isFree: currentFilters.isFree,
        name: currentFilters.name,
        categories: currentFilters.categories,
        pageSize: 5,
      );
        context.read<GetMyTrainingCoursesBloc>().add(
          GetMyTrainingCoursesEvent.applyFilters(
            filterCubit.state,
          ),
        );
    }
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
