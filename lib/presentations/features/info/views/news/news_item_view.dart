import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/app/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../../app/constants.dart';
import '../../../../../domain/models/cms_models/news/news_model.dart';
import '../../../../resources/resources.dart';
import '../../../../widgets/shimmer_placeholder.dart';
import '../../../../widgets/widgets.dart';
import 'blocs/news_bloc/news_bloc.dart';
import 'blocs/news_item_bloc/news_item_bloc.dart';

class NewsItemView extends StatefulWidget {
  final int id;
  const NewsItemView({super.key, required this.id});

  @override
  State<NewsItemView> createState() => _NewsItemViewState();
}

class _NewsItemViewState extends State<NewsItemView> {
  late NewsItemBloc newsItemBloc;
  late NewsBloc newsBloc;

  @override
  void initState() {
    newsItemBloc = instance<NewsItemBloc>()
      ..add(NewsItemEvent.getNewsItem(id: widget.id));
    newsBloc = instance<NewsBloc>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageAssets.appbarBg), fit: BoxFit.fill)),
        ),
        leading: BackButton(
          color: ColorManager.golden,
        ),
        title: Text(
          'تفاصيل الأخبار',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share_outlined, color: ColorManager.golden),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(ImageAssets.homeBg),
          fit: BoxFit.cover,
        )),
        child: BlocConsumer(
          listener: (context, NewsItemState state) {
            state.mapOrNull(
              success: (value) {
                newsBloc.add(const NewsEvent.getNewsEvent());
              },
            );
          },
          bloc: newsItemBloc,
          builder: (context, NewsItemState state) {
            return state.map(
              loading: (value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              success: (value) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizeW.s20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          progressIndicatorBuilder: (context, url, progress) {
                            return ShimmerPlaceholder(
                              child: Image(
                                height: AppSizeH.s260,
                                image: const AssetImage(
                                  ImageAssets.test,
                                ),
                                fit: BoxFit.fill,
                              ),
                            );
                          },
                          imageUrl:
                              '${Constant.secondaryBaseUrl}/assests/${value.item.data.image}',
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              height: AppSizeH.s260,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(AppSizeR.s8),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                            );
                          },
                          errorWidget: (context, url, error) {
                            return ShimmerPlaceholder(
                              child: Image(
                                height: AppSizeH.s260,
                                image: const AssetImage(
                                  ImageAssets.test,
                                ),
                                fit: BoxFit.fill,
                              ),
                            );
                          },
                        ),

                        SizedBox(height: AppSizeH.s16),
                        Text(
                          value.item.data.title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(height: AppSizeH.s8),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_outlined,
                              size: AppSizeSp.s14,
                              color: ColorManager.cloudyGrey,
                            ),
                            SizedBox(width: AppSizeW.s5),
                            Text(
                              DateTime.parse(value.item.data.dateCreated)
                                  .toFormattedString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                      fontSize: AppSizeSp.s14,
                                      fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        SizedBox(height: AppSizeH.s6),
                        Divider(
                          color: ColorManager.grey,
                          height: AppSizeH.s1,
                        ),
                        SizedBox(height: AppSizeH.s14),
                        Html(
                          data: value.item.data.content,
                        ),
                        SizedBox(height: AppSizeH.s14),
                        Divider(
                          color: ColorManager.grey,
                          height: AppSizeH.s1,
                        ),
                        SizedBox(height: AppSizeH.s18),
                        Text(
                          'أخبار ذات صلة',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(height: AppSizeH.s8),
                        Container(
                            width: AppSizeW.s30,
                            height: AppSizeH.s5,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(AppSizeR.s5),
                                color: ColorManager.lightSilver)),
                        SizedBox(height: AppSizeH.s20),
                        BlocBuilder(
                          bloc: newsBloc,
                          builder: (context, NewsState state) {
                            return state.map(
                              loading: (value) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                              loaded: (value) {
                                List<NewsModel> values = [];
                                values.addAll(value.news);
                                values.removeWhere(
                                    (element) => element.id == widget.id);
                                return Wrap(
                                  runSpacing: AppSizeH.s10,
                                  children: values.map((e) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: AppSizeW.s2),
                                      child: SizedBox(
                                        height: AppSizeH.s100,
                                        child: NewsItemWidget(
                                            image: e.image,
                                            date: e.dateCreated,
                                            label: e.title),
                                      ),
                                    );
                                  }).toList(),
                                );
                              },
                              error: (value) {
                                return const Text('error');
                              },
                            );
                          },
                        )

                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: AppSizeW.s3),
                        //   child: SizedBox(
                        //     height: AppSizeH.s100,
                        //     child: NewsItemWidget(
                        //         image: 'value.news[index].image',
                        //         date: DateTime.now().toString(),
                        //         label: 'title'),
                        //   ),
                        // ),
                        // SizedBox(height: AppSizeH.s12),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: AppSizeW.s3),
                        //   child: SizedBox(
                        //     height: AppSizeH.s100,
                        //     child: NewsItemWidget(
                        //         image: 'value.news[index].image',
                        //         date: DateTime.now().toString(),
                        //         label: 'title'),
                        //   ),
                        // ),
                        // SizedBox(height: AppSizeH.s20),
                      ],
                    ),
                  ),
                );
              },
              error: (value) {
                return const Text('error');
              },
            );
          },
        ),
      ),
    );
  }
}
