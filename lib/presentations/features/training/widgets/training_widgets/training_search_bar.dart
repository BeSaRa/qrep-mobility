import 'package:ebla/presentations/features/chatbot/widgets/rera_text_faild.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';

class TrainingSearchBar extends StatelessWidget {
  const TrainingSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(AppSizeR.s12),
        boxShadow: [
          BoxShadow(
            color: ColorManager.blackBG.withValues(alpha: 0.05),
            blurRadius: AppSizeR.s10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ReraTextFaild(
        hint: ' بحث من خلال اسم الدورة ..',
        onChange: (value) {
          // context.read<TrainingBloc>().add(SearchCourses(value));
        },
        suffixIcon: Icon(
          Icons.search,
          color: ColorManager.grey,
        ),
      ),
    );
  }
}
