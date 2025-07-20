import 'package:ebla/presentations/features/training/widgets/training_booking_widgets/training_booking_widgets.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';

class TrainingBookingView extends StatefulWidget {
  const TrainingBookingView({super.key});

  @override
  State<TrainingBookingView> createState() => _TrainingBookingViewState();
}

class _TrainingBookingViewState extends State<TrainingBookingView> {
  final ValueNotifier<bool> isCalendarView = ValueNotifier(false);
  final ValueNotifier<int> selectedTimeSlot = ValueNotifier(1);
  final ValueNotifier<int> selectedDay = ValueNotifier(17);

  @override
  void dispose() {
    isCalendarView.dispose();
    selectedTimeSlot.dispose();
    selectedDay.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Theme.of(context).scaffoldBackgroundColor
          : Theme.of(context).canvasColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        flexibleSpace: ShaderMask(
          shaderCallback: (rect) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Colors.transparent],
            ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
          },
          blendMode: BlendMode.dstIn,
          child: Image.asset(
            ImageAssets.appbarBg,
            fit: BoxFit.fill,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.maybePop(context),
              child: Icon(
                Icons.arrow_back,
                color: ColorManager.cloudyGrey,
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: isCalendarView,
              builder: (context, isCalendar, _) {
                return Container(
                  alignment: Alignment.center,
                  width: AppSizeW.s80,
                  height: AppSizeH.s40,
                  padding: EdgeInsets.symmetric(horizontal: AppSizeW.s3),
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Theme.of(context).cardColor
                        : ColorManager.grey,
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  child: Stack(
                    children: [
                      // Animated thumb (white circle with shadow)
                      AnimatedAlign(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                        alignment: isCalendar
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          width: AppSizeW.s34,
                          height: AppSizeH.s34,
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Icon Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        spacing: AppSizeH.s5,
                        children: [
                          // Calendar icon
                          GestureDetector(
                            onTap: () => isCalendarView.value = true,
                            child: Container(
                              // width: AppSizeW.s34,
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.calendar_month_outlined,
                                size: AppSizeSp.s20,
                                color: isCalendar
                                    ? ColorManager.primaryBlue
                                    : ColorManager.cloudyGrey,
                              ),
                            ),
                          ),
                          // View icon
                          GestureDetector(
                            onTap: () => isCalendarView.value = false,
                            child: Container(
                              // width: AppSizeW.s34,
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.view_compact_rounded,
                                size: AppSizeSp.s20,
                                color: !isCalendar
                                    ? ColorManager.primaryBlue
                                    : ColorManager.cloudyGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSizeW.s20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'تدريب العقود الذكية للوسطاء العقاريين',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
              ),
              SizedBox(height: AppSizeH.s20),
              ValueListenableBuilder<bool>(
                valueListenable: isCalendarView,
                builder: (context, isCalendar, _) {
                  if (isCalendar) {
                    return ValueListenableBuilder<int>(
                      valueListenable: selectedDay,
                      builder: (context, day, _) {
                        return CalendarView(
                          selectedDay: day,
                          onDaySelected: (newDay) {
                            selectedDay.value = newDay;
                          },
                        );
                      },
                    );
                  } else {
                    return ValueListenableBuilder<int>(
                      valueListenable: selectedTimeSlot,
                      builder: (context, slot, _) {
                        return TimeSlotView(
                          selectedTimeSlot: slot,
                          onTimeSlotSelected: (newSlot) {
                            selectedTimeSlot.value = newSlot;
                          },
                        );
                      },
                    );
                  }
                },
              ),
              SizedBox(height: AppSizeH.s60),
            ],
          ),
        ),
      ),
      bottomSheet: const TwoBottomButtonsWidget(),
    );
  }
}
