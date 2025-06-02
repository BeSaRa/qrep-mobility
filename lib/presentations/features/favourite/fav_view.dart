import 'dart:async';
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart' as local;
import 'package:ebla/presentations/features/favourite/bloc/get_favourite_bloc/get_favourite_bloc.dart';
import 'package:ebla/presentations/features/favourite/bloc/selected_page_cubit.dart';
import 'package:ebla/presentations/features/more/blocs/user_bloc/user_bloc.dart';
import 'package:ebla/presentations/widgets/taost_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/depndency_injection.dart';
import '../../../domain/models/favourite/favourite_models.dart';
import '../../resources/resources.dart';
import '../../widgets/widgets.dart';
import '../main/blocs/lookup_bloc/lookup_bloc.dart';

import 'fav_sheet_view.dart';
import 'fav_widgets.dart';

class FavView extends StatefulWidget {
  const FavView({super.key});

  @override
  State<FavView> createState() => _FavViewState();
}

class _FavViewState extends State<FavView> {
  TextEditingController searchController = TextEditingController();
  Timer? _debounce;
  List<int> items = List<int>.generate(100, (int index) => index);

  late GetFavouriteBloc favouriteBloc;
  late SelectedPageCubit selectedPageCubit;
  @override
  void initState() {
    // context.read<UserBloc>().user.id
    selectedPageCubit = SelectedPageCubit(-1);
    selectedPageCubit.savePage(indicators.first);
    context.read<LookupBloc>().add(const LookupEvent.initilaEvent());
    context.read<LookupBloc>().add(const LookupEvent.getBrokerLookupEvent());
    favouriteBloc = instance<GetFavouriteBloc>()
      ..add(GetFavouriteEvent.started(context.read<UserBloc>().user?.id ?? ''));
    super.initState();
  }

