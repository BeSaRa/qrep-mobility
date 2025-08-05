import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/domain/models/requests/training/get_all_courses_request_model.dart';
import 'package:ebla/domain/models/training/get_all_courses_response_model.dart';
import 'package:ebla/presentations/features/training/bloc/get_training_course_sessions_bloc/get_training_course_sessions_bloc.dart';
import 'package:ebla/presentations/features/training/widgets/training_booking_widgets/training_booking_widgets.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/language_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:ebla/presentations/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrainingBookingView extends StatefulWidget {
  const TrainingBookingView({super.key, required this.course});
    final TrainingCourse course;

  @override
  State<TrainingBookingView> createState() => _TrainingBookingViewState();
}

class _TrainingBookingViewState extends State<TrainingBookingView> {
  final ValueNotifier<bool> isCalendarView = ValueNotifier(false);
  final ValueNotifier<int> selectedTimeSlot = ValueNotifier(0);
  final ValueNotifier<int> selectedDay = ValueNotifier(17);
  late GetTrainingCourseSessionsBloc getTrainingCourseSessionsBloc;

  @override
  void initState() {
    super.initState();
    getTrainingCourseSessionsBloc = instance<GetTrainingCourseSessionsBloc>();
  }

  @override
  void dispose() {
    isCalendarView.dispose();
    selectedTimeSlot.dispose();
    selectedDay.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetTrainingCourseSessionsBloc>(
      create: (context) => getTrainingCourseSessionsBloc..add(GetTrainingCourseSessionsEvent.started(GetTrainingCourseSessionsRequestModel(pageIndex: 1,pageSize: 5,trainingCourseId:widget.course.id))),
      child: Stack(
        children: [
          Scaffold(
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
                                      color: Colors.black.withValues(alpha:0.1),
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
            body: BlocConsumer<GetTrainingCourseSessionsBloc,GetTrainingCourseSessionsState>(
              listener: (context, state) {},
              builder: (context,state) {
                return state.map(
                    initial: (value) {
                      return const SizedBox.shrink();
                    },
                    loading: (value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    error: (value) {
                      return ErrorGlobalWidget(
                        message: value.message,
                        onPressed: () {
                          getTrainingCourseSessionsBloc.add(GetTrainingCourseSessionsEvent.started(GetTrainingCourseSessionsRequestModel(pageIndex: 1,pageSize: 5,trainingCourseId:widget.course.id)));
                        },
                      );
                    },
                  done: (value) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(AppSizeW.s20),
              child: Column(
                children: [
                  Text(
                    widget.course.lookup.translations.firstWhere(
                      (e) => e.languageId == (context.locale == ARABIC_LOCAL ? 2 : 1),
                      orElse: () => widget.course.lookup.translations.first,
                    ).name,
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
                        return EnhancedCalendarView(
                          course: widget.course,
                          sessions: value.trainingCourseSessions.data.sessions,
                        );
                      } else {
                        return ValueListenableBuilder<int>(
                          valueListenable: selectedTimeSlot,
                          builder: (context, slot, _) {
                            return TimeSlotView(
                              course: widget.course,
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
                  // add extra space at the bottom to prevent button overlap
                  SizedBox(height: AppSizeH.s80),
                ],
              ),
            );
          },
                );
                
              }
            ),
          ),

            // Fixed position buttons at bottom
            BlocConsumer<GetTrainingCourseSessionsBloc,GetTrainingCourseSessionsState>(
              listener: (context, state) {},
                builder: (context,state){
                return state.maybeMap(
                  done: (value) {
                    return Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: TwoBottomButtonsWidget(
                        selectedIndex: selectedTimeSlot.value,
                        sessions: value.trainingCourseSessions.data.sessions,
                      ),
                    );
                    },
                    orElse: (){
                        return const SizedBox.shrink();
                    });
              }
            ),
        ],
      ),
    );
  }
}
