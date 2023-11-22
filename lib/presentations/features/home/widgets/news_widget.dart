import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../resources/resources.dart';
import '../../../widgets/widgets.dart';
import '../../info/blocs/news_bloc/news_bloc.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget({super.key});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  final PageController _pageController = PageController();
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSizeW.s20, vertical: AppSizeH.s14),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    AppStrings().news,
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w800),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: AppSizeW.s10),
                    height: AppSizeH.s5,
                    width: AppSizeW.s40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSizeR.s5),
                        color: ColorManager.lightSilver),
                  ),
                ],
              ),
              const Spacer(),
              BlocBuilder(
                bloc: context.read<NewsBloc>(),
                builder: (context, state) {
                  if (context
                      .read<NewsBloc>()
                      .newsList
                      .isEmpty) {
                    return const SizedBox();
                  }
                  return InkWell(
                    onTap: () {
                      context.pushNamed(RoutesNames.news,
                          extra: context.read<NewsBloc>());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSizeW.s14, vertical: AppSizeH.s2),
                      decoration: BoxDecoration(

                          color: ColorManager.white,
                          border: Border.all(color: ColorManager.golden),
                          borderRadius: BorderRadius.circular(AppSizeR.s20)),
                      child: Row(
                        children: [
                          Text(
                            AppStrings().more,
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleSmall,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: ColorManager.golden,
                            size: AppSizeH.s14,
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
        SizedBox(
          height: AppSizeH.s120,
          child: BlocBuilder(
            bloc: context.read<NewsBloc>(),
            builder: (context, NewsState state) {
              return state.map(
                loading: (value) {
                  return Column(
                    children: [
                      SizedBox(
                        height: AppSizeH.s100,
                        child: PageView.builder(
                            controller: _pageController,
                            itemCount: 3,
                            onPageChanged: (indexx) {
                              index = indexx;
                              setState(() {
                                //   _indexCubit = index;
                                index = indexx;
                              });
                            },
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppSizeW.s20,
                                    vertical: AppSizeH.s4),
                                child: const NewsItemWidget(
                                    image: '',
                                    date: '',
                                    label: '',
                                    isLoading: true),
                              );
                            }),
                      ),
                      SizedBox(
                        height: AppSizeH.s10,
                      ),
                      Center(
                        child: AnimatedSmoothIndicator(
                          activeIndex: index,
                          count: 3,
                          // textDirection: TextDirection.rtl,
                          effect: ExpandingDotsEffect(
                              dotColor: ColorManager.silver,
                              activeDotColor: Theme
                                  .of(context)
                                  .primaryColor,
                              dotHeight: AppSizeH.s6,
                              dotWidth: AppSizeW.s6),
                        ),
                      ),
                    ],
                  );
                },
                loaded: (value) {
                  if (value.news.isEmpty) {
                    return Text(
                      AppStrings().noDataFound,
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyMedium,
                    );
                  }
                  return Column(
                    children: [
                      SizedBox(
                        height: AppSizeH.s100,
                        child: PageView.builder(
                            controller: _pageController,
                            itemCount:
                            value.news.length > 5 ? 5 : value.news.length,
                            onPageChanged: (indexx) {
                              index = indexx;
                              setState(() {
                                //   _indexCubit = index;
                                index = indexx;
                              });
                            },
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppSizeW.s20,
                                    vertical: AppSizeH.s4),
                                child: InkWell(
                                  onTap: () {
                                    context.pushNamed(RoutesNames.newsbyId,
                                        pathParameters: {
                                          "id": value.news[index].id.toString()
                                        },
                                        extra: context.read<NewsBloc>());
                                  },
                                  child: NewsItemWidget(
                                      image: value.news[index].image,
                                      date: value.news[index].dateCreated,
                                      label: value.news[index].title),
                                ),
                              );
                            }),
                      ),
                      SizedBox(height: AppSizeH.s10),
                      Center(
                        child: AnimatedSmoothIndicator(
                          activeIndex: index,
                          count: value.news.length > 5 ? 5 : value.news.length,
                          // textDirection: TextDirection.rtl,
                          effect: ExpandingDotsEffect(
                              dotColor: ColorManager.silver,
                              activeDotColor: Theme
                                  .of(context)
                                  .primaryColor,
                              dotHeight: AppSizeH.s6,
                              dotWidth: AppSizeW.s6),
                        ),
                      ),
                    ],
                  );
                },
                error: (value) {
                  return Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            context
                                .read<NewsBloc>()
                                .add(const NewsEvent.getNewsEvent());
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  ColorManager.primary)),
                          icon: Icon(
                            Icons.replay_outlined,
                            color: ColorManager.white,
                          )),
                      // SizedBox(height: AppSizeH.s10),
                      Text(
                        value.message,
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyMedium,
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
