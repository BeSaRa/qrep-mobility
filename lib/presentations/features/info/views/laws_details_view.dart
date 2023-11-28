// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ebla/app/constants.dart';
import 'package:ebla/domain/models/cms_models/faq/faq_model.dart';
import 'package:ebla/domain/models/cms_models/laws/laws_model.dart';
import 'package:ebla/presentations/features/info/blocs/laws_bloc/laws_bloc.dart';
import 'package:ebla/presentations/features/info/cubits/expanded_tile_index_cubit/expanded_tile_index_cubit.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../home/home_view.dart';

class LawsDetailsView extends StatefulWidget {
  final int id;

  const LawsDetailsView({super.key, required this.id});

  @override
  State<LawsDetailsView> createState() => _LawsDetailsViewState();
}

class _LawsDetailsViewState extends State<LawsDetailsView> {
  late LawsModel lawsModel;

  bool isValidUrl(String url) {
    try {
      Uri.tryParse(url);
      return true;
    } catch (e) {
      return false;
    }
  }

  String getFileUrl(String assetId) {
    return "${Constant.secondaryBaseUrl}/assets/$assetId";
  }

  @override
  void initState() {
    lawsModel = context.read<LawsBloc>().getLawModelById(widget.id);
    super.initState();
  }

  int expandedTileIndex = -1;

  @override
  Widget build(BuildContext context) {
    lawsModel = context.read<LawsBloc>().getLawModelById(widget.id);
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
        //     image: DecorationImage(
        //       image: AssetImage(ImageAssets.appbarBg),
        //       fit: BoxFit.cover,
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
          AppStrings().lawDetails,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizeW.s16,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: AppSizeH.s10,
              ),
              Hero(
                tag: "thelaw",
                child: Center(
                  child: SizedBox(
                    width: AppSizeW.s112,
                    height: AppSizeH.s90,
                    child: StaticPagesContainer(
                      icon: IconAssets.lawsHome,
                      title: Container(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppSizeH.s40,
              ),
              BlocProvider(
                create: (context) => ExpandedTileIndexCubit(),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: ColorManager.grey,
                      height: AppSizeH.s1,
                    );
                  },
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: lawsModel.articles.length,
                  itemBuilder: (context, index) {
                    return LawArticleWidget(
                      index: index,
                      faqItemModel: null,
                      article: lawsModel.articles[index],
                      maxExpandedHeight: AppSizeH.s250,
                    );
                  },
                ),
              ),
              SizedBox(height: AppSizeH.s30),
            ],
          ),
        ),
      ),
    );
  }
}

class LawArticleWidget extends StatefulWidget {
  final ArticleModel? article;
  final FaqItemModel? faqItemModel;
  final double maxExpandedHeight;
  final int index;

  const LawArticleWidget({
    Key? key,
    required this.article,
    required this.faqItemModel,
    required this.maxExpandedHeight,
    required this.index,
  }) : super(key: key);

  @override
  State<LawArticleWidget> createState() => _LawArticleWidgetState();
}

class _LawArticleWidgetState extends State<LawArticleWidget> {
  final ExpansionTileController expansionTileController =
      ExpansionTileController();

  bool isValidUrl(String url) {
    try {
      Uri.tryParse(url);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizeH.s5),
      child: Theme(
        data: ThemeData().copyWith(
          /// Prevents to splash effect when clicking.
          splashColor: Theme.of(context).scaffoldBackgroundColor,

          /// Prevents the mouse cursor to highlight the tile when hovering on web.
          hoverColor: Theme.of(context).scaffoldBackgroundColor,

          /// Hides the highlight color when the tile is pressed.
          highlightColor: Theme.of(context).scaffoldBackgroundColor,

          /// Makes the top and bottom dividers invisible when expanded.
          dividerColor: Colors.transparent,

          scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor,

          /// Make background transparent.
          expansionTileTheme: ExpansionTileThemeData(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            collapsedBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
        child: BlocListener(
          bloc: context.read<ExpandedTileIndexCubit>(),
          listener: (context, state) {
            state == widget.index ? null : expansionTileController.collapse();
          },
          child: ExpansionTile(
            maintainState: true,
            onExpansionChanged: (expanded) {
              expanded
                  ? context
                      .read<ExpandedTileIndexCubit>()
                      .setIndex(widget.index)
                  : null;
            },
            controller: expansionTileController,
            iconColor: ColorManager.golden,
            collapsedIconColor: ColorManager.golden,
            tilePadding: EdgeInsets.symmetric(horizontal: AppSizeW.s10),
            title: Text(
                widget.article?.title ?? widget.faqItemModel?.question ?? '',
                style: Theme.of(context).textTheme.titleMedium),
            // Title when the tile is collapsed
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  expansionTileController.collapse();
                },
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(maxHeight: widget.maxExpandedHeight),
                  child: SingleChildScrollView(
                    child: Html(
                      data: widget.article?.content ??
                          widget.faqItemModel?.answer ??
                          '',
                      onLinkTap: (url, attributes, element) {
                        if (url != null && isValidUrl(url)) {
                          launchUrl(Uri.parse(url));
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
