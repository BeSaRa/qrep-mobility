import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/app/extensions.dart';
import 'package:ebla/presentations/features/more/widgets/dialog_data_audited_and_collected.dart';
import 'package:ebla/presentations/features/more/widgets/dialog_disabled_filters_warning.dart';
import 'package:ebla/presentations/features/rent/widgets/top_ten_index_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/global_functions.dart';
import '../../../resources/resources.dart';
import '../../../widgets/widgets.dart';
import '../../main/blocs/lookup_bloc/lookup_bloc.dart';
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

  bool isDisabled() {
    return (context
                .read<RentBloc>()
                .requestMeanValue
                .propertyTypeList
                ?.contains(-1) ??
            false) ||
        (context.read<RentBloc>().requestMeanValue.purposeList?.contains(-1) ??
            false);
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
                        height: AppSizeH.s60,
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
                              isDisabled: isDisabled(),
                              tabIndex: 3,
                              name: AppStrings().avgPriceEveryMonth,
                            ),
                            _TabContainerShimmer(
                              tabIndex: 4,
                              name: AppStrings().contractsValue,
                            ),
                            _TabContainerShimmer(
                              isDisabled: isDisabled(),
                              tabIndex: 5,
                              name: AppStrings().avgPricePerMeter,
                            ),
                            _TabContainerShimmer(
                              isDisabled: isDisabled(),
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
                    height: AppSizeH.s60,
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
                            isDisabled: isDisabled(),
                            indexTab: 3,
                            name: AppStrings().avgPriceEveryMonth,
                            onPress: () {
                              if (isDisabled()) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext ctxt) =>
                                        DialogDisabledFiltersWarning(messages: [
                                          '• ${AppStrings().propertyType}: ${AppStrings().singleValueOtherThanAll}',
                                          '• ${AppStrings().propertyUsage}: ${AppStrings().singleValueOtherThanAll}'
                                        ]));
                              } else {
                                tenIndexCubit.save(3);
                                context.read<CertificateContractBloc>().add(
                                    CertificateContractEvent
                                        .meanRentAmountEvent(
                                            request: context
                                                .read<RentBloc>()
                                                .requestMeanValue));
                              }
                            }),
                        _TabContainer(
                            indexTab: 4,
                            name: AppStrings().contractsValue,
                            onPress: () {
                              tenIndexCubit.save(4);
                              context.read<CertificateContractBloc>().add(
                                  CertificateContractEvent.rentAmountEvent(
                                      request: context
                                          .read<RentBloc>()
                                          .requestMeanValue));
                            }),
                        _TabContainer(
                            // disabled because data is being collected and audited
                            isDisabled: true,
                            indexTab: 5,
                            name: AppStrings().avgPricePerMeter,
                            onPress: () {
                              // todo: remove this when data is ready
                              if (true) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext ctxt) =>
                                        const DialogDataCollectedAndAudited());
                              } else {
                                tenIndexCubit.save(5);
                                context.read<CertificateContractBloc>().add(
                                    CertificateContractEvent
                                        .rentValuePerMeterEvent(
                                            request: context
                                                .read<RentBloc>()
                                                .requestMeanValue));
                              }
                            }),
                        _TabContainer(
                            // disabled because data is being collected and audited
                            isDisabled: true,
                            indexTab: 6,
                            name: AppStrings().rentedAreas,
                            onPress: () {
                              // todo: remove this when data is ready
                              if (true) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext ctxt) =>
                                        const DialogDataCollectedAndAudited());
                              } else {
                                tenIndexCubit.save(6);
                                context.read<CertificateContractBloc>().add(
                                    CertificateContractEvent.rentedAreasEvent(
                                        request: context
                                            .read<RentBloc>()
                                            .requestMeanValue));
                              }
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
                                        .read<LookupBloc>()
                                        .loockUpRent!
                                        .zoneList,
                                    e.zoneId.toInt())
                                ?.arName ??
                            ''
                        : getObjectByLookupKey(
                                    context
                                        .read<LookupBloc>()
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
      return e.formatWithCommasToInt();
    } else {
      return "${e.round().formatWithCommas()} ${AppStrings().currency}";
    }
  }
}

class _TabContainerShimmer extends StatelessWidget {
  final int tabIndex;
  final String name;
  final bool isDisabled;

  const _TabContainerShimmer({
    required this.tabIndex,
    required this.name,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppSizeH.s0_2),
      padding:
          EdgeInsets.symmetric(horizontal: AppSizeW.s3, vertical: AppSizeH.s6),
      decoration: BoxDecoration(
          color: context.read<CertificateContractBloc>().index == tabIndex
              ? ColorManager.primary
              : isDisabled
                  ? ColorManager.lightSilver.withOpacity(0.5)
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
                  fontSize: AppSizeSp.s12,
                  decoration: TextDecoration.none,
                  color: isDisabled
                      ? ColorManager.cloudyGrey.withOpacity(0.5)
                      : null,
                ),
      ),
    );
  }
}

class _TabContainer extends StatelessWidget {
  final int indexTab;
  final String name;
  final Function onPress;
  final bool isDisabled;

  const _TabContainer({
    required this.indexTab,
    required this.name,
    required this.onPress,
    this.isDisabled = false,
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
        margin: EdgeInsets.all(AppSizeH.s0_2),
        padding: EdgeInsets.symmetric(
            horizontal: AppSizeW.s3, vertical: AppSizeH.s6),
        decoration: BoxDecoration(
            color: context.read<CertificateContractBloc>().index == indexTab
                ? ColorManager.primary
                : isDisabled
                    ? ColorManager.lightSilver.withOpacity(0.5)
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
                    color: isDisabled
                        ? ColorManager.cloudyGrey.withOpacity(0.5)
                        : null,
                  ),
        ),
      ),
    );
  }
}
