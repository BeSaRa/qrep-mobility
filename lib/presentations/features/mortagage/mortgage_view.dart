// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/app/extensions.dart';
import 'package:ebla/domain/models/cms_models/main_menu_models/main_menu_models.dart';
import 'package:ebla/presentations/features/mortagage/blocs/mortgage_bloc.dart';
import 'package:ebla/presentations/features/mortagage/blocs/mortgage_grid_kpis_bloc/mortgage_grid_kpis_bloc.dart';
import 'package:ebla/presentations/features/mortagage/blocs/transactions/mortgage_transactions_bloc.dart';
import 'package:ebla/presentations/features/mortagage/widgets/mortgage_grid_widget.dart';
import 'package:ebla/presentations/widgets/widgets.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../domain/models/favourite/favourite_models.dart';
import '../../../domain/models/rent_models/rent_models.dart';
import '../../../utils/global_functions.dart';
import '../../resources/resources.dart';
import '../../widgets/selected_year_widget.dart';
import '../main/blocs/lookup_bloc/lookup_bloc.dart';
import '../main/blocs/main_menu_bloc/main_menu_bloc.dart';
import '../rent/blocs/cubits/change_status_cubit.dart';
import 'widgets/bottom_sheet_filter_mortgage.dart';

class MortgageView extends StatefulWidget {
  const MortgageView({super.key});

  @override
  State<MortgageView> createState() => _MortagageViewState();
}

class _MortagageViewState extends State<MortgageView> {
  late MortgageTransactionsBloc mortgageTransactionsBloc;
  late ChangeStatusCubit changeStatusCubit;
  late MortgageGridKPIsBloc mortgageGridKPIsBloc;

  @override
  void initState() {
    FirebaseAnalytics.instance.logEvent(name: 'open_mortgage_view');
    context.read<LookupBloc>().add(const LookupEvent.getMortgageLookupEvent());
    context.read<MainMenuBloc>().mainMenu != MainMenuResponse()
        ? null
        : context.read<MainMenuBloc>().add(const MainMenuEvent.getMainMenu());
    mortgageTransactionsBloc = instance<MortgageTransactionsBloc>();
    mortgageGridKPIsBloc = instance<MortgageGridKPIsBloc>();
    changeStatusCubit = ChangeStatusCubit();

    super.initState();
  }

