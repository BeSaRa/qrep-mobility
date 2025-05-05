import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/domain/models/cms_models/news/news_model.dart';
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
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ],
              ),
              const Spacer(),
              BlocBuilder<NewsBloc, NewsState>(
                bloc: context.read<NewsBloc>(),
                builder: (context, state) {
                  return state.map(
                    error: (value) {
                      return const SizedBox();
                    },
                    loading: (value) {
                      return const SizedBox();
                    },
                    loaded: (value) {
                      return InkWell(
                        onTap: () {
                          context.pushNamed(RoutesNames.news,
                              extra: context.read<NewsBloc>());
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSizeW.s10, vertical: AppSizeH.s2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppStrings().more,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              SizedBox(
                                width: AppSizeW.s8,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: ColorManager.golden,
                                size: AppSizeH.s10,
                              )
                            ],
                          ),
                        ),
                      );
                    },
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
                              activeDotColor: Theme.of(context).primaryColor,
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
                      style: Theme.of(context).textTheme.bodyMedium,
                    );
                  }

                  // Filter the news based on the current locale
                  List<NewsModel> filteredNews = [];
                  if (context.locale == ARABIC_LOCAL) {
                    // Show only Arabic news
                    filteredNews = value.news.where((news) {
                      return RegExp(r'[\u0600-\u06FF]')
                          .hasMatch(news.title.rendered);
                    }).toList();
                  } else {
                    // Show only English news
                    filteredNews = value.news.where((news) {
                      return !RegExp(r'[\u0600-\u06FF]')
                          .hasMatch(news.title.rendered);
                    }).toList();
                  }

                  return Column(
                    children: [
                      SizedBox(
                        height: AppSizeH.s100,
                        child: PageView.builder(
                            controller: _pageController,
                            itemCount: filteredNews.length > 5
                                ? 5
                                : filteredNews.length,
                            // value.news.length > 5 ? 5 : value.news.length,
                            onPageChanged: (indexx) {
                              index = indexx;
                              setState(() {
                                //   _indexCubit = index;
                                index = indexx;
                              });
                            },
                            itemBuilder: (context, index) {
                              // final newsTitle =
                              //     value.news[index].title.rendered;
                              // // Check if the current law matches the app language
                              // final isArabic = context.locale == ARABIC_LOCAL;
                              // final isNewsInArabic = RegExp(r'[\u0600-\u06FF]')
                              //     .hasMatch(newsTitle);
                              // // Show the item only if it matches the app's language
                              // if ((isArabic && isNewsInArabic) ||
                              //     (!isArabic && !isNewsInArabic)) {

                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppSizeW.s20,
                                    vertical: AppSizeH.s4),
                                child: InkWell(
                                  onTap: () {
                                    context.pushNamed(RoutesNames.newsbyId,
                                        pathParameters: {
                                          "id":
                                              filteredNews[index].id.toString()
                                        },
                                        extra: context.read<NewsBloc>());
                                  },
                                  child: NewsItemWidget(
                                      image: filteredNews[index]
                                              .yoastHeadJsonModel
                                              .ogImage
                                              .isNotEmpty
                                          ? filteredNews[index]
                                              .yoastHeadJsonModel
                                              .ogImage[0]
                                              .url
                                          : ImageAssets.test,
                                      // image:filteredNews[index].ogImage.isNotEmpty? filteredNews[index].ogImage[0].url:ImageAssets.test,
                                      date: filteredNews[index].date,
                                      label:
                                          filteredNews[index].title.rendered),
                                ),
                              );
                              // }

                              // // return an empty container for items that don't match the condition
                              // return const SizedBox.shrink();
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
                              activeDotColor: Theme.of(context).primaryColor,
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
                              backgroundColor: WidgetStateProperty.all(
                                  ColorManager.primary)),
                          icon: Icon(
                            Icons.replay_outlined,
                            color: ColorManager.white,
                          )),
                      // SizedBox(height: AppSizeH.s10),
                      Text(
                        value.message,
                        style: Theme.of(context).textTheme.bodyMedium,
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
