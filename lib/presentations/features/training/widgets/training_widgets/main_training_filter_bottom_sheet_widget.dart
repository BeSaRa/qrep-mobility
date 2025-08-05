import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ebla/presentations/features/training/widgets/my_courses_widgets/date_range_picker_filed.dart';
import 'package:flutter/material.dart';
import 'package:ebla/app/app_preferences.dart';
import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/presentations/features/training/utils/training_utils.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:ebla/presentations/widgets/custom_elevated_button.dart';
class MainTrainingFilterBottomSheetWidget extends StatelessWidget {
  final ValueNotifier<FilterOption> selectedTrackNotifier;
  final ValueNotifier<FilterOption> selectedIsFreeNotifier;
  final ValueNotifier<FilterOption> selectedIsActiveNotifier;
  final ValueNotifier<FilterOption> selectedisMorningNotifier;
  final ValueNotifier<FilterOption> selectedLangNotifier;
  final ValueNotifier<FilterOption> selectedLocationNotifier;
  final ValueNotifier<DateTime?> startDateNotifier;
  final ValueNotifier<DateTime?> endDateNotifier;
  final ValueNotifier<bool> isEndDateEnabledNotifier;
  final List<FilterOption> isFreeOptions;
  final List<FilterOption> isActiveOptions;
  final List<FilterOption> trackOptions;
  final List<FilterOption> langOptions;
  final List<FilterOption> locationOptions;
  final List<FilterOption> isMorningOptions;

  const MainTrainingFilterBottomSheetWidget({
    super.key,
    required this.selectedTrackNotifier,
    required this.selectedIsFreeNotifier,
    required this.selectedIsActiveNotifier,
    required this.isFreeOptions,
    required this.isActiveOptions,
    required this.trackOptions,
    required this.selectedisMorningNotifier,
    required this.selectedLangNotifier,
    required this.selectedLocationNotifier,
    required this.langOptions,
    required this.locationOptions,
    required this.isMorningOptions,
    required this.startDateNotifier, 
    required this.endDateNotifier,
    required this.isEndDateEnabledNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //------------------ Reset Filter ----------------
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.restart_alt,
                          color: ColorManager.golden,
                          size: AppSizeSp.s15,
                        ),
                        Text(
                          AppStrings().reset,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: ColorManager.golden),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: AppSizeH.s8),
          //------------------ Date Filter -----------------
          Padding(
            padding:  EdgeInsets.only(bottom: AppSizeH.s12),
            child: Row(
              children: [
                // Start Date Picker
                Expanded(
                  child: DateRangePickerField(
                    isComingFromMyCourses: false,
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
                ),
                
                SizedBox(width: AppSizeW.s8),
                
                // End Date Picker
                Expanded(
                  child: ValueListenableBuilder<bool>(
                    valueListenable: isEndDateEnabledNotifier,
                    builder: (context, isEnabled, child) {
                      return DateRangePickerField(
                        isComingFromMyCourses: false,
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
                ),
              ],
            ),
          ),
          
          //------------------ Another Filters ----------------------
          Row(
            children: [
              Expanded(
                child: _CustomFilterDropdown(
                  mainLabel:AppStrings().trainingLocation,
                  options: locationOptions,
                  selectedNotifier: selectedLocationNotifier,
                  hint: AppStrings().trainingLocation,
                ),
              ),
              SizedBox(width: AppSizeH.s8),
              Expanded(
                child: _CustomFilterDropdown(
                  mainLabel:AppStrings().cousreTime,
                  options: isMorningOptions,
                  selectedNotifier: selectedisMorningNotifier,
                  hint: AppStrings().cousreTime,
                ),
              ),
            ],
          ),
            SizedBox(height: AppSizeH.s12),
          Row(
            children: [
              Expanded(
                child: _CustomFilterDropdown(
                  mainLabel:AppStrings().language,
                  options: langOptions,
                  selectedNotifier: selectedLangNotifier,
                  hint: AppStrings().language,
                ),
              ),
              SizedBox(width: AppSizeH.s8),
              Expanded(
                child: _CustomFilterDropdown(
                  mainLabel:AppStrings().courseFees,
            options: isFreeOptions,
            selectedNotifier: selectedIsFreeNotifier,
            hint: AppStrings().courseFees,
          ),
              ),
            ],
          ),
            SizedBox(height: AppSizeH.s30),
          //----------- Buttons ---------------------
              Directionality(
                textDirection: TextDirection.rtl,
                child: Row(children: [
                  Expanded(
                    child: CustomElevatedButton(
                      isPrimary: true,
                      title: AppStrings().search,
                      onPress: () {
                        // here edit the filter cubit
                        // if (_formkey.currentState!.validate()) {
                        //   // Navigator.of(context).pop(true);
                        // }
                      },
                    ),
                  ),
                  SizedBox(width: AppSizeW.s8),
                  Expanded(
                    child: CustomElevatedButton(
                      isPrimary: false,
                      title: AppStrings().cancel,
                      onPress: () {
                        Navigator.of(context).pop();
                      },
                      backgroundColor:
                          instance<AppPreferences>().getTheme().brightness ==
                                  Brightness.light
                              ? ColorManager.porcelain
                              : ColorManager.greyCloud,
                    ),
                  ),
                ]),
              ),
            SizedBox(height: AppSizeH.s15),
        ],
      ),
    );
  }
  
