// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/app/extensions.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/presentations/features/main/blocs/lookup_bloc/lookup_bloc.dart';
import 'package:ebla/presentations/features/main/blocs/main_menu_bloc/main_menu_bloc.dart';
import 'package:ebla/presentations/features/rent/rents.dart';
import 'package:ebla/presentations/widgets/selected_year_widget.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../app/depndency_injection.dart';
import '../../../domain/models/cms_models/main_menu_models/main_menu_models.dart';
import '../../../domain/models/favourite/favourite_models.dart';
import '../../../utils/global_functions.dart';
import '../../resources/resources.dart';
import '../../widgets/widgets.dart';

class RentView extends StatefulWidget {
  const RentView({super.key});

  @override
  State<RentView> createState() => _RentViewState();
}

class _RentViewState extends State<RentView> {
  late RentGridKPIsBloc rentGridKPIsBloc;
  late RentSummeryBloc rentSummeryBloc;
  late RentDefaultBloc rentDefaultBloc;
  late CertificateContractBloc certificateContractBloc;
  late ChangeStatusCubit changeStatusCubit;

  late CriteriaObject criteriaObject;
  getCriteria() {
    if (GoRouterState.of(context).extra != null) {
      criteriaObject = GoRouterState.of(context).extra as CriteriaObject;
      if (kDebugMode) {
        print("i get the criteria");
      }
    }
  }

