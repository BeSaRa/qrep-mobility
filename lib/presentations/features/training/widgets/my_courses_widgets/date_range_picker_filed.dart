import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/presentations/features/training/bloc/get_my_training_courses_bloc/get_my_training_courses_bloc.dart';
import 'package:ebla/presentations/features/training/bloc/training_filter_cubit/training_filter_cubit.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateRangePickerField extends StatelessWidget {
  final String mainLabel;
  final ValueNotifier<DateTime?> endDateNotifier;
  final ValueNotifier<bool?> isEndDateEnabledNotifier;
  final Function(DateTime) onDateSelected;
  final bool isStartDate;
  final bool isComingFromMyCourses;
  final ValueNotifier<DateTime?> startDateNotifier;
  final bool isEnabled;

  const DateRangePickerField({
    super.key,
    required this.mainLabel,
    required this.isComingFromMyCourses,
    required this.isEndDateEnabledNotifier,
    required this.endDateNotifier,
    required this.onDateSelected,
    required this.isStartDate,
    required this.startDateNotifier,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale == ARABIC_LOCAL;

    return ValueListenableBuilder<DateTime?>(
      valueListenable: endDateNotifier,
      builder: (context, selectedDate, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Label
            Text(
              mainLabel,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isEnabled
                    ? (Theme.of(context).brightness == Brightness.dark
                        ? ColorManager.golden
                        : ColorManager.primaryBlue)
                    : ColorManager.primaryBlue.withValues(alpha: 0.4),
                fontSize: AppSizeSp.s11,
                fontWeight: FontWeight.w500,
              ),
            ),
            
            SizedBox(height: AppSizeH.s5),
            
            // Date Container
            GestureDetector(
              onTap: isEnabled ? () => _showDatePicker(context) : null,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                margin: EdgeInsets.symmetric(vertical: AppSizeH.s5),
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizeW.s12,
                  vertical: AppSizeH.s8,
                ),
                decoration:!isComingFromMyCourses?
                  BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.circular(AppSizeR.s5),
                border: Border.all(
                  width: AppSizeW.s1,
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                ),
              )
                : BoxDecoration(
                  boxShadow: [
                  BoxShadow(
                    blurStyle: BlurStyle.inner,
                    color: ColorManager.primary.withValues(alpha: 0.2),
                    blurRadius: 2,
                    offset: const Offset(0, 2),
                  )
                ],
                  borderRadius: BorderRadius.horizontal(
                  left: isStartDate?
                    isArabic?Radius.circular(AppSizeR.s0):Radius.circular(AppSizeR.s10)
                    :isArabic? Radius.circular(AppSizeR.s10):Radius.circular(AppSizeR.s0),
                  right: isStartDate?
                    isArabic?Radius.circular(AppSizeR.s10):Radius.circular(AppSizeR.s0)
                    :isArabic?Radius.circular(AppSizeR.s0):Radius.circular(AppSizeR.s10)),
                  color: _getContainerColor(context, selectedDate),
                  // border: selectedDate != null
                  //     ? Border.all(
                  //         color: ColorManager.primary.withValues(alpha: 0.4),
                  //         width: 1.2,
                  //       )
                  //     : Border.all(
                  //         color: ColorManager.grey.withValues(alpha: 0.2),
                  //         width: 0.8,
                  //       ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Calendar Icon
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        selectedDate != null 
                            ? Icons.event_available 
                            : Icons.calendar_today_outlined,
                        size: AppSizeSp.s16,
                        color: _getIconColor(selectedDate),
                      ),
                    ),
                    
                    SizedBox(width: AppSizeW.s8),
                    
                    // Date Text
                    Text(
                      _getDisplayText(selectedDate),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        // fontWeight: selectedDate != null
                        //     ? FontWeight.w400
                        //     : FontWeight.w400,
                        color: _getTextColor(context, selectedDate),
                        fontSize: AppSizeSp.s12,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    if(!isComingFromMyCourses)
                    const Spacer(flex: 1),

                    SizedBox(width: AppSizeW.s6),
                    // Dropdown Arrow
                  
                    AnimatedRotation(
                      turns: 0,
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        size: isComingFromMyCourses? AppSizeSp.s18:null,
                        color: isEnabled
                            ? ColorManager.primary.withValues(alpha: 0.8)
                            : ColorManager.primaryBlue.withValues(alpha: 0.4),
                      ),
                    ),
                    if(!isStartDate && isEnabled && isComingFromMyCourses)...[
                      SizedBox(width: AppSizeH.s5),
                        Container(
                        height: AppSizeH.s20,
                        width: AppSizeW.s1,
                        color: Colors.grey,
                      ),
                      SizedBox(width: AppSizeH.s10),
                      AnimatedRotation(
                        turns: 0,
                        duration: const Duration(milliseconds: 200),
                        child: GestureDetector(
                          onTap: () {
                            endDateNotifier.value = null;
                            startDateNotifier.value = null;
                            isEndDateEnabledNotifier.value = false;
                                  // Here you can integrate with your filter cubit
                            final filterCubit = context.read<TrainingFilterCubit>();
                            final currentFilters = filterCubit.state;      
                            filterCubit.updateFilters(
                              startDate: null,
                              endDate: null,
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
                          },
                          child: Icon(
                            Icons.close,
                            size: AppSizeSp.s18,
                            color: isEnabled
                                ? ColorManager.primary.withValues(alpha: 0.8)
                                : ColorManager.primaryBlue.withValues(alpha: 0.4),
                          ),
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Color _getContainerColor(BuildContext context, DateTime? selectedDate) {
    // if (!isEnabled) {
    //   return ColorManager.grey.withValues(alpha: 0.1);
    // }
    
    // if (selectedDate != null) {
    //   return Theme.of(context).brightness == Brightness.dark
    //       ? ColorManager.textFieldGrey.withValues(alpha: 0.9)
    //       : ColorManager.primary.withValues(alpha: 0.05);
    // }
    
    return Theme.of(context).brightness == Brightness.dark
        ? ColorManager.textFieldGrey
        : Theme.of(context).scaffoldBackgroundColor;
  }

  Color _getIconColor(DateTime? selectedDate) {
    if (!isEnabled) {
      return ColorManager.primaryBlue.withValues(alpha: 0.4);
    }
    
    return selectedDate != null
        ? ColorManager.primary
        : ColorManager.primaryBlue.withValues(alpha: 0.7);
  }

  Color _getTextColor(BuildContext context, DateTime? selectedDate) {
    if (!isEnabled) {
      return ColorManager.primaryBlue.withValues(alpha: .4);
    }
    
    if (selectedDate != null) {
      return Theme.of(context).brightness == Brightness.dark
          ? ColorManager.golden
          : ColorManager.primaryBlue;
    }
    
    return ColorManager.primaryBlue;
  }

  String _getDisplayText(DateTime? selectedDate) {
    if (selectedDate != null) {
      return DateFormat('yyyy/MM/dd').format(selectedDate);
    }
    
    return isStartDate ? AppStrings().selectStartDate : AppStrings().selectEndDate;
  }

void _showDatePicker(BuildContext context) async {
  final DateTime now = DateTime.now();
  final DateTime? otherDate = startDateNotifier.value;

  DateTime? firstDate;
  DateTime? lastDate;
  DateTime initialDate;

  if (isStartDate) {
    firstDate = DateTime(now.year - 10);
    lastDate = otherDate ?? DateTime(now.year + 10);
    initialDate = endDateNotifier.value ?? now;
  } else {
    firstDate = otherDate ?? DateTime(now.year - 10);
    lastDate = DateTime(now.year + 10);
    initialDate = endDateNotifier.value ?? (otherDate ?? now);

    if (otherDate != null && initialDate.isBefore(otherDate)) {
      initialDate = otherDate;
    }
  }

  final bool isArabic = context.locale == ARABIC_LOCAL;

  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: firstDate,
    lastDate: lastDate,
    locale: Locale(isArabic ? 'ar' : 'en'),
    helpText: '',
    cancelText: AppStrings().cancel,
    confirmText: AppStrings().confirm,
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          dialogBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
          colorScheme: ColorScheme.light(
            primary: ColorManager.primary, // Confirm button color
            onPrimary: ColorManager.white,        // Confirm button text color
            onSurface: ColorManager.blackBG,        // Selected day/month text
          ),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.pressed)) {
                  return ColorManager.primary;
                }
                return null;
              }),
              backgroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.pressed)) {
                  return Colors.transparent;
                }
                return null;
              }),
              textStyle: WidgetStateProperty.all(
                TextStyle(
                  fontSize: AppSizeSp.s14,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontConstants.fontFamily,
                ),
              ),
            ),
          ),
        ),
        child: Builder(
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizeW.s5), // Rounded
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  textTheme: Theme.of(context).textTheme.copyWith(
                    titleLarge:  TextStyle(
                      fontFamily: FontConstants.fontFamily, 
                      fontWeight: FontWeight.bold,
                      color: ColorManager.white,
                    ),
                    bodyLarge: TextStyle(
                      fontFamily: FontConstants.fontFamily,
                      fontSize: AppSizeSp.s12,                 // Smaller day numbers
                      color: ColorManager.blackBG,
                    ),
                    bodySmall: TextStyle(
                      fontFamily: FontConstants.fontFamily,
                      fontSize:  AppSizeSp.s11,
                       color: ColorManager.golden,           // Days label color
                    ),
                  ),
                ),
                child: child!,
              ),
            );
          },
        ),
      );
    },
    // Disable text input
    useRootNavigator: true,
    initialEntryMode: DatePickerEntryMode.calendarOnly,
  );

  if (picked != null) {
    onDateSelected(picked);
  }
}
}
