// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/presentations/features/rent/blocs/get_location_name_cubit.dart';
import 'package:ebla/presentations/features/rent/blocs/rent_bloc/rent_bloc.dart';
import 'package:ebla/presentations/features/rent/blocs/rent_bloc/rent_grid_kpis_bloc/rent_grid_kpis_bloc.dart';
import 'package:ebla/presentations/features/rent/blocs/summery_bloc/rent_summery_bloc.dart';
import 'package:ebla/presentations/widgets/main_data_container.dart';
import 'package:ebla/presentations/widgets/staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../app/depndency_injection.dart';
import '../../../domain/models/requests/rent_requests/request_mean_value.dart';
import '../../../utils/global_functions.dart';
import '../../resources/resources.dart';
import '../../widgets/bottom_sheet_filter_widget.dart';
import '../../widgets/bottom_sheet_widget.dart';
import '../home/home_view.dart';
import 'blocs/certificate_contract_bloc/certificate_contract_bloc.dart';
import 'blocs/default_bloc/rent_default_bloc.dart';
import 'widgets/rent_grid_item_widget.dart';

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

  @override
  void initState() {
    rentDefaultBloc = instance<RentDefaultBloc>()
      ..add(RentDefaultEvent.started(
          request: context.read<RentBloc>().requestMeanValue));
    rentGridKPIsBloc = instance<RentGridKPIsBloc>()
      ..add(RentGridKPIsEvent.getData(
          request: context.read<RentBloc>().requestMeanValue));
    rentSummeryBloc = instance<RentSummeryBloc>()
      ..add(RentSummeryEvent.getRentSummary(
          request: context.read<RentBloc>().requestMeanValue));
    certificateContractBloc = instance<CertificateContractBloc>();
    // ..add(CertificateContractEvent.certificateCountEvent(
    //     request: context.read<RentBloc>().requestMeanValue));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RentDefaultBloc, RentDefaultState>(
        bloc: rentDefaultBloc,
        builder: (context, state) => state.when(
            initial: () => const AnimatedPulesLogo(),
            success: (RentDefault response) => ListView(
                  children: [
                    Container(
                      height: AppSizeH.s40,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(ImageAssets.appbarBg),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: BlocBuilder(
                        bloc: context.read<RentBloc>(),
                        builder: (context, RentState state) {
                          if (state.isLoadingRentLookup) {
                            return Icon(
                              Icons.filter_list_sharp,
                              color: ColorManager.golden,
                            );
                          }
                          return IconButton(
                              onPressed: () async {
                                var res = await bottomSheetWidget(
                                  context,
                                  child: BlocProvider.value(
                                    value: context.read<RentBloc>(),
                                    child: const BottomSheetFilterWidget(),
                                  ),
                                );
                                if (res != null && res) {
                                  rentGridKPIsBloc.add(
                                      RentGridKPIsEvent.getData(
                                          request: context
                                              .read<RentBloc>()
                                              .requestMeanValue));
                                  rentSummeryBloc
                                      .add(RentSummeryEvent.getRentSummary(
                                    request: context
                                        .read<RentBloc>()
                                        .requestMeanValue,
                                  ));
                                  certificateContractBloc.add(
                                    CertificateContractEvent
                                        .certificateCountEvent(
                                            request: context
                                                .read<RentBloc>()
                                                .requestMeanValue),
                                  );
                                }
                              },
                              icon: Icon(
                                Icons.filter_list_sharp,
                                color: ColorManager.golden,
                              ));
                        },
                      ),
                    ),
                    Center(
                      child: Text(
                        AppStrings().currentPerformanceSummary,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    const GreyLinerContainer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSizeH.s20),
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
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    const GreyLinerContainer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSizeH.s20),
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
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    const GreyLinerContainer(),
                    BlocBuilder<RentSummeryBloc, RentSummeryState>(
                      bloc: rentSummeryBloc,
                      builder: (context, state) {
                        if (state.isLoadingRentSummery) {
                          return Center(
                            child: SizedBox(
                                width: AppSizeW.s50,
                                height: AppSizeW.s50,
                                child: const CircularProgressIndicator()),
                          );
                        }
                        if (state.rentSummery != const RentListSummary()) {
                          return ListView.builder(
                              itemCount:
                                  state.rentSummery.transactionList.length > 3
                                      ? 3
                                      : state
                                          .rentSummery.transactionList.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return MainContainerWithBloc(
                                  price:
                                      "${state.rentSummery.transactionList[index].rentPaymentMeterMT?.toStringAsFixed(3)} ${AppStrings().currency}",
                                  area: state.rentSummery.transactionList[index]
                                          .area
                                          ?.toStringAsFixed(0) ??
                                      '0',
                                  bedCount: state.rentSummery
                                          .transactionList[index].bedRoomsCount
                                          ?.toStringAsFixed(0) ??
                                      '0',
                                  location: context.locale == ARABIC_LOCAL
                                      ? getObjectById(
                                                  context
                                                          .read<RentBloc>()
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
                                                          .read<RentBloc>()
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
                        return Container();
                      },
                    )
                  ],
                ),
            error: (String message) => SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: SizedBox(
                        height: AppSizeH.s200,
                        width: AppSizeH.s200,
                        child: Column(
                          children: [
                            SizedBox(
                                height: AppSizeH.s130,
                                width: AppSizeH.s130,
                                child:
                                    Lottie.asset(ImageAssets.animationError)),
                            IconButton(
                                onPressed: () {
                                  rentDefaultBloc.add(RentDefaultEvent.started(
                                    request: RequestMeanValue(
                                      municipalityId: 1,
                                      propertyTypeList: [-1],
                                      purposeList: [-1],
                                      issueDateQuarterList: [1, 2, 3, 4],
                                      furnitureStatus: -1,
                                      issueDateYear: 2023,
                                      issueDateStartMonth: 1,
                                      issueDateEndMonth: 10,
                                      zoneId: -1,
                                      limit: 5,
                                    ),
                                  ));
                                },
                                icon: const Icon(Icons.refresh))
                          ],
                        )),
                  ),
                )),
        listener: (BuildContext context, RentDefaultState state) {},
      ),
    );
  }
}

