import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/app/constants.dart';
import 'package:ebla/domain/models/training/get_all_courses_response_model.dart';
import 'package:ebla/presentations/features/more/all_more_web_views/view/authority_map_view.dart';
import 'package:ebla/presentations/features/training/bloc/get_training_course_sessions_bloc/get_training_course_sessions_bloc.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/language_manager.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class TimeSlotView extends StatelessWidget {
  final int selectedTimeSlot;
  // final TrainingSessionsDataModel  trainingSessionsDataModel ;
  final ValueChanged<int> onTimeSlotSelected;
  final TrainingCourse course;
  
  const TimeSlotView({
    super.key,
    required this.selectedTimeSlot,
    required this.onTimeSlotSelected,
    required this.course,
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
        TrainingCardWidget(
          course: course,
          selectedTimeSlot: selectedTimeSlot,
          isCalendarView: false,
        ),
        BlocBuilder<GetTrainingCourseSessionsBloc,
            GetTrainingCourseSessionsState>(
          builder: (context, state) {
            return state.maybeMap(
              done: (value) {
                final session = value
                    .trainingCourseSessions.data.sessions[selectedTimeSlot];
                return SeeOnGoogleMapButton(session: session);
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ],
    );
  }
}

class MapDialog extends StatelessWidget {
  final double latitude;
  final double longitude;

  const MapDialog({
    super.key,
    required this.latitude,
    required this.longitude,
  });
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizeR.s16),
      ),
      insetPadding: const EdgeInsets.all(20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizeR.s16),
          color: Colors.white,
        ),
        child: Column(
          children: [
            // Top close button row
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: LatLng(latitude, longitude),
                  initialZoom: 17,
                ),
                children: [
                  TileLayer(
                    urlTemplate: Constant.mapUrlTemplate,
                    userAgentPackageName: 'com.eblacorp.qrep',
                    tileBuilder: Theme.of(context).brightness == Brightness.dark
                        ? customDarkModeTileBuilder
                        : null,
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(latitude, longitude),
                        child: Icon(
                          Icons.location_on_sharp,
                          color: const Color(0xffEA4335),
                          size: AppSizeW.s40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Bottom fixed close button
            Padding(
              padding: EdgeInsets.all(AppSizeW.s12),
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizeR.s8),
                  ),
                  minimumSize: Size(double.infinity, AppSizeW.s48),
                ),
                child: Text(AppStrings().close),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SeeOnGoogleMapButton extends StatelessWidget {
  final TrainingSessionModel? session;

  const SeeOnGoogleMapButton({
    super.key,
    required this.session,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (session != null) {
          showDialog(
            context: context,
            builder: (context) => MapDialog(
              latitude: session!.latitude,
              longitude: session!.longitude,
            ),
          );
        }
      },
      child: Container(
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
            Text(AppStrings().seeLocationOnMap,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: ColorManager.white)),
          ],
        ),
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
    return SizedBox(
      height: AppSizeH.s96,
      child: BlocConsumer<GetTrainingCourseSessionsBloc,
              GetTrainingCourseSessionsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return state.maybeMap(done: (value) {
              final sessionsList = value.trainingCourseSessions.data.sessions;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: sessionsList.length,
                itemBuilder: (context, index) {
                  final slot = sessionsList[index];
                  final isSelected = index == selectedTimeSlot;

                  ///------------------ Date format--------------------------------
                  final DateTime start = DateTime.parse(slot.startDate);
                  final DateTime end = DateTime.parse(slot.endDate);
                  final bool sameMonth = start.month == end.month;
                  // final dateFormatter     = DateFormat('d');
                  final monthDayFormatter = DateFormat('d MMM');
                  final monthFormatter =
                      DateFormat('MMMM', 'ar'); // Arabic month name
                  final yearFormatter = DateFormat('y');

                  // Main display logic
                  final String dateDisplay = sameMonth
                      ? '${start.day} - ${end.day}' // same month => 10 - 13
                      : '${monthDayFormatter.format(start)}\n${monthDayFormatter.format(end)}'; // diff => 10 Aug\n03 Sep

                  // Label logic
                  final String label = sameMonth
                      ? monthFormatter.format(start) // e.g., April
                      : yearFormatter.format(start); // e.g., 2025
                  ///------------------ Date format --------------------------------

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
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: AppSizeW.s50,
                            height: AppSizeH.s50,
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius:
                                  BorderRadius.circular(AppSizeR.s100),
                            ),
                            child: Text(
                              dateDisplay,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: isSelected
                                          ? ColorManager.primaryBlue
                                          : const Color(0xff84A7BC),
                                      fontWeight: FontWeight.bold,
                                      fontSize: AppSizeSp.s12),
                            ),
                          ),
                          SizedBox(height: AppSizeH.s5),
                          Text(
                            label,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    color: ColorManager.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: AppSizeSp.s12),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }, orElse: () {
              return const SizedBox.shrink();
            });
          }),
    );
  }
}

