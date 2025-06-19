import 'dart:async';
import 'dart:developer';

import 'package:ebla/domain/models/requests/ai_search_models/ai_search_model.dart';
import 'package:ebla/presentations/features/chatbot/widgets/rera_text_faild.dart';
import 'package:ebla/presentations/features/main/cubit/bottom_nav_cubit.dart';
import 'package:ebla/presentations/features/more/ai_search_view/blocs/ai_search_bloc.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:ebla/presentations/widgets/taost_widget.dart';
import 'package:ebla/presentations/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../chatbot/blocs/record_cubit/voice_cubit.dart';

class AiSearchView extends StatefulWidget {
  const AiSearchView({super.key});

  @override
  State<AiSearchView> createState() => _AiSearchViewState();
}

class _AiSearchViewState extends State<AiSearchView> {
  final ValueNotifier<List<bool>> expandedList =
      ValueNotifier(List.generate(10, (_) => false));
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  Timer? _debounce;
  int currentPage = 1;
  final int pageSize = 10;
  bool _isHasMoreData = true;
  bool isValidUrl(String url) {
    try {
      Uri.tryParse(url);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    expandedList.dispose();
    _searchController.dispose();
    _scrollController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void toggleExpansion(int index) {
    final newList = List<bool>.from(expandedList.value);
    newList[index] = !newList[index];
    expandedList.value = newList;
  }

  void _onSearchChanged(String query) {
    // cancel the previous timer if it's still running
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    // start a new timer
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      if (query.isNotEmpty) {
        //اere the page will always be 1 and the number is 10 because every time we do a search, we return the data as it was and search.
        //--- Clear previous results before making a new search request ----
        currentPage = 1;
        context
            .read<AiSearchBloc>()
            .add(const StartAiSearchEvent.clearResults());
        // _isHasMoreData = true;
        //------------------------------------------------------------------
        await _fetchSearchResults(query, currentPage);
      }
    });
  }