  @override
  void initState() {
    FirebaseAnalytics.instance.logEvent(name: 'open_rent_view');
    context.read<LookupBloc>().add(const LookupEvent.getRentLookupEvent());
    context.read<MainMenuBloc>().mainMenu != MainMenuResponse()
        ? null
        : context.read<MainMenuBloc>().add(const MainMenuEvent.getMainMenu());
    // rentDefaultBloc = instance<RentDefaultBloc>()
    //   ..add(RentDefaultEvent.started(
    //       request: context.read<RentBloc>().requestDefault));
    rentGridKPIsBloc = instance<RentGridKPIsBloc>();
    rentSummeryBloc = instance<RentSummeryBloc>();
    certificateContractBloc = instance<CertificateContractBloc>();
    changeStatusCubit = ChangeStatusCubit();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer(
        listener: (context, LookupState state) {
          state.mapOrNull(
            loadedLookup: (value) {
              if (GoRouterState.of(context).extra != null) {
                getCriteria();
                context.read<RentBloc>().setRequestCriteria(criteriaObject);
              }
              // rentDefaultBloc.add(RentDefaultEvent.started(
              //     request: context.read<RentBloc>().requestMeanValue));
              rentGridKPIsBloc.add(RentGridKPIsEvent.getData(
                  request: context.read<RentBloc>().requestMeanValue));
              rentSummeryBloc.add(RentSummeryEvent.getRentSummary(
                  request: context.read<RentBloc>().requestMeanValue));
              certificateContractBloc.add(
                  CertificateContractEvent.certificateCountEvent(
                      request: context.read<RentBloc>().requestMeanValue));
              List<LookupModel> listMunicipalityWithAll = [];
              listMunicipalityWithAll.addAll(
                  context.read<LookupBloc>().lookUpRent?.municipalityList ??
                      []);
              if (!listMunicipalityWithAll.contains(const LookupModel(
                  isActive: true,
                  lookupKey: -1,
                  arName: "الكل",
                  enName: "All",
                  id: -1,
                  value: 0,
                  selected: false,
                  yoy: 0,
                  hasPrice: false,
                  municipalityId: -1))) {
                listMunicipalityWithAll.insert(
                    0,
                    const LookupModel(
                        isActive: true,
                        lookupKey: -1,
                        arName: "الكل",
                        enName: "All",
                        id: -1,
                        value: 0,
                        selected: false,
                        yoy: 0,
                        hasPrice: false,
                        municipalityId: -1));
              }
              context.read<LookupBloc>().lookUpRent = context
                  .read<LookupBloc>()
                  .lookUpRent
                  ?.copyWith(municipalityList: listMunicipalityWithAll);
            },
          );

          // if (state.rentLookup != const RentLookupResponse()) {
          //   // rentDefaultBloc.add(RentDefaultEvent.started(
          //   //     request: context.read<RentBloc>().requestMeanValue));
          //   rentGridKPIsBloc.add(RentGridKPIsEvent.getData(
          //       request: context.read<RentBloc>().requestMeanValue));
          //   rentSummeryBloc.add(RentSummeryEvent.getRentSummary(
          //       request: context.read<RentBloc>().requestMeanValue));
          //   certificateContractBloc.add(
          //       CertificateContractEvent.certificateCountEvent(
          //           request: context.read<RentBloc>().requestMeanValue));
          // }
        },
        bloc: context.read<LookupBloc>(),
        builder: (context, LookupState state) {
          return state.map(
            loadingLookup: (value) => const AnimatedPulesLogo(),
            loadedLookup: (value) {
              return Column(
                children: [
                  ShaderMask(
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
                        context
                            .read<LookupBloc>()
                            .add(const LookupEvent.getRentLookupEvent());
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
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(width: AppSizeW.s16),
                                        SelectedMunicipality(
                                          list: context
                                                  .read<LookupBloc>()
                                                  .lookUpRent
                                                  ?.municipalityList ??
                                              [],
                                          value: getObjectById(
                                                  context
                                                          .read<LookupBloc>()
                                                          .lookUpRent
                                                          ?.municipalityList ??
                                                      [],
                                                  context
                                                          .read<RentBloc>()
                                                          .requestMeanValue
                                                          .municipalityId ??
                                                      1) ??
                                              const LookupModel(),
                                          onChanged: (municipal) {
                                            context
                                                    .read<RentBloc>()
                                                    .requestMeanValue =
                                                context
                                                    .read<RentBloc>()
                                                    .requestMeanValue
                                                    .copyWith(
                                                        offset: 0,
                                                        municipalityId:
                                                            municipal
                                                                ?.lookupKey,
                                                        areaCode: -1);
                                            changeStatusCubit.changeStatus();
                                            rentGridKPIsBloc.add(
                                                RentGridKPIsEvent.getData(
                                                    request: context
                                                        .read<RentBloc>()
                                                        .requestMeanValue));
                                            rentSummeryBloc.add(
                                                RentSummeryEvent.getRentSummary(
                                              request: context
                                                  .read<RentBloc>()
                                                  .requestMeanValue,
                                            ));
                                            certificateContractBloc.add(
                                                CertificateContractEvent
                                                    .certificateCountEvent(
                                                        request: context
                                                            .read<RentBloc>()
                                                            .requestMeanValue));
                                          },
                                        ),
                                        SizedBox(width: AppSizeW.s5),
                                        SelectedYearWidget(
                                          value: context
                                                  .read<RentBloc>()
                                                  .requestMeanValue
                                                  .issueDateYear ??
                                              DateTime.now().year,
                                          onChanged: (year) {
                                            context
                                                    .read<RentBloc>()
                                                    .requestMeanValue =
                                                context
                                                    .read<RentBloc>()
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
                                            rentGridKPIsBloc.add(
                                                RentGridKPIsEvent.getData(
                                                    request: context
                                                        .read<RentBloc>()
                                                        .requestMeanValue));
                                            rentSummeryBloc.add(
                                                RentSummeryEvent.getRentSummary(
                                              request: context
                                                  .read<RentBloc>()
                                                  .requestMeanValue,
                                            ));
                                            certificateContractBloc.add(
                                                CertificateContractEvent
                                                    .certificateCountEvent(
                                                        request: context
                                                            .read<RentBloc>()
                                                            .requestMeanValue));
                                          },
                                          isRent: true,
                                        ),
                                        SizedBox(width: AppSizeW.s7),
                                        BlocBuilder(
                                          bloc: context.read<LookupBloc>(),
                                          builder:
                                              (context, LookupState state) {
                                            return state.map(
                                              errorLookUp: (value) => Icon(
                                                Icons.filter_list_sharp,
                                                color: ColorManager.golden,
                                              ),
                                              loadingLookup: (value) => Icon(
                                                Icons.filter_list_sharp,
                                                color: ColorManager.golden,
                                              ),
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
                                                                value: context.read<
                                                                    RentBloc>()),
                                                            BlocProvider.value(
                                                                value: context.read<
                                                                    LookupBloc>()),
                                                          ],
                                                          child:
                                                              const BottomSheetFilterWidget(),
                                                        ),
                                                      );
                                                      if (res != null && res) {
                                                        changeStatusCubit
                                                            .changeStatus();

                                                        rentGridKPIsBloc.add(
                                                            RentGridKPIsEvent.getData(
                                                                request: context
                                                                    .read<
                                                                        RentBloc>()
                                                                    .requestMeanValue));
                                                        rentSummeryBloc.add(
                                                            RentSummeryEvent
                                                                .getRentSummary(
                                                          request: context
                                                              .read<RentBloc>()
                                                              .requestMeanValue,
                                                        ));
                                                        certificateContractBloc
                                                            .add(
                                                          CertificateContractEvent
                                                              .certificateCountEvent(
                                                                  request: context
                                                                      .read<
                                                                          RentBloc>()
                                                                      .requestMeanValue),
                                                        );
                                                      }
                                                    },
                                                    icon: Icon(
                                                      size: AppSizeW.s32,
                                                      Icons.filter_list_sharp,
                                                      color:
                                                          ColorManager.golden,
                                                    ));
                                              },
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          width: AppSizeW.s7,
                                        ),
                                      ]),
                                ]);
                              },
                            ),
                            // SizedBox(height: AppSizeH.s22),
                            SizedBox(height: AppSizeH.s5),
                            BlocBuilder(
                              bloc: context.read<MainMenuBloc>(),
                              builder: (context, state) {
                                return MessageNoteWidget(
                                    message: getObjectLinkModelById(
                                                context
                                                    .read<MainMenuBloc>()
                                                    .mainMenu
                                                    .mainMenu
                                                    .links,
                                                4)
                                            ?.dataSourceMessage ??
                                        const DataSourceMessageModel());
                              },
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    AppStrings.currentPerformanceSummary
                                        .tr(args: [AppStrings().rental]),
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                BlocBuilder(
                                  bloc: changeStatusCubit,
                                  builder: (context, state) {
                                    return FiltersApplied(
                                      year: context
                                              .read<RentBloc>()
                                              .requestMeanValue
                                              .issueDateYear ??
                                          DateTime.now().year,
                                      municipality: getObjectByLookupKey(
                                              context
                                                      .read<LookupBloc>()
                                                      .lookUpRent
                                                      ?.municipalityList ??
                                                  [],
                                              context
                                                      .read<RentBloc>()
                                                      .requestMeanValue
                                                      .municipalityId ??
                                                  1) ??
                                          const LookupModel(),
                                      zone: getObjectByLookupKey(
                                              context
                                                      .read<LookupBloc>()
                                                      .lookUpRent
                                                      ?.districtList ??
                                                  [],
                                              context
                                                      .read<RentBloc>()
                                                      .requestMeanValue
                                                      .areaCode
                                                      ?.toInt() ??
                                                  -1) ??
                                          const LookupModel(),
                                      propertyPurpose: getObjectByLookupKey(
                                              context
                                                      .read<LookupBloc>()
                                                      .lookUpRent
                                                      ?.rentPurposeList ??
                                                  [],
                                              context
                                                      .read<RentBloc>()
                                                      .requestMeanValue
                                                      .purposeList?[0] ??
                                                  1) ??
                                          const LookupModel(),
                                      propertyType: getObjectByLookupKey(
                                              context
                                                      .read<LookupBloc>()
                                                      .lookUpRent
                                                      ?.propertyTypeList ??
                                                  [],
                                              context
                                                      .read<RentBloc>()
                                                      .requestMeanValue
                                                      .propertyTypeList?[0] ??
                                                  1) ??
                                          const LookupModel(),
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
                                itemsCount: 4,
                                rightSectionTopPadding: AppSizeH.s17,
                                mainAxisSpacing: AppSizeH.s22,
                                crossAxisSpacing: AppSizeW.s23,
                                gridItemChildBuilder: (context, index) {
                                  return MultiBlocProvider(
                                    providers: [
                                      BlocProvider.value(
                                          value: rentGridKPIsBloc),
                                      BlocProvider.value(
                                          value: changeStatusCubit),
                                      BlocProvider.value(
                                          value: context.read<RentBloc>()),
                                    ],
                                    child: GridItemWidget(
                                      gridItemType: GridItemType.rent,
                                      defaultResponse: RentDefault(),
                                      rentKPI: RentGridKPIs.values[index],
                                      mortgageKPI: null,
                                      sellKPI: null,
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
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                BlocBuilder(
                                  bloc: changeStatusCubit,
                                  builder: (context, state) {
                                    return FiltersApplied(
                                      withoutZone: true,
                                      year: context
                                              .read<RentBloc>()
                                              .requestMeanValue
                                              .issueDateYear ??
                                          DateTime.now().year,
                                      municipality: getObjectByLookupKey(
                                              context
                                                      .read<LookupBloc>()
                                                      .lookUpRent
                                                      ?.municipalityList ??
                                                  [],
                                              context
                                                      .read<RentBloc>()
                                                      .requestMeanValue
                                                      .municipalityId ??
                                                  1) ??
                                          const LookupModel(),
                                      zone: getObjectByLookupKey(
                                              context
                                                      .read<LookupBloc>()
                                                      .lookUpRent
                                                      ?.districtList ??
                                                  [],
                                              context
                                                      .read<RentBloc>()
                                                      .requestMeanValue
                                                      .areaCode ??
                                                  1) ??
                                          const LookupModel(),
                                      propertyPurpose: getObjectByLookupKey(
                                              context
                                                      .read<LookupBloc>()
                                                      .lookUpRent
                                                      ?.rentPurposeList ??
                                                  [],
                                              context
                                                      .read<RentBloc>()
                                                      .requestMeanValue
                                                      .purposeList?[0] ??
                                                  1) ??
                                          const LookupModel(),
                                      propertyType: getObjectByLookupKey(
                                              context
                                                      .read<LookupBloc>()
                                                      .lookUpRent
                                                      ?.propertyTypeList ??
                                                  [],
                                              context
                                                      .read<RentBloc>()
                                                      .requestMeanValue
                                                      .propertyTypeList?[0] ??
                                                  1) ??
                                          const LookupModel(),
                                    );
                                  },
                                ),
                              ],
                            ),
                            const GreyLinerContainer(),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppSizeW.s20),
                              child: BlocProvider.value(
                                value: certificateContractBloc,
                                child: StatisTicsWidget(
                                  title: AppStrings().countLeaseContracts,
                                ),
                              ),
                            ),
                            SizedBox(height: AppSizeH.s20),
                            Column(
                              children: [
                                Center(
                                  child: Text(
                                    AppStrings().rentContractList,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                BlocBuilder(
                                  bloc: changeStatusCubit,
                                  builder: (context, state) {
                                    return FiltersApplied(
                                      year: context
                                              .read<RentBloc>()
                                              .requestMeanValue
                                              .issueDateYear ??
                                          DateTime.now().year,
                                      municipality: getObjectByLookupKey(
                                              context
                                                      .read<LookupBloc>()
                                                      .lookUpRent
                                                      ?.municipalityList ??
                                                  [],
                                              context
                                                      .read<RentBloc>()
                                                      .requestMeanValue
                                                      .municipalityId ??
                                                  1) ??
                                          const LookupModel(),
                                      zone: getObjectByLookupKey(
                                              context
                                                      .read<LookupBloc>()
                                                      .lookUpRent
                                                      ?.districtList ??
                                                  [],
                                              context
                                                      .read<RentBloc>()
                                                      .requestMeanValue
                                                      .areaCode ??
                                                  -1) ??
                                          const LookupModel(),
                                      propertyPurpose: getObjectByLookupKey(
                                              context
                                                      .read<LookupBloc>()
                                                      .lookUpRent
                                                      ?.rentPurposeList ??
                                                  [],
                                              context
                                                      .read<RentBloc>()
                                                      .requestMeanValue
                                                      .purposeList?[0] ??
                                                  1) ??
                                          const LookupModel(),
                                      propertyType: getObjectByLookupKey(
                                              context
                                                      .read<LookupBloc>()
                                                      .lookUpRent
                                                      ?.propertyTypeList ??
                                                  [],
                                              context
                                                      .read<RentBloc>()
                                                      .requestMeanValue
                                                      .propertyTypeList?[0] ??
                                                  1) ??
                                          const LookupModel(),
                                    );
                                  },
                                ),
                              ],
                            ),
                            const GreyLinerContainer(),
                            BlocBuilder<RentSummeryBloc, RentSummeryState>(
                              bloc: rentSummeryBloc,
                              builder: (context, state) {
                                if (state.isLoadingRentSummery) {
                                  return ListView.builder(
                                      itemCount: 5,
                                      padding: const EdgeInsets.all(0.0),
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return const ShimmerMainRentDataContainer();
                                      });
                                }
                                if (state.rentSummery !=
                                    const RentListSummary()) {
                                  return ListView.builder(
                                      itemCount: state.rentSummery
                                                  .transactionList.length >
                                              5
                                          ? 5
                                          : state.rentSummery.transactionList
                                              .length,
                                      shrinkWrap: true,
                                      padding: const EdgeInsets.all(0.0),
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return MainRentDataContainer(
                                          title: AppStrings().rentValue,
                                          contract: context.locale ==
                                                  ARABIC_LOCAL
                                              ? getObjectByLookupKey(
                                                          context
                                                                  .read<
                                                                      LookupBloc>()
                                                                  .lookUpRent
                                                                  ?.serviceTypeList ??
                                                              [],
                                                          state
                                                                  .rentSummery
                                                                  .transactionList[
                                                                      index]
                                                                  .serviceTypeId ??
                                                              0)
                                                      ?.arName ??
                                                  ''
                                              : getObjectByLookupKey(
                                                          context
                                                                  .read<
                                                                      LookupBloc>()
                                                                  .lookUpRent
                                                                  ?.serviceTypeList ??
                                                              [],
                                                          state
                                                                  .rentSummery
                                                                  .transactionList[
                                                                      index]
                                                                  .serviceTypeId ??
                                                              0)
                                                      ?.enName ??
                                                  '',
                                          totalPrice:
                                              "${state.rentSummery.transactionList[index].rentPaymentMonthly?.formatWithCommasToInt()} ${AppStrings().currency}",
                                          titleInfo:
                                              "${AppStrings().roomsCount}:",
                                          valueInfo: state
                                                      .rentSummery
                                                      .transactionList[index]
                                                      .bedRoomsCount ==
                                                  0
                                              ? AppStrings().unspecified
                                              : state
                                                      .rentSummery
                                                      .transactionList[index]
                                                      .bedRoomsCount
                                                      ?.toStringAsFixed(0) ??
                                                  AppStrings().unspecified,
                                          location: context.locale ==
                                                  ARABIC_LOCAL
                                              ? getObjectByLookupKey(
                                                          context
                                                                  .read<
                                                                      LookupBloc>()
                                                                  .lookUpRent
                                                                  ?.municipalityList ??
                                                              [],
                                                          state
                                                                  .rentSummery
                                                                  .transactionList[
                                                                      index]
                                                                  .municipalityid ??
                                                              0)
                                                      ?.arName ??
                                                  ''
                                              : getObjectByLookupKey(
                                                          context
                                                                  .read<
                                                                      LookupBloc>()
                                                                  .lookUpRent
                                                                  ?.municipalityList ??
                                                              [],
                                                          state
                                                                  .rentSummery
                                                                  .transactionList[
                                                                      index]
                                                                  .municipalityid ??
                                                              0)
                                                      ?.enName ??
                                                  '',
                                          descripton: getUnitName(state
                                                  .rentSummery
                                                  .transactionList[index]
                                                  .propertyTypeId ??
                                              0),
                                          startDate: state
                                                      .rentSummery
                                                      .transactionList[index]
                                                      .startDate
                                                      ?.isNotEmpty ??
                                                  false
                                              ? DateTime.parse(state
                                                          .rentSummery
                                                          .transactionList[
                                                              index]
                                                          .startDate ??
                                                      '')
                                                  .toFormattedString()
                                              : "",
                                          endDate: state
                                                      .rentSummery
                                                      .transactionList[index]
                                                      .endDate
                                                      ?.isNotEmpty ??
                                                  false
                                              ? DateTime.parse(state
                                                          .rentSummery
                                                          .transactionList[
                                                              index]
                                                          .endDate ??
                                                      '')
                                                  .toFormattedString()
                                              : "",
                                          // history: '',
                                          history: DateTime.parse(state
                                                      .rentSummery
                                                      .transactionList[index]
                                                      .issueDate ??
                                                  '')
                                              .toFormattedString(),
                                        );
                                      });
                                }
                                if (state.isHasErrorRentSummery) {
                                  return SizedBox(
                                      height: AppSizeH.s200,
                                      width: AppSizeH.s200,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                              height: AppSizeH.s130,
                                              width: AppSizeH.s130,
                                              child: Lottie.asset(
                                                  ImageAssets.animationError)),
                                          IconButton(
                                              onPressed: () {
                                                rentSummeryBloc.add(
                                                    RentSummeryEvent.getRentSummary(
                                                        request: context
                                                            .read<RentBloc>()
                                                            .requestMeanValue));
                                              },
                                              icon: const Icon(Icons.refresh))
                                        ],
                                      ));
                                }
                                return const SizedBox();
                              },
                            ),
                            BlocBuilder(
                              bloc: rentSummeryBloc,
                              builder: (context, RentSummeryState state) {
                                if (state.isLoadingRentSummery) {
                                  return Column(
                                    children: [
                                      FlutterCustomPagination(
                                        currentPage: (context
                                                    .read<RentBloc>()
                                                    .requestMeanValue
                                                    .offset ??
                                                0) ~/
                                            (context
                                                    .read<RentBloc>()
                                                    .requestMeanValue
                                                    .limit ??
                                                1),
                                        limitPerPage: 5,
                                        totalDataCount: rentSummeryBloc
                                                .rentSummery?.count ??
                                            0,
                                        onPreviousPage: (previousPage) {},
                                        onBackToFirstPage: (firstPage) {},
                                        onNextPage: (nextPage) {},
                                        onGoToLastPage: (lastPage) {},
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .surface,
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
                                  );
                                }
                                if (state.isEmptyRentSummery) {
                                  return Column(
                                    children: [
                                      Text(
                                        AppStrings().noRentContracts,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                      // IconButton(
                                      //     onPressed: () {
                                      //       context
                                      //               .read<RentBloc>()
                                      //               .requestMeanValue =
                                      //           context
                                      //               .read<RentBloc>()
                                      //               .requestMeanValue
                                      //               .copyWith(offset: 0);
                                      //       rentSummeryBloc.add(
                                      //           RentSummeryEvent.getRentSummary(
                                      //               request: context
                                      //                   .read<RentBloc>()
                                      //                   .requestMeanValue));
                                      //     },
                                      //     icon: const Icon(Icons.refresh))
                                    ],
                                  );
                                }
                                if (state.rentSummery !=
                                    const RentListSummary()) {
                                  return state.rentSummery.count <
                                          (context
                                                  .read<RentBloc>()
                                                  .requestMeanValue
                                                  .limit ??
                                              4)
                                      ? SizedBox(height: AppSizeH.s10)
                                      : Column(
                                          children: [
                                            FlutterCustomPagination(
                                              currentPage: (context
                                                          .read<RentBloc>()
                                                          .requestMeanValue
                                                          .offset ??
                                                      0) ~/
                                                  (context
                                                          .read<RentBloc>()
                                                          .requestMeanValue
                                                          .limit ??
                                                      1),
                                              limitPerPage: context
                                                      .read<RentBloc>()
                                                      .requestMeanValue
                                                      .limit ??
                                                  5,
                                              totalDataCount: state
                                                  .rentSummery.count
                                                  .ceil(),
                                              onPreviousPage: (previousPage) {
                                                context.read<RentBloc>().requestMeanValue = context
                                                    .read<RentBloc>()
                                                    .requestMeanValue
                                                    .copyWith(
                                                        offset: ((context
                                                                            .read<
                                                                                RentBloc>()
                                                                            .requestMeanValue
                                                                            .offset ??
                                                                        0) ~/
                                                                    (context
                                                                            .read<
                                                                                RentBloc>()
                                                                            .requestMeanValue
                                                                            .limit ??
                                                                        1) -
                                                                1) *
                                                            (context
                                                                    .read<
                                                                        RentBloc>()
                                                                    .requestMeanValue
                                                                    .limit ??
                                                                1));
                                                rentSummeryBloc.add(
                                                    RentSummeryEvent.getRentSummary(
                                                        request: context
                                                            .read<RentBloc>()
                                                            .requestMeanValue));
                                              },
                                              onBackToFirstPage: (firstPage) {
                                                context
                                                        .read<RentBloc>()
                                                        .requestMeanValue =
                                                    context
                                                        .read<RentBloc>()
                                                        .requestMeanValue
                                                        .copyWith(offset: 0);
                                                rentSummeryBloc.add(
                                                    RentSummeryEvent.getRentSummary(
                                                        request: context
                                                            .read<RentBloc>()
                                                            .requestMeanValue));
                                              },
                                              onNextPage: (nextPage) {
                                                context.read<RentBloc>().requestMeanValue = context
                                                    .read<RentBloc>()
                                                    .requestMeanValue
                                                    .copyWith(
                                                        offset: (((context
                                                                            .read<
                                                                                RentBloc>()
                                                                            .requestMeanValue
                                                                            .offset ??
                                                                        0) ~/
                                                                    (context
                                                                            .read<
                                                                                RentBloc>()
                                                                            .requestMeanValue
                                                                            .limit ??
                                                                        1) +
                                                                1) *
                                                            (context
                                                                    .read<
                                                                        RentBloc>()
                                                                    .requestMeanValue
                                                                    .limit ??
                                                                1)));
                                                rentSummeryBloc.add(
                                                    RentSummeryEvent.getRentSummary(
                                                        request: context
                                                            .read<RentBloc>()
                                                            .requestMeanValue));
                                              },
                                              onGoToLastPage: (lastPage) {
                                                context.read<RentBloc>().requestMeanValue = context
                                                    .read<RentBloc>()
                                                    .requestMeanValue
                                                    .copyWith(
                                                        offset: (((state.rentSummery
                                                                        .count) %
                                                                    (context.read<RentBloc>().requestMeanValue.limit ??
                                                                        1)) ==
                                                                0
                                                            ? state.rentSummery.count -
                                                                (context.read<RentBloc>().requestMeanValue.limit ??
                                                                    5)
                                                            : ((state.rentSummery
                                                                        .count) ~/
                                                                    (context.read<RentBloc>().requestMeanValue.limit ??
                                                                        1)) *
                                                                (context
                                                                        .read<RentBloc>()
                                                                        .requestMeanValue
                                                                        .limit ??
                                                                    1)));
                                                rentSummeryBloc.add(
                                                    RentSummeryEvent.getRentSummary(
                                                        request: context
                                                            .read<RentBloc>()
                                                            .requestMeanValue));
                                              },
                                              backgroundColor: Theme.of(context)
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
                                              nextPageIcon: context.locale ==
                                                      ARABIC_LOCAL
                                                  ? Icons
                                                      .keyboard_arrow_left_sharp
                                                  : Icons
                                                      .keyboard_arrow_right_sharp,
                                              goToLastPageIcon: Icons.last_page,
                                            ),
                                            SizedBox(height: AppSizeH.s10)
                                          ],
                                        );
                                }
                                return const SizedBox();
                              },
                            ),
                            SizedBox(height: AppSizeH.s20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            errorLookUp: (value) => ErrorGlobalWidget(
              message: value.message,
              onPressed: () {
                context
                    .read<LookupBloc>()
                    .add(const LookupEvent.getRentLookupEvent());
              },
            ),
          );
        },
      ),
    );
  }

  String getUnitName(int id) {
    if (context.locale == ARABIC_LOCAL) {
      return "${AppStrings().unitType}: ${getObjectByLookupKey(context.read<LookupBloc>().lookUpRent?.propertyTypeList ?? [], id)?.arName ?? ''}";
    } else {
      return "${AppStrings().unitType}: ${getObjectByLookupKey(context.read<LookupBloc>().lookUpRent?.propertyTypeList ?? [], id)?.enName ?? ''}";
    }
  }
}
