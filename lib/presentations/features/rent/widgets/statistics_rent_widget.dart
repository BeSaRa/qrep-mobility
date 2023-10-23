import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/global_functions.dart';
import '../../../resources/resources.dart';
import '../../../widgets/widgets.dart';
import '../blocs/certificate_contract_bloc/certificate_contract_bloc.dart';
import '../blocs/rent_bloc/rent_bloc.dart';

class StatisTicsWidget extends StatefulWidget {
  const StatisTicsWidget({super.key});

  @override
  State<StatisTicsWidget> createState() => _StatisTicsWidgetState();
}

class _StatisTicsWidgetState extends State<StatisTicsWidget> {
  // int index = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder(
          bloc: context.read<CertificateContractBloc>(),
          builder: (context, CertificateContractState state) {
            if (state.isLoadingContract || state.isLoadingCertificate) {
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
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSizeW.s10, vertical: AppSizeH.s6),
                          decoration: BoxDecoration(
                              color: context
                                          .read<CertificateContractBloc>()
                                          .index ==
                                      1
                                  ? ColorManager.primary
                                  : Colors.transparent,
                              borderRadius:
                                  BorderRadius.circular(AppSizeR.s10)),
                          child: Text(
                            AppStrings().countLeaseContracts,
                            style:
                                context.read<CertificateContractBloc>().index ==
                                        1
                                    ? Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(fontSize: AppSizeSp.s12)
                                    : Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(fontSize: AppSizeSp.s12),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSizeW.s10, vertical: AppSizeH.s6),
                          decoration: BoxDecoration(
                              color: context
                                          .read<CertificateContractBloc>()
                                          .index ==
                                      2
                                  ? ColorManager.primary
                                  : Colors.transparent,
                              borderRadius:
                                  BorderRadius.circular(AppSizeR.s10)),
                          child: Text(
                            AppStrings().countPropertiesUnits,
                            style:
                                context.read<CertificateContractBloc>().index ==
                                        2
                                    ? Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(fontSize: AppSizeSp.s12)
                                    : Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(fontSize: AppSizeSp.s12),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            }
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
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          // setState(() {
                          //   index = 1;
                          // });
                          context.read<CertificateContractBloc>().add(
                              CertificateContractEvent.certificateCountEvent(
                                  request: context
                                      .read<RentBloc>()
                                      .requestMeanValue));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSizeW.s10, vertical: AppSizeH.s6),
                          decoration: BoxDecoration(
                              color: context
                                          .read<CertificateContractBloc>()
                                          .index ==
                                      1
                                  ? ColorManager.primary
                                  : Colors.transparent,
                              borderRadius:
                                  BorderRadius.circular(AppSizeR.s10)),
                          child: Text(
                            AppStrings().countLeaseContracts,
                            style:
                                context.read<CertificateContractBloc>().index ==
                                        1
                                    ? Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(fontSize: AppSizeSp.s12)
                                    : Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(fontSize: AppSizeSp.s12),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // setState(() {
                          //   index = 2;
                          // });
                          context.read<CertificateContractBloc>().add(
                              CertificateContractEvent.contractCountEvent(
                                  request: context
                                      .read<RentBloc>()
                                      .requestMeanValue));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSizeW.s10, vertical: AppSizeH.s6),
                          decoration: BoxDecoration(
                              color: context
                                          .read<CertificateContractBloc>()
                                          .index ==
                                      2
                                  ? ColorManager.primary
                                  : Colors.transparent,
                              borderRadius:
                                  BorderRadius.circular(AppSizeR.s10)),
                          child: Text(
                            AppStrings().countPropertiesUnits,
                            style:
                                context.read<CertificateContractBloc>().index ==
                                        2
                                    ? Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(fontSize: AppSizeSp.s12)
                                    : Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(fontSize: AppSizeSp.s12),
                          ),
                        ),
                      )
                    ],
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
            if (state.isLoadingCertificate || state.isLoadingContract) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.isHasErrorCertificate || state.isHasErrorContract) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(state.errorMessageCertificate),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.refresh_outlined))
                ],
              );
            }
            if (state.certificateCountResponse.isNotEmpty &&
                context.read<CertificateContractBloc>().index == 1) {
              return StatisticsRentWidget(
                  statistics: state.certificateCountResponse.map((e) {
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
                    number: e.kpiVal.toString());
              }).toList());
            }
            if (state.certificateCountResponse.isEmpty &&
                context.read<CertificateContractBloc>().index == 1) {
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
                child: Text(AppStrings().noLeaseContracts),
              );
            }

            if (state.contractCountResponse.isNotEmpty &&
                context.read<CertificateContractBloc>().index == 2) {
              return StatisticsRentWidget(
                  statistics: state.contractCountResponse.map((e) {
                return StatisticsModel(
                    title: context.locale == ARABIC_LOCAL
                        ? getObjectByLookupKey(
                              context.read<RentBloc>().loockUpRent!.zoneList,
                              e.zoneId.toInt(),
                            )?.arName ??
                            ''
                        : getObjectByLookupKey(
                                    context
                                        .read<RentBloc>()
                                        .loockUpRent!
                                        .zoneList,
                                    e.zoneId.toInt())
                                ?.enName ??
                            '',
                    number: e.kpiVal.toString());
              }).toList());
            }
            if (state.contractCountResponse.isEmpty &&
                context.read<CertificateContractBloc>().index == 2) {
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
                child: Text(AppStrings().noPropertiesUnits),
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }
}
