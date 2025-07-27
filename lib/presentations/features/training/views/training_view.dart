import 'dart:developer';

import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/domain/models/requests/training/get_all_courses_request_model.dart';
import 'package:ebla/presentations/features/training/bloc/get_all_training_courses_bloc/get_all_training_courses_bloc.dart';
import 'package:ebla/presentations/features/training/bloc/training_filter_cubit/training_filter_cubit.dart';
import 'package:ebla/presentations/features/training/widgets/training_widgets/training_course_card.dart';
import 'package:ebla/presentations/features/training/widgets/training_widgets/training_filter_chips.dart';
import 'package:ebla/presentations/features/training/widgets/training_widgets/training_search_bar.dart';
import 'package:ebla/presentations/features/training/widgets/training_widgets/training_selectable_horizontal_list.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:ebla/presentations/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrainingView extends StatefulWidget {
  const TrainingView({super.key});

  @override
  State<TrainingView> createState() => _TrainingViewState();
}

class _TrainingViewState extends State<TrainingView> {
  late GetAllTrainingCoursesBloc getAllTrainingCoursesBloc;
  @override
  void initState() {
    super.initState();
    getAllTrainingCoursesBloc = instance<GetAllTrainingCoursesBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TrainingFilterCubit(),
        ),
        BlocProvider(
          create: (context) => getAllTrainingCoursesBloc
            ..add(const GetAllTrainingCoursesEvent.started(
                GetAllCoursesRequestModel(
                    pageIndex: 1,
                    pageSize: 5,
                    name: "",
                    track: null,
                    isFree: null,
                    categories: null,
                    isActive: null))),
        ),
      ],
      child: const TrainingViewContent(),
    );
  }
}

class TrainingViewContent extends StatefulWidget {
  const TrainingViewContent({super.key});

  @override
  State<TrainingViewContent> createState() => _TrainingViewContentState();
}

class _TrainingViewContentState extends State<TrainingViewContent> {
  final ScrollController _mainScrollController = ScrollController();