  late CriteriaObject criteriaObject;
  getCriteria() {
    if (GoRouterState.of(context).extra != null) {
      criteriaObject = GoRouterState.of(context).extra as CriteriaObject;
      print("i get the criteria");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        listener: (context, LookupState state) {
          state.mapOrNull(
            loadedLookup: (value) {
              if (GoRouterState.of(context).extra != null) {
                getCriteria();
                context.read<MortgageBloc>().setRequestCriteria(criteriaObject);
              }
              mortgageGridKPIsBloc.add(MortgageGridKPIsEvent.getData(
                  request: context.read<MortgageBloc>().requestMeanValue));
              mortgageTransactionsBloc.add(MortgageTransactionsEvent.started(
                  requestMortgageValues:
                      context.read<MortgageBloc>().requestMeanValue));
              List<LookupModel> listMunicipalityWithAll = [];
              listMunicipalityWithAll.addAll(
                  context.read<LookupBloc>().lookUpMortgage?.municipalityList ??
                      []);
              if (!listMunicipalityWithAll.contains(const LookupModel(
                  isActive: true,
                  lookupKey: -1,
                  arName: "الكل",
                  enName: "All",
                  id: -1))) {
                listMunicipalityWithAll.insert(
                    0,
                    const LookupModel(
                        isActive: true,
                        lookupKey: -1,
                        arName: "الكل",
                        enName: "All",
                        id: -1));
              }
              context.read<LookupBloc>().lookUpMortgage =
                  context.read<LookupBloc>().lookUpMortgage?.copyWith(
                        municipalityList: listMunicipalityWithAll,
                      );
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
              return Scaffold(
                appBar: AppBar(
                  surfaceTintColor: Colors.transparent,
                  toolbarHeight: AppSizeH.s50,
                  // Set this height
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
                      // height: 400,
                      fit: BoxFit.fill,
                    ),
                  ),

                  backgroundColor: Colors.transparent,
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () {
                          context
                              .read<LookupBloc>()
                              .add(const LookupEvent.getMortgageLookupEvent());

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
                                                            .read<LookupBloc>()
                                                            .lookUpMortgage
                                                            ?.municipalityList ??
                                                        [],
                                                    context
                                                            .read<
                                                                MortgageBloc>()
                                                            .requestMeanValue
                                                            .municipalityId ??
                                                        4) ??
                                                const LookupModel(),
                                            list: context
                                                    .read<LookupBloc>()
                                                    .lookUpMortgage
                                                    ?.municipalityList ??
                                                [],
                                            onChanged: (municipal) {
                                              context
                                                      .read<MortgageBloc>()
                                                      .requestMeanValue =
                                                  context
                                                      .read<MortgageBloc>()
                                                      .requestMeanValue
                                                      .copyWith(
                                                          offset: 0,
                                                          municipalityId:
                                                              municipal
                                                                  ?.lookupKey,
                                                          areaCode: -1);
                                              changeStatusCubit.changeStatus();
                                              mortgageGridKPIsBloc.add(
                                                  MortgageGridKPIsEvent.getData(
                                                      request: context
                                                          .read<MortgageBloc>()
                                                          .requestMeanValue));
                                              mortgageTransactionsBloc.add(
                                                  MortgageTransactionsEvent.started(
                                                      requestMortgageValues:
                                                          context
                                                              .read<
                                                                  MortgageBloc>()
                                                              .requestMeanValue));
                                            },
                                          ),
                                          SizedBox(width: AppSizeW.s5),
                                          SelectedYearWidget(
                                            value: context
                                                    .read<MortgageBloc>()
                                                    .requestMeanValue
                                                    .issueDateYear ??
                                                DateTime.now().year,
                                            onChanged: (year) {
                                              context
                                                      .read<MortgageBloc>()
                                                      .requestMeanValue =
                                                  context
                                                      .read<MortgageBloc>()
                                                      .requestMeanValue
                                                      .copyWith(
                                                          offset: 0,
                                                          issueDateEndMonth: year ==
                                                                  DateTime.now()
                                                                      .year
                                                              ? DateTime.now()
                                                                  .month
                                                              : 12,
                                                          issueDateYear: year);
                                              changeStatusCubit.changeStatus();
                                              mortgageGridKPIsBloc.add(
                                                  MortgageGridKPIsEvent.getData(
                                                      request: context
                                                          .read<MortgageBloc>()
                                                          .requestMeanValue));
                                              mortgageTransactionsBloc.add(
                                                  MortgageTransactionsEvent.started(
                                                      requestMortgageValues:
                                                          context
                                                              .read<
                                                                  MortgageBloc>()
                                                              .requestMeanValue));
                                            },
                                          ),
                                          SizedBox(width: AppSizeW.s7),
                                          BlocBuilder(
                                            bloc: context.read<LookupBloc>(),
                                            builder:
                                                (context, LookupState state) {
                                              return state.map(
                                                loadingLookup: (value) {
                                                  return Icon(
                                                    Icons.filter_list_sharp,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondaryFixed,
                                                  );
                                                },
                                                loadedLookup: (value) {
                                                  return IconButton(
                                                      onPressed: () async {
                                                        var res =
                                                            await bottomSheetWidget(
                                                          context,
                                                          child:
                                                              MultiBlocProvider(
                                                            providers: [
                                                              BlocProvider.value(
                                                                  value: context
                                                                      .read<
                                                                          MortgageBloc>()),
                                                              BlocProvider.value(
                                                                  value: context
                                                                      .read<
                                                                          LookupBloc>())
                                                            ],
                                                            child:
                                                                const BottomSheetFilterMortgageWidget(),
                                                          ),
                                                        );
                                                        if (res != null &&
                                                            res) {
                                                          changeStatusCubit
                                                              .changeStatus();
                                                          mortgageTransactionsBloc.add(
                                                              MortgageTransactionsEvent.started(
                                                                  requestMortgageValues: context
                                                                      .read<
                                                                          MortgageBloc>()
                                                                      .requestMeanValue));
                                                          mortgageGridKPIsBloc.add(
                                                              MortgageGridKPIsEvent.getData(
                                                                  request: context
                                                                      .read<
                                                                          MortgageBloc>()
                                                                      .requestMeanValue));
                                                        }
                                                      },
                                                      icon: Icon(
                                                        size: AppSizeW.s32,
                                                        Icons.filter_list_sharp,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .secondaryFixed,
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
                                    //                   .read<MortgageBloc>()
                                    //                   .lookUpMortgage
                                    //                   ?.periodTime
                                    //                   .map((e) {
                                    //                 return e.id != 5
                                    //                     ? ChosenPeriodWidget(
                                    //                         periodId: context
                                    //                             .read<
                                    //                                 MortgageBloc>()
                                    //                             .requestMeanValue
                                    //                             .periodId,
                                    //                         id: e.id,
                                    //                         enName: e.enName,
                                    //                         arName: e.arName,
                                    //                       )
                                    //                     : const SizedBox();
                                    //               }).toList() ??
                                    //               [])),
                                    // ),
                                  ]);
                                },
                              ),
                              SizedBox(height: AppSizeH.s5),
                              MessageNoteWidget(
                                  message: getObjectLinkModelById(
                                              context
                                                  .read<MainMenuBloc>()
                                                  .mainMenu
                                                  .mainMenu
                                                  .links,
                                              3)
                                          ?.dataSourceMessage ??
                                      const DataSourceMessageModel()),
                              Column(
                                children: [
                                  Center(
                                    child: Text(
                                      AppStrings.currentPerformanceSummary
                                          .tr(args: [AppStrings().mortgage]),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondaryFixed),
                                    ),
                                  ),
                                  BlocBuilder(
                                    bloc: changeStatusCubit,
                                    builder: (context, state) {
                                      return FiltersApplied(
                                        year: context
                                                .read<MortgageBloc>()
                                                .requestMeanValue
                                                .issueDateYear ??
                                            DateTime.now().year,
                                        municipality: getObjectByLookupKey(
                                                context
                                                        .read<LookupBloc>()
                                                        .lookUpMortgage
                                                        ?.municipalityList ??
                                                    [],
                                                context
                                                        .read<MortgageBloc>()
                                                        .requestMeanValue
                                                        .municipalityId ??
                                                    1) ??
                                            const LookupModel(),
                                        zone: getObjectByLookupKey(
                                                context
                                                        .read<LookupBloc>()
                                                        .lookUpMortgage
                                                        ?.districtList ??
                                                    [],
                                                context
                                                    .read<MortgageBloc>()
                                                    .requestMeanValue
                                                    .areaCode
                                                    .toInt()) ??
                                            const LookupModel(),
                                        propertyPurpose: getObjectByLookupKey(
                                                context
                                                        .read<LookupBloc>()
                                                        .lookUpMortgage
                                                        ?.rentPurposeList ??
                                                    [],
                                                context
                                                        .read<MortgageBloc>()
                                                        .requestMeanValue
                                                        .purposeList?[0] ??
                                                    1) ??
                                            const LookupModel(),
                                        propertyType: getObjectByLookupKey(
                                                context
                                                        .read<LookupBloc>()
                                                        .lookUpMortgage
                                                        ?.propertyTypeList ??
                                                    [],
                                                context
                                                        .read<MortgageBloc>()
                                                        .requestMeanValue
                                                        .propertyTypeList?[0] ??
                                                    1) ??
                                            const LookupModel(lookupKey: -1),
                                        withoutZone: context
                                                .read<MortgageBloc>()
                                                .requestMeanValue
                                                .areaCode ==
                                            -1,
                                      );
                                    },
                                  ),
                                ],
                              ),
                              const GreyLinerContainer(),
                              MultiBlocProvider(
                                providers: [
                                  BlocProvider.value(
                                      value: mortgageGridKPIsBloc),
                                  BlocProvider.value(value: changeStatusCubit),
                                ],
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: AppSizeW.s30),
                                    child: MortgageGrid(
                                      mainAxisSpacing: AppSizeH.s22,
                                      crossAxisSpacing: AppSizeW.s23,
                                    )),
                              ),
                              SizedBox(height: AppSizeH.s20),
                              Column(
                                children: [
                                  Center(
                                    child: Text(
                                      AppStrings().mortgageTransactionsList,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondaryFixed),
                                    ),
                                  ),
                                  BlocBuilder(
                                    bloc: changeStatusCubit,
                                    builder: (context, state) {
                                      return FiltersApplied(
                                        year: context
                                                .read<MortgageBloc>()
                                                .requestMeanValue
                                                .issueDateYear ??
                                            DateTime.now().year,
                                        municipality: getObjectByLookupKey(
                                                context
                                                        .read<LookupBloc>()
                                                        .lookUpMortgage
                                                        ?.municipalityList ??
                                                    [],
                                                context
                                                        .read<MortgageBloc>()
                                                        .requestMeanValue
                                                        .municipalityId ??
                                                    1) ??
                                            const LookupModel(),
                                        zone: getObjectByLookupKey(
                                                context
                                                        .read<LookupBloc>()
                                                        .lookUpMortgage
                                                        ?.districtList ??
                                                    [],
                                                context
                                                    .read<MortgageBloc>()
                                                    .requestMeanValue
                                                    .areaCode
                                                    .toInt()) ??
                                            const LookupModel(),
                                        propertyPurpose: getObjectByLookupKey(
                                                context
                                                        .read<LookupBloc>()
                                                        .lookUpMortgage
                                                        ?.rentPurposeList ??
                                                    [],
                                                context
                                                        .read<MortgageBloc>()
                                                        .requestMeanValue
                                                        .purposeList?[0] ??
                                                    1) ??
                                            const LookupModel(),
                                        propertyType: getObjectByLookupKey(
                                                context
                                                        .read<LookupBloc>()
                                                        .lookUpMortgage
                                                        ?.propertyTypeList ??
                                                    [],
                                                context
                                                        .read<MortgageBloc>()
                                                        .requestMeanValue
                                                        .propertyTypeList?[0] ??
                                                    1) ??
                                            const LookupModel(lookupKey: -1),
                                        withoutZone: context
                                                .read<MortgageBloc>()
                                                .requestMeanValue
                                                .areaCode ==
                                            -1,
                                      );
                                    },
                                  ),
                                ],
                              ),
                              const GreyLinerContainer(),
                              BlocBuilder<MortgageTransactionsBloc,
                                  MortgageTransactionsState>(
                                bloc: mortgageTransactionsBloc,
                                builder: (context, state) => state.when(
                                    initial: () => const SizedBox(),
                                    loading: () => ListView.builder(
                                        itemCount: 5,
                                        shrinkWrap: true,
                                        padding: const EdgeInsets.all(0.0),
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return const ShimmerMainContainer();
                                        }),
                                    done: (done) => ListView.builder(
                                        itemCount:
                                            done.transactionList.length > 5
                                                ? 5
                                                : done.transactionList.length,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        padding: const EdgeInsets.all(0.0),
                                        itemBuilder: (context, index) {
                                          return MainDataContainer(
                                            hasRooms: false,
                                            title: AppStrings().mortgageValue,
                                            totalPrice:
                                                "${done.transactionList[index].realEstateValue?.formatWithCommas()}${AppStrings().currency}",
                                            value: done.transactionList[index]
                                                    .realEstateArea
                                                    ?.formatWithCommas() ??
                                                '0',
                                            valueDescription:
                                                AppStrings().rentArea,
                                            titleInfo: '',
                                            valueInfo: '',
                                            descripton: done
                                                        .transactionList[index]
                                                        .issueDate
                                                        ?.isEmpty ??
                                                    true
                                                ? ""
                                                : DateTime.parse(done
                                                            .transactionList[
                                                                index]
                                                            .issueDate ??
                                                        '')
                                                    .toFormattedString(),
                                            location: context
                                                        .locale ==
                                                    ARABIC_LOCAL
                                                ? getObjectByLookupKey(
                                                            context
                                                                    .read<
                                                                        LookupBloc>()
                                                                    .lookUpMortgage
                                                                    ?.municipalityList ??
                                                                [],
                                                            done
                                                                    .transactionList[
                                                                        index]
                                                                    .municipalityId ??
                                                                0)
                                                        ?.arName ??
                                                    ''
                                                : getObjectByLookupKey(
                                                            context
                                                                    .read<
                                                                        LookupBloc>()
                                                                    .lookUpMortgage
                                                                    ?.municipalityList ??
                                                                [],
                                                            done
                                                                    .transactionList[
                                                                        index]
                                                                    .municipalityId ??
                                                                0)
                                                        ?.enName ??
                                                    '',
                                          );
                                        }),
                                    error: (error) => SizedBox(
                                        height: AppSizeH.s200,
                                        width: AppSizeH.s200,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                                height: AppSizeH.s130,
                                                width: AppSizeH.s130,
                                                child: Lottie.asset(ImageAssets
                                                    .animationError)),
                                            IconButton(
                                                onPressed: () {
                                                  mortgageTransactionsBloc.add(
                                                      MortgageTransactionsEvent.started(
                                                          requestMortgageValues: context
                                                              .read<
                                                                  MortgageBloc>()
                                                              .requestMeanValue));
                                                },
                                                icon: const Icon(Icons.refresh))
                                          ],
                                        ))),
                              ),
                              BlocBuilder<MortgageTransactionsBloc,
                                  MortgageTransactionsState>(
                                bloc: mortgageTransactionsBloc,
                                builder: (context, state) => state.when(
                                  initial: () => Container(),
                                  loading: () => Column(
                                    children: [
                                      FlutterCustomPagination(
                                        currentPage: (context
                                                    .read<MortgageBloc>()
                                                    .requestMeanValue
                                                    .offset ??
                                                0) ~/
                                            (context
                                                    .read<MortgageBloc>()
                                                    .requestMeanValue
                                                    .limit ??
                                                1),
                                        limitPerPage: 5,
                                        totalDataCount: mortgageTransactionsBloc
                                            .response.count,
                                        onPreviousPage: (previousPage) {},
                                        onBackToFirstPage: (firstPage) {},
                                        onNextPage: (nextPage) {},
                                        onGoToLastPage: (lastPage) {},
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
                                  ),
                                  done: (done) {
                                    if (done.transactionList.isEmpty) {
                                      return Text(
                                        AppStrings().noMortgageTransictions,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      );
                                    } else {
                                      return done.count <
                                              (context
                                                      .read<MortgageBloc>()
                                                      .requestMeanValue
                                                      .limit ??
                                                  5)
                                          ? SizedBox(height: AppSizeH.s10)
                                          : Column(
                                              children: [
                                                FlutterCustomPagination(
                                                  currentPage: (context
                                                              .read<
                                                                  MortgageBloc>()
                                                              .requestMeanValue
                                                              .offset ??
                                                          0) ~/
                                                      (context
                                                              .read<
                                                                  MortgageBloc>()
                                                              .requestMeanValue
                                                              .limit ??
                                                          1),
                                                  limitPerPage: context
                                                          .read<MortgageBloc>()
                                                          .requestMeanValue
                                                          .limit ??
                                                      5,
                                                  totalDataCount:
                                                      mortgageTransactionsBloc
                                                          .response.count,
                                                  onPreviousPage:
                                                      (previousPage) {
                                                    context.read<MortgageBloc>().requestMeanValue = context
                                                        .read<MortgageBloc>()
                                                        .requestMeanValue
                                                        .copyWith(
                                                            offset: ((context.read<MortgageBloc>().requestMeanValue.offset ??
                                                                            0) ~/
                                                                        (context.read<MortgageBloc>().requestMeanValue.limit ??
                                                                            1) -
                                                                    1) *
                                                                (context
                                                                        .read<
                                                                            MortgageBloc>()
                                                                        .requestMeanValue
                                                                        .limit ??
                                                                    1));
                                                    mortgageTransactionsBloc.add(
                                                        MortgageTransactionsEvent.started(
                                                            requestMortgageValues: context
                                                                .read<
                                                                    MortgageBloc>()
                                                                .requestMeanValue));
                                                  },
                                                  onBackToFirstPage:
                                                      (firstPage) {
                                                    context
                                                            .read<MortgageBloc>()
                                                            .requestMeanValue =
                                                        context
                                                            .read<
                                                                MortgageBloc>()
                                                            .requestMeanValue
                                                            .copyWith(
                                                                offset: 0);
                                                    mortgageTransactionsBloc.add(
                                                        MortgageTransactionsEvent.started(
                                                            requestMortgageValues: context
                                                                .read<
                                                                    MortgageBloc>()
                                                                .requestMeanValue));
                                                  },
                                                  onNextPage: (nextPage) {
                                                    context.read<MortgageBloc>().requestMeanValue = context
                                                        .read<MortgageBloc>()
                                                        .requestMeanValue
                                                        .copyWith(
                                                            offset: (((context.read<MortgageBloc>().requestMeanValue.offset ??
                                                                            0) ~/
                                                                        (context.read<MortgageBloc>().requestMeanValue.limit ??
                                                                            1) +
                                                                    1) *
                                                                (context
                                                                        .read<
                                                                            MortgageBloc>()
                                                                        .requestMeanValue
                                                                        .limit ??
                                                                    1)));
                                                    mortgageTransactionsBloc.add(
                                                        MortgageTransactionsEvent.started(
                                                            requestMortgageValues: context
                                                                .read<
                                                                    MortgageBloc>()
                                                                .requestMeanValue));
                                                  },
                                                  onGoToLastPage: (lastPage) {
                                                    context.read<MortgageBloc>().requestMeanValue = context.read<MortgageBloc>().requestMeanValue.copyWith(
                                                        offset: (((mortgageTransactionsBloc
                                                                        .response
                                                                        .count) %
                                                                    (context.read<MortgageBloc>().requestMeanValue.limit ??
                                                                        1)) ==
                                                                0
                                                            ? mortgageTransactionsBloc
                                                                    .response
                                                                    .count -
                                                                (context.read<MortgageBloc>().requestMeanValue.limit ??
                                                                    5)
                                                            : ((mortgageTransactionsBloc
                                                                        .response
                                                                        .count) ~/
                                                                    (context.read<MortgageBloc>().requestMeanValue.limit ??
                                                                        1)) *
                                                                (context
                                                                        .read<MortgageBloc>()
                                                                        .requestMeanValue
                                                                        .limit ??
                                                                    1)));
                                                    mortgageTransactionsBloc.add(
                                                        MortgageTransactionsEvent.started(
                                                            requestMortgageValues: context
                                                                .read<
                                                                    MortgageBloc>()
                                                                .requestMeanValue));
                                                  },
                                                  backgroundColor:
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .surface,
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
                                                SizedBox(height: AppSizeH.s10)
                                              ],
                                            );
                                    }
                                  },
                                  error: (error) => const SizedBox(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            errorLookUp: (value) {
              return ErrorGlobalWidget(
                message: value.message,
                onPressed: () {
                  context
                      .read<LookupBloc>()
                      .add(const LookupEvent.getMortgageLookupEvent());
                },
              );
            },
          );
        });
  }
}
