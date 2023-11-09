import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/app/extensions.dart';
import 'package:ebla/presentations/features/rent/widgets/top_ten_index_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/global_functions.dart';
import '../../../resources/resources.dart';
import '../../../widgets/widgets.dart';
import '../blocs/certificate_contract_bloc/certificate_contract_bloc.dart';
import '../blocs/rent_bloc/rent_bloc.dart';

class StatisTicsWidget extends StatefulWidget {
  final String title;

  const StatisTicsWidget({super.key, required this.title});

  @override
  State<StatisTicsWidget> createState() => _StatisTicsWidgetState();
}

class _StatisTicsWidgetState extends State<StatisTicsWidget> {
  // int index = 1;

  late TopTenIndexCubit tenIndexCubit;

  @override
  void initState() {
    tenIndexCubit = TopTenIndexCubit(1);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("called change dependencies");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder(
          bloc: context.read<CertificateContractBloc>(),
          builder: (context, CertificateContractState state) {
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
                        height: AppSizeH.s54,
                        width: MediaQuery.of(context).size.width - AppSizeW.s52,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            _TabContainerShimmer(
                              tabIndex: 1,
                              name: widget.title,
                            ),
                            _TabContainerShimmer(
                              tabIndex: 2,
                              name: AppStrings().countPropertiesUnits,
                            ),
                            _TabContainerShimmer(
                              tabIndex: 3,
                              name: AppStrings().avgPriceEveryMonth,
                            ),
                            _TabContainerShimmer(
                              tabIndex: 4,
                              name: AppStrings().contractsValue,
                            ),
                            _TabContainerShimmer(
                              tabIndex: 5,
                              name: AppStrings().avgPricePerMeter,
                            ),
                            _TabContainerShimmer(
                              tabIndex: 6,
                              name: AppStrings().rentedAreas,
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
                    height: AppSizeH.s54,
                    width: MediaQuery.of(context).size.width - AppSizeW.s52,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        _TabContainer(
                          indexTab: 1,
                          name: AppStrings().countLeaseContracts,
                          onPress: () {
                            tenIndexCubit.save(1);
                            context.read<CertificateContractBloc>().add(
                                CertificateContractEvent.certificateCountEvent(
                                    request: context
                                        .read<RentBloc>()
                                        .requestMeanValue));
                          },
                        ),
                        _TabContainer(
                            indexTab: 2,
                            name: AppStrings().countPropertiesUnits,
                            onPress: () {
                              tenIndexCubit.save(2);
                              context.read<CertificateContractBloc>().add(
                                  CertificateContractEvent.contractCountEvent(
                                      request: context
                                          .read<RentBloc>()
                                          .requestMeanValue));
                            }),
                        _TabContainer(
                            indexTab: 3,
                            name: AppStrings().avgPriceEveryMonth,
                            onPress: () {
                              tenIndexCubit.save(3);
                              context.read<CertificateContractBloc>().add(
                                  CertificateContractEvent.meanRentAmountEvent(
                                      request: context
                                          .read<RentBloc>()
                                          .requestMeanValue));
                            }),
                        _TabContainer(
                            indexTab: 4,
                            name: AppStrings().contractsValue,
                            onPress: () {
                              tenIndexCubit.save(4);
                              context.read<CertificateContractBloc>().add(
                                  CertificateContractEvent.RentAmountEvent(
                                      request: context
                                          .read<RentBloc>()
                                          .requestMeanValue));
                            }),
                        _TabContainer(
                            indexTab: 5,
                            name: AppStrings().avgPricePerMeter,
                            onPress: () {
                              tenIndexCubit.save(5);
                              context.read<CertificateContractBloc>().add(
                                  CertificateContractEvent
                                      .RentValuePerMeterEvent(
                                          request: context
                                              .read<RentBloc>()
                                              .requestMeanValue));
                            }),
                        _TabContainer(
                            indexTab: 6,
                            name: AppStrings().rentedAreas,
                            onPress: () {
                              tenIndexCubit.save(6);
                              context.read<CertificateContractBloc>().add(
                                  CertificateContractEvent.RentedAreasEvent(
                                      request: context
                                          .read<RentBloc>()
                                          .requestMeanValue));
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
          bloc: context.read<CertificateContractBloc>(),
          builder: (context, CertificateContractState state) {
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
                        context.read<CertificateContractBloc>().add(
                            CertificateContractEvent.certificateCountEvent(
                                request:
                                    context.read<RentBloc>().requestMeanValue));
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
                                        .read<RentBloc>()
                                        .loockUpRent!
                                        .zoneList,
                                    e.zoneId.toInt())
                                ?.arName ??
                            ''
                        : getObjectByLookupKey(
                                    context
                                        .read<RentBloc>()
                                        .loockUpRent!
                                        .zoneList,
                                    e.zoneId.toInt())
                                ?.enName ??
                            '',
                    number: getValues(e.kpiVal));
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

  String getValues(num e) {
    if (tenIndexCubit.state == 1 || tenIndexCubit.state == 2) {
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
      decoration: BoxDecoration(
          color: context.read<CertificateContractBloc>().index == tabIndex
              ? ColorManager.primary
              : Colors.transparent,
          border: Border.all(
            color: ColorManager.silver,
            width: AppSizeH.s1,
          ),
          borderRadius: BorderRadius.circular(AppSizeR.s10)),
      child: Text(
        name,
        style: context.read<CertificateContractBloc>().index == tabIndex
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
        padding: EdgeInsets.symmetric(
            horizontal: AppSizeW.s5, vertical: AppSizeH.s6),
        decoration: BoxDecoration(
            color: context.read<CertificateContractBloc>().index == indexTab
                ? ColorManager.primary
                : Colors.transparent,
            border: Border.all(
              color: ColorManager.silver,
              width: AppSizeH.s1,
            ),
            borderRadius: BorderRadius.circular(AppSizeR.s10)),
        child: Text(
          name,
          style: context.read<CertificateContractBloc>().index == indexTab
              ? Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: AppSizeSp.s12)
              : Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: AppSizeSp.s12,
                    decoration: TextDecoration.none,
                  ),
        ),
      ),
    );
  }
}