  void _handleDateRangeChange() {
    final startDate = startDateNotifier.value;
    final endDate = endDateNotifier.value;
    
    if (startDate != null && endDate != null) {  
      // final filterCubit = context.read<TrainingFilterCubit>();
      // final currentFilters = filterCubit.state;      
      // filterCubit.updateFilters(
      //   startDate: DateFormat('yyyy-MM-dd').format(startDate),
      //   endDate: DateFormat('yyyy-MM-dd').format(endDate),
      //   isActive: currentFilters.isActive,
      //   pageIndex: 1,
      //   track: currentFilters.track,
      //   isFree: currentFilters.isFree,
      //   name: currentFilters.name,
      //   categories: currentFilters.categories,
      //   pageSize: 5,
      // );
    }
  }
}



class _CustomFilterDropdown extends StatelessWidget {
  final List<FilterOption> options;
  final ValueNotifier<FilterOption> selectedNotifier;
  final String hint;
  final String mainLabel;

  const _CustomFilterDropdown({
    required this.options,
    required this.selectedNotifier,
    required this.hint,
    required this.mainLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSizeH.s10,
      children: [
          Text(
          mainLabel,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).brightness == Brightness.dark
                  ? ColorManager.golden
                  : ColorManager.primaryBlue,
              fontSize: AppSizeSp.s11),
        ),
        ValueListenableBuilder<FilterOption>(
          valueListenable: selectedNotifier,
          builder: (_, selected, __) {
            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.circular(AppSizeR.s5),
                border: Border.all(
                  width: AppSizeW.s1,
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<FilterOption>(
                  isExpanded: true,
                  hint: Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizeW.s10),
                    child: Text(
                      hint.isNotEmpty ? hint : "Select Item",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  items: options
                      .map((option) => DropdownMenuItem<FilterOption>(
                            value: option,
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: AppSizeW.s11),
                              child: Text(
                                option.name,
                                style: Theme.of(context).textTheme.labelSmall,
                                softWrap: true,
                              ),
                            ),
                          ))
                      .toList(),
                  // value: selected,
                  value: options.contains(selected) ? selected : null,
                  onChanged: (value) {
                    if (value != null) {
                      selectedNotifier.value = value;
                    }
                  },
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: AppSizeH.s200,
                    width: double.infinity,
                    useSafeArea: true,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSizeR.s5),
                      color: Theme.of(context).cardTheme.color,
                    ),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: Radius.circular(AppSizeR.s5),
                      thickness: WidgetStateProperty.all(AppSizeW.s6),
                      thumbVisibility: WidgetStateProperty.all(true),
                    ),
                  ),
                  iconStyleData: IconStyleData(
                    openMenuIcon: Icon(
                      Icons.keyboard_arrow_up_rounded,
                      color: ColorManager.primary,
                    ),
                    icon: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: AppSizeW.s10),
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: ColorManager.primary,
                      ),
                    ),
                  ),
                  buttonStyleData: ButtonStyleData(
                    height: AppSizeH.s36,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}