  Future<void> _fetchSearchResults(String query, int page) async {
    final AiSearchRequestModel request = AiSearchRequestModel(
      facet: "",
      pageNumber: page,
      pageSize: pageSize,
      query: query,
      sort: "date",
    );
    context.read<AiSearchBloc>().add(
          StartAiSearchEvent.makeAiSearch(request: request),
        );
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 100 &&
        _isHasMoreData) {
      _fetchSearchResults(_searchController.text, currentPage + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            fit: BoxFit.fill,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.maybePop(context);
                // context.read<BottomNavCubit>().changePage(0);
                // context.goNamed(context.read<BottomNavCubit>().paths[0]);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: ColorManager.cloudyGrey,
                  ),
                  SizedBox(width: AppSizeW.s5),
                  Text(
                    AppStrings().main,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            Text(
              AppStrings().aiSearch,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppSizeW.s15, vertical: AppSizeH.s20),
        child: Column(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  children: [
                    // // Record button
                    // BlocConsumer<VoiceCubit, VoiceState>(
                    //   listener: (context, voiceState) {
                    //     final message = voiceState.text;
                    //     if (!voiceState.isListening && message.isNotEmpty) {
                    //       WidgetsBinding.instance.addPostFrameCallback((_) {
                    //         _searchController.text = message;
                    //         context.read<VoiceCubit>().clearText();
                    //       });
                    //     }
                    //   },
                    //   builder: (context, voiceState) {
                    //     return GestureDetector(
                    //       onTap: () async {
                    //         final can = await Haptics.canVibrate();
                    //         if (!can) return;
                    //         await Haptics.vibrate(HapticsType.heavy);
                    //         if (voiceState.isListening) {
                    //           context.read<VoiceCubit>().stopListening();
                    //         } else {
                    //           context
                    //               .read<VoiceCubit>()
                    //               .checkAndRequestPermissionToStart();
                    //         }
                    //       },
                    //       child: voiceState.isListening
                    //           ? SizedBox(
                    //               height: AppSizeH.s40,
                    //               width: AppSizeH.s40,
                    //               child: Lottie.asset(
                    //                   ImageAssets.chatBotRecordingIndecetor),
                    //             )
                    //           : const Icon(Icons.mic_none),
                    //     );
                    //   },
                    // ),

                    // Text field
                    Expanded(
                      child: ReraTextFaild(
                        controller: _searchController,
                        onChange: _onSearchChanged,
                        hint: AppStrings().searchHere,
                        suffixIcon: Icon(
                          Icons.search_rounded,
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            BlocBuilder<AiSearchBloc, AiSearchState>(builder: (context, state) {
              return Padding(
                padding: EdgeInsets.all(AppSizeW.s10),
                child: Row(
                  children: [
                    // Text(
                    //     context.read<AiSearchBloc>().state.maybeMap(
                    //         done: (value) =>
                    //             "${AppStrings().searchfor}: ${_searchController.text}",
                    //         orElse: () => "${AppStrings().searchfor}: -"),
                    //     style: Theme.of(context).textTheme.titleSmall),
                    // const Spacer(),
                    Text(
                        context.read<AiSearchBloc>().state.maybeMap(
                            done: (value) =>
                                "${AppStrings().numberOfResults}: ${value.previousResults.length} | ${value.response.totalCount}",
                            orElse: () => "${AppStrings().numberOfResults}: 0"),
                        style: Theme.of(context).textTheme.titleSmall),
                  ],
                ),
              );
            }),
            BlocConsumer<AiSearchBloc, AiSearchState>(
                listener: (context, state) {
              state.maybeMap(
                loading: (value) => _isHasMoreData = false,
                done: (value) {
                  final total = value.response.totalCount;
                  final count = value.response.count;
                  final page = value.response.pageNumber;

                  // Avoid division‐by‐zero: if count == 0, treat totalPages as 0
                  final totalPages = (count == 0) ? 0 : (total / count).ceil();

                  _isHasMoreData = page < totalPages;
                  currentPage = page;

                  // Update expandedList to match the totalCount
                  expandedList.value = List.generate(total, (_) => false);
                },
                orElse: () {},
              );
            }, builder: (context, state) {
              return state.map(
                initial: (value) => const _AiSearchInitialUiWidget(),
                loading: (value) {
                  // if (!value.isPagination) {
                  return const Expanded(
                      child: Center(child: CircularProgressIndicator()));
                  // } else {
                  // return const Text("data");
                  // }
                },
                error: (value) => SizedBox(
                  width: AppSizeW.s200,
                  height: AppSizeH.s304,
                  child: Center(
                      child: ErrorGlobalWidget(
                          small: false, message: value.message)),
                ),
                done: (value) {
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: AppSizeH.s20),
                      child: ValueListenableBuilder<List<bool>>(
                          valueListenable: expandedList,
                          builder: (context, expanded, child) {
                            return ListView.builder(
                                controller: _scrollController,
                                itemCount: value.previousResults.length + 1,
                                itemBuilder: (context, index) {
                                  if (index < value.previousResults.length) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Text("${index + 1}"),
                                        GestureDetector(
                                          onLongPress: () {
                                            log("zak ${value.previousResults[index].refUrl}");
                                          },
                                          onTap: () async {
                                            final refUrl = value
                                                .previousResults[index].refUrl;

                                            if (refUrl
                                                .toLowerCase()
                                                .endsWith('.pdf')) {
                                              if (isValidUrl(refUrl)) {
                                                launchUrl(Uri.parse(refUrl));
                                              }
                                            } else {
                                              // Use url_launcher to open the web URL
                                              final uri = Uri.parse(refUrl);
                                              if (await canLaunchUrl(uri)) {
                                                await launchUrl(uri,
                                                    mode: LaunchMode
                                                        .externalApplication);
                                              } else {
                                                if (context.mounted) {
                                                  errorToast(
                                                      'Could not launch URL',
                                                      context);
                                                }
                                              }
                                            }
                                          },
                                          // onTap: () => context.pushNamed(
                                          //   RoutesNames.aboutTheAuthority,
                                          //   pathParameters: {
                                          //     "pageName": "aiSearchUrl"
                                          //   },
                                          //   //Note: here u must put the ref_url which come from back-end
                                          //   queryParameters: {
                                          //     "aiSearchUrl": value.previousResults[index].refUrl
                                          //     // "https://www.aqarat.gov.qa/%d9%83%d9%84%d9%85%d8%a9-%d8%a7%d9%84%d8%b1%d8%a6%d9%8a%d8%b3/"
                                          //   },
                                          // ),
                                          child: Text(
                                            value.previousResults[index].title,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineLarge,
                                          ),
                                        ),
                                        AnimatedCrossFade(
                                          firstChild: Text(
                                            value.previousResults[index].chunk,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          secondChild: Text(
                                            value.previousResults[index].chunk,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium,
                                          ),
                                          crossFadeState: expanded[index]
                                              ? CrossFadeState.showSecond
                                              : CrossFadeState.showFirst,
                                          duration:
                                              const Duration(milliseconds: 300),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              icon: AnimatedRotation(
                                                turns:
                                                    expanded[index] ? 0.5 : 0.0,
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                child: const Icon(
                                                    Icons.keyboard_arrow_down),
                                              ),
                                              onPressed: () {
                                                toggleExpansion(index);
                                              },
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          thickness: 2,
                                          height: AppSizeH.s30,
                                        ),
                                      ],
                                    );
                                  } else {
                                    return _isHasMoreData
                                        ? Padding(
                                            padding:
                                                EdgeInsets.all(AppSizeW.s10),
                                            child: const Center(
                                                child:
                                                    CircularProgressIndicator()),
                                          )
                                        : const SizedBox.shrink();
                                  }
                                });
                          }),
                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
      // body: Text("data"),
    );
  }
}

class _AiSearchInitialUiWidget extends StatelessWidget {
  const _AiSearchInitialUiWidget();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Opacity(
        opacity: .6,
        child: Column(
          spacing: AppSizeH.s20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage(ImageAssets.logoPng),
              width: AppSizeW.s250,
              height: AppSizeH.s250,
            ),
            Text(
              AppStrings().empowerIdeasAndUnleashIntelligence,
              style: Theme.of(context).textTheme.titleLarge,
            ),

            // Text(
            //   AppStrings().startSearching,
            //   style: Theme.of(context).textTheme.titleSmall,
            // )
          ],
        ),
      ),
    );
  }
}