  List<PagesNames> indicators = [
    PagesNames(-1, "الكل", "ALL"),
    PagesNames(Indicators.broker.index, "الوسطاء", "Brokers"),
    PagesNames(Indicators.sell.index, "مؤشر البيع", "Sell indicator"),
    PagesNames(Indicators.rental.index, "مؤشر الإيجار", "Rental indicator"),
    PagesNames(Indicators.mortgage.index, "مؤشر الرهن", "Mortgage indicator"),
    PagesNames(
        Indicators.ownership.index, "مؤشر الملكيات", "Ownership indicator"),
    PagesNames(Indicators.occupied.index, "مؤشر الشاغل والمشغول",
        "Occupied and vacant indicator"),
    PagesNames(Indicators.general.index, "تقرير الأمانة العامة",
        "General secretariat report"),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LookupBloc, LookupState>(
      builder: (context, state) {
        return state.map(loadingLookup: (val) {
          return const AnimatedPulesLogo();
        }, loadedLookup: (val) {
          return BlocBuilder<GetFavouriteBloc, GetFavouriteState>(
            bloc: favouriteBloc,
            builder: (context, state) {
              return state.map(initial: (val) {
                return Container();
              }, loading: (val) {
                return const AnimatedPulesLogo();
              }, done: (loaded) {
                return Scaffold(
                  appBar: EblaAppBar(
                    title: AppStrings().watchList,
                  ),
                  body: SingleChildScrollView(
                      child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: AppSizeW.s16),
                          Flexible(
                            child: SearchTextFieldWidget(
                              controller: searchController,
                              hint: AppStrings().favName,
                              onChange: (val) {
                                if (_debounce?.isActive ?? false) {
                                  _debounce?.cancel();
                                }
                                _debounce = Timer(
                                    const Duration(milliseconds: 500), () {
                                  favouriteBloc.add(GetFavouriteEvent.filter(
                                      selectedPageCubit.state,
                                      searchController.text));
                                });
                              },
                            ),
                          ),
                          SizedBox(width: AppSizeW.s10),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizeW.s20, vertical: AppSizeH.s14),
                        child: BlocBuilder(
                          bloc: selectedPageCubit,
                          builder: (context, state) {
                            return SingleDropDownValue<PagesNames>(
                              value: selectedPageCubit.page,
                              onChanged: (page) {
                                selectedPageCubit.savePage(page!);
                                favouriteBloc.add(GetFavouriteEvent.filter(
                                    selectedPageCubit.state,
                                    searchController.text));
                              },
                              list: indicators,
                            );
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: AppSizeW.s150, vertical: AppSizeH.s20),
                        height: AppSizeH.s5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSizeR.s5),
                            color: ColorManager.lightSilver),
                      ),
                      if (loaded.response.isEmpty)
                        Text(AppStrings().noDataFound),
                      if (loaded.response.isNotEmpty)
                        Column(
                          children: [
                            Container(
                              // height: MediaQuery.of(context).size.height / 1.4,
                              margin: EdgeInsets.symmetric(
                                  horizontal: AppSizeW.s20),
                              padding: EdgeInsets.symmetric(
                                  vertical: AppSizeH.s10,
                                  horizontal: AppSizeW.s20),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).cardTheme.color,
                                  borderRadius:
                                      BorderRadius.circular(AppSizeR.s10)),
                              child: ListView.builder(
                                // itemCount: items.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: loaded.response.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return FavouriteItemWidget(
                                    name: loaded.response[index].name ?? '',
                                    page: getPageName(
                                        loaded.response[index].pageName),
                                    date: loaded.response[index].creationTime ??
                                        '',
                                    divider:
                                        index != loaded.response.length - 1,
                                    deleteFav: () async {
                                      var res = await showDialog(
                                          context: context,
                                          builder: (BuildContext ctxt) =>
                                              const Dialog(
                                                  child: DeleteItemWidget()));
                                      if (res != null && res == true) {
                                        favouriteBloc.add(
                                            GetFavouriteEvent.delete(
                                                loaded.response[index].id,
                                                context
                                                        .read<UserBloc>()
                                                        .user
                                                        ?.id ??
                                                    ''));
                                      }
                                    },
                                    updateFav: () async {
                                      var res = await showDialog(
                                          context: context,
                                          builder: (BuildContext ctxt) =>
                                              Dialog(
                                                  child: UpdateFavWidget(
                                                name: loaded.response[index],
                                              )));
                                      if (res != null && res == true) {
                                        favouriteBloc.add(
                                            GetFavouriteEvent.reload(context
                                                    .read<UserBloc>()
                                                    .user
                                                    ?.id ??
                                                ''));
                                      }
                                    },
                                    applyFav: () {
                                      Map<String, dynamic> valueMap =
                                          json.decode(
                                              loaded.response[index].criteria!);
                                      CriteriaObject criteriaObject =
                                          CriteriaObject.fromJson(valueMap);
                                      switch (loaded.response[index].pageName) {
                                        case Indicators.broker:
                                          initRealEstateBroker();
                                          Navigator.pop(context, {
                                            "class": 0,
                                            "object": criteriaObject
                                          });
                                        case Indicators.sell:
                                          initSellModule();
                                          Navigator.pop(context, {
                                            "class": 2,
                                            "object": criteriaObject
                                          });

                                        case Indicators.rental:
                                          initRentModule();
                                          Navigator.pop(context, {
                                            "class": 1,
                                            "object": criteriaObject
                                          });
                                        case Indicators.mortgage:
                                          initMortgageModule();
                                          Navigator.pop(context, {
                                            "class": 3,
                                            "object": criteriaObject
                                          });
                                        default:
                                          Navigator.pop(context, {
                                            "class": 1,
                                            "object": criteriaObject
                                          });
                                      }
                                    },
                                    openCard: () async {
                                      if (loaded.response[index].pageName ==
                                              Indicators.ownership ||
                                          loaded.response[index].pageName ==
                                              Indicators.occupied ||
                                          loaded.response[index].pageName ==
                                              Indicators.general) {
                                        errorToast(
                                            AppStrings().mobileAppDonSupport,
                                            context);
                                        //show toast
                                      } else {
                                        var res = await bottomSheetWidget(
                                          context,
                                          child: BottomSheetFavWidget(
                                            criteria: loaded
                                                    .response[index].criteria ??
                                                '',
                                            indicator:
                                                loaded.response[index].pageName,
                                            title:
                                                loaded.response[index].name ??
                                                    '',
                                          ),
                                        );
                                        if (res != null) {
                                          Navigator.pop(context, res);
                                        }
                                      }
                                    },
                                    showApply: getApply(
                                        loaded.response[index].pageName),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                    ],
                  )),
                );
              }, error: (val) {
                return Scaffold(
                  appBar: AppBar(),
                  body: ErrorGlobalWidget(
                    message: AppStrings().somethingWentWrong,
                    onPressed: () {
                      favouriteBloc.add(GetFavouriteEvent.started(
                          context.read<UserBloc>().user?.id ?? ''));
                    },
                  ),
                );
              }, searchLoading: (value) {
                return Scaffold(
                  appBar: EblaAppBar(
                    title: AppStrings().watchList,
                  ),
                  body: SingleChildScrollView(
                      child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: AppSizeW.s16),
                          Flexible(
                            child: SearchTextFieldWidget(
                              controller: searchController,
                              hint: AppStrings().favName,
                              onChange: (val) {
                                if (_debounce?.isActive ?? false) {
                                  _debounce?.cancel();
                                }
                                _debounce = Timer(
                                    const Duration(milliseconds: 500), () {});
                              },
                            ),
                          ),
                          SizedBox(width: AppSizeW.s10),
                        ],
                      ),
                      BlocBuilder(
                        bloc: selectedPageCubit,
                        builder: (context, state) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppSizeW.s20,
                                vertical: AppSizeH.s14),
                            child: SingleDropDownValue<PagesNames>(
                              value: selectedPageCubit.page,
                              onChanged: (page) {
                                selectedPageCubit.save(page?.num ?? -1);
                              },
                              list: indicators,
                            ),
                          );
                        },
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: AppSizeW.s150, vertical: AppSizeH.s20),
                        height: AppSizeH.s5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSizeR.s5),
                            color: ColorManager.lightSilver),
                      ),
                      Column(
                        children: [
                          Container(
                            // height: MediaQuery.of(context).size.height / 1.4,
                            margin:
                                EdgeInsets.symmetric(horizontal: AppSizeW.s20),
                            padding: EdgeInsets.symmetric(
                                vertical: AppSizeH.s10,
                                horizontal: AppSizeW.s20),
                            decoration: BoxDecoration(
                                color: Theme.of(context).cardTheme.color,
                                borderRadius:
                                    BorderRadius.circular(AppSizeR.s10)),
                            child: ListView.builder(
                              // itemCount: items.length,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                return const FavouriteItemShimmer();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
                );
              });
            },
          );
        }, errorLookUp: (val) {
          return Scaffold(
            appBar: AppBar(),
            body: ErrorGlobalWidget(
              message: AppStrings().somethingWentWrong,
              onPressed: () {
                context
                    .read<LookupBloc>()
                    .add(const LookupEvent.getBrokerLookupEvent());
              },
            ),
          );
        });
      },
    );
  }

  bool getApply(Indicators indicator) {
    if (indicator == Indicators.ownership) {
      return false;
    } else if (indicator == Indicators.occupied) {
      return false;
    } else if (indicator == Indicators.general) {
      return false;
    } else {
      return true;
    }
  }

  String getPageName(Indicators page) {
    String name = "";
    indicators.map((e) {
      if (e.num == page.index) {
        name = context.locale == ARABIC_LOCAL ? e.arName : e.enName;
      }
    }).toList();
    return name;
  }
}
