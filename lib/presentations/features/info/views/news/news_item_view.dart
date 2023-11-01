import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/app/extensions.dart';
import 'package:ebla/utils/global_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:go_router/go_router.dart';

import '../../../../../app/constants.dart';
import '../../../../../domain/models/cms_models/news/news_model.dart';
import '../../../../resources/resources.dart';
import '../../../../widgets/shimmer_placeholder.dart';
import '../../../../widgets/widgets.dart';
import '../../blocs/news_bloc/news_bloc.dart';

class NewsItemView extends StatefulWidget {
  final int id;

  const NewsItemView({super.key, required this.id});

  @override
  State<NewsItemView> createState() => _NewsItemViewState();
}

class _NewsItemViewState extends State<NewsItemView> {
  late NewsModel model;
  List<NewsModel> values = [];

  @override
  void initState() {
    model =
        getObjectByIdNewsModel(context.read<NewsBloc>().newsList, widget.id) ??
            const NewsModel();

    values.addAll(context.read<NewsBloc>().newsList);
    values.removeWhere((element) => element.id == widget.id);
    // newsItemBloc = instance<NewsItemBloc>()
    //   ..add(NewsItemEvent.getNewsItem(id: widget.id));
    // newsBloc = instance<NewsBloc>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            // height: 400,

            fit: BoxFit.fill,
          ),
        ),
        // Container(
        //   height: AppSizeH.s50,
        //   decoration: const BoxDecoration(
        //       image: DecorationImage(
        //           image: AssetImage(ImageAssets.appbarBg), fit: BoxFit.fill)),
        // ),
        leading: IconButton(
            onPressed: () {
              Navigator.maybePop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorManager.golden,
            )),
        // BackButton(
        //   color: ColorManager.golden,
        // ),
        title: Text(
          AppStrings().newsDetails,
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
          child: Padding(
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
                          width: double.infinity,
                          image: const AssetImage(
                            ImageAssets.test,
                          ),
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                    imageUrl:
                        '${Constant.secondaryBaseUrl}/assets/${model.image}',
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        height: AppSizeH.s260,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSizeR.s8),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return ShimmerPlaceholder(
                        child: Image(
                          height: AppSizeH.s260,
                          width: double.infinity,
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
                    model.title,
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
                        DateTime.parse(model.dateCreated)
                            .toShowDateTime(local: context.locale.languageCode),
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
                    data: model.content,
                  ),
                  SizedBox(height: AppSizeH.s14),
                  Divider(
                    color: ColorManager.grey,
                    height: AppSizeH.s1,
                  ),
                  SizedBox(height: AppSizeH.s18),
                  Text(
                    AppStrings().releatedNews,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: AppSizeH.s8),
                  Container(
                    width: AppSizeW.s30,
                    height: AppSizeH.s5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSizeR.s5),
                        color: ColorManager.lightSilver),
                  ),
                  SizedBox(height: AppSizeH.s20),
                  Wrap(
                    runSpacing: AppSizeH.s10,
                    children: values.map((e) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppSizeW.s2),
                        child: InkWell(
                          onTap: () {
                            context.pushNamed(RoutesNames.newsbyId,
                                pathParameters: {"id": e.id.toString()},
                                extra: context.read<NewsBloc>());
                          },
                          child: SizedBox(
                            height: AppSizeH.s100,
                            child: NewsItemWidget(
                                image: e.image,
                                date: e.dateCreated,
                                label: e.title),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: AppSizeH.s20),
                ],
              ),
            ),
          )),
    );
  }
}
