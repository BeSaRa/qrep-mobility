import 'package:ebla/presentations/features/training/widgets/training_details_widgets/course_description_widget.dart';
import 'package:ebla/presentations/features/training/widgets/training_details_widgets/course_info_widget.dart';
import 'package:ebla/presentations/features/training/widgets/training_details_widgets/expandable_selection_widget.dart';
import 'package:ebla/presentations/features/training/widgets/training_details_widgets/registration_button_widget.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/routes_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Main TrainingDetailsView
class TrainingDetailsView extends StatelessWidget {
  const TrainingDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Set<int>> expandedSections =
        ValueNotifier<Set<int>>({});

    void toggleSection(int index) {
      final current = Set<int>.from(expandedSections.value);
      if (current.contains(index)) {
        current.remove(index);
      } else {
        current.add(index);
      }
      expandedSections.value = current;
    }

    return Scaffold(
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
              onTap: () {
                Navigator.maybePop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: ColorManager.golden,
              ),
            ),
            Text(
              'الدورات والامتحانات',
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
      ),
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Theme.of(context).scaffoldBackgroundColor
          : Theme.of(context).canvasColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: AppSizeH.s20),
            const CourseInfoWidget(),
            SizedBox(height: AppSizeH.s20),
            RegistrationButtonWidget(
              onPressed: () {
                // Handle registration
                context.pushNamed(RoutesNames.trainingBooking);
              },
            ),
            SizedBox(height: AppSizeH.s10),
            const CourseDescriptionWidget(),
            SizedBox(height: AppSizeH.s10),
            ValueListenableBuilder<Set<int>>(
              valueListenable: expandedSections,
              builder: (context, expanded, child) {
                return Column(
                  spacing: AppSizeH.s15,
                  children: [
                    ExpandableSectionWidget(
                      isLink: false,
                      title: 'محتوى الدورة',
                      icon: Icons.menu_book,
                      isExpanded: expanded.contains(0),
                      onTap: () => toggleSection(0),
                      items: const [
                        'مقدمة في العقود الذكية',
                        'أساسيات البلوك تشين',
                        'تطبيقات العقود الذكية في العقارات',
                        'إدارة المخاطر والأمان',
                      ],
                    ),
                    ExpandableSectionWidget(
                      isLink: false,
                      title: 'الفئة المستهدفة',
                      icon: Icons.group,
                      isExpanded: expanded.contains(1),
                      onTap: () => toggleSection(1),
                      items: const [
                        'أن يكون المستخدم من الوسطاء العقاريين',
                        'أن يكون المستخدم من الوسطاء العقاريين',
                        'أن يكون المستخدم من الوسطاء العقاريين',
                      ],
                    ),
                    ExpandableSectionWidget(
                      isLink: false,
                      title: 'شروط الدورة',
                      icon: Icons.assignment,
                      isExpanded: expanded.contains(2),
                      onTap: () => toggleSection(2),
                      items: const [
                        'خبرة أساسية في العقارات',
                        'معرفة بأساسيات التكنولوجيا',
                        'الالتزام بحضور جميع الجلسات',
                      ],
                    ),
                    ExpandableSectionWidget(
                      isLink: false,
                      title: 'وثائق الدورة',
                      icon: Icons.assignment,
                      isExpanded: expanded.contains(3),
                      onTap: () => toggleSection(3),
                      items: const [
                        'خبرة أساسية في العقارات',
                        'معرفة بأساسيات التكنولوجيا',
                        'الالتزام بحضور جميع الجلسات',
                      ],
                    ),
                    const ExpandableSectionWidget(
                      isLink: true,
                      title: 'رابط الدورة',
                      icon: Icons.link_rounded,
                      url: "/https//www.aqarat.gov.qa",
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: AppSizeH.s32),
          ],
        ),
      ),
    );
  }
}
