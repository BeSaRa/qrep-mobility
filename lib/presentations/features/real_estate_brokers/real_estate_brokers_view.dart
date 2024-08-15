import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/domain/models/favourite/favourite_models.dart';
import 'package:ebla/presentations/features/real_estate_brokers/real_estates.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../app/depndency_injection.dart';
import '../../../utils/global_functions.dart';
import '../../resources/resources.dart';
import '../../widgets/shimmer_placeholder.dart';
import '../../widgets/widgets.dart';
import '../rent/blocs/cubits/change_status_cubit.dart';

class RealEstateBrokersView extends StatefulWidget {
  const RealEstateBrokersView({super.key});

  @override
  State<RealEstateBrokersView> createState() => _RealEstateBrokersViewState();
}

class _RealEstateBrokersViewState extends State<RealEstateBrokersView> {
  late ChangeStatusCubit changeStatusCubit;
  late BrokersCountBloc brokersCountBloc;
  late BrokerTransactionBloc brokerTransactionBloc;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    FirebaseAnalytics.instance.logEvent(name: 'open_brokers_view');
    changeStatusCubit = ChangeStatusCubit();
    brokersCountBloc = instance<BrokersCountBloc>()
      ..add(BrokersCountEvent.started(
          request: context.read<LookUpBrokerBloc>().requestBroker));
    brokerTransactionBloc = instance<BrokerTransactionBloc>();
  }

  late CriteriaObject criteriaObject;
  getCriteria() {
    if (GoRouterState.of(context).extra != null) {
      criteriaObject = GoRouterState.of(context).extra as CriteriaObject;
    }
  }

  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: context.read<LookUpBrokerBloc>(),
      listener: (context, LookUpBrokerState state) {
        state.map(
          loading: (value) {},
          done: (value) {
            if (GoRouterState.of(context).extra != null) {
              getCriteria();
              context.read<LookUpBrokerBloc>().requestBroker = context
                  .read<LookUpBrokerBloc>()
                  .requestBroker
                  .copyWith(
                      limit: 5,
                      municipalityId: criteriaObject.municipalityId ?? -1,
                      brokerName: criteriaObject.brokerName,
                      brokerCategoryId: criteriaObject.brokerCategoryId ?? 2);
              searchController.text = criteriaObject.brokerName ?? '';
            } else {
              context.read<LookUpBrokerBloc>().requestBroker = context
                  .read<LookUpBrokerBloc>()
                  .requestBroker
                  .copyWith(limit: 5, municipalityId: -1, brokerCategoryId: 2);
            }
            brokerTransactionBloc.add(BrokerTransactionEvent.started(
                request: context.read<LookUpBrokerBloc>().requestBroker));
          },
          error: (value) {},
        );
      },
      builder: (context, LookUpBrokerState state) {
        return state.map(
          loading: (value) {
            return const AnimatedPulesLogo();
          },
          done: (value) {
            // if (GoRouterState.of(context).extra != null) {
            //   getCriteria();
            //   context.read<LookUpBrokerBloc>().requestBroker = context
            //       .read<LookUpBrokerBloc>()
            //       .requestBroker
            //       .copyWith(
            //           limit: 5,
            //           municipalityId: criteriaObject.municipalityId ?? -1,
            //           brokerName: criteriaObject.brokerName,
            //           brokerCategoryId: criteriaObject.brokerCategoryId ?? 2);
            //   searchController.text = criteriaObject.brokerName ?? '';
            // } else {
            //   context.read<LookUpBrokerBloc>().requestBroker = context
            //       .read<LookUpBrokerBloc>()
            //       .requestBroker
            //       .copyWith(limit: 5, municipalityId: -1, brokerCategoryId: 2);
            // }
            // brokerTransactionBloc.add(BrokerTransactionEvent.started(
            //     request: context.read<LookUpBrokerBloc>().requestBroker));

            return GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Scaffold(
                appBar: EblaAppBar(
                  title: AppStrings().realEstateBrokers,
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      BlocBuilder(
                        bloc: changeStatusCubit,
                        builder: (context, state) {
                          return Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(width: AppSizeW.s16),
                                Flexible(
                                  child: SearchTextFieldWidget(
                                    controller: searchController,
                                    hint: AppStrings().brokerCompanyName,
                                    onChange: (val) {
                                      if (_debounce?.isActive ?? false)
                                        _debounce?.cancel();
                                      _debounce = Timer(
                                          const Duration(milliseconds: 500),
                                          () {
                                        // do something with query
                                        brokersCountBloc
                                            .add(BrokersCountEvent.started(
                                          request: context
                                              .read<LookUpBrokerBloc>()
                                              .requestBroker
                                              .copyWith(
                                                  brokerName:
                                                      searchController.text,
                                                  limit: 5,
                                                  offset: 0),
                                        ));
                                        brokerTransactionBloc.add(
                                            BrokerTransactionEvent.search(
                                                request: context
                                                    .read<LookUpBrokerBloc>()
                                                    .requestBroker
                                                    .copyWith(
                                                        brokerName:
                                                            searchController
                                                                .text,
                                                        limit: 5,
                                                        offset: 0)));
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(width: AppSizeW.s10),
                                BlocBuilder(
                                  bloc: context.read<LookUpBrokerBloc>(),
                                  builder: (context, LookUpBrokerState state) {
                                    return state.map(
                                      loading: (value) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: AppSizeH.s5),
                                          child: Icon(
                                            Icons.filter_list_sharp,
                                            color: ColorManager.golden,
                                          ),
                                        );
                                      },
                                      done: (value) {
                                        return IconButton(
                                            onPressed: () async {
                                              var res = await bottomSheetWidget(
                                                context,
                                                child: MultiBlocProvider(
                                                  providers: [
                                                    BlocProvider.value(
                                                        value: context.read<
                                                            LookUpBrokerBloc>()),
                                                  ],
                                                  child:
                                                      BottomSheetFilterBrokerWidget(
                                                    brokerName:
                                                        searchController.text,
                                                  ),
                                                ),
                                              );
                                              if (res != null && res) {
                                                changeStatusCubit
                                                    .changeStatus();
                                                brokersCountBloc.add(
                                                    BrokersCountEvent.started(
                                                        // ignore: use_build_context_synchronously
                                                        request: context
                                                            .read<
                                                                LookUpBrokerBloc>()
                                                            .requestBroker));
                                                brokerTransactionBloc.add(
                                                    BrokerTransactionEvent
                                                        .started(
                                                            // ignore: use_build_context_synchronously
                                                            request: context
                                                                .read<
                                                                    LookUpBrokerBloc>()
                                                                .requestBroker));
                                              }
                                            },
                                            icon: Icon(
                                              size: AppSizeW.s32,
                                              Icons.filter_list_sharp,
                                              color: ColorManager.golden,
                                            ));
                                      },
                                      error: (value) {
                                        return const SizedBox();
                                      },
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: AppSizeW.s7,
                                ),
                              ]);
                        },
                      ),
                      SizedBox(
                        height: AppSizeH.s25,
                      ),
                      BlocBuilder(
                        bloc: changeStatusCubit,
                        builder: (context, state) {
                          return BlocBuilder<BrokersCountBloc,
                              BrokersCountState>(
                            bloc: brokersCountBloc,
                            builder: (context, state) {
                              return state.map(
                                  initial: (value) =>
                                      const BrokerCountContainer(
                                        count: '106',
                                      ),
                                  loading: (value) =>
                                      const BrokerCountContainerShimmer(),
                                  loaded: (value) {
                                    return BrokerCountContainer(
                                      count: value.val.toStringAsFixed(0),
                                    );
                                  },
                                  error: (value) => ErrorGlobalWidget(
                                        small: true,
                                        onPressed: () {
                                          brokersCountBloc.add(
                                              BrokersCountEvent.started(
                                                  request: context
                                                      .read<LookUpBrokerBloc>()
                                                      .requestBroker));
                                        },
                                        message: value.message,
                                      ));
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: AppSizeH.s40,
                      ),
                      Center(
                        child: Text(
                          AppStrings().realEstateBrokersDashboard,
                          style: Theme.of(context).textTheme.titleMedium,
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
                      BlocBuilder<BrokerTransactionBloc,
                          BrokerTransactionState>(
                        bloc: brokerTransactionBloc,
                        builder: (context, state) {
                          return state.map(initial: (initial) {
                            return Container();
                          }, loading: (val) {
                            return Container(
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
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return const RealEstateCardShimmer();
                                  }),
                            );
                          }, loaded: (loaded) {
                            if (loaded.response.transactionList.isEmpty) {
                              return Text(AppStrings().noDataFound);
                            } else {
                              return Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: AppSizeW.s20),
                                    padding: EdgeInsets.symmetric(
                                        vertical: AppSizeH.s10,
                                        horizontal: AppSizeW.s20),
                                    decoration: BoxDecoration(
                                        color:
                                            Theme.of(context).cardTheme.color,
                                        borderRadius: BorderRadius.circular(
                                            AppSizeR.s10)),
                                    child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: loaded.response
                                                    .transactionList.length >
                                                5
                                            ? 5
                                            : loaded.response.transactionList
                                                .length,
                                        itemBuilder: (context, index) {
                                          return RealEstateCard(
                                            name: context.locale == ARABIC_LOCAL
                                                ? loaded
                                                    .response
                                                    .transactionList[index]
                                                    .brokerArName
                                                : loaded
                                                    .response
                                                    .transactionList[index]
                                                    .brokerEnName,
                                            country: context
                                                        .locale ==
                                                    ARABIC_LOCAL
                                                ? getObjectByLookupKey(
                                                            context
                                                                    .read<
                                                                        LookUpBrokerBloc>()
                                                                    .lookupBrokerOv
                                                                    ?.municipalityList ??
                                                                [],
                                                            loaded
                                                                .response
                                                                .transactionList[
                                                                    index]
                                                                .municipalityId)
                                                        ?.arName ??
                                                    ''
                                                : getObjectByLookupKey(
                                                            context
                                                                    .read<
                                                                        LookUpBrokerBloc>()
                                                                    .lookupBrokerOv
                                                                    ?.municipalityList ??
                                                                [],
                                                            loaded
                                                                .response
                                                                .transactionList[
                                                                    index]
                                                                .municipalityId)
                                                        ?.enName ??
                                                    '',
                                            phone: loaded
                                                .response
                                                .transactionList[index]
                                                .brokerPhone1,
                                            email: loaded
                                                .response
                                                .transactionList[index]
                                                .brokerEmail,
                                            divider: index !=
                                                loaded.response.transactionList
                                                        .length -
                                                    1,
                                            zoneId: loaded.response
                                                .transactionList[index].zoneNo,
                                            streetNo: loaded
                                                .response
                                                .transactionList[index]
                                                .streetNo,
                                            buildingNo: loaded
                                                .response
                                                .transactionList[index]
                                                .buuildingNo,
                                          );
                                        }),
                                  ),
                                  Column(
                                    children: [
                                      FlutterCustomPagination(
                                        currentPage: (context
                                                    .read<LookUpBrokerBloc>()
                                                    .requestBroker
                                                    .offset ??
                                                0) ~/
                                            (context
                                                    .read<LookUpBrokerBloc>()
                                                    .requestBroker
                                                    .limit ??
                                                1),
                                        limitPerPage: context
                                                .read<LookUpBrokerBloc>()
                                                .requestBroker
                                                .limit ??
                                            5,
                                        totalDataCount: getCount(
                                            loaded.response.transactionList),
                                        // .  brokersCountBloc.count.ceil(),
                                        onPreviousPage: (previousPage) {
                                          context.read<LookUpBrokerBloc>().requestBroker = context
                                              .read<LookUpBrokerBloc>()
                                              .requestBroker
                                              .copyWith(
                                                  offset: ((context
                                                                      .read<
                                                                          LookUpBrokerBloc>()
                                                                      .requestBroker
                                                                      .offset ??
                                                                  0) ~/
                                                              (context
                                                                      .read<
                                                                          LookUpBrokerBloc>()
                                                                      .requestBroker
                                                                      .limit ??
                                                                  1) -
                                                          1) *
                                                      (context
                                                              .read<
                                                                  LookUpBrokerBloc>()
                                                              .requestBroker
                                                              .limit ??
                                                          1),
                                                  brokerName:
                                                      searchController.text);
                                          brokerTransactionBloc.add(
                                              BrokerTransactionEvent.started(
                                                  request: context
                                                      .read<LookUpBrokerBloc>()
                                                      .requestBroker));
                                        },
                                        onBackToFirstPage: (firstPage) {
                                          context
                                                  .read<LookUpBrokerBloc>()
                                                  .requestBroker =
                                              context
                                                  .read<LookUpBrokerBloc>()
                                                  .requestBroker
                                                  .copyWith(offset: 0);
                                          brokerTransactionBloc.add(
                                              BrokerTransactionEvent.started(
                                                  request: context
                                                      .read<LookUpBrokerBloc>()
                                                      .requestBroker));
                                        },
                                        onNextPage: (nextPage) {
                                          context.read<LookUpBrokerBloc>().requestBroker = context
                                              .read<LookUpBrokerBloc>()
                                              .requestBroker
                                              .copyWith(
                                                  offset: (((context
                                                                      .read<
                                                                          LookUpBrokerBloc>()
                                                                      .requestBroker
                                                                      .offset ??
                                                                  0) ~/
                                                              (context
                                                                      .read<
                                                                          LookUpBrokerBloc>()
                                                                      .requestBroker
                                                                      .limit ??
                                                                  1) +
                                                          1) *
                                                      (context
                                                              .read<
                                                                  LookUpBrokerBloc>()
                                                              .requestBroker
                                                              .limit ??
                                                          1)),
                                                  brokerName:
                                                      searchController.text);
                                          brokerTransactionBloc.add(
                                              BrokerTransactionEvent.started(
                                                  request: context
                                                      .read<LookUpBrokerBloc>()
                                                      .requestBroker));
                                        },
                                        onGoToLastPage: (lastPage) {
                                          context.read<LookUpBrokerBloc>().requestBroker = context
                                              .read<LookUpBrokerBloc>()
                                              .requestBroker
                                              .copyWith(
                                                  offset: (((loaded.response.count) %
                                                              (context.read<LookUpBrokerBloc>().requestBroker.limit ??
                                                                  1)) ==
                                                          0
                                                      ? loaded.response.count -
                                                          (context
                                                                  .read<
                                                                      LookUpBrokerBloc>()
                                                                  .requestBroker
                                                                  .limit ??
                                                              5)
                                                      : ((loaded.response.count) ~/
                                                              (context.read<LookUpBrokerBloc>().requestBroker.limit ??
                                                                  1)) *
                                                          (context
                                                                  .read<LookUpBrokerBloc>()
                                                                  .requestBroker
                                                                  .limit ??
                                                              1)));
                                          brokerTransactionBloc.add(
                                              BrokerTransactionEvent.started(
                                                  request: context
                                                      .read<LookUpBrokerBloc>()
                                                      .requestBroker));
                                        },
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                        // textStyle: Theme.of(context)
                                        //     .textTheme
                                        //     .labelSmall,
                                        previousPageIcon: context.locale ==
                                                ARABIC_LOCAL
                                            ? Icons.keyboard_arrow_right_sharp
                                            : Icons.keyboard_arrow_left_sharp,
                                        backToFirstPageIcon: Icons.first_page,
                                        nextPageIcon: context.locale ==
                                                ARABIC_LOCAL
                                            ? Icons.keyboard_arrow_left_sharp
                                            : Icons.keyboard_arrow_right_sharp,
                                        goToLastPageIcon: Icons.last_page,
                                      ),
                                      SizedBox(height: AppSizeH.s10)
                                    ],
                                  )
                                ],
                              );
                            }
                          }, error: (error) {
                            return const ErrorGlobalWidget();
                          });
                        },
                      ),
                      SizedBox(
                        height: AppSizeH.s30,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          error: (value) {
            return ErrorGlobalWidget(
              message: value.message,
              onPressed: () {
                brokersCountBloc.add(BrokersCountEvent.started(
                    request: context.read<LookUpBrokerBloc>().requestBroker));
              },
            );
          },
        );
      },
    );
  }

  int getCount(List list) {
    if (((context.read<LookUpBrokerBloc>().requestBroker.offset ?? 0) ~/
            (context.read<LookUpBrokerBloc>().requestBroker.limit ?? 1)) ==
        0) {
      if (list.length < 5) {
        return 1;
      } else
        return brokersCountBloc.count.ceil();
    } else {
      return brokersCountBloc.count.ceil();
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}

class BrokerCountContainer extends StatelessWidget {
  final String count;

  const BrokerCountContainer({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizeW.s47,
        ),
        child: Container(
          height: AppSizeH.s120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(AppSizeR.s20)),
            boxShadow: [
              BoxShadow(
                  spreadRadius: AppSizeR.s2,
                  blurRadius: AppSizeR.s11,
                  color: ColorManager.textBlack.withAlpha(30)),
            ],
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.onSecondaryContainer,
                Theme.of(context).scaffoldBackgroundColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.2, 1.0],
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSizeW.s30),
                      child: Text(
                        AppStrings().totalCertifiedRealEstate,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: AppSizeSp.s16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: AppSizeH.s10,
                    ),
                    Text(count,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: AppSizeSp.s16)),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: SvgPicture.asset(
                  IconAssets.sellHome,
                  color: Theme.of(context).iconTheme.color!.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ));
  }
}

class BrokerCountContainerShimmer extends StatelessWidget {
  const BrokerCountContainerShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizeW.s47,
        ),
        child: Container(
          height: AppSizeH.s120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(AppSizeR.s20)),
            boxShadow: [
              BoxShadow(
                  spreadRadius: AppSizeR.s2,
                  blurRadius: AppSizeR.s11,
                  color: ColorManager.textBlack.withAlpha(30)),
            ],
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.onSecondaryContainer,
                Theme.of(context).scaffoldBackgroundColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.2, 1.0],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings().totalCertifiedRealEstate,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: AppSizeSp.s16),
                    ),
                    SizedBox(
                      height: AppSizeH.s10,
                    ),
                    ShimmerPlaceholder(
                      child: Container(
                        width: AppSizeW.s50,
                        height: AppSizeH.s12,
                        decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(AppSizeR.s12)),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: AppSizeH.s20,
                  ),
                  SvgPicture.asset(
                    IconAssets.sellHome,
                    // color:
                    //     Theme.of(context).primaryColor.withOpacity(0.5),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
