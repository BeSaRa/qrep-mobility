import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/domain/models/requests/rent_requests/request_mean_value.dart';
import 'package:ebla/presentations/features/sell/blocs/bloc/sell_bloc.dart';
import 'package:ebla/presentations/features/sell/blocs/sell_grid_kpis_bloc/sell_grid_kpis_bloc.dart';
import 'package:ebla/presentations/features/sell/widgets/sell_grid_item_widget.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:ebla/presentations/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/global_functions.dart';
import '../rent/blocs/cubits/cubit/change_status_cubit.dart';
import '../rent/widgets/selected_municipality_widget.dart';
import '../rent/widgets/selected_period_widget.dart';
import '../rent/widgets/selected_year_widget.dart';

class SalesView extends StatefulWidget {
  const SalesView({super.key});

  @override
  State<SalesView> createState() => _SalesViewState();
}

class _SalesViewState extends State<SalesView> {
  late SellGridKPIsBloc sellGridKPIsBloc;
  late ChangeStatusCubit changeStatusCubit;
  @override
  void initState() {
    changeStatusCubit = ChangeStatusCubit();

    sellGridKPIsBloc = instance<SellGridKPIsBloc>()
      ..add(SellGridKPIsEvent.getData(
          request: RequestMeanValue(
        municipalityId: 1,
        propertyTypeList: [-1],
        purposeList: [-1],
        issueDateQuarterList: [1, 2, 3, 4],
        furnitureStatus: -1,
        issueDateYear: 2023,
        issueDateStartMonth: 1,
        issueDateEndMonth: DateTime.now().month,
        zoneId: -1,
        limit: 5,
        periodId: 1,
        offset: 0,
      )));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<SellBloc>(),
      builder: (context, SellState state) {
        return state.map(
          loadingSellLookup: (value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          loadedSellLookup: (value) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      alignment: AlignmentDirectional.bottomCenter,
                      height: AppSizeH.s40,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(ImageAssets.appbarBg),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    BlocBuilder(
                      bloc: changeStatusCubit,
                      builder: (context, state) {
                        return Column(children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(width: AppSizeW.s16),
                                // SelectedMunicipality(
                                //   onChanged: (municipal) {
                                //     context
                                //             .read<SellBloc>()
                                //             .requestSellDefault =
                                //         context
                                //             .read<SellBloc>()
                                //             .requestSellDefault
                                //             .copyWith(
                                //                 municipalityId:
                                //                     municipal?.lookupKey,
                                //                 zoneId: -1);
                                //     changeStatusCubit.changeStatus();
                                //   },
                                //   model: getObjectById(
                                //           context
                                //                   .read<SellBloc>()
                                //                   .loockUpSell
                                //                   ?.municipalityList ??
                                //               [],
                                //           context
                                //                   .read<SellBloc>()
                                //                   .requestSellDefault
                                //                   .municipalityId ??
                                //               1) ??
                                //       const RentLookupModel(),
                                // ),
                                SizedBox(width: AppSizeW.s5),
                                SelectedYearWidget(
                                  value: context
                                          .read<SellBloc>()
                                          .requestSellDefault
                                          .issueDateYear ??
                                      DateTime.now().year,
                                  onChanged: (year) {
                                    context
                                            .read<SellBloc>()
                                            .requestSellDefault =
                                        context
                                            .read<SellBloc>()
                                            .requestSellDefault
                                            .copyWith(issueDateYear: year);
                                  },
                                ),
                                SizedBox(width: AppSizeW.s7),
                                BlocBuilder(
                                  bloc: context.read<SellBloc>(),
                                  builder: (context, SellState state) {
                                    return state.map(
                                      loadingSellLookup: (value) {
                                        return Icon(
                                          Icons.filter_list_sharp,
                                          color: ColorManager.golden,
                                        );
                                      },
                                      loadedSellLookup: (value) {
                                        return IconButton(
                                            onPressed: () async {
                                              var res = await bottomSheetWidget(
                                                context,
                                                child: BlocProvider.value(
                                                  value:
                                                      context.read<SellBloc>(),
                                                  child:
                                                      const BottomSheetFilterWidget(),
                                                ),
                                              );
                                              if (res != null && res) {
                                                // changeStatusCubit
                                                //     .changeStatus();

                                                // rentGridKPIsBloc.add(
                                                //     RentGridKPIsEvent.getData(
                                                //         request: context
                                                //             .read<RentBloc>()
                                                //             .requestMeanValue));
                                                // rentSummeryBloc.add(
                                                //     RentSummeryEvent
                                                //         .getRentSummary(
                                                //   request: context
                                                //       .read<RentBloc>()
                                                //       .requestMeanValue,
                                                // ));
                                                // certificateContractBloc.add(
                                                //   CertificateContractEvent
                                                //       .certificateCountEvent(
                                                //           request: context
                                                //               .read<RentBloc>()
                                                //               .requestMeanValue),
                                                // );
                                              }
                                            },
                                            icon: Icon(
                                              size: AppSizeW.s32,
                                              Icons.filter_list_sharp,
                                              color: ColorManager.golden,
                                            ));
                                      },
                                      errorSellLookUp: (value) {
                                        return const SizedBox();
                                      },
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: AppSizeW.s7,
                                ),
                              ]),
                          SizedBox(height: AppSizeH.s12),
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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSizeW.s31),
                      child: StaggeredGridView(
                        // for development only: UniqueKey forces the rebuild of the widget on hot reload
                        key: UniqueKey(),
                        itemsCount: 4,
                        rightSectionTopPadding: AppSizeH.s17,
                        mainAxisSpacing: AppSizeH.s22,
                        crossAxisSpacing: AppSizeW.s23,
                        gridItemChildBuilder: (context, index) {
                          return BlocProvider.value(
                            value: sellGridKPIsBloc,
                            child: SellGridItemWidget(
                              response: RentDefault(
                                  kpi1Val: 100,
                                  kpi4Val: 400,
                                  kpi7Val: 700,
                                  kpi13Val: 1300),
                              kpi: SellGridKPIs.values[index],
                              index: index,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          errorSellLookUp: (value) {
            return Center(
              child: Container(
                child: const Text('Error LookUp Sell '),
              ),
            );
          },
        );
      },
    );
  }
}