class TrainingCardWidget extends StatelessWidget {
  final bool isCalendarView;
  final int selectedTimeSlot;
  final TrainingCourse course;

  const TrainingCardWidget(
      {super.key,
      required this.isCalendarView,
      required this.selectedTimeSlot,
      required this.course});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTrainingCourseSessionsBloc,
        GetTrainingCourseSessionsState>(builder: (context, state) {
      return state.maybeMap(done: (value) {
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
                      '${AppStrings().courseFees}: ',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      course.fee.toInt()==0?
              AppStrings().free
              :
              '${course.fee} ${AppStrings().qr}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ColorManager.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                const Divider(),
              ],
              InfoRowWidget(
                label: "${AppStrings().address}:",
                value: value.trainingCourseSessions.data
                    .sessions[selectedTimeSlot].address,
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
                    children: [
                      InfoRowWidget(
                          isLabelLocation: false,
                          label: '${AppStrings().time}:',
                          value:
                              "${value.trainingCourseSessions.data.sessions[selectedTimeSlot].timeFrom} - ${value.trainingCourseSessions.data.sessions[selectedTimeSlot].timeTo}"),
                      // SizedBox(height: AppSizeH.s5),
                      InfoRowWidget(
                          isLabelLocation: false,
                          label: "${AppStrings().numberOfDdays}:",
                          value: value.trainingCourseSessions.data
                              .sessions[selectedTimeSlot].numberOfDays
                              .toString()),
                      // SizedBox(height: AppSizeH.s5),
                      InfoRowWidget(
                          isLabelLocation: false,
                          label: '${AppStrings().registrationDeadline}:',
                          value: value.trainingCourseSessions.data
                              .sessions[selectedTimeSlot].registrationDeadline),
                      // SizedBox(height: AppSizeH.s5),

                      InfoRowWidget(
                          isLabelLocation: false,
                          label: '${AppStrings().language}:',
                          value: value
                              .trainingCourseSessions
                              .data
                              .sessions[selectedTimeSlot]
                              .languageTranslation
                              .key
                              .firstWhere(
                                (e) =>
                                    e.languageId ==
                                    (context.locale == ARABIC_LOCAL ? 2 : 1),
                                orElse: () => value
                                    .trainingCourseSessions
                                    .data
                                    .sessions[selectedTimeSlot]
                                    .languageTranslation
                                    .key
                                    .first,
                              )
                              .name),
                    ],
                  ),

                  //2
                  const Spacer(flex: 1),
                  if (isCalendarView) ...[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${AppStrings().courseFees}: ',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          course.fee.toInt()==0?
                            AppStrings().free
                            :
                            '${course.fee} ${AppStrings().qr}',
                                        style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
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
      }, orElse: () {
        return const SizedBox.shrink();
      });
    });
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

class TwoBottomButtonsWidget extends StatelessWidget {
  final int selectedIndex;
  final List<TrainingSessionModel> sessions;

