import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../resources/resources.dart';
import '../../../../widgets/widgets.dart';
import '../../blocs/news_bloc/news_bloc.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
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
        //  Container(
        //   height: AppSizeH.s50,
        //   decoration: const BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage(ImageAssets.appbarBg),
        //       fit: BoxFit.fill,
        //     ),
        //   ),
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
          AppStrings().news,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share_outlined, color: ColorManager.golden),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: AppSizeH.s40),
              itemCount: context.read<NewsBloc>().newsList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSizeW.s20, vertical: AppSizeH.s4),
                  child: InkWell(
                    onTap: () {
                      context.pushNamed(RoutesNames.newsbyId,
                          pathParameters: {
                            "id": context
                                .read<NewsBloc>()
                                .newsList[index]
                                .id
                                .toString()
                          },
                          extra: context.read<NewsBloc>());
                    },
                    child: SizedBox(
                      height: AppSizeH.s100,
                      child: NewsItemWidget(
                          image: context.read<NewsBloc>().newsList[index].image,
                          date: context
                              .read<NewsBloc>()
                              .newsList[index]
                              .dateCreated,
                          label:
                              context.read<NewsBloc>().newsList[index].title),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
