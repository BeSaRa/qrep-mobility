import 'package:ebla/presentations/features/info/blocs/faq/faq_bloc.dart';
import 'package:ebla/presentations/features/info/cubits/expanded_tile_index_cubit/expanded_tile_index_cubit.dart';
import 'package:ebla/domain/models/cms_models/faq/faq_model.dart';
import 'package:ebla/domain/models/cms_models/laws/laws_model.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ebla/presentations/widgets/animated_pulse_logo.dart';
import 'package:ebla/presentations/widgets/error_widget.dart';
import 'package:flutter_svg/svg.dart';

class FAQView extends StatefulWidget {
  const FAQView({super.key});

  @override
  State<FAQView> createState() => _FAQViewState();
}

class _FAQViewState extends State<FAQView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FaqBloc, FaqState>(
        bloc: context.read<FaqBloc>(),
        builder: (context, state) {
          if (state.isLoading) {
            return const AnimatedPulesLogo();
          } else if (state.hasError) {
            return Scaffold(
              appBar: AppBar(
                surfaceTintColor: Colors.transparent,
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageAssets.appbarBg),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                leading: BackButton(
                  color: ColorManager.golden,
                ),
                title: Text(
                  AppStrings().faqs,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                centerTitle: true,
              ),
              body: ErrorGlobalWidget(
                onPressed: () {
                  context.read<FaqBloc>().add(const FaqEvent.getFaq());
                },
              ),
            );
          }
          if (state.faqResponse.data.isNotEmpty) {
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
                    ).createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.height));
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
                  AppStrings().faqs,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                centerTitle: true,
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizeW.s30,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: AppSizeH.s46),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: AppSizeW.s100),
                        child: Center(
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: AppSizeH.s26,
                                  horizontal: AppSizeW.s35),
                              decoration: BoxDecoration(
                                  color: ColorManager.white,
                                  border: Border.all(
                                      width: 1,
                                      color: ColorManager.lightSilver),
                                  borderRadius:
                                      BorderRadius.circular(AppSizeR.s15)),
                              child: SvgPicture.asset(
                                IconAssets.faqHome,
                              )),
                        ),
                      ),
                      SizedBox(height: AppSizeH.s56),
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
                          itemCount: state.faqResponse.data.length,
                          itemBuilder: (context, index) {
                            return LawArticleWidget(
                              faqItemModel: state.faqResponse.data[index],
                              article: null,
                              maxExpandedHeight: AppSizeH.s250,
                              index: index,
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
          } else if (state.faqResponse.data.isEmpty) {
            return Center(
              child: Text(
                AppStrings().noDataFound,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          }
          return Container();
        },
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

