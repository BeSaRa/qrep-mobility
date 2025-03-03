import 'dart:async';

import 'package:ebla/domain/models/requests/ai_search_models/ai_search_model.dart';
import 'package:ebla/presentations/features/chatbot/widgets/rera_text_faild.dart';
import 'package:ebla/presentations/features/more/ai_search_view/blocs/ai_search_bloc.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/routes_manager.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:ebla/presentations/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
    print("Fetching page: $page");
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
            ReraTextFaild(
              controller: _searchController,
              onChange: (p0) {
                _onSearchChanged(p0);
              },
              hint: AppStrings().searchHere,
              suffixIcon: Icon(
                Icons.search_rounded,
                color: Theme.of(context).cardColor,
              ),
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
                  _isHasMoreData = value.response.pageNumber <
                      (value.response.totalCount / value.response.count).ceil();
                  currentPage = value.response.pageNumber;
                  // Update expandedList to match the total count from the response
                  expandedList.value =
                      List.generate(value.response.totalCount, (_) => false);
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
                error: (value) => Center(
                    child:
                        ErrorGlobalWidget(small: true, message: value.message)),
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
                                          onTap: () => context.pushNamed(
                                            RoutesNames.aboutTheAuthority,
                                            pathParameters: {
                                              "pageName": "aiSearchUrl"
                                            },
                                            //Note: here u must put the ref_url which come from back-end
                                            queryParameters: {
                                              "aiSearchUrl": value
                                                  .previousResults[index].refUrl
                                              // "https://www.aqarat.gov.qa/%d9%83%d9%84%d9%85%d8%a9-%d8%a7%d9%84%d8%b1%d8%a6%d9%8a%d8%b3/"
                                            },
                                          ),
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
