// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/presentations/features/rent/blocs/cubits/cubit/change_status_cubit.dart';
import 'package:ebla/presentations/features/rent/blocs/get_location_name_cubit.dart';
import 'package:ebla/presentations/features/rent/blocs/rent_bloc/rent_bloc.dart';
import 'package:ebla/presentations/features/rent/blocs/rent_bloc/rent_grid_kpis_bloc/rent_grid_kpis_bloc.dart';
import 'package:ebla/presentations/features/rent/blocs/summery_bloc/rent_summery_bloc.dart';
import 'package:ebla/presentations/features/rent/widgets/selected_year_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../app/depndency_injection.dart';
import '../../../utils/global_functions.dart';
import '../../resources/resources.dart';
import '../../widgets/widgets.dart';
import '../home/home_view.dart';
import 'blocs/certificate_contract_bloc/certificate_contract_bloc.dart';
import 'blocs/default_bloc/rent_default_bloc.dart';
import 'widgets/rent_grid_item_widget.dart';
import 'widgets/selected_municipality_widget.dart';
import 'widgets/selected_period_widget.dart';

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
          // TODO: implement listener
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
                          Container(
                            height: AppSizeH.s40,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(ImageAssets.appbarBg),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: RefreshIndicator(
                              onRefresh: () {
                                context
                                    .read<RentBloc>()
                                    .add(const RentEvent.getRentLookupEvent());
                                return Future.value();
                              },
                              child: ListView(
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
                                                model: getObjectById(
                                                        context
                                                                .read<
                                                                    RentBloc>()
                                                                .loockUpRent
                                                                ?.municipalityList ??
                                                            [],
                                                        context
                                                                .read<
                                                                    RentBloc>()
                                                                .requestMeanValue
                                                                .municipalityId ??
                                                            1) ??
                                                    RentLookupModel(),
                                              ),
                                              SizedBox(width: AppSizeW.s5),
                                              SelectedYearWidget(
                                                  year: context
                                                      .read<RentBloc>()
                                                      .requestMeanValue
                                                      .issueDateYear
                                                      .toString()),
                                              SizedBox(width: AppSizeW.s7),
                                              BlocBuilder(
                                                bloc: context.read<RentBloc>(),
                                                builder:
                                                    (context, RentState state) {
                                                  if (state
                                                      .isLoadingRentLookup) {
                                                    return Icon(
                                                      Icons.filter_list_sharp,
                                                      color:
                                                          ColorManager.golden,
                                                    );
                                                  }
                                                  return IconButton(
                                                      onPressed: () async {
                                                        var res =
                                                            await bottomSheetWidget(
                                                          context,
                                                          child: BlocProvider
                                                              .value(
                                                            value: context.read<
                                                                RentBloc>(),
                                                            child:
                                                                const BottomSheetFilterWidget(),
                                                          ),
                                                        );
                                                        if (res != null &&
                                                            res) {
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
                                                                .read<
                                                                    RentBloc>()
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
                                              ),
                                              SizedBox(
                                                width: AppSizeW.s7,
                                              ),
                                            ]),
                                        SizedBox(height: AppSizeH.s12),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: AppSizeW.s11,
                                          ),
                                          child: SizedBox(
                                              height: AppSizeH.s26,
                                              child: Row(
                                                  children: context
                                                          .read<RentBloc>()
                                                          .loockUpRent
                                                          ?.periodTime
                                                          .map((e) {
                                                        return e.id != 5
                                                            ? ChosenPeriodWidget(
                                                                id: e.id,
                                                                enName:
                                                                    e.enName,
                                                                arName:
                                                                    e.arName,
                                                              )
                                                            : const SizedBox();
                                                      }).toList() ??
                                                      [])),
                                        ),
                                      ]);
                                    },
                                  ),
                                  SizedBox(height: AppSizeH.s22),
                                  Center(
                                    child: Text(
                                      AppStrings().currentPerformanceSummary,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ),
                                  const GreyLinerContainer(),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: AppSizeW.s20),
                                    child: StaggeredGridView(
                                      // for development only: UniqueKey forces the rebuild of the widget on hot reload
                                      key: UniqueKey(),
                                      itemsCount: 4,
                                      rightSectionTopPadding: AppSizeH.s17,
                                      mainAxisSpacing: AppSizeH.s22,
                                      crossAxisSpacing: AppSizeW.s23,
                                      gridItemChildBuilder: (context, index) {
                                        return BlocProvider.value(
                                          value: rentGridKPIsBloc,
                                          child: RentGridItemWidget(
                                            response: response,
                                            kpi: KPI.values[index],
                                            index: index,
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ),
                                  const GreyLinerContainer(),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: AppSizeW.s20),
                                    child: BlocProvider.value(
                                      value: certificateContractBloc,
                                      child: const StatisTicsWidget(),
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppSizeH.s20,
                                  ),
                                  Center(
                                    child: Text(
                                      AppStrings().rentContractList,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ),
                                  const GreyLinerContainer(),
                                  BlocBuilder<RentSummeryBloc,
                                      RentSummeryState>(
                                    bloc: rentSummeryBloc,
                                    builder: (context, state) {
                                      if (state.isLoadingRentSummery) {
                                        return Center(
                                          child: SizedBox(
                                              width: AppSizeW.s50,
                                              height: AppSizeW.s50,
                                              child:
                                                  const CircularProgressIndicator()),
                                        );
                                      }
                                      if (state.rentSummery !=
                                          const RentListSummary()) {
                                        return ListView.builder(
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
                                              return MainContainerWithBloc(
                                                price:
                                                    "${state.rentSummery.transactionList[index].rentPaymentMeterMT?.toStringAsFixed(3)} ${AppStrings().currency}",
                                                area: state
                                                        .rentSummery
                                                        .transactionList[index]
                                                        .area
                                                        ?.toStringAsFixed(0) ??
                                                    '0',
                                                bedCount: state
                                                        .rentSummery
                                                        .transactionList[index]
                                                        .bedRoomsCount
                                                        ?.toStringAsFixed(0) ??
                                                    '0',
                                                location: context.locale ==
                                                        ARABIC_LOCAL
                                                    ? getObjectById(
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
                                                    : getObjectById(
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
                                                        ImageAssets
                                                            .animationError)),
                                                IconButton(
                                                    onPressed: () {
                                                      rentSummeryBloc.add(
                                                          RentSummeryEvent.getRentSummary(
                                                              request: context
                                                                  .read<
                                                                      RentBloc>()
                                                                  .requestMeanValue));
                                                    },
                                                    icon: const Icon(
                                                        Icons.refresh))
                                              ],
                                            ));
                                      }
                                      return const SizedBox();
                                    },
                                  )
                                ],
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
                      )
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
}