class AnimatedPulesLogo extends StatefulWidget {
  const AnimatedPulesLogo({super.key});

  @override
  State<AnimatedPulesLogo> createState() => _AnimatedPulesLogoState();
}

class _AnimatedPulesLogoState extends State<AnimatedPulesLogo>
    with TickerProviderStateMixin {
  late AnimationController motionController;

  double size = 20;

  @override
  void initState() {
    super.initState();
    motionController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
      lowerBound: 0.5,
    );
    motionController.forward();
    motionController.addListener(() {
      setState(() {
        size = motionController.value * 250;
      });
    });
    motionController.addStatusListener((status) {
      setState(() {
        if (status == AnimationStatus.completed) {
          motionController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          motionController.forward();
        }
      });
    });
    // motionController.forward();
  }

  @override
  void dispose() {
    motionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          ColorManager.primary,
          ColorManager.white,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: const [0.2, 1.0],
      )),
      child: Center(
          child: SizedBox(
        height: AppSizeW.s200,
        child: Stack(children: <Widget>[
          Center(
            child: Container(
              height: size - AppSizeW.s5,
              padding: EdgeInsets.all(AppSizeW.s5 * (0.009 * size)),
              decoration: BoxDecoration(
                  color: ColorManager.white.withOpacity(0.4),
                  shape: BoxShape.circle),
              child: Container(
                height: size - AppSizeW.s5,
                padding: EdgeInsets.all(AppSizeW.s5 * (0.007 * size)),
                decoration: BoxDecoration(
                    color: ColorManager.white.withOpacity(0.6),
                    shape: BoxShape.circle),
                child: Container(
                  padding: EdgeInsets.all(AppSizeW.s5),
                  decoration: BoxDecoration(
                      color: ColorManager.white, shape: BoxShape.circle),
                  height: size,
                  child: Image.asset(ImageAssets.logoPng),
                ),
              ),
            ),
          )
        ]),
      )),
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
