import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/app/extensions.dart';
import 'package:ebla/presentations/features/favourite/bloc/get_favourite_bloc/get_favourite_bloc.dart';
import 'package:ebla/presentations/features/favourite/bloc/selected_page_cubit.dart';
import 'package:ebla/presentations/features/more/blocs/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/depndency_injection.dart';
import '../../../domain/models/favourite/favourite_models.dart';
import '../../resources/resources.dart';
import '../../widgets/shimmer_placeholder.dart';
import '../../widgets/widgets.dart';

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
    favouriteBloc = instance<GetFavouriteBloc>()
      ..add(GetFavouriteEvent.started(context.read<UserBloc>().user?.id ?? ''));
    // context.read<UserBloc>().user.id
    selectedPageCubit = SelectedPageCubit(-1);
    selectedPageCubit.savePage(indicators.first);
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
                          if (_debounce?.isActive ?? false) _debounce?.cancel();
                          _debounce =
                              Timer(const Duration(milliseconds: 500), () {
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
                              selectedPageCubit.state, searchController.text));
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
                if (loaded.response.isEmpty) Text(AppStrings().noDataFound),
                if (loaded.response.isNotEmpty)
                  Column(
                    children: [
                      Container(
                        // height: MediaQuery.of(context).size.height / 1.4,
                        margin: EdgeInsets.symmetric(horizontal: AppSizeW.s20),
                        padding: EdgeInsets.symmetric(
                            vertical: AppSizeH.s10, horizontal: AppSizeW.s20),
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardTheme.color,
                            borderRadius: BorderRadius.circular(AppSizeR.s10)),
                        child: ListView.builder(
                          // itemCount: items.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: loaded.response.length,
                          itemBuilder: (BuildContext context, int index) {
                            return FavouriteItemWidget(
                              name: loaded.response[index].name ?? '',
                              page: getPageName(loaded.response[index].pageName
                                  as Indicators),
                              date:
                                  loaded.response[index].lastModifiedTime ?? '',
                              divider: index != loaded.response.length - 1,
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
          return ErrorGlobalWidget(
            message: "Error",
            onPressed: () {
              favouriteBloc.add(GetFavouriteEvent.started(
                  context.read<UserBloc>().user?.id ?? ''));
            },
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
                          if (_debounce?.isActive ?? false) _debounce?.cancel();
                          _debounce =
                              Timer(const Duration(milliseconds: 500), () {});
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
                          horizontal: AppSizeW.s20, vertical: AppSizeH.s14),
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
                      margin: EdgeInsets.symmetric(horizontal: AppSizeW.s20),
                      padding: EdgeInsets.symmetric(
                          vertical: AppSizeH.s10, horizontal: AppSizeW.s20),
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardTheme.color,
                          borderRadius: BorderRadius.circular(AppSizeR.s10)),
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

class FavouriteItemWidget extends StatelessWidget {
  final String name;
  final String page;
  final String date;
  final bool divider;
  const FavouriteItemWidget({
    super.key,
    required this.name,
    required this.page,
    required this.date,
    this.divider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(vertical: AppSizeH.s5, horizontal: AppSizeR.s8),
      padding: EdgeInsets.symmetric(vertical: AppSizeH.s10),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(AppSizeR.s10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontSize: AppSizeSp.s18),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              AppStrings().page + ": ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontSize: AppSizeSp.s14,
                                      fontWeight: FontWeight.w700),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              page,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontSize: AppSizeSp.s14),
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      DateTime.parse(date ?? '').toFormattedString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: AppSizeSp.s14),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.9,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // _callNumber(phone);
                      },
                      child: Container(
                        width: AppSizeW.s42,
                        decoration: BoxDecoration(
                            color: ColorManager.golden,
                            borderRadius: BorderRadius.circular(AppSizeR.s8)),
                        padding: EdgeInsets.all(AppSizeH.s3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.edit,
                              color: ColorManager.white,
                              size: AppSizeH.s24,
                            ),
                            SizedBox(
                              width: AppSizeW.s5,
                            ),
                            Text(
                              AppStrings().edit,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontSize: AppSizeSp.s12,
                                      color: ColorManager.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // sendEmail(email);
                      },
                      child: Container(
                        width: AppSizeW.s42,
                        decoration: BoxDecoration(
                            color: ColorManager.golden,
                            borderRadius: BorderRadius.circular(AppSizeR.s8)),
                        padding: EdgeInsets.all(AppSizeH.s3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.delete,
                              color: ColorManager.white,
                              size: AppSizeH.s24,
                            ),
                            SizedBox(
                              width: AppSizeW.s5,
                            ),
                            Text(
                              AppStrings().delete,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontSize: AppSizeSp.s12,
                                      color: ColorManager.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        // openMap();
                      },
                      child: Container(
                        width: AppSizeW.s42,
                        decoration: BoxDecoration(
                            color: ColorManager.golden,
                            borderRadius: BorderRadius.circular(AppSizeR.s8)),
                        padding: EdgeInsets.all(AppSizeH.s3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.bolt,
                              color: ColorManager.white,
                              size: AppSizeH.s24,
                            ),
                            SizedBox(
                              width: AppSizeW.s5,
                            ),
                            Text(
                              AppStrings().apply,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontSize: AppSizeSp.s12,
                                      color: ColorManager.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (divider)
            Padding(
              padding: EdgeInsets.only(top: AppSizeH.s10),
              child: Center(
                child: Divider(
                  color: ColorManager.lightSilver,
                  endIndent: AppSizeW.s15,
                  indent: AppSizeW.s15,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class FavouriteItemShimmer extends StatelessWidget {
  const FavouriteItemShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(vertical: AppSizeH.s5, horizontal: AppSizeR.s10),
      padding: EdgeInsets.symmetric(vertical: AppSizeH.s10),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(AppSizeR.s10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: AppSizeW.s140,
                      height: AppSizeH.s50,
                      child: ShimmerPlaceholder(
                        child: Container(
                          decoration: BoxDecoration(
                              color: ColorManager.white,
                              borderRadius:
                                  BorderRadius.circular(AppSizeR.s12)),
                        ),
                      )),
                  Row(
                    children: [
                      Text(
                        AppStrings().page,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: AppSizeSp.s14,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: AppSizeW.s5,
                      ),
                      ShimmerPlaceholder(
                        child: Container(
                          width: AppSizeW.s76,
                          // width: double.infinity,
                          height: AppSizeH.s15,
                          decoration: BoxDecoration(
                              color: ColorManager.white,
                              borderRadius:
                                  BorderRadius.circular(AppSizeR.s12)),
                        ),
                      )
                    ],
                  ),
                  ShimmerPlaceholder(
                    child: Container(
                      width: AppSizeW.s76,
                      // width: double.infinity,
                      height: AppSizeH.s15,
                      decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.circular(AppSizeR.s12)),
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      // _callNumber(phone);
                    },
                    child: Container(
                      width: AppSizeW.s42,
                      decoration: BoxDecoration(
                          color: ColorManager.golden,
                          borderRadius: BorderRadius.circular(AppSizeR.s8)),
                      padding: EdgeInsets.all(AppSizeH.s3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.edit,
                            color: ColorManager.white,
                            size: AppSizeH.s24,
                          ),
                          SizedBox(
                            width: AppSizeW.s5,
                          ),
                          Text(
                            AppStrings().edit,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontSize: AppSizeSp.s12,
                                    color: ColorManager.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    // height: AppSizeH.s10,
                    width: AppSizeH.s10,
                  ),
                  GestureDetector(
                    onTap: () {
                      // sendEmail(email);
                    },
                    child: Container(
                      width: AppSizeW.s42,
                      decoration: BoxDecoration(
                          color: ColorManager.golden,
                          borderRadius: BorderRadius.circular(AppSizeR.s8)),
                      padding: EdgeInsets.all(AppSizeH.s3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.delete,
                            color: ColorManager.white,
                            size: AppSizeH.s24,
                          ),
                          SizedBox(
                            width: AppSizeW.s5,
                          ),
                          Text(
                            AppStrings().delete,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontSize: AppSizeSp.s12,
                                    color: ColorManager.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    // height: AppSizeH.s10,
                    width: AppSizeH.s10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      // openMap();
                    },
                    child: Container(
                      width: AppSizeW.s42,
                      decoration: BoxDecoration(
                          color: ColorManager.golden,
                          borderRadius: BorderRadius.circular(AppSizeR.s8)),
                      padding: EdgeInsets.all(AppSizeH.s3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.bolt,
                            color: ColorManager.white,
                            size: AppSizeH.s24,
                          ),
                          SizedBox(
                            width: AppSizeW.s5,
                          ),
                          Text(
                            AppStrings().apply,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontSize: AppSizeSp.s12,
                                    color: ColorManager.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // if (divider)
          Padding(
            padding: EdgeInsets.only(top: AppSizeH.s10),
            child: Center(
              child: Divider(
                color: ColorManager.lightSilver,
                endIndent: AppSizeW.s15,
                indent: AppSizeW.s15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PagesNames {
  String arName;
  String enName;
  int num;
  PagesNames(this.num, this.arName, this.enName);
}

extension IndicatorsTypeNumber on Indicators {
  int get number {
    switch (this) {
      case Indicators.broker:
        return 1;
      case Indicators.sell:
        return 2;
      case Indicators.rental:
        return 3;
      case Indicators.mortgage:
        return 4;
      case Indicators.general:
        return 5;
      case Indicators.occupied:
        return 6;
      case Indicators.ownership:
        return 7;
    }
  }
}
