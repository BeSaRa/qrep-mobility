import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/app/extensions.dart';
import 'package:ebla/presentations/features/sell/blocs/sell_bloc/sell_bloc.dart';
import 'package:ebla/presentations/features/sell/blocs/top_values_bloc/topvalues_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/models/rent_models/rent_models.dart';
import '../../../../utils/global_functions.dart';
import '../../../resources/resources.dart';
import '../../../widgets/widgets.dart';
import '../../rent/widgets/top_ten_index_cubit.dart';

class StatisticsTopSellWidget extends StatefulWidget {
  const StatisticsTopSellWidget({super.key});

  @override
  State<StatisticsTopSellWidget> createState() =>
      _StatisticsTopSellWidgetState();
}

class _StatisticsTopSellWidgetState extends State<StatisticsTopSellWidget> {
  late TopTenIndexCubit tenIndexCubit;

  @override
  void initState() {
    tenIndexCubit = TopTenIndexCubit(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            AppStrings().rentTopTen,
            style: Theme.of(context).textTheme.titleLarge,
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
        BlocBuilder(
          bloc: context.read<TopvaluesBloc>(),
          builder: (context, TopvaluesState state) {
            if (state.isLoading) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSizeW.s6, vertical: AppSizeH.s6),
                      decoration: BoxDecoration(
                        color: ColorManager.grey,
                        borderRadius: BorderRadius.circular(AppSizeR.s12),
                      ),
                      child: SizedBox(
                        height: AppSizeH.s60,
                        width: MediaQuery.of(context).size.width - AppSizeW.s52,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            _TabContainerShimmer(
                              tabIndex: 1,
                              name: AppStrings().sellContractCount,
                            ),
                            _TabContainerShimmer(
                              tabIndex: 2,
                              name: AppStrings().avgPricePerUnit,
                            ),
                            _TabContainerShimmer(
                              tabIndex: 3,
                              name: AppStrings().transictionValue,
                            ),
                            _TabContainerShimmer(
                              tabIndex: 4,
                              name:
                                  "${AppStrings().soldAreas} (${context.read<SellBloc>().requestSell.unit == 1 ? AppStrings().meterSquare : AppStrings().footSquare})",
                            ),
                            _TabContainerShimmer(
                              tabIndex: 5,
                              name: AppStrings().countPropertiesUnits,
                            ),
                            _TabContainerShimmer(
                              tabIndex: 6,
                              name: "${AppStrings().avgPricePer} "
                                  "(${context.read<SellBloc>().requestSell.unit == 1 ? AppStrings().meterSquare : AppStrings().footSquare})",
                            ),
                          ],
                        ),
                      ))
                ],
              );
            }
            return Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSizeW.s6, vertical: AppSizeH.s6),
                  decoration: BoxDecoration(
                    color: ColorManager.grey,
                    borderRadius: BorderRadius.circular(AppSizeR.s12),
                  ),
                  child: SizedBox(
                    height: AppSizeH.s60,
                    width: MediaQuery.of(context).size.width - AppSizeW.s52,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        _TabContainer(
                          indexTab: 1,
                          name: AppStrings().sellContractCount,
                          onPress: () {
                            tenIndexCubit.save(1);
                            context.read<TopvaluesBloc>().add(
                                TopvaluesEvent.countTransictionNumberEvent(
                                    request:
                                        context.read<SellBloc>().requestSell));
                          },
                        ),
                        _TabContainer(
                            indexTab: 2,
                            name: AppStrings().avgPricePerUnit,
                            onPress: () {
                              tenIndexCubit.save(2);
                              context.read<TopvaluesBloc>().add(
                                  TopvaluesEvent.countUnitPriceEvent(
                                      request: context
                                          .read<SellBloc>()
                                          .requestSell));
                            }),
                        _TabContainer(
                            indexTab: 3,
                            name: AppStrings().transictionValue,
                            onPress: () {
                              tenIndexCubit.save(3);
                              context.read<TopvaluesBloc>().add(
                                  TopvaluesEvent.countTransictionsValueEvent(
                                      request: context
                                          .read<SellBloc>()
                                          .requestSell));
                            }),
                        _TabContainer(
                            indexTab: 4,
                            name:
                                "${AppStrings().soldAreas} (${context.read<SellBloc>().requestSell.unit == 1 ? AppStrings().meterSquare : AppStrings().footSquare})",
                            onPress: () {
                              tenIndexCubit.save(4);
                              context.read<TopvaluesBloc>().add(
                                  TopvaluesEvent.countAreasEvent(
                                      request: context
                                          .read<SellBloc>()
                                          .requestSell));
                            }),
                        _TabContainer(
                            indexTab: 5,
                            name: AppStrings().countPropertiesUnits,
                            onPress: () {
                              tenIndexCubit.save(5);
                              context.read<TopvaluesBloc>().add(
                                  TopvaluesEvent.realStateNumberEvent(
                                      request: context
                                          .read<SellBloc>()
                                          .requestSell));
                            }),
                        _TabContainer(
                            indexTab: 6,
                            name: "${AppStrings().avgPricePer} "
                                "(${context.read<SellBloc>().requestSell.unit == 1 ? AppStrings().meterSquare : AppStrings().footSquare})",
                            onPress: () {
                              tenIndexCubit.save(6);
                              context.read<TopvaluesBloc>().add(
                                  TopvaluesEvent.realStateNumberMeterEvent(
                                      request: context
                                          .read<SellBloc>()
                                          .requestSell));
                            }),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
        SizedBox(
          height: AppSizeH.s30,
        ),
        BlocBuilder(
          bloc: context.read<TopvaluesBloc>(),
          builder: (context, TopvaluesState state) {
            if (state.isLoading) {
              return const StatisticsShimmerWidget();
            }
            if (state.isHasErrorContract || state.isHasErrorContract) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(state.errorMessage),
                  IconButton(
                      onPressed: () {
                        context.read<TopvaluesBloc>().add(
                            TopvaluesEvent.countTransictionNumberEvent(
                                request: context.read<SellBloc>().requestSell));
                      },
                      icon: const Icon(Icons.refresh_outlined))
                ],
              );
            }
            if (state.listResponse.isNotEmpty) {
              return StatisticsRentWidget(
                  statistics: state.listResponse.map((e) {
                return StatisticsModel(
                    title: context.locale == ARABIC_LOCAL
                        ? getObjectByLookupKey(
                                    context
                                        .read<SellBloc>()
                                        .loockUpSell!
                                        .districtList,
                                    e.zoneId.toInt())
                                ?.arName ??
                            ''
                        : getObjectByLookupKey(
                                    context
                                        .read<SellBloc>()
                                        .loockUpSell!
                                        .districtList,
                                    e.zoneId.toInt())
                                ?.enName ??
                            '',
                    number: tenIndexCubit.state == 4 || tenIndexCubit.state == 6
                        ? getSpaces(e)
                        : getValue(e.kpiVal));
              }).toList());
            }
            if (state.listResponse.isEmpty) {
              return Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    vertical: AppSizeH.s13, horizontal: AppSizeW.s21),
                decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(AppSizeR.s12),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(1, 1),
                          spreadRadius: AppSizeR.s2,
                          blurRadius: AppSizeR.s11,
                          color: ColorManager.black.withAlpha(6))
                    ]),
                child: Text(AppStrings().noDataFound),
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }

  String getSpaces(BaseRentResponse e) {
    if (tenIndexCubit.state == 6) {
      return context.read<SellBloc>().requestSell.unit == 1
          ? "${e.priceMT.round().formatWithCommas()} "
              "${AppStrings().currency}"
          : "${e.priceSQ.round().formatWithCommas()} "
              "${AppStrings().currency}";
    } else {
      return context.read<SellBloc>().requestSell.unit == 1
          ? "${e.realEstateMT.round().formatWithCommas()} "
              "${AppStrings().meterSquare}"
          : "${e.realEstateSQT.round().formatWithCommas()} "
              "${AppStrings().footSquare}";
    }
  }

  String getValue(num e) {
    if (tenIndexCubit.state == 1 || tenIndexCubit.state == 5) {
      return e.toStringAsFixed(0);
    } else {
      return "${e.round().formatWithCommas()} ${AppStrings().currency}";
    }
  }
}