  const TwoBottomButtonsWidget({
    super.key,
    required this.selectedIndex,
    required this.sessions,
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
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
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
              child: Text(
                AppStrings().registerNow,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ColorManager.white,
                      fontWeight: FontWeight.w800,
                    ),
              ),
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
                  ),
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
                  side: BorderSide.none,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${AppStrings().trainingLocation}: ',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ColorManager.primary,
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                    Text(
                      sessions[selectedIndex]
                          .locationTranslation
                          .key
                          .firstWhere(
                            (e) =>
                                e.languageId ==
                                (context.locale == ARABIC_LOCAL ? 2 : 1),
                            orElse: () => sessions[selectedIndex]
                                .locationTranslation
                                .key
                                .first,
                          )
                          .name,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
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

class EnhancedCalendarView extends StatefulWidget {
  final TrainingCourse course;
  final List<TrainingSessionModel> sessions;

  const EnhancedCalendarView({
    super.key,
    required this.course,
    required this.sessions,
  });

  @override
  State<EnhancedCalendarView> createState() => _EnhancedCalendarViewState();
}

class _EnhancedCalendarViewState extends State<EnhancedCalendarView> {
  final ValueNotifier<DateTime> _currentMonth = ValueNotifier(DateTime.now());
  final ValueNotifier<DateTime?> _selectedDate = ValueNotifier(null);
  final ValueNotifier<TrainingSessionModel?> _selectedSession =
      ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    _selectedDate.value = DateTime.now();
    _findSessionForDate(_selectedDate.value!);
  }

  void _findSessionForDate(DateTime date) {
    _selectedSession.value =
        widget.sessions.cast<TrainingSessionModel?>().firstWhere(
      (session) {
        final start = DateTime.parse(session!.startDate);
        final end = DateTime.parse(session.endDate);
        return date.isAfter(start.subtract(const Duration(days: 1))) &&
            date.isBefore(end.add(const Duration(days: 1)));
      },
      orElse: () => null,
    );
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
    _findSessionForDate(day);
  }

  bool _isDateInAnySession(DateTime date) {
    return widget.sessions.any((session) {
      final start = DateTime.parse(session.startDate);
      final end = DateTime.parse(session.endDate);
      return date.isAfter(start.subtract(const Duration(days: 1))) &&
          date.isBefore(end.add(const Duration(days: 1)));
    });
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.day == now.day &&
        date.month == now.month &&
        date.year == now.year;
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                Column(
                  
                ),
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
                      _previousMonth(); // Swipe right to go back
                    } else if (details.primaryVelocity! > 0) {
                      _nextMonth(); // Swipe left to go forward
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
                          children:
                              ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT']
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
                            return AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              transitionBuilder: (child, animation) {
                                return SlideTransition(
                                  position: Tween<Offset>(
                                    begin: const Offset(1, 0),
                                    end: Offset.zero,
                                  ).animate(animation),
                                  child: child,
                                );
                              },
                              child: Table(
                                key: ValueKey(_currentMonth.value), // Important: triggers animation on month change
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
                                              if (day < 1 ||
                                                  day > daysInMonth) {
                                                return const SizedBox.shrink();
                                              }

                                              final date = DateTime(
                                                  currentMonth.year,
                                                  currentMonth.month,
                                                  day);
                                              final isInRange =
                                                  _isDateInAnySession(date);
                                              final isSelected =
                                                  selectedDate != null &&
                                                      _isSameDay(
                                                          date, selectedDate);
                                              final isToday = _isToday(date);

                                              return GestureDetector(
                                                onTap: isInRange
                                                    ? () => _onDaySelected(date)
                                                    : null,
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
                                                                : isInRange
                                                                    ? ColorManager
                                                                        .primaryBlue
                                                                        .withOpacity(
                                                                            0.1)
                                                                    : Colors
                                                                        .transparent,
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
                                                                            : isInRange
                                                                                ? ColorManager.textBlack
                                                                                : ColorManager.textBlack.withValues(alpha: 0.3),
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
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: AppSizeH.s20),
                ValueListenableBuilder<TrainingSessionModel?>(
                  valueListenable: _selectedSession,
                  builder: (context, selectedSession, _) {
                    return selectedSession != null
                        ? TrainingCardWidget(
                            isCalendarView: true,
                            selectedTimeSlot:
                                widget.sessions.indexOf(selectedSession),
                            course: widget.course,
                          )
                        : Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: ColorManager.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(AppStrings().noSessions,
                                style: Theme.of(context).textTheme.bodySmall),
                          );
                  },
                ),
                ValueListenableBuilder<TrainingSessionModel?>(
                  valueListenable: _selectedSession,
                  builder: (context, selectedSession, _) {
                    return selectedSession != null
                        ? Column(
                            children: [
                              SeeOnGoogleMapButton(session: selectedSession),
                            ],
                          )
                        : const SizedBox.shrink();
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _currentMonth.dispose();
    _selectedDate.dispose();
    _selectedSession.dispose();
    super.dispose();
  }
}
