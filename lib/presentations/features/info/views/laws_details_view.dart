// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ebla/app/constants.dart';
import 'package:ebla/domain/models/cms_models/faq/faq_model.dart';
import 'package:ebla/presentations/features/info/blocs/laws_bloc/laws_bloc.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:ebla/presentations/widgets/animated_pulse_logo.dart';
import 'package:ebla/presentations/widgets/error_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ebla/domain/models/cms_models/laws/laws_model.dart';

import 'package:url_launcher/url_launcher.dart';

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

  @override
  Widget build(BuildContext context) {
    lawsModel = context.read<LawsBloc>().getLawModelById(widget.id);
    print("lawModel: ${lawsModel.id}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        flexibleSpace: Container(
          height: AppSizeH.s50,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageAssets.appbarBg),
              fit: BoxFit.cover,
            ),
          ),
        ),
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
              SizedBox(height: AppSizeH.s40),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      bottom: AppSizeH
                          .s1, // This can be the space you need between text and underline
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: ColorManager.golden,
                          width: AppSizeSp
                              .s2, // This would be the width of the underline
                        ),
                      ),
                    ),
                    child: Text(
                      '${AppStrings().lawDetails}:',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizeH.s20),
              Row(children: [
                Flexible(
                  child: Container(
                    color: ColorManager.whiteSmoke,
                    padding: EdgeInsets.all(AppSizeH.s25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lawsModel.title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          '${AppStrings().issueDate}${DateTime.tryParse(lawsModel.issueDate)?.year}',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        SizedBox(width: AppSizeW.s10),
                        Text(
                          '${AppStrings().lawNumber}${lawsModel.lawNumber}',
                          style: Theme.of(context).textTheme.labelSmall,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: AppSizeW.s20),
                SizedBox(
                  width: AppSizeW.s70,
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        height: AppSizeH.s70,
                        color: ColorManager.primary,
                        IconAssets.lawItem,
                      ),
                      SizedBox(height: AppSizeH.s5),
                      GestureDetector(
                        onTap: () {
                          String fileUrl = getFileUrl(lawsModel.file);
                          if (isValidUrl(fileUrl)) {
                            launchUrl(Uri.parse(fileUrl));
                          }
                        },
                        child: Container(
                          height: AppSizeH.s25,
                          decoration: BoxDecoration(
                              color: ColorManager.primary,
                              borderRadius: BorderRadius.circular(AppSizeR.s5)),
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSizeW.s5, vertical: AppSizeH.s1),
                          child: FittedBox(
                            child: Text(
                              textAlign: TextAlign.center,
                              AppStrings().downloadFile,
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
              SizedBox(height: AppSizeH.s30),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: lawsModel.articles.length,
                itemBuilder: (context, index) {
                  return LawArticleWidget(
                    faqItemModel: null,
                    article: lawsModel.articles[index],
                    maxExpandedHeight: AppSizeH.s250,
                  );
                },
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
  const LawArticleWidget({
    Key? key,
    required this.article,
    required this.faqItemModel,
    required this.maxExpandedHeight,
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
        // this removes the border when ExpansionTile is expanded
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizeR.s8),
              color: ColorManager.white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(1, 1),
                  spreadRadius: AppSizeR.s2,
                  blurRadius: AppSizeR.s11,
                  color: ColorManager.black.withAlpha(6),
                ),
              ]),
          child: ExpansionTile(
            maintainState: true,
            controller: expansionTileController,
            iconColor: ColorManager.black,
            collapsedIconColor: ColorManager.black,
            tilePadding: EdgeInsets.symmetric(horizontal: AppSizeW.s30),
            childrenPadding: EdgeInsets.only(
                left: AppSizeW.s30, right: AppSizeW.s30, bottom: AppSizeH.s10),
            title: Text(
                widget.article?.title ?? widget.faqItemModel?.question ?? '',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium), // Title when the tile is collapsed
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
