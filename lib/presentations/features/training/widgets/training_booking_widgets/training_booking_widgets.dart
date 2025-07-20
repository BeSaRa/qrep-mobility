import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';

class TimeSlotView extends StatelessWidget {
  final int selectedTimeSlot;
  final ValueChanged<int> onTimeSlotSelected;

  const TimeSlotView({
    super.key,
    required this.selectedTimeSlot,
    required this.onTimeSlotSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TimeSlotsWidget(
          selectedTimeSlot: selectedTimeSlot,
          onTimeSlotSelected: onTimeSlotSelected,
        ),
        SizedBox(height: AppSizeH.s30),
        const TrainingCardWidget(
          isCalendarView: false,
        ),
        const SeeOnGoogleMapButton(),
      ],
    );
  }
}

class SeeOnGoogleMapButton extends StatelessWidget {
  const SeeOnGoogleMapButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: AppSizeH.s10, horizontal: AppSizeW.s30),
      margin: EdgeInsets.symmetric(vertical: AppSizeH.s20),
      decoration: BoxDecoration(
        color: ColorManager.primaryBlue,
        borderRadius: BorderRadius.circular(AppSizeR.s12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(IconAssets.map, width: AppSizeSp.s20),
          SizedBox(width: AppSizeW.s8),
          Text('عرض الموقع على الخريطة',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: ColorManager.white)),
        ],
      ),
    );
  }
}

class TimeSlotsWidget extends StatelessWidget {
  final int selectedTimeSlot;
  final ValueChanged<int> onTimeSlotSelected;

  const TimeSlotsWidget({
    super.key,
    required this.selectedTimeSlot,
    required this.onTimeSlotSelected,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> timeSlots = [
      {'time': '04 - 06', 'label': 'مايو', 'isSelected': false},
      {'time': '01 - 03', 'label': 'مايو', 'isSelected': true},
      {'time': '23 - 26', 'label': 'أبريل', 'isSelected': false},
      {'time': '20 - 23', 'label': 'أبريل', 'isSelected': false},
      {'time': '10 - 13', 'label': 'أبريل', 'isSelected': false},
    ];

    return SizedBox(
      height: AppSizeH.s96,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: timeSlots.length,
        itemBuilder: (context, index) {
          final slot = timeSlots[index];
          final isSelected = index == selectedTimeSlot;

          return GestureDetector(
            onTap: () => onTimeSlotSelected(index),
            child: Container(
              width: AppSizeW.s56,
              margin: EdgeInsets.symmetric(horizontal: AppSizeW.s6),
              padding: EdgeInsets.all(AppSizeW.s3),
              decoration: BoxDecoration(
                color: isSelected
                    ? ColorManager.primaryBlue
                    : const Color(0xff84A7BC),
                borderRadius: BorderRadius.circular(AppSizeR.s100),
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: AppSizeW.s50,
                    height: AppSizeH.s50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(AppSizeR.s100),
                    ),
                    child: Text(
                      slot['time'],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: isSelected
                              ? ColorManager.primaryBlue
                              : const Color(0xff84A7BC),
                          fontWeight: FontWeight.bold,
                          fontSize: AppSizeSp.s12),
                    ),
                  ),
                  SizedBox(height: AppSizeH.s5),
                  Text(
                    slot['label'],
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorManager.white,
                        fontWeight: FontWeight.w600,
                        fontSize: AppSizeSp.s12),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CalendarView extends StatelessWidget {
  final int selectedDay;
  final ValueChanged<int> onDaySelected;

  const CalendarView({
    super.key,
    required this.selectedDay,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CalendarHeaderWidget(),
        SizedBox(height: AppSizeH.s20),
        CalendarWidget(
          selectedDay: selectedDay,
          onDaySelected: onDaySelected,
        ),
        SizedBox(height: AppSizeH.s30),
        const TrainingCardWidget(isCalendarView: true),
        const SeeOnGoogleMapButton(),
      ],
    );
  }
}

class CalendarHeaderWidget extends StatelessWidget {
  const CalendarHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppSizeW.s20, vertical: AppSizeH.s15),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(AppSizeR.s10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.arrow_back_ios,
              size: AppSizeSp.s16, color: ColorManager.greyCloud),
          Text(
            'APRIL 2025',
            style: TextStyle(
              fontSize: AppSizeSp.s16,
              fontWeight: FontWeight.w600,
              color: ColorManager.textBlack,
            ),
          ),
          Icon(Icons.arrow_forward_ios,
              size: AppSizeSp.s16, color: ColorManager.greyCloud),
        ],
      ),
    );
  }
}

class CalendarWidget extends StatelessWidget {
  final int selectedDay;
  final ValueChanged<int> onDaySelected;

