import 'dart:async';

import 'package:ebla/presentations/features/chatbot/widgets/rera_text_faild.dart';
import 'package:ebla/presentations/features/training/bloc/get_all_training_courses_bloc/get_all_training_courses_bloc.dart';
import 'package:ebla/presentations/features/training/bloc/training_filter_cubit/training_filter_cubit.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrainingSearchBar extends StatefulWidget {
  const TrainingSearchBar({super.key});

  @override
  State<TrainingSearchBar> createState() => _TrainingSearchBarState();
}

class _TrainingSearchBarState extends State<TrainingSearchBar> {
  Timer? _debounce;

  void _onSearchChanged(String value) {
    // cancel the previous timer if still active
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      final filterCubit = context.read<TrainingFilterCubit>();
      final currentFilters = filterCubit.state;

      filterCubit.updateFilters(
        isActive: currentFilters.isActive,
        pageIndex: 1,
        track: currentFilters.track,
        isFree: currentFilters.isFree,
        name: value,
        categories: currentFilters.categories,
        pageSize: currentFilters.pageSize,
      );

      context.read<GetAllTrainingCoursesBloc>().add(
            GetAllTrainingCoursesEvent.applyFilters(filterCubit.state),
          );
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(AppSizeR.s12),
        boxShadow: [
          BoxShadow(
            color: ColorManager.blackBG.withOpacity(0.05),
            blurRadius: AppSizeR.s10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ReraTextFaild(
        hint: ' بحث من خلال اسم الدورة ..',
        onChange: _onSearchChanged,
        suffixIcon: Icon(
          Icons.search,
          color: ColorManager.grey,
        ),
      ),
    );
  }
}