  @override
  void dispose() {
    _mainScrollController.dispose();
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
              onTap: () {
                Navigator.maybePop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: ColorManager.cloudyGrey,
                  ),
                  SizedBox(width: AppSizeW.s5),
                  Text(
                    AppStrings().back,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            Text(
              'الدورات والامتحانات',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      body: BlocConsumer<GetAllTrainingCoursesBloc, GetAllTrainingCoursesState>(
        listener: (context, state) {
          state.mapOrNull(
            done: (value) {
              log(value.coursesResponse.toString());
            },
          );
        },
        builder: (context, state) {
          return state.map(
            initial: (value) => const SizedBox.shrink(),
            loading: (value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            error: (value) {
              return ErrorGlobalWidget(
                message: value.message,
                onPressed: () {
                  context.read<TrainingFilterCubit>().resetFilters();
                  context.read<GetAllTrainingCoursesBloc>().add(
                      const GetAllTrainingCoursesEvent.started(
                          GetAllCoursesRequestModel(
                              pageIndex: 1,
                              pageSize: 5,
                              name: "",
                              track: null,
                              isFree: null,
                              categories: null,
                              isActive: null)));
                },
              );
            },
            done: (value) {
              final courses = value.coursesResponse.data?.trainingCourses ?? [];
              final pager = value.coursesResponse.data?.pager;
              final bloc = context.read<GetAllTrainingCoursesBloc>();
              bool showHeader = true;

              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  // Handle scroll direction for header show/hide
                  if (notification.direction == ScrollDirection.forward) {
                    if (!showHeader) {
                      showHeader = true;
                    }
                  } else if (notification.direction ==
                      ScrollDirection.reverse) {
                    if (showHeader) {
                      showHeader = false;
                    }
                  }
                  return true;
                },
                child: NotificationListener<ScrollNotification>(
                  onNotification: (scrollInfo) {
                    // Handle pagination when reaching bottom
                    if (scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent &&
                        scrollInfo.metrics.axis == Axis.vertical &&
                        pager != null &&
                        pager.hasNextPage) {
                      final filterCubit = context.read<TrainingFilterCubit>();
                      final nextPageRequest = filterCubit.state.copyWith(
                        pageIndex: pager.pageIndex + 1,
                      );
                      // Update cubit state
                      filterCubit.updateFilters(
                        pageIndex: pager.pageIndex + 1,
                      );
                      bloc.add(
                        GetAllTrainingCoursesEvent.fetchNextPage(
                            nextPageRequest),
                      );
                    }
                    return true;
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    child: CustomScrollView(
                      controller: _mainScrollController,
                      slivers: [
                        // Collapsible header section
                        SliverAppBar(
                          automaticallyImplyLeading: false,
                          backgroundColor:
                              Theme.of(context).brightness == Brightness.dark
                                  ? Theme.of(context).scaffoldBackgroundColor
                                  : Theme.of(context).canvasColor,
                          expandedHeight: AppSizeH.s280,
                          floating: true,
                          pinned: false,
                          snap: true,
                          flexibleSpace: FlexibleSpaceBar(
                            collapseMode: CollapseMode.pin,
                            background: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: AppSizeW.s16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'الدورات والامتحانات',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge
                                                ?.copyWith(
                                                    color: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall
                                                        ?.color),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Showing results",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.copyWith(
                                                        color: ColorManager
                                                            .golden),
                                              ),
                                              SizedBox(width: AppSizeW.s8),
                                              Container(
                                                constraints: BoxConstraints(
                                                  minWidth: AppSizeW.s50,
                                                  maxWidth: AppSizeW.s100,
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: AppSizeW.s8,
                                                    vertical: AppSizeW.s5),
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      offset:
                                                          const Offset(1, 1),
                                                      spreadRadius: AppSizeR.s2,
                                                      blurRadius: AppSizeR.s11,
                                                      color: ColorManager
                                                          .textBlack
                                                          .withAlpha(6),
                                                    ),
                                                  ],
                                                  color: Theme.of(context)
                                                      .cardTheme
                                                      .color,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          AppSizeR.s10),
                                                ),
                                                child: DropdownButton<int>(
                                                  value: context
                                                      .read<
                                                          TrainingFilterCubit>()
                                                      .state
                                                      .pageSize,
                                                  items: [5, 10, 15, 20]
                                                      .map((value) {
                                                    return DropdownMenuItem<
                                                        int>(
                                                      value: value,
                                                      child: Text(
                                                        value.toString(),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall
                                                            ?.copyWith(
                                                                color: ColorManager
                                                                    .primaryBlue,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  onChanged: (value) {
                                                    final filterCubit =context.read<TrainingFilterCubit>();
                                                    final currentFilters = filterCubit.state;
                                                    filterCubit.updateFilters(isActive: currentFilters.isActive,pageIndex: 1,track:currentFilters.track,isFree:currentFilters.isFree,name: currentFilters.name,categories: currentFilters.categories,pageSize: value ?? 5,);

                                                    context.read<GetAllTrainingCoursesBloc>().add(
                                                          GetAllTrainingCoursesEvent
                                                              .applyFilters(
                                                                  filterCubit
                                                                      .state),
                                                        );
                                                  },
                                                  isDense: true,
                                                  underline: const SizedBox(),
                                                  icon: const Icon(Icons
                                                      .keyboard_arrow_down),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: AppSizeH.s16),
                                      const TrainingSearchBar(),
                                      SizedBox(height: AppSizeH.s16),
                                      const TrainingFilterChips(),
                                      SizedBox(height: AppSizeH.s5),
                                      const TrainingSelectableCatigoriesList(),
                                      // SizedBox(height: AppSizeH.s16),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (value.isApplyFilterLoading)
                          const SliverFillRemaining(
                            child: Center(child: CircularProgressIndicator()),
                          )
                        else
                          // Courses list
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                if (index < courses.length) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: AppSizeW.s16,
                                      vertical: AppSizeH.s8,
                                    ),
                                    child: TrainingCourseCard(
                                        course: courses[index]),
                                  );
                                } else if (pager?.hasNextPage == true) {
                                  return Padding(
                                    padding: EdgeInsets.all(AppSizeW.s16),
                                    child: const Center(
                                        child: CircularProgressIndicator()),
                                  );
                                }
                                return null;
                              },
                              childCount: courses.length +
                                  (pager?.hasNextPage == true ? 1 : 0),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
