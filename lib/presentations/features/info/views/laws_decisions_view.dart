import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/domain/models/cms_models/laws/laws_model.dart';
import 'package:ebla/presentations/features/chatbot/widgets/rera_text_faild.dart';
import 'package:ebla/presentations/features/info/blocs/laws_bloc/laws_bloc.dart';
import 'package:ebla/presentations/widgets/animated_pulse_logo.dart';
import 'package:ebla/presentations/widgets/error_widget.dart';
import 'package:ebla/presentations/widgets/taost_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../resources/resources.dart';

class LawsDecisionsView extends StatefulWidget {
  const LawsDecisionsView({super.key});

  @override
  State<LawsDecisionsView> createState() => _LawsDecisionsViewState();
}

class _LawsDecisionsViewState extends State<LawsDecisionsView> {
  final ValueNotifier<List<String>> selectedCategoriesNotifier =
      ValueNotifier<List<String>>([]);
  List<String> menuItems = [
    "الأدلة",
    "الاتفاقيات",
    "القرارات واللوائح",
    "القوانين",
    "تعاميم",
    "Agreements",
    "Circulars",
    "Decisions and Regulations",
    "Evidence",
    "Laws"
  ];
  final TextEditingController searchController = TextEditingController();
  final ValueNotifier<String> searchTermNotifier = ValueNotifier('');

  @override
  void initState() {
    super.initState();
    // Set all items as selected by default
    selectedCategoriesNotifier.value = List.from(menuItems);
  }

  void _toggleCategory(String category) {
    final newCategories = List<String>.from(selectedCategoriesNotifier.value);
    if (newCategories.contains(category)) {
      newCategories.remove(category);
    } else {
      newCategories.add(category);
    }
    selectedCategoriesNotifier.value = newCategories;
  }

