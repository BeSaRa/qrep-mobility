import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/presentations/features/home/blocs/news_bloc/news_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../resources/resources.dart';
import '../../../widgets/widgets.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget({super.key});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  final PageController _pageController = PageController();
  late NewsBloc newsBloc;
  int index = 0;
  @override
  void initState() {
    newsBloc = instance<NewsBloc>()..add(const NewsEvent.getAbout());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: newsBloc,
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
                              horizontal: AppSizeW.s20, vertical: AppSizeH.s4),
                          child: const NewsItemWidget(
                              date: '', label: '', isLoading: true),
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
            return Column(
              children: [
                SizedBox(
                  height: AppSizeH.s100,
                  child: PageView.builder(
                      controller: _pageController,
                      itemCount: value.news.length,
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
                              horizontal: AppSizeW.s20, vertical: AppSizeH.s4),
                          child: NewsItemWidget(
                              date: value.news[index].dateCreated,
                              label: value.news[index].title),
                        );
                      }),
                ),
                SizedBox(
                  height: AppSizeH.s10,
                ),
                Center(
                  child: AnimatedSmoothIndicator(
                    activeIndex: index,
                    count: value.news.length,
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
            return const Text('data');
          },
        );
      },
    );
  }
}
