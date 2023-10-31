import 'package:ebla/app/constants.dart';

import 'package:ebla/domain/models/cms_models/laws/laws_model.dart';
import 'package:ebla/presentations/features/info/blocs/laws_bloc/laws_bloc.dart';
import 'package:ebla/presentations/widgets/animated_pulse_logo.dart';
import 'package:ebla/presentations/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../resources/resources.dart';

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
              } else if (state.lawsResponse.data.isNotEmpty) {
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
                      AppStrings().lawsAndDecisions,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    centerTitle: true,
                  ),
                  body: RefreshIndicator(
                    onRefresh: () async {
                      context.read<LawsBloc>().add(const LawsEvent.getLaws());
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSizeW.s15, vertical: AppSizeH.s10),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.lawsResponse.data.length,
                        itemBuilder: (context, index) {
                          return LawWidget(
                            law: state.lawsResponse.data[index],
                          );
                        },
                      ),
                    ),
                  ),
                );
              } else if (state.lawsResponse.data.isEmpty) {}
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

  String getFileUrl(String assetId) {
    return "${Constant.secondaryBaseUrl}/assets/$assetId";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizeH.s4),
      child: InkWell(
        splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
        splashColor: ColorManager.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSizeR.s20),
        onTap: () {
          context.pushNamed(RoutesNames.lawsDetails,
              pathParameters: {'id': widget.law.id.toString()});
        },
        child: Ink(
          height: AppSizeH.s110,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: AppSizeW.s2,
                color: ColorManager.grey,
              ),
              borderRadius: BorderRadius.circular(AppSizeR.s20),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(1, 1),
                  spreadRadius: AppSizeR.s2,
                  blurRadius: AppSizeR.s11,
                  color: ColorManager.black.withAlpha(6),
                )
              ]),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppSizeW.s15, vertical: AppSizeH.s10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: SvgPicture.asset(
                    IconAssets.lawItem,
                    color: ColorManager.primary,
                    height: AppSizeH.s80,
                    width: AppSizeW.s80,
                  ),
                ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '${AppStrings().issueDate}${DateTime.tryParse(widget.law.issueDate)?.year}',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            SizedBox(width: AppSizeW.s10),
                            Text(
                              '${AppStrings().lawNumber}${widget.law.lawNumber}',
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
                        String fileUrl = getFileUrl(widget.law.file);
                        if (isValidUrl(fileUrl)) {
                          launchUrl(Uri.parse(fileUrl));
                        }
                      },
                      child: Container(
                          height: double.infinity,
                          margin: EdgeInsets.symmetric(vertical: AppSizeH.s20),
                          padding:
                              EdgeInsets.symmetric(horizontal: AppSizeW.s8),
                          decoration: BoxDecoration(
                              color: ColorManager.primary,
                              borderRadius: BorderRadius.circular(AppSizeH.s4)),
                          child: FittedBox(
                            child: Icon(
                              Icons.cloud_download,
                              // todo: change this with the correct theme color
                              color: ColorManager.white,
                            ),
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