  const CalendarWidget({
    super.key,
    required this.selectedDay,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    List<String> weekDays = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];

    return Container(
      padding: EdgeInsets.all(AppSizeW.s16),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(AppSizeR.s10),
      ),
      child: Column(
        children: [
          // Week days header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: weekDays
                .map((day) => Text(
                      day,
                      style: TextStyle(
                        fontSize: AppSizeSp.s12,
                        color: ColorManager.greyCloud,
                        fontWeight: FontWeight.w500,
                      ),
                    ))
                .toList(),
          ),
          SizedBox(height: AppSizeH.s15),
          // Calendar grid
          ...List.generate(
            5,
            (weekIndex) => Padding(
              padding: EdgeInsets.only(bottom: AppSizeH.s8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(7, (dayIndex) {
                  int day = weekIndex * 7 + dayIndex + 1;
                  if (day > 31) return SizedBox(width: AppSizeW.s30);

                  bool isSelected = day == selectedDay;
                  bool isInRange = day >= 17 && day <= 19;

                  return GestureDetector(
                    onTap: () => onDaySelected(day),
                    child: Container(
                      width: AppSizeW.s30,
                      height: AppSizeH.s30,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? ColorManager.primaryBlue
                            : isInRange
                                ? ColorManager.primaryBlue.withOpacity(0.3)
                                : Colors.transparent,
                        borderRadius: BorderRadius.circular(AppSizeR.s15),
                      ),
                      child: Center(
                        child: Text(
                          day.toString(),
                          style: TextStyle(
                            fontSize: AppSizeSp.s14,
                            color: isSelected || isInRange
                                ? ColorManager.white
                                : ColorManager.textBlack,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TrainingCardWidget extends StatelessWidget {
  final bool isCalendarView;
  const TrainingCardWidget({super.key, required this.isCalendarView});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizeW.s20),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? ColorManager.textFieldGrey
            : ColorManager.white,
        borderRadius: BorderRadius.circular(AppSizeR.s15),
        boxShadow: [
          BoxShadow(
            color: ColorManager.primary.withValues(alpha: 0.3),
            blurRadius: 2,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: Column(
        spacing: AppSizeH.s15,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isCalendarView) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(IconAssets.money, width: AppSizeSp.s25),
                SizedBox(width: AppSizeW.s5),
                Text(
                  'قيمة الدورة: ',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  '950.00 ريال قطري',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorManager.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const Divider(),
          ],
          const InfoRowWidget(
            label: 'العنوان:',
            value: 'مركز قطر الوطني للمؤتمرات (QNCC) الريان - الدوحة - قطر',
            isLabelLocation: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //1
              Column(
                spacing: AppSizeH.s15,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  InfoRowWidget(
                      isLabelLocation: false,
                      label: 'الوقت:',
                      value: 'السابعة 2 - 4'),
                  // SizedBox(height: AppSizeH.s5),
                  const InfoRowWidget(
                      isLabelLocation: false,
                      label: 'عدد الأيام:',
                      value: '10 يوم'),
                  // SizedBox(height: AppSizeH.s5),
                  const InfoRowWidget(
                      isLabelLocation: false,
                      label: 'انتهاء التسجيل:',
                      value: '9 مايو'),
                  // SizedBox(height: AppSizeH.s5),
                  const InfoRowWidget(
                      isLabelLocation: false,
                      label: 'اللغة:',
                      value: 'العربية'),
                ],
              ),

              //2
              const Spacer(flex: 1),
              if (isCalendarView) ...[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'قيمة الدورة: ',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      '950.00 ريال قطري',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ColorManager.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                const Divider(),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class InfoRowWidget extends StatelessWidget {
  final String label;
  final String value;
  final bool isLabelLocation;

  const InfoRowWidget({
    super.key,
    required this.label,
    required this.value,
    required this.isLabelLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: !isLabelLocation
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        if (!isLabelLocation) ...[
          Container(
            width: AppSizeW.s10,
            height: AppSizeH.s10,
            decoration: BoxDecoration(
                color: ColorManager.golden,
                borderRadius: BorderRadius.circular(AppSizeR.s100)),
          ),
          SizedBox(width: AppSizeW.s8),
        ],
        if (label.isNotEmpty) ...[
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ColorManager.primaryBlue,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(width: AppSizeW.s8),
        ],
        !isLabelLocation
            ? Text(
                maxLines: 2,
                value,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.right,
              )
            : Expanded(
                child: Text(
                  maxLines: 2,
                  value,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.right,
                ),
              ),
      ],
    );
  }
}

class BottomSectionWidget extends StatelessWidget {
  final bool isCalendarView;

  const BottomSectionWidget({
    super.key,
    required this.isCalendarView,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isCalendarView) ...[
          Container(
            padding: EdgeInsets.all(AppSizeW.s16),
            decoration: BoxDecoration(
              color: ColorManager.lightBlue,
              borderRadius: BorderRadius.circular(AppSizeR.s10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'قيمة الدورة',
                  style: TextStyle(
                    fontSize: AppSizeSp.s12,
                    color: ColorManager.primary,
                  ),
                ),
                Text(
                  '950.00 ريال قطري',
                  style: TextStyle(
                    fontSize: AppSizeSp.s18,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.primary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppSizeH.s15),
        ],
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: AppSizeH.s15),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorManager.primary),
                  borderRadius: BorderRadius.circular(AppSizeR.s8),
                ),
                child: Text(
                  'المقرر مباشر',
                  style: TextStyle(
                    fontSize: AppSizeSp.s14,
                    color: ColorManager.primary,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(width: AppSizeW.s12),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: AppSizeH.s15),
                decoration: BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.circular(AppSizeR.s8),
                ),
                child: Text(
                  'التسجيل',
                  style: TextStyle(
                    fontSize: AppSizeSp.s14,
                    color: ColorManager.white,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}


class TwoBottomButtonsWidget extends StatelessWidget {
  const TwoBottomButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizeW.s20,
        vertical: AppSizeH.s12,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).scaffoldBackgroundColor
            : Theme.of(context).canvasColor,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: AppSizeH.s14),
                backgroundColor: ColorManager.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizeR.s8),
                ),
              ),
              child: Text('التسجيل',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ColorManager.white,
                      fontWeight: FontWeight.w800)),
            ),
          ),
          SizedBox(width: AppSizeW.s12),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizeR.s8),
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.primary.withValues(alpha: 0.3),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  )
                ],
              ),
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: AppSizeH.s14),
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.dark
                            ? ColorManager.textFieldGrey
                            : ColorManager.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizeR.s8),
                    ),
                    side: BorderSide.none),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('المقر: ',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(
                                color: ColorManager.primary,
                                fontWeight: FontWeight.w800)),
                    Text('مباشر',
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