  @override
  void dispose() {
    selectedCategoriesNotifier.dispose();
    super.dispose();
  }

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
              message: state.errorMessage,
              onPressed: () {
                context.read<LawsBloc>().add(const LawsEvent.getLaws());
              },
            );
          } else if (state.lawsResponse.isNotEmpty) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
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
                backgroundColor: Theme.of(context).brightness == Brightness.dark
                    ? ColorManager.blackBG
                    : ColorManager.white,
                surfaceTintColor: Colors.transparent,
                title: Row(
                  // textDirection: ui.TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.maybePop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: ColorManager.cloudyGrey,
                          ),
                          // SizedBox(width: AppSizeW.s5),
                          // Text(
                          //   AppStrings().main,
                          //   style: Theme.of(context).textTheme.headlineMedium,
                          // ),
                        ],
                      ),
                    ),
                    Text(
                      AppStrings().laws,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    GestureDetector(
                      onTapDown: (details) async {
                        final selected = await showMenu(
                          context: context,
                          position: RelativeRect.fromLTRB(
                              0, AppSizeH.s70, AppSizeW.s20, 0),
                          color: Colors.transparent,
                          elevation: 0,
                          items: [
                            PopupMenuItem(
                              enabled: false,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? ColorManager.greyBg
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 8,
                                      offset: const Offset(0, 0),
                                    ),
                                  ],
                                ),
                                child: StatefulBuilder(
                                  builder: (context, setState) {
                                    return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(height: AppSizeH.s10),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              AppStrings().allCategories,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            ),
                                          ),
                                          Divider(
                                            endIndent: AppSizeW.s20,
                                            indent: AppSizeW.s20,
                                          ),
                                          ...menuItems.map((category) {
                                            final isArabic =
                                                context.locale == ARABIC_LOCAL;
                                            final isLawInArabic =
                                                RegExp(r'[\u0600-\u06FF]')
                                                    .hasMatch(category);

                                            final show = (isArabic &&
                                                    isLawInArabic) ||
                                                (!isArabic && !isLawInArabic);

                                            if (!show) {
                                              return const SizedBox.shrink();
                                            }

                                            return InkWell(
                                              onTap: () {
                                                _toggleCategory(category);
                                                setState(
                                                    () {}); // Rebuild just the popup content
                                              },
                                              child: Row(
                                                children: [
                                                  Checkbox(
                                                    value:
                                                        selectedCategoriesNotifier
                                                            .value
                                                            .contains(category),
                                                    onChanged: (_) {
                                                      _toggleCategory(category);
                                                      setState(() {});
                                                    },
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelSmall,
                                                      category,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }).toList(),
                                        ]);
                                  },
                                ),
                              ),
                            )
                          ],
                        );
                      },
                      child: const Icon(
                        Icons.more_vert,
                        // color: ColorManager.primary,
                      ),
                    ),
                  ],
                ),
              ),
              body: RefreshIndicator(
                onRefresh: () async {
                  context.read<LawsBloc>().add(const LawsEvent.getLaws());
                },
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: AppSizeW.s20,
                          right: AppSizeW.s20,
                          top: AppSizeH.s20),
                      child: ReraTextFaild(
                        hint: "${AppStrings().search}...",
                        controller: searchController,
                        onChange: (value) {
                          searchTermNotifier.value = value.trim().toLowerCase();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSizeW.s15, vertical: AppSizeH.s10),
                      child: ValueListenableBuilder<String>(
                          valueListenable: searchTermNotifier,
                          builder: (context, searchTerm, _) {
                            return ValueListenableBuilder<List<String>>(
                              valueListenable: selectedCategoriesNotifier,
                              builder: (context, selectedCategories, _) {
                                final isArabic = context.locale == ARABIC_LOCAL;

                                // Filter laws based on language and selected categories
                                final filteredLaws =
                                    state.lawsResponse.where((law) {
                                  final isLawInArabic =
                                      RegExp(r'[\u0600-\u06FF]')
                                          .hasMatch(law.title);

                                  final languageMatch =
                                      (isArabic && isLawInArabic) ||
                                          (!isArabic && !isLawInArabic);

                                  final categoryMatch =
                                      selectedCategories.isEmpty ||
                                          law.categories.any((cat) =>
                                              selectedCategories.contains(cat));

                                  final titleMatch = law.title
                                      .toLowerCase()
                                      .contains(searchTerm);
                                  return languageMatch &&
                                      categoryMatch &&
                                      titleMatch;
                                }).toList();

                                if (filteredLaws.isEmpty) {
                                  return Center(
                                    child: Text(
                                      AppStrings().noResultFounded,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  );
                                }

                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: filteredLaws.length,
                                  itemBuilder: (context, index) {
                                    return LawWidget(law: filteredLaws[index]);
                                  },
                                );
                              },
                            );
                          }),
                    ),
                  ],
                ),
              ),
            );
          } else if (state.lawsResponse.isEmpty) {
            return Container();
          }
          return Container();
        },
      ),
    );
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizeH.s8),
      child: InkWell(
        splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
        splashColor: ColorManager.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSizeR.s20),
        // onTap: () {
        //   // context.pushNamed(RoutesNames.lawsDetails,
        //   //     pathParameters: {'id': widget.law.id.toString()});
        //   String fileUrl = widget.law.pdf;
        //   if (isValidUrl(fileUrl)) {
        //     launchUrl(Uri.parse(fileUrl));
        //   }
        // },
        onTap: () {
          String fileUrl = widget.law.pdf;

          if (!isValidUrl(fileUrl)) {
            errorToast("Invalid file URL", context);
            return;
          }

          if (!fileUrl.toLowerCase().endsWith('.pdf')) {
            errorToast("File type not supported", context);
            return;
          }

          launchUrl(Uri.parse(fileUrl));
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
                            maxLines: 2,
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
                    child: Container(
                        height: AppSizeH.s35,
                        margin: EdgeInsets.symmetric(vertical: AppSizeH.s20),
                        padding: EdgeInsets.symmetric(horizontal: AppSizeW.s8),
                        decoration: BoxDecoration(
                            color: ColorManager.golden,
                            borderRadius: BorderRadius.circular(AppSizeH.s10)),
                        child: SvgPicture.asset(
                          IconAssets.cloudDownload,
                          color: ColorManager.white,
                        )),
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
