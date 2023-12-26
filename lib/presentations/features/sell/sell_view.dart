// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/app/extensions.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/presentations/features/sell/blocs/sell_default/sell_default_bloc.dart';
import 'package:ebla/presentations/features/sell/blocs/sell_grid_kpis_bloc/sell_grid_kpis_bloc.dart';
import 'package:ebla/presentations/features/sell/blocs/sell_transaction/sell_transaction_bloc.dart';
import 'package:ebla/presentations/features/sell/blocs/top_values_bloc/topvalues_bloc.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:ebla/presentations/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../domain/models/cms_models/main_menu_models/main_menu_models.dart';
import '../../../utils/global_functions.dart';
import '../../widgets/selected_year_widget.dart';
import '../main/blocs/lookup_bloc/lookup_bloc.dart';
import '../main/blocs/main_menu_bloc/main_menu_bloc.dart';
import '../rent/blocs/cubits/change_status_cubit.dart';
import 'blocs/sell_bloc/sell_bloc.dart';
import 'widgets/bottom_sheet_filter_sell.dart';
import 'widgets/statistics_top_sell.dart';

class SalesView extends StatefulWidget {
  const SalesView({super.key});

  @override
  State<SalesView> createState() => _SalesViewState();
}

class _SalesViewState extends State<SalesView> {
  late SellGridKPIsBloc sellGridKPIsBloc;
  late SellDefaultBloc sellDefaultBloc;
  late SellTransactionBloc sellTransactionBloc;
  late ChangeStatusCubit changeStatusCubit;
  late TopvaluesBloc topvaluesBloc;

