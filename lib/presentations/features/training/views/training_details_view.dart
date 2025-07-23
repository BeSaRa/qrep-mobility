import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/presentations/features/training/bloc/get_course_details_bloc/get_course_details_bloc.dart';
import 'package:ebla/presentations/resources/language_manager.dart';
import 'package:ebla/presentations/widgets/error_widget.dart';
import 'package:ebla/utils/global_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ebla/domain/models/training/get_all_courses_response_model.dart';
import 'package:ebla/presentations/features/training/widgets/training_details_widgets/course_description_widget.dart';
import 'package:ebla/presentations/features/training/widgets/training_details_widgets/course_info_widget.dart';
import 'package:ebla/presentations/features/training/widgets/training_details_widgets/expandable_selection_widget.dart';
import 'package:ebla/presentations/features/training/widgets/training_details_widgets/registration_button_widget.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/routes_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class TrainingDetailsView extends StatefulWidget {
  final TrainingCourse course;

  const TrainingDetailsView({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  State<TrainingDetailsView> createState() => _TrainingDetailsViewState();
}

class _TrainingDetailsViewState extends State<TrainingDetailsView> {
  String? validateUrl(String? url) {
    if (url == null || url.isEmpty) return null;

    try {
      final uri = Uri.parse(url);
      if (uri.scheme.isEmpty || uri.host.isEmpty) {
        return null;
      }
      return url;
    } catch (e) {
      return null;
    }
  }

  final ValueNotifier<Set<int>> expandedSections = ValueNotifier<Set<int>>({});
  late GetCourseDetailsBloc getCourseDetailsBloc;
  void toggleSection(int index) {
    final current = Set<int>.from(expandedSections.value);
    if (current.contains(index)) {
      current.remove(index);
    } else {
      current.add(index);
    }
    expandedSections.value = current;
  }

  @override
  void initState() {
    super.initState();
    getCourseDetailsBloc = instance<GetCourseDetailsBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetCourseDetailsBloc >(
      create: (context) => getCourseDetailsBloc
        ..add(GetCourseDetailsEvent.started(widget.course.id)),
      child: Scaffold(
        appBar: const TrainingDeatilsAppBar(),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).scaffoldBackgroundColor
            : Theme.of(context).canvasColor,
        body: BlocConsumer<GetCourseDetailsBloc, GetCourseDetailsState>(
            listener: (context, state) {},
            builder: (context, state) {
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
                      getCourseDetailsBloc
                          .add(GetCourseDetailsEvent.started(widget.course.id));
                    },
                  );
                },
                done: (value) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //--------- 1 -----------
                        SizedBox(height: AppSizeH.s20),
                        CourseInfoWidget(course: value.courseDetailsResponse.data!),
                        
                        //--------- 2 -----------
                        SizedBox(height: AppSizeH.s20),
                        RegistrationButtonWidget(
                          onPressed: () {
                            context.pushNamed(RoutesNames.trainingBooking,extra: widget.course);
                          },
                        ),

                        //--------- 3 -----------
                        SizedBox(height: AppSizeH.s10),
                        CourseDescriptionWidget(course: value.courseDetailsResponse.data!),

                        //--------- 4 -----------
                        SizedBox(height: AppSizeH.s10),
                        ValueListenableBuilder<Set<int>>(
                          valueListenable: expandedSections,
                          builder: (context, expanded, child) {
                            //===================Data Lists=====================
                            //------ A -----
                            List<String> descriptionItems = value
                                .courseDetailsResponse.data!.translations
                                .firstWhere(
                                  (e) =>
                                      e.languageId ==
                                      (context.locale == ARABIC_LOCAL ? 2 : 1),
                                  orElse: () => value.courseDetailsResponse
                                      .data!.translations.first,
                                )
                                .description
                                .split(RegExp(
                                    r'[.!؟]\s*')) // split on Arabic/English sentence ends
                                .where((s) =>
                                    s.trim().isNotEmpty) // remove empty items
                                .map((s) => s.trim()) // remove whitespace
                                .toList();

                            //------ B -----

                            List<String> requirementsItems = [];
                            for (int i = 0;
                                i <
                                    value.courseDetailsResponse.data!
                                        .trainingCourseRequirements.length;
                                i++) {
                              requirementsItems.add(value
                                  .courseDetailsResponse
                                  .data!
                                  .trainingCourseRequirements[i]
                                  .translations
                                  .firstWhere(
                                    (e) =>
                                        e.languageId ==
                                        (context.locale == ARABIC_LOCAL
                                            ? 2
                                            : 1),
                                    orElse: () => value
                                        .courseDetailsResponse
                                        .data!
                                        .trainingCourseRequirements[i]
                                        .translations
                                        .first,
                                  )
                                  .title);
                            }
                            //------ C -----

                            List<String> categoriesItems = [];
                            for (int i = 0; i < value.courseDetailsResponse.data!.categories.length; i++) {
                              categoriesItems.add(value.courseDetailsResponse
                                  .data!.categories[i].translations
                                  .firstWhere(
                                    (e) =>
                                        e.languageId ==
                                        (context.locale == ARABIC_LOCAL
                                            ? 2
                                            : 1),
                                    orElse: () => value.courseDetailsResponse
                                        .data!.categories[i].translations.first,
                                  )
                                  .name);
                            }
                            //========================================

                            return Column(
                              spacing: AppSizeH.s15,
                              children: [
                                ExpandableSectionWidget(
                                  index: 0,
                                  isLink: false,
                                  title: 'وصف الدورة',
                                  icon: Icons.menu_book,
                                  isExpanded: expanded.contains(0),
                                  onTap: () => toggleSection(0),
                                  items: descriptionItems
                                      .map((item) => Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: AppSizeH.s4),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Icon(Icons.check,
                                                    color: ColorManager.primary,
                                                    size: AppSizeSp.s16),
                                                SizedBox(width: AppSizeW.s8),
                                                Expanded(
                                                  child: Text(
                                                    item,
                                                    textAlign: TextAlign.right,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ))
                                      .toList(),
                                ),
                                ExpandableSectionWidget(
                                  isLink: false,
                                  index: 1,
                                  title: 'الفئة المستهدفة',
                                  icon: Icons.group,
                                  isExpanded: expanded.contains(1),
                                  onTap: () => toggleSection(1),
                                  items: categoriesItems
                                      .map((item) => Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: AppSizeH.s4),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Icon(Icons.check,
                                                    color: ColorManager.primary,
                                                    size: AppSizeSp.s16),
                                                SizedBox(width: AppSizeW.s8),
                                                Expanded(
                                                  child: Text(
                                                    item,
                                                    textAlign: TextAlign.right,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ))
                                      .toList(),
                                ),

                                ExpandableSectionWidget(
                                  index: 2,
                                  isLink: false,
                                  title: 'شروط الدورة',
                                  icon: Icons.assignment,
                                  isExpanded: expanded.contains(2),
                                  onTap: () => toggleSection(2),
                                  items: requirementsItems.isEmpty
                                      ? [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: AppSizeH.s4),
                                            child: Center(
                                              child: Text(
                                                "لا يوجد شروط",
                                                textAlign: TextAlign.right,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall,
                                              ),
                                            ),
                                          ),
                                        ]
                                      : requirementsItems
                                          .map((item) => Padding(
                                                padding: EdgeInsets.symmetric(vertical: AppSizeH.s4),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.check,
                                                        color: ColorManager.primary,
                                                        size: AppSizeSp.s16),
                                                    SizedBox(width: AppSizeW.s8),
                                                    Expanded(
                                                      child: Text(
                                                        item,
                                                        textAlign:TextAlign.right,
                                                        style: Theme.of(context).textTheme.bodySmall,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ))
                                          .toList(),
                                ),

                                ExpandableSectionWidget(
                                  index: 3,
                                  isLink: false,
                                  title: 'وثائق الدورة',
                                  icon: Icons.assignment,
                                  isExpanded: expanded.contains(3),
                                  onTap: () => toggleSection(3),
                                  items: value.courseAttachments.data.isEmpty
                                      ? [
                                          Padding(
                                            padding: EdgeInsets.symmetric(vertical: AppSizeH.s4),
                                            child: Center(
                                              child: Text(
                                                "لا يوجد وثائق",
                                                textAlign: TextAlign.right,
                                                style: Theme.of(context).textTheme.bodySmall,
                                              ),
                                            ),
                                          ),
                                        ]
                                      : value.courseAttachments.data
                                          .map((doc) => DocumentItemWidget(
                                                fileName: doc.fileName,
                                                onView: () {
                                                  openPdf(
                                                      base64String:doc.base64File,
                                                      fileName: doc.fileName,
                                                      );
                                                },
                                                onDownload: () {
                                                  // downloadPdf(
                                                  //     base64String: doc.base64File,
                                                  //     fileName: doc.fileName);
                                                },
                                              ))
                                          .toList(),
                                ),
                                ExpandableSectionWidget(
                                  index: 4,
                                  isLink: true,
                                  onTap: () async {
                                    final validUrl = validateUrl(
                                        value.courseDetailsResponse.data?.link);
                                    if (validUrl != null) {
                                      launchUrl(Uri.parse(validUrl));
                                    } else {
                                      log("zak Invalid course link");
                                    }
                                  },
                                  title: 'رابط الدورة',
                                  icon: Icons.link_rounded,
                                  url: value.courseDetailsResponse.data!.link,
                                ),
                              ],
                            );
                          },
                        ),
                        SizedBox(height: AppSizeH.s32),
                      ],
                    ),
                  );
                },
              );
            }),
      ),
    );
  }

}
class TrainingDeatilsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TrainingDeatilsAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
            onTap: () {
              Navigator.maybePop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: ColorManager.golden,
            ),
          ),
          Text(
            "الدورات والامتحانات",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
          ),
          SizedBox(
            width: AppSizeW.s30,
            height: AppSizeH.s30,
          ),
        ],
      ),
    );
  }
}
