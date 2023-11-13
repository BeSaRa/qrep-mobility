// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/app/extensions.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/presentations/features/rent/blocs/cubits/cubit/change_status_cubit.dart';
import 'package:ebla/presentations/features/rent/blocs/rent_bloc/rent_bloc.dart';
import 'package:ebla/presentations/features/rent/blocs/rent_bloc/rent_grid_kpis_bloc/rent_grid_kpis_bloc.dart';
import 'package:ebla/presentations/features/rent/blocs/summery_bloc/rent_summery_bloc.dart';
import 'package:ebla/presentations/widgets/selected_year_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../app/depndency_injection.dart';
import '../../../utils/global_functions.dart';
import '../../resources/resources.dart';
import '../../widgets/grid/grid_item_widget.dart';
import '../../widgets/pagination_widget/pagination_widget.dart';
import '../../widgets/selected_municipality_widget.dart';
import '../../widgets/widgets.dart';
import 'blocs/certificate_contract_bloc/certificate_contract_bloc.dart';
import 'blocs/default_bloc/rent_default_bloc.dart';
import 'widgets/main_container_rent.dart';
import 'widgets/statistics_rent_widget.dart';

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

  @override
  void initState() {
    rentDefaultBloc = instance<RentDefaultBloc>()
      ..add(RentDefaultEvent.started(
          request: context.read<RentBloc>().requestDefault));
    rentGridKPIsBloc = instance<RentGridKPIsBloc>();
    rentSummeryBloc = instance<RentSummeryBloc>();
    certificateContractBloc = instance<CertificateContractBloc>();
    changeStatusCubit = ChangeStatusCubit();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('test rent ');
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener(
        bloc: context.read<RentBloc>(),
        listener: (context, RentState state) {
          if (state.rentLookup != const RentLookupResponse()) {
            // rentDefaultBloc.add(RentDefaultEvent.started(
            //     request: context.read<RentBloc>().requestMeanValue));
            rentGridKPIsBloc.add(RentGridKPIsEvent.getData(
                request: context.read<RentBloc>().requestMeanValue));
            rentSummeryBloc.add(RentSummeryEvent.getRentSummary(
                request: context.read<RentBloc>().requestMeanValue));
            certificateContractBloc.add(
                CertificateContractEvent.certificateCountEvent(
                    request: context.read<RentBloc>().requestMeanValue));
          }
        },
        child: BlocBuilder(
          bloc: context.read<RentBloc>(),
          builder: (context, RentState state) {
            if (state.isLoadingRentLookup) {
              return const AnimatedPulesLogo();
            }
            if (state.isHasErrorRentLookup) {
              return ErrorGlobalWidget(
                message: state.errorMessageRentLookup,
                onPressed: () {
                  context
                      .read<RentBloc>()
                      .add(const RentEvent.getRentLookupEvent());
                },
              );
            }
            return BlocConsumer<RentDefaultBloc, RentDefaultState>(
              bloc: rentDefaultBloc,
              builder: (context, state) => state.when(
                initial: () => const AnimatedPulesLogo(),
                success: (RentDefault response) => Column(
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
                              .read<RentBloc>()
                              .add(const RentEvent.getRentLookupEvent());
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
                                            list: context
                                                    .read<RentBloc>()
                                                    .loockUpRent
                                                    ?.municipalityList ??
                                                [],
                                            value: getObjectById(
                                                    context
                                                            .read<RentBloc>()
                                                            .loockUpRent
                                                            ?.municipalityList ??
                                                        [],
                                                    context
                                                            .read<RentBloc>()
                                                            .requestMeanValue
                                                            .municipalityId ??
                                                        1) ??
                                                const RentLookupModel(),
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
                                                          zoneId: -1);
                                              changeStatusCubit.changeStatus();
                                              rentGridKPIsBloc.add(
                                                  RentGridKPIsEvent.getData(
                                                      request: context
                                                          .read<RentBloc>()
                                                          .requestMeanValue));
                                              rentSummeryBloc.add(
                                                  RentSummeryEvent
                                                      .getRentSummary(
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
                                                  RentSummeryEvent
                                                      .getRentSummary(
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
                                          SizedBox(width: AppSizeW.s7),
                                          BlocBuilder(
                                            bloc: context.read<RentBloc>(),
                                            builder:
                                                (context, RentState state) {
                                              if (state.isLoadingRentLookup) {
                                                return Icon(
                                                  Icons.filter_list_sharp,
                                                  color: ColorManager.golden,
                                                );
                                              }
                                              return IconButton(
                                                  onPressed: () async {
                                                    var res =
                                                        await bottomSheetWidget(
                                                      context,
                                                      child: BlocProvider.value(
                                                        value: context
                                                            .read<RentBloc>(),
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
                                                    color: ColorManager.golden,
                                                  ));
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
                                    //                   .read<RentBloc>()
                                    //                   .loockUpRent
                                    //                   ?.periodTime
                                    //                   .map((e) {
                                    //                 return e.id != 5
                                    //                     ? ChosenPeriodWidget(
                                    //                         periodId: context
                                    //                             .read<
                                    //                                 RentBloc>()
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
                              SizedBox(height: AppSizeH.s22),
                              Center(
                                child: Text(
                                  AppStrings().currentPerformanceSummary,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
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
                                  gridItemChildBuilder: (context, index) {
                                    return MultiBlocProvider(
                                      providers: [
                                        BlocProvider.value(
                                            value: rentGridKPIsBloc),
                                        BlocProvider.value(
                                            value: changeStatusCubit),
                                      ],
                                      child: GridItemWidget(
                                        gridItemType: GridItemType.rent,
                                        defaultResponse: response,
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
                              Center(
                                child: Text(
                                  AppStrings().rentTopTen,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
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
                              Center(
                                child: Text(
                                  AppStrings().rentContractList,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                              const GreyLinerContainer(),
                              BlocBuilder<RentSummeryBloc, RentSummeryState>(
                                bloc: rentSummeryBloc,
                                builder: (context, state) {
                                  if (state.isLoadingRentSummery) {
                                    return ListView.builder(
                                        itemCount: 3,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return const ShimmerMainRentDataContainer();
                                        });
                                  }
                                  if (state.rentSummery !=
                                      const RentListSummary()) {
                                    return Column(
                                      children: [
                                        ListView.builder(
                                            itemCount: state
                                                        .rentSummery
                                                        .transactionList
                                                        .length >
                                                    3
                                                ? 3
                                                : state.rentSummery
                                                    .transactionList.length,
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return MainRentDataContainer(
                                                title: AppStrings().rentValue,
                                                totalPrice:
                                                    "${state.rentSummery.transactionList[index].rentPaymentMonthly?.round()} ${AppStrings().currency}",
                                                titleInfo:
                                                    "${AppStrings().roomsCount}:",
                                                valueInfo: state
                                                        .rentSummery
                                                        .transactionList[index]
                                                        .bedRoomsCount
                                                        ?.toStringAsFixed(0) ??
                                                    '0',
                                                location: context.locale ==
                                                        ARABIC_LOCAL
                                                    ? getObjectByLookupKey(
                                                                context
                                                                        .read<
                                                                            RentBloc>()
                                                                        .loockUpRent
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
                                                                            RentBloc>()
                                                                        .loockUpRent
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
                                                startDate: DateTime.parse(state
                                                            .rentSummery
                                                            .transactionList[
                                                                index]
                                                            .startDate ??
                                                        '')
                                                    .toFormattedString(),
                                                endDate: DateTime.parse(state
                                                            .rentSummery
                                                            .transactionList[
                                                                index]
                                                            .endDate ??
                                                        '')
                                                    .toFormattedString(),
                                              );
                                            }),
                                        // SizedBox(height: AppSizeH.s6),
                                      ],
                                    );
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
                                                child: Lottie.asset(ImageAssets
                                                    .animationError)),
                                            IconButton(
                                                onPressed: () {
                                                  rentSummeryBloc.add(
                                                      RentSummeryEvent
                                                          .getRentSummary(
                                                              request: context
                                                                  .read<
                                                                      RentBloc>()
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
                                          currentPage: context
                                                  .read<RentBloc>()
                                                  .requestMeanValue
                                                  .offset ??
                                              0,
                                          limitPerPage: 3,
                                          totalDataCount: rentSummeryBloc
                                                  .rentSummery?.count ??
                                              0,
                                          onPreviousPage: (previousPage) {},
                                          onBackToFirstPage: (firstPage) {},
                                          onNextPage: (nextPage) {},
                                          onGoToLastPage: (lastPage) {},
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .background,
                                          previousPageIcon: context.locale ==
                                                  ARABIC_LOCAL
                                              ? Icons.keyboard_arrow_right_sharp
                                              : Icons.keyboard_arrow_left_sharp,
                                          backToFirstPageIcon: Icons.first_page,
                                          nextPageIcon: context.locale ==
                                                  ARABIC_LOCAL
                                              ? Icons.keyboard_arrow_left_sharp
                                              : Icons
                                                  .keyboard_arrow_right_sharp,
                                          goToLastPageIcon: Icons.last_page,
                                        ),
                                        SizedBox(height: AppSizeH.s10)
                                      ],
                                    );
                                  }
                                  if (state.isEmptyRentSummery) {
                                    return Text(
                                      AppStrings().noRentContracts,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    );
                                  }
                                  if (state.rentSummery !=
                                      const RentListSummary()) {
                                    return Column(
                                      children: [
                                        FlutterCustomPagination(
                                          currentPage: context
                                                  .read<RentBloc>()
                                                  .requestMeanValue
                                                  .offset ??
                                              0,
                                          limitPerPage: 3,
                                          totalDataCount: rentSummeryBloc
                                                  .rentSummery?.count ??
                                              0,
                                          onPreviousPage: (previousPage) {
                                            context
                                                    .read<RentBloc>()
                                                    .requestMeanValue =
                                                context
                                                    .read<RentBloc>()
                                                    .requestMeanValue
                                                    .copyWith(
                                                        offset: previousPage);
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
                                            context
                                                    .read<RentBloc>()
                                                    .requestMeanValue =
                                                context
                                                    .read<RentBloc>()
                                                    .requestMeanValue
                                                    .copyWith(
                                                        offset: (nextPage));
                                            rentSummeryBloc.add(
                                                RentSummeryEvent.getRentSummary(
                                                    request: context
                                                        .read<RentBloc>()
                                                        .requestMeanValue));
                                          },
                                          onGoToLastPage: (lastPage) {
                                            context
                                                    .read<RentBloc>()
                                                    .requestMeanValue =
                                                context
                                                    .read<RentBloc>()
                                                    .requestMeanValue
                                                    .copyWith(offset: lastPage);
                                            rentSummeryBloc.add(
                                                RentSummeryEvent.getRentSummary(
                                                    request: context
                                                        .read<RentBloc>()
                                                        .requestMeanValue));
                                          },
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .background,
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
                    rentDefaultBloc.add(RentDefaultEvent.started(
                      request: context.read<RentBloc>().requestDefault,
                    ));
                  },
                ),
                //  SizedBox(
                //       height: MediaQuery.of(context).size.height,
                //       width: MediaQuery.of(context).size.width,
                //       child: Center(
                //         child: SizedBox(
                //             height: AppSizeH.s200,
                //             width: AppSizeH.s200,
                //             child: Column(
                //               children: [
                //                 SizedBox(
                //                     height: AppSizeH.s130,
                //                     width: AppSizeH.s130,
                //                     child: Lottie.asset(
                //                         ImageAssets.animationError)),
                //                 IconButton(
                //                     onPressed: () {
                //                       rentDefaultBloc
                //                           .add(RentDefaultEvent.started(
                //                         request: context
                //                             .read<RentBloc>()
                //                             .requestDefault,
                //                       ));
                //                     },
                //                     icon: const Icon(Icons.refresh))
                //               ],
                //             )),
                //       ),
                //     )
              ),
              listener: (BuildContext context, RentDefaultState state) {},
            );
          },
        ),
      ),
    );
  }

  String getUnitName(int id) {
    if (context.locale == ARABIC_LOCAL) {
      return "${AppStrings().unitType}: ${getObjectByLookupKey(context.read<RentBloc>().loockUpRent?.propertyTypeList ?? [], id)?.arName ?? ''}";
    } else {
      return "${AppStrings().unitType}: ${getObjectByLookupKey(context.read<RentBloc>().loockUpRent?.propertyTypeList ?? [], id)?.enName ?? ''}";
    }
  }
}