  @override
  void initState() {
    context.read<LookupBloc>().add(const LookupEvent.getSellLookupEvent());
    context.read<MainMenuBloc>().mainMenu != MainMenuResponse()
        ? null
        : context.read<MainMenuBloc>().add(const MainMenuEvent.getMainMenu());
    // sellGridKPIsBloc = instance<SellGridKPIsBloc>();
    sellGridKPIsBloc = instance<SellGridKPIsBloc>();
    sellDefaultBloc = instance<SellDefaultBloc>()
      ..add(SellDefaultEvent.started(
          request: context.read<SellBloc>().requestSellDefault));
    sellTransactionBloc = instance<SellTransactionBloc>();
    changeStatusCubit = ChangeStatusCubit();
    topvaluesBloc = instance<TopvaluesBloc>();
    // sellTransactionBloc.add(SellTransactionEvent.started(
    //     request: context.read<SellBloc>().requestSellDefault));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: (context, LookupState state) {
        state.mapOrNull(
          loadedLookup: (value) {
            sellGridKPIsBloc.add(SellGridKPIsEvent.getData(
                request: context.read<SellBloc>().requestSell));
            sellTransactionBloc.add(SellTransactionEvent.started(
                request: context.read<SellBloc>().requestSell));
            topvaluesBloc.add(TopvaluesEvent.countTransictionNumberEvent(
                request: context.read<SellBloc>().requestSell));
          },
        );
      },
      bloc: context.read<LookupBloc>(),
      builder: (context, LookupState state) {
        return state.map(
          loadingLookup: (value) {
            return const AnimatedPulesLogo();
          },
          loadedLookup: (value) {
            return BlocBuilder<SellDefaultBloc, SellDefaultState>(
                bloc: sellDefaultBloc,
                builder: (context, state) => state.when(
                    initial: () => const SizedBox(),
                    loading: () => const AnimatedPulesLogo(),
                    done: (done) => Column(
                          children: [
                            ShaderMask(
                              shaderCallback: (rect) {
                                return const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.black, Colors.transparent],
                                ).createShader(Rect.fromLTRB(
                                    0, 0, rect.width, rect.height));
                              },
                              blendMode: BlendMode.dstIn,
                              child: Image.asset(
                                ImageAssets.appbarBg,
                                height: AppSizeH.s50,
                                width: double.infinity,
                                fit: BoxFit.cover,
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
                            Expanded(
                              child: RefreshIndicator(
                                onRefresh: () {
                                  context.read<LookupBloc>().add(
                                      const LookupEvent.getSellLookupEvent());
                                  return Future.value();
                                },
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      BlocBuilder(
                                        bloc: changeStatusCubit,
                                        builder: (context, state) {
                                          return Column(children: [
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  SizedBox(width: AppSizeW.s16),
                                                  SelectedMunicipality(
                                                    value: getObjectByLookupKey(
                                                            context
                                                                    .read<
                                                                        LookupBloc>()
                                                                    .loockUpSell
                                                                    ?.municipalityList ??
                                                                [],
                                                            context
                                                                    .read<
                                                                        SellBloc>()
                                                                    .requestSell
                                                                    .municipalityId ??
                                                                4) ??
                                                        const RentLookupModel(),
                                                    list: context
                                                            .read<LookupBloc>()
                                                            .loockUpSell
                                                            ?.municipalityList ??
                                                        [],
                                                    onChanged: (municipal) {
                                                      context
                                                              .read<SellBloc>()
                                                              .requestSell =
                                                          context
                                                              .read<SellBloc>()
                                                              .requestSell
                                                              .copyWith(
                                                                  offset: 0,
                                                                  municipalityId:
                                                                      municipal
                                                                          ?.lookupKey,
                                                                  areaCode: -1);
                                                      changeStatusCubit
                                                          .changeStatus();
                                                      sellGridKPIsBloc.add(
                                                          SellGridKPIsEvent.getData(
                                                              request: context
                                                                  .read<
                                                                      SellBloc>()
                                                                  .requestSell));
                                                      sellTransactionBloc.add(
                                                          SellTransactionEvent.started(
                                                              request: context
                                                                  .read<
                                                                      SellBloc>()
                                                                  .requestSell));
                                                      topvaluesBloc.add(TopvaluesEvent
                                                          .countTransictionNumberEvent(
                                                              request: context
                                                                  .read<
                                                                      SellBloc>()
                                                                  .requestSell));
                                                    },
                                                  ),
                                                  SizedBox(width: AppSizeW.s5),
                                                  SelectedYearWidget(
                                                    value: context
                                                            .read<SellBloc>()
                                                            .requestSell
                                                            .issueDateYear ??
                                                        DateTime.now().year,
                                                    onChanged: (year) {
                                                      context
                                                              .read<SellBloc>()
                                                              .requestSell =
                                                          context
                                                              .read<SellBloc>()
                                                              .requestSell
                                                              .copyWith(
                                                                  offset: 0,
                                                                  issueDateEndMonth: year ==
                                                                          DateTime.now()
                                                                              .year
                                                                      ? DateTime
                                                                              .now()
                                                                          .month
                                                                      : 12,
                                                                  issueDateYear:
                                                                      year);
                                                      changeStatusCubit
                                                          .changeStatus();
                                                      sellGridKPIsBloc.add(
                                                          SellGridKPIsEvent.getData(
                                                              request: context
                                                                  .read<
                                                                      SellBloc>()
                                                                  .requestSell));
                                                      sellTransactionBloc.add(
                                                          SellTransactionEvent.started(
                                                              request: context
                                                                  .read<
                                                                      SellBloc>()
                                                                  .requestSell));
                                                      topvaluesBloc.add(TopvaluesEvent
                                                          .countTransictionNumberEvent(
                                                              request: context
                                                                  .read<
                                                                      SellBloc>()
                                                                  .requestSell));
                                                    },
                                                  ),
                                                  SizedBox(width: AppSizeW.s7),
                                                  BlocBuilder(
                                                    bloc: context
                                                        .read<LookupBloc>(),
                                                    builder: (context,
                                                        LookupState state) {
                                                      return state.map(
                                                        loadingLookup: (value) {
                                                          return Icon(
                                                            Icons
                                                                .filter_list_sharp,
                                                            color: ColorManager
                                                                .golden,
                                                          );
                                                        },
                                                        loadedLookup: (value) {
                                                          return IconButton(
                                                              onPressed:
                                                                  () async {
                                                                var res =
                                                                    await bottomSheetWidget(
                                                                  context,
                                                                  child:
                                                                      MultiBlocProvider(
                                                                    providers: [
                                                                      BlocProvider.value(
                                                                          value:
                                                                              context.read<SellBloc>()),
                                                                      BlocProvider.value(
                                                                          value:
                                                                              context.read<LookupBloc>()),
                                                                    ],
                                                                    child:
                                                                        const BottomSheetFilterSellWidget(),
                                                                  ),
                                                                );
                                                                if (res !=
                                                                        null &&
                                                                    res) {
                                                                  changeStatusCubit
                                                                      .changeStatus();
                                                                  sellGridKPIsBloc.add(SellGridKPIsEvent.getData(
                                                                      request: context
                                                                          .read<
                                                                              SellBloc>()
                                                                          .requestSell));
                                                                  topvaluesBloc.add(TopvaluesEvent.countTransictionNumberEvent(
                                                                      request: context
                                                                          .read<
                                                                              SellBloc>()
                                                                          .requestSell));
                                                                  sellTransactionBloc.add(SellTransactionEvent.started(
                                                                      request: context
                                                                          .read<
                                                                              SellBloc>()
                                                                          .requestSell));
                                                                }
                                                              },
                                                              icon: Icon(
                                                                size: AppSizeW
                                                                    .s32,
                                                                Icons
                                                                    .filter_list_sharp,
                                                                color:
                                                                    ColorManager
                                                                        .golden,
                                                              ));
                                                        },
                                                        errorLookUp: (value) {
                                                          return const SizedBox();
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  SizedBox(
                                                    width: AppSizeW.s7,
                                                  ),
                                                ]),
                                            // SizedBox(height: AppSizeH.s12),
                                            // Padding(
                                            //   padding: EdgeInsets.symmetric(
                                            //     horizontal: AppSizeW.s11,
                                            //   ),
                                            //   child: SizedBox(
                                            //       height: AppSizeH.s26,
                                            //       child: Row(
                                            //           children: context
                                            //                   .read<SellBloc>()
                                            //                   .loockUpSell
                                            //                   ?.periodTime
                                            //                   .map((e) {
                                            //                 return e.id != 5
                                            //                     ? ChosenPeriodWidget(
                                            //                         periodId: context
                                            //                             .read<
                                            //                                 SellBloc>()
                                            //                             .requestSell
                                            //                             .periodId,
                                            //                         id: e.id,
                                            //                         enName: e
                                            //                             .enName,
                                            //                         arName: e
                                            //                             .arName,
                                            //                       )
                                            //                     : const SizedBox();
                                            //               }).toList() ??
                                            //               [])),
                                            // ),
                                          ]);
                                        },
                                      ),
                                      // SizedBox(height: AppSizeH.s22),
                                      SizedBox(height: AppSizeH.s5),
                                      MessageNoteWidget(
                                          message: getObjectLinkModelById(
                                                      context
                                                          .read<MainMenuBloc>()
                                                          .mainMenu
                                                          .mainMenu
                                                          .links,
                                                      2)
                                                  ?.dataSourceMessage ??
                                              const DataSourceMessageModel()),
                                      Column(
                                        children: [
                                          Center(
                                            child: Text(
                                              AppStrings
                                                  .currentPerformanceSummary
                                                  .tr(args: [
                                                AppStrings().sell
                                              ]),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge,
                                            ),
                                          ),
                                          BlocBuilder(
                                            bloc: changeStatusCubit,
                                            builder: (context, state) {
                                              return FiltersApplied(
                                                year: context
                                                        .read<SellBloc>()
                                                        .requestSell
                                                        .issueDateYear ??
                                                    DateTime.now().year,
                                                municipality: getObjectByLookupKey(
                                                        context
                                                                .read<
                                                                    LookupBloc>()
                                                                .loockUpSell
                                                                ?.municipalityList ??
                                                            [],
                                                        context
                                                                .read<
                                                                    SellBloc>()
                                                                .requestSell
                                                                .municipalityId ??
                                                            1) ??
                                                    const RentLookupModel(),
                                                zone: getObjectByLookupKey(
                                                        context
                                                                .read<
                                                                    LookupBloc>()
                                                                .loockUpSell
                                                                ?.districtList ??
                                                            [],
                                                        context
                                                            .read<SellBloc>()
                                                            .requestSell
                                                            .areaCode
                                                            .toInt()) ??
                                                    const RentLookupModel(),
                                                propertyPurpose: getObjectByLookupKey(
                                                        context
                                                                .read<
                                                                    LookupBloc>()
                                                                .loockUpSell
                                                                ?.rentPurposeList ??
                                                            [],
                                                        context
                                                                .read<
                                                                    SellBloc>()
                                                                .requestSell
                                                                .purposeList?[0] ??
                                                            1) ??
                                                    const RentLookupModel(),
                                                propertyType: getObjectByLookupKey(
                                                        context
                                                                .read<
                                                                    LookupBloc>()
                                                                .loockUpSell
                                                                ?.propertyTypeList ??
                                                            [],
                                                        context
                                                                    .read<
                                                                        SellBloc>()
                                                                    .requestSell
                                                                    .propertyTypeList?[
                                                                0] ??
                                                            1) ??
                                                    const RentLookupModel(
                                                        lookupKey: -1),
                                                withoutZone: context
                                                        .read<SellBloc>()
                                                        .requestSell
                                                        .areaCode ==
                                                    -1,
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                      const GreyLinerContainer(),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: AppSizeW.s31),
                                        child: StaggeredGridView(
                                          // for development only: UniqueKey forces the rebuild of the widget on hot reload
                                          key: UniqueKey(),
                                          itemsCount: 6,
                                          rightSectionTopPadding: AppSizeH.s17,
                                          mainAxisSpacing: AppSizeH.s22,
                                          crossAxisSpacing: AppSizeW.s23,
                                          gridItemChildBuilder:
                                              (context, index) {
                                            return MultiBlocProvider(
                                              providers: [
                                                BlocProvider.value(
                                                    value: sellGridKPIsBloc),
                                                BlocProvider.value(
                                                    value: changeStatusCubit),
                                              ],
                                              child: GridItemWidget(
                                                gridItemType: GridItemType.sell,
                                                defaultResponse: done,
                                                sellKPI:
                                                    SellGridKPIs.values[index],
                                                rentKPI: null,
                                                mortgageKPI: null,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: AppSizeH.s20,
                                      ),
                                      Column(
                                        children: [
                                          Center(
                                            child: Text(
                                              AppStrings().rentTopTen,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge,
                                            ),
                                          ),
                                          BlocBuilder(
                                            bloc: changeStatusCubit,
                                            builder: (context, state) {
                                              return FiltersApplied(
                                                withoutZone: true,
                                                year: context
                                                        .read<SellBloc>()
                                                        .requestSell
                                                        .issueDateYear ??
                                                    DateTime.now().year,
                                                municipality: getObjectByLookupKey(
                                                        context
                                                                .read<
                                                                    LookupBloc>()
                                                                .loockUpSell
                                                                ?.municipalityList ??
                                                            [],
                                                        context
                                                                .read<
                                                                    SellBloc>()
                                                                .requestSell
                                                                .municipalityId ??
                                                            1) ??
                                                    const RentLookupModel(),
                                                zone: getObjectByLookupKey(
                                                        context
                                                                .read<
                                                                    LookupBloc>()
                                                                .loockUpSell
                                                                ?.districtList ??
                                                            [],
                                                        context
                                                            .read<SellBloc>()
                                                            .requestSell
                                                            .areaCode
                                                            .toInt()) ??
                                                    const RentLookupModel(),
                                                propertyPurpose: getObjectByLookupKey(
                                                        context
                                                                .read<
                                                                    LookupBloc>()
                                                                .loockUpSell
                                                                ?.rentPurposeList ??
                                                            [],
                                                        context
                                                                .read<
                                                                    SellBloc>()
                                                                .requestSell
                                                                .purposeList?[0] ??
                                                            1) ??
                                                    const RentLookupModel(),
                                                propertyType: getObjectByLookupKey(
                                                        context
                                                                .read<
                                                                    LookupBloc>()
                                                                .loockUpSell
                                                                ?.propertyTypeList ??
                                                            [],
                                                        context
                                                                    .read<
                                                                        SellBloc>()
                                                                    .requestSell
                                                                    .propertyTypeList?[
                                                                0] ??
                                                            1) ??
                                                    const RentLookupModel(
                                                        lookupKey: -1),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: AppSizeW.s20),
                                        child: BlocProvider.value(
                                          value: topvaluesBloc,
                                          child:
                                              const StatisticsTopSellWidget(),
                                        ),
                                      ),
                                      SizedBox(height: AppSizeH.s20),
                                      Column(
                                        children: [
                                          Center(
                                            child: Text(
                                              AppStrings().sellContractList,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge,
                                            ),
                                          ),
                                          BlocBuilder(
                                            bloc: changeStatusCubit,
                                            builder: (context, state) {
                                              return FiltersApplied(
                                                year: context
                                                        .read<SellBloc>()
                                                        .requestSell
                                                        .issueDateYear ??
                                                    DateTime.now().year,
                                                municipality: getObjectByLookupKey(
                                                        context
                                                                .read<
                                                                    LookupBloc>()
                                                                .loockUpSell
                                                                ?.municipalityList ??
                                                            [],
                                                        context
                                                                .read<
                                                                    SellBloc>()
                                                                .requestSell
                                                                .municipalityId ??
                                                            1) ??
                                                    const RentLookupModel(),
                                                zone: getObjectByLookupKey(
                                                        context
                                                                .read<
                                                                    LookupBloc>()
                                                                .loockUpSell
                                                                ?.districtList ??
                                                            [],
                                                        context
                                                            .read<SellBloc>()
                                                            .requestSell
                                                            .areaCode
                                                            .toInt()) ??
                                                    const RentLookupModel(),
                                                propertyPurpose: getObjectByLookupKey(
                                                        context
                                                                .read<
                                                                    LookupBloc>()
                                                                .loockUpSell
                                                                ?.rentPurposeList ??
                                                            [],
                                                        context
                                                                .read<
                                                                    SellBloc>()
                                                                .requestSell
                                                                .purposeList?[0] ??
                                                            1) ??
                                                    const RentLookupModel(),
                                                propertyType: getObjectByLookupKey(
                                                        context
                                                                .read<
                                                                    LookupBloc>()
                                                                .loockUpSell
                                                                ?.propertyTypeList ??
                                                            [],
                                                        context
                                                                    .read<
                                                                        SellBloc>()
                                                                    .requestSell
                                                                    .propertyTypeList?[
                                                                0] ??
                                                            1) ??
                                                    const RentLookupModel(
                                                        lookupKey: -1),
                                                withoutZone: context
                                                        .read<SellBloc>()
                                                        .requestSell
                                                        .areaCode ==
                                                    -1,
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                      const GreyLinerContainer(),
                                      BlocBuilder<SellTransactionBloc,
                                          SellTransactionState>(
                                        bloc: sellTransactionBloc,
                                        builder: (context, state) => state.when(
                                          initial: () => const SizedBox(),
                                          loading: () {
                                            return ListView.builder(
                                                itemCount: 5,
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemBuilder: (context, index) {
                                                  return const ShimmerMainContainer();
                                                });
                                          },
                                          success: (success) =>
                                              ListView.builder(
                                                  itemCount: success
                                                              .transactionList
                                                              .length >
                                                          5
                                                      ? 5
                                                      : success.transactionList
                                                          .length,
                                                  shrinkWrap: true,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return MainDataContainer(
                                                      title: AppStrings()
                                                          .sellPrice,
                                                      totalPrice:
                                                          "${success.transactionList[index].realEstateValue?.formatWithCommas()} ${AppStrings().currency}",
                                                      value: context
                                                                  .read<
                                                                      SellBloc>()
                                                                  .requestSell
                                                                  .unit ==
                                                              1
                                                          ? success
                                                                  .transactionList[
                                                                      index]
                                                                  .realEstateMT
                                                                  ?.formatWithCommas() ??
                                                              '0'
                                                          : success
                                                                  .transactionList[
                                                                      index]
                                                                  .realEstateSQT
                                                                  ?.formatWithCommas() ??
                                                              '0',
                                                      valueDescription:
                                                          AppStrings().rentArea,
                                                      unit: context
                                                                  .read<
                                                                      SellBloc>()
                                                                  .requestSell
                                                                  .unit ==
                                                              1
                                                          ? AppStrings()
                                                              .meterSquare
                                                          : AppStrings()
                                                              .footSquare,
                                                      titleInfo: getTitleInfo(),
                                                      valueInfo: context
                                                                  .read<
                                                                      SellBloc>()
                                                                  .requestSell
                                                                  .unit ==
                                                              1
                                                          ? success
                                                                  .transactionList[
                                                                      index]
                                                                  .priceMT
                                                                  ?.formatWithCommas() ??
                                                              '0'
                                                          : success
                                                                  .transactionList[
                                                                      index]
                                                                  .priceSQ
                                                                  ?.formatWithCommas() ??
                                                              '0',
                                                      location: context.locale ==
                                                              ARABIC_LOCAL
                                                          ? getObjectByLookupKey(
                                                                      context
                                                                              .read<
                                                                                  LookupBloc>()
                                                                              .loockUpSell
                                                                              ?.municipalityList ??
                                                                          [],
                                                                      success.transactionList[index].municipalityId ??
                                                                          0)
                                                                  ?.arName ??
                                                              ''
                                                          : getObjectByLookupKey(
                                                                      context
                                                                              .read<
                                                                                  LookupBloc>()
                                                                              .loockUpSell
                                                                              ?.municipalityList ??
                                                                          [],
                                                                      success.transactionList[index]
                                                                              .municipalityId ??
                                                                          0)
                                                                  ?.enName ??
                                                              '',
                                                      descripton: success
                                                                  .transactionList[
                                                                      index]
                                                                  .issueDate
                                                                  ?.isEmpty ??
                                                              true
                                                          ? ""
                                                          : DateTime.parse(success
                                                                      .transactionList[
                                                                          index]
                                                                      .issueDate ??
                                                                  '')
                                                              .toFormattedString(),
                                                    );
                                                  }),
                                          error: (String message) => SizedBox(
                                            height: AppSizeH.s200,
                                            width: AppSizeH.s200,
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                    height: AppSizeH.s130,
                                                    width: AppSizeH.s130,
                                                    child: Lottie.asset(
                                                        ImageAssets
                                                            .animationError)),
                                                IconButton(
                                                    onPressed: () {
                                                      sellTransactionBloc.add(
                                                          SellTransactionEvent.started(
                                                              request: context
                                                                  .read<
                                                                      SellBloc>()
                                                                  .requestSell));
                                                    },
                                                    icon: const Icon(
                                                        Icons.refresh))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      BlocBuilder(
                                        bloc: sellTransactionBloc,
                                        builder: (context,
                                            SellTransactionState state) {
                                          return state.maybeMap(
                                            loading: (value) {
                                              return Column(
                                                children: [
                                                  FlutterCustomPagination(
                                                    currentPage: (context
                                                                .read<
                                                                    SellBloc>()
                                                                .requestSell
                                                                .offset ??
                                                            0) ~/
                                                        (context
                                                                .read<
                                                                    SellBloc>()
                                                                .requestSell
                                                                .limit ??
                                                            1),
                                                    limitPerPage: 5,
                                                    totalDataCount:
                                                        sellTransactionBloc
                                                                .sellTransaction
                                                                ?.count ??
                                                            0,
                                                    onPreviousPage:
                                                        (previousPage) {},
                                                    onBackToFirstPage:
                                                        (firstPage) {},
                                                    onNextPage: (nextPage) {},
                                                    onGoToLastPage:
                                                        (lastPage) {},
                                                    backgroundColor:
                                                        Theme.of(context)
                                                            .colorScheme
                                                            .background,
                                                    // textStyle: Theme.of(context)
                                                    //     .textTheme
                                                    //     .labelSmall,
                                                    previousPageIcon: context
                                                                .locale ==
                                                            ARABIC_LOCAL
                                                        ? Icons
                                                            .keyboard_arrow_right_sharp
                                                        : Icons
                                                            .keyboard_arrow_left_sharp,
                                                    backToFirstPageIcon:
                                                        Icons.first_page,
                                                    nextPageIcon: context.locale ==
                                                            ARABIC_LOCAL
                                                        ? Icons
                                                            .keyboard_arrow_left_sharp
                                                        : Icons
                                                            .keyboard_arrow_right_sharp,
                                                    goToLastPageIcon:
                                                        Icons.last_page,
                                                  ),
                                                  SizedBox(height: AppSizeH.s8)
                                                ],
                                              );
                                            },
                                            success: (value) {
                                              if (value.response.transactionList
                                                  .isEmpty) {
                                                return Text(
                                                  AppStrings()
                                                      .noTransactionFound,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge,
                                                );
                                              }
                                              return value.response.count <
                                                      (context
                                                              .read<SellBloc>()
                                                              .requestSell
                                                              .limit ??
                                                          4)
                                                  ? SizedBox(
                                                      height: AppSizeH.s10)
                                                  : Column(
                                                      children: [
                                                        FlutterCustomPagination(
                                                          currentPage: (context
                                                                      .read<
                                                                          SellBloc>()
                                                                      .requestSell
                                                                      .offset ??
                                                                  0) ~/
                                                              (context
                                                                      .read<
                                                                          SellBloc>()
                                                                      .requestSell
                                                                      .limit ??
                                                                  1),
                                                          limitPerPage: context
                                                                  .read<
                                                                      SellBloc>()
                                                                  .requestSell
                                                                  .limit ??
                                                              5,
                                                          totalDataCount:
                                                              sellTransactionBloc
                                                                      .sellTransaction
                                                                      ?.count ??
                                                                  0,
                                                          onPreviousPage:
                                                              (previousPage) {
                                                            context
                                                                    .read<
                                                                        SellBloc>()
                                                                    .requestSell =
                                                                context
                                                                    .read<
                                                                        SellBloc>()
                                                                    .requestSell
                                                                    .copyWith(
                                                                        offset: ((context.read<SellBloc>().requestSell.offset ?? 0) ~/ (context.read<SellBloc>().requestSell.limit ?? 1) -
                                                                                1) *
                                                                            (context.read<SellBloc>().requestSell.limit ??
                                                                                1));
                                                            sellTransactionBloc.add(
                                                                SellTransactionEvent.started(
                                                                    request: context
                                                                        .read<
                                                                            SellBloc>()
                                                                        .requestSell));
                                                          },
                                                          onBackToFirstPage:
                                                              (firstPage) {
                                                            context
                                                                    .read<
                                                                        SellBloc>()
                                                                    .requestSell =
                                                                context
                                                                    .read<
                                                                        SellBloc>()
                                                                    .requestSell
                                                                    .copyWith(
                                                                        offset:
                                                                            0);
                                                            sellTransactionBloc.add(
                                                                SellTransactionEvent.started(
                                                                    request: context
                                                                        .read<
                                                                            SellBloc>()
                                                                        .requestSell));
                                                          },
                                                          onNextPage:
                                                              (nextPage) {
                                                            context
                                                                    .read<
                                                                        SellBloc>()
                                                                    .requestSell =
                                                                context
                                                                    .read<
                                                                        SellBloc>()
                                                                    .requestSell
                                                                    .copyWith(
                                                                        offset: (((context.read<SellBloc>().requestSell.offset ?? 0) ~/ (context.read<SellBloc>().requestSell.limit ?? 1) +
                                                                                1) *
                                                                            (context.read<SellBloc>().requestSell.limit ??
                                                                                1)));
                                                            sellTransactionBloc.add(
                                                                SellTransactionEvent.started(
                                                                    request: context
                                                                        .read<
                                                                            SellBloc>()
                                                                        .requestSell));
                                                          },
                                                          onGoToLastPage:
                                                              (lastPage) {
                                                            context.read<SellBloc>().requestSell = context.read<SellBloc>().requestSell.copyWith(
                                                                offset: (((sellTransactionBloc.sellTransaction?.count ??
                                                                                0) %
                                                                            (context.read<SellBloc>().requestSell.limit ??
                                                                                1)) ==
                                                                        0
                                                                    ? (sellTransactionBloc.sellTransaction?.count ??
                                                                            0) -
                                                                        (context.read<SellBloc>().requestSell.limit ??
                                                                            5)
                                                                    : ((sellTransactionBloc.sellTransaction?.count ??
                                                                                0) ~/
                                                                            (context.read<SellBloc>().requestSell.limit ??
                                                                                1)) *
                                                                        (context.read<SellBloc>().requestSell.limit ??
                                                                            1)));
                                                            sellTransactionBloc.add(
                                                                SellTransactionEvent.started(
                                                                    request: context
                                                                        .read<
                                                                            SellBloc>()
                                                                        .requestSell));
                                                          },
                                                          backgroundColor:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .background,
                                                          // textStyle: Theme.of(context)
                                                          //     .textTheme
                                                          //     .labelSmall,
                                                          previousPageIcon: context
                                                                      .locale ==
                                                                  ARABIC_LOCAL
                                                              ? Icons
                                                                  .keyboard_arrow_right_sharp
                                                              : Icons
                                                                  .keyboard_arrow_left_sharp,
                                                          backToFirstPageIcon:
                                                              Icons.first_page,
                                                          nextPageIcon: context
                                                                      .locale ==
                                                                  ARABIC_LOCAL
                                                              ? Icons
                                                                  .keyboard_arrow_left_sharp
                                                              : Icons
                                                                  .keyboard_arrow_right_sharp,
                                                          goToLastPageIcon:
                                                              Icons.last_page,
                                                        ),
                                                        SizedBox(
                                                            height: AppSizeH.s8)
                                                      ],
                                                    );
                                            },
                                            orElse: () => const SizedBox(),
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                    error: (String message) => ErrorGlobalWidget(
                          message: message,
                          onPressed: () {
                            sellDefaultBloc.add(SellDefaultEvent.started(
                                request: context
                                    .read<SellBloc>()
                                    .requestSellDefault));
                          },
                        )));
          },
          errorLookUp: (value) {
            return ErrorGlobalWidget(
              message: value.message,
              onPressed: () {
                context
                    .read<LookupBloc>()
                    .add(const LookupEvent.getSellLookupEvent());
              },
            );
          },
        );
      },
    );
  }

  String getTitleInfo() {
    return context.locale == ARABIC_LOCAL
        ? "${AppStrings().theUnitPrice} "
            "${context.read<SellBloc>().requestSell.unit == 1 ? AppStrings().meterSquareFull : AppStrings().footSquareFull}"
            ": "
        : "${context.read<SellBloc>().requestSell.unit == 1 ? AppStrings().meterSquareFull : AppStrings().footSquareFull} ${AppStrings().theUnitPrice}"
            ": ";
  }
}
