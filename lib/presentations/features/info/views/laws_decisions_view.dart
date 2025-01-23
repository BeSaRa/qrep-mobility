import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/domain/models/cms_models/laws/laws_model.dart';
import 'package:ebla/presentations/features/info/blocs/laws_bloc/laws_bloc.dart';
import 'package:ebla/presentations/widgets/animated_pulse_logo.dart';
import 'package:ebla/presentations/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../resources/resources.dart';
import '../../home/home_view.dart';

class LawsDecisionsView extends StatefulWidget {
  const LawsDecisionsView({super.key});

  @override
  State<LawsDecisionsView> createState() => _LawsDecisionsViewState();
}

class _LawsDecisionsViewState extends State<LawsDecisionsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<LawsBloc, LawsState>(
            bloc: context.read<LawsBloc>(),
            builder: (context, state) {
              if (state.isLoading) {
                return const AnimatedPulesLogo();
              } else if (state.hasError) {
                return ErrorGlobalWidget(
                  onPressed: () {
                    context.read<LawsBloc>().add(const LawsEvent.getLaws());
                  },
                );
              } else if (state.lawsResponse.isNotEmpty) {
                // } else if (state.lawsResponse.data.isNotEmpty) {
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
                      AppStrings().lawsAndDecisions,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    centerTitle: true,
                  ),
                  body: RefreshIndicator(
                    onRefresh: () async {
                      context.read<LawsBloc>().add(const LawsEvent.getLaws());
                    },
                    child: ListView(
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
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSizeW.s15, vertical: AppSizeH.s10),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.lawsResponse.length,
                            // itemCount: state.lawsResponse.data.length,
                            itemBuilder: (context, index) {
                              final law = state.lawsResponse[index];

                              // Check if the current law matches the app language
                              final isArabic = context.locale ==
                                  ARABIC_LOCAL; // Example: Using localization
                              final isLawInArabic = RegExp(r'[\u0600-\u06FF]')
                                  .hasMatch(law.title);
                              // Show the item only if it matches the app's language
                              if ((isArabic && isLawInArabic) ||
                                  (!isArabic && !isLawInArabic)) {
                                return LawWidget(
                                  law: law,
                                );
                              }

                              // Return an empty container for items that don't match the condition
                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state.lawsResponse.isEmpty) {}
              // } else if (state.lawsResponse.data.isEmpty) {}
              return Container();
            }));
  }
}

class LawWidget extends StatefulWidget {
  final LawsModel law;

  const LawWidget({
    super.key,
    required this.law,
  });

  @override
  State<LawWidget> createState() => _LawWidgetState();
}

class _LawWidgetState extends State<LawWidget> {
  bool isValidUrl(String url) {
    try {
      Uri.tryParse(url);
      return true;
    } catch (e) {
      return false;
    }
  }

  // String getFileUrl(String assetId) {
  //   return "${Constant.cmsBaseUrl}/assets/$assetId";
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizeH.s8),
      child: InkWell(
        splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
        splashColor: ColorManager.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSizeR.s20),
        onTap: () {
          // context.pushNamed(RoutesNames.lawsDetails,
          //     pathParameters: {'id': widget.law.id.toString()});
        },
        child: Ink(
          height: widget.law.title.length > 200 ? AppSizeH.s130 : AppSizeH.s110,
          decoration: BoxDecoration(
              color: ColorManager.lightSilver.withOpacity(0.3),
              borderRadius: BorderRadius.circular(AppSizeR.s20),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(1, 1),
                  spreadRadius: AppSizeR.s2,
                  blurRadius: AppSizeR.s11,
                  color: ColorManager.textBlack.withAlpha(6),
                )
              ]),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizeW.s15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: AppSizeH.s20),
                    padding: EdgeInsets.symmetric(horizontal: AppSizeW.s8),
                    child: FittedBox(
                      child: Icon(
                        Icons.gavel,
                        color: ColorManager.textBlack,
                      ),
                    )),
                SizedBox(width: AppSizeW.s10),
                Flexible(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSizeH.s10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            widget.law.title,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        Divider(
                          color: ColorManager.lightSilver,
                          endIndent: AppSizeW.s37,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                widget.law.categories[0],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                // '${AppStrings().issueDate}${DateTime.tryParse(widget.law.issueDate)?.year}',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.symmetric(horizontal: AppSizeW.s5),
                              height: AppSizeH.s16,
                              width: AppSizeW.s2,
                              color: ColorManager.lightSilver,
                            ),
                            Text(
                              widget.law.date,
                              // '${DateFormat('MMM d, y').format(DateTime.parse('${widget.law.date}'))}',
                              style: Theme.of(context).textTheme.labelSmall,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: AppSizeW.s10),
                Flexible(
                  flex: 1,
                  child: Tooltip(
                    message: AppStrings().downloadFile,
                    child: GestureDetector(
                      onTap: () {
                        String fileUrl = widget.law.pdf;
                        // String fileUrl = getFileUrl(widget.law.pdf);
                        if (isValidUrl(fileUrl)) {
                          launchUrl(Uri.parse(fileUrl));
                        }
                      },
                      child: Container(
                          height: AppSizeH.s35,
                          margin: EdgeInsets.symmetric(vertical: AppSizeH.s20),
                          padding:
                              EdgeInsets.symmetric(horizontal: AppSizeW.s8),
                          decoration: BoxDecoration(
                              color: ColorManager.golden,
                              borderRadius:
                                  BorderRadius.circular(AppSizeH.s10)),
                          child: SvgPicture.asset(
                            IconAssets.cloudDownload,
                            // todo: change this with the correct theme color
                            color: ColorManager.white,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