class _TabContainerShimmer extends StatelessWidget {
  final int tabIndex;
  final String name;

  const _TabContainerShimmer({
    required this.tabIndex,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: AppSizeW.s5, vertical: AppSizeH.s6),
      margin: EdgeInsets.all(AppSizeH.s0_5),
      decoration: BoxDecoration(
          color: context.read<TopvaluesBloc>().index == tabIndex
              ? ColorManager.primary
              : Colors.transparent,
          border: Border.all(
            color: ColorManager.silver,
            width: AppSizeH.s1,
          ),
          borderRadius: BorderRadius.circular(AppSizeR.s10)),
      child: Text(
        name,
        style: context.read<TopvaluesBloc>().index == tabIndex
            ? Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: AppSizeSp.s12)
            : Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: AppSizeSp.s12, decoration: TextDecoration.none),
      ),
    );
  }
}

class _TabContainer extends StatelessWidget {
  final int indexTab;
  final String name;
  final Function onPress;

  const _TabContainer({
    required this.indexTab,
    required this.name,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // setState(() {
        //   index = 1;
        // });
        onPress();
      },
      child: Container(
        margin: EdgeInsets.all(AppSizeH.s0_5),
        padding: EdgeInsets.symmetric(
            horizontal: AppSizeW.s5, vertical: AppSizeH.s6),
        decoration: BoxDecoration(
            color: context.read<TopvaluesBloc>().index == indexTab
                ? ColorManager.primary
                : Colors.transparent,
            border: Border.all(
              color: ColorManager.silver,
              width: AppSizeH.s1,
            ),
            borderRadius: BorderRadius.circular(AppSizeR.s10)),
        child: Text(
          name,
          style: context.read<TopvaluesBloc>().index == indexTab
              ? Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: AppSizeSp.s12)
              : Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: AppSizeSp.s12, decoration: TextDecoration.none),
        ),
      ),
    );
  }
}
