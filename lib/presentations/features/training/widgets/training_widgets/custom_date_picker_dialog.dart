
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ebla/presentations/resources/resources.dart';

class CustomDatePickerDialog extends StatefulWidget {
  final ValueNotifier<DateTime?> selectedDateNotifier;

  const CustomDatePickerDialog({
    super.key,
    required this.selectedDateNotifier,
  });

  @override
  State<CustomDatePickerDialog> createState() => _CustomDatePickerDialogState();
}

class _CustomDatePickerDialogState extends State<CustomDatePickerDialog> {
  final ValueNotifier<DateTime> _currentMonth = ValueNotifier(DateTime.now());
  final ValueNotifier<DateTime?> _selectedDate = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    _selectedDate.value = widget.selectedDateNotifier.value ?? DateTime.now();
  }

  void _previousMonth() {
    _currentMonth.value =
        DateTime(_currentMonth.value.year, _currentMonth.value.month - 1, 1);
  }

  void _nextMonth() {
    _currentMonth.value =
        DateTime(_currentMonth.value.year, _currentMonth.value.month + 1, 1);
  }

  void _onDaySelected(DateTime day) {
    _selectedDate.value = day;
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.day == now.day &&
        date.month == now.month &&
        date.year == now.year;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(AppSizeW.s16),
      child: Container(
        padding: EdgeInsets.all(AppSizeW.s16),
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppSizeR.s10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ValueListenableBuilder<DateTime>(
              valueListenable: _currentMonth,
              builder: (context, currentMonth, _) {
                final firstDayOfMonth =
                    DateTime(currentMonth.year, currentMonth.month, 1);
                final daysInMonth =
                    DateUtils.getDaysInMonth(currentMonth.year, currentMonth.month);
                final startingWeekday = firstDayOfMonth.weekday;

                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: AppSizeH.s15, horizontal: AppSizeW.s20),
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(AppSizeR.s10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios, size: AppSizeW.s16),
                            color: ColorManager.greyCloud,
                            onPressed: _previousMonth,
                          ),
                          Text(
                            DateFormat('MMMM yyyy').format(currentMonth),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_forward_ios, size: AppSizeW.s16),
                            color: ColorManager.greyCloud,
                            onPressed: _nextMonth,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppSizeH.s20),
                    GestureDetector(
                      onHorizontalDragEnd: (details) {
                        if (details.primaryVelocity! < 0) {
                          _previousMonth();
                        } else if (details.primaryVelocity! > 0) {
                          _nextMonth();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(AppSizeW.s16),
                        decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.circular(AppSizeR.s10),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT']
                                  .map((day) => Text(
                                        day,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                color: ColorManager.cloudyGrey
                                                    .withValues(alpha: .4)),
                                      ))
                                  .toList(),
                            ),
                            SizedBox(height: AppSizeH.s15),
                            ValueListenableBuilder<DateTime?>(
                              valueListenable: _selectedDate,
                              builder: (context, selectedDate, _) {
                                return Table(
                                  children: [
                                    for (var i = 0; i < 6; i++)
                                      TableRow(
                                        children: [
                                          for (var j = 0; j < 7; j++)
                                            Builder(
                                              builder: (context) {
                                                final day = i * 7 +
                                                    j -
                                                    startingWeekday +
                                                    1;
                                                if (day < 1 || day > daysInMonth) {
                                                  return const SizedBox.shrink();
                                                }

                                                final date = DateTime(
                                                    currentMonth.year,
                                                    currentMonth.month,
                                                    day);
                                                final isSelected = selectedDate != null &&
                                                    date.day == selectedDate.day &&
                                                    date.month == selectedDate.month &&
                                                    date.year == selectedDate.year;
                                                final isToday = _isToday(date);

                                                return GestureDetector(
                                                  onTap: () => _onDaySelected(date),
                                                  child: Container(
                                                    padding: EdgeInsets.all(
                                                        AppSizeW.s2),
                                                    child: AspectRatio(
                                                      aspectRatio: 1,
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: isSelected
                                                              ? ColorManager
                                                                  .primaryBlue
                                                              : isToday
                                                                  ? ColorManager
                                                                      .primaryBlue
                                                                      .withOpacity(
                                                                          0.3)
                                                                  : Colors.transparent,
                                                          border: isToday
                                                              ? Border.all(
                                                                  color: ColorManager
                                                                      .primaryBlue,
                                                                  width: 1)
                                                              : null,
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            day.toString(),
                                                            style:
                                                                Theme.of(context)
                                                                    .textTheme
                                                                    .bodySmall
                                                                    ?.copyWith(
                                                                      color: isSelected
                                                                          ? Colors.white
                                                                          : isToday
                                                                              ? ColorManager.primaryBlue
                                                                              : ColorManager.textBlack,
                                                                      fontWeight: isSelected ||
                                                                              isToday
                                                                          ? FontWeight
                                                                              .bold
                                                                          : FontWeight
                                                                              .normal,
                                                                    ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                        ],
                                      ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: AppSizeH.s20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(AppStrings().cancel,style: Theme.of(context).textTheme.bodyMedium),
                ),
                TextButton(
                  onPressed: () {
                    widget.selectedDateNotifier.value = _selectedDate.value;
                    Navigator.of(context).pop();
                  },
                  child: Text(AppStrings().confirm ,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).primaryColor)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _currentMonth.dispose();
    _selectedDate.dispose();
    super.dispose();
  }
}