class GreyLinerContainer extends StatelessWidget {
  const GreyLinerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: AppSizeW.s170, vertical: AppSizeH.s20),
      height: AppSizeH.s5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizeR.s5),
          color: ColorManager.lightSilver),
    );
  }
}

class MainContainerWithBloc extends StatefulWidget {
  final String price;
  final String area;
  final String bedCount;
  final String location;

  const MainContainerWithBloc(
      {super.key,
      required this.price,
      required this.area,
      required this.bedCount,
      required this.location});

  @override
  State<MainContainerWithBloc> createState() => _MainContainerWithBlocState();
}

class _MainContainerWithBlocState extends State<MainContainerWithBloc> {
  late GetLocationNameCubit getLocationNameCubit;

  @override
  void initState() {
    getLocationNameCubit = GetLocationNameCubit(widget.location);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    getLocationNameCubit.save(widget.location);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: context.read<RentBloc>(),
      listener: (context, state) {
        if (context.read<RentBloc>().loockUpRent?.municipalityList != []) {
          getLocationNameCubit.save(widget.location);
        }
      },
      child: BlocBuilder<GetLocationNameCubit, String>(
        bloc: getLocationNameCubit,
        builder: (context, state) {
          if (state == '') {
            getLocationNameCubit.save(widget.location);
          }
          return MainDataContainer(
            title: AppStrings().rentValue,
            totalPrice: widget.price,
            value: widget.area,
            valueDescription: AppStrings().rentArea,
            titleInfo: "${AppStrings().roomsCount}:",
            valueInfo: widget.bedCount,
            location: state,
          );
        },
      ),
    );
  }
}
