import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/app/extensions.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';
import '../blocs/rent_bloc/rent_grid_kpis_bloc/rent_grid_kpis_bloc.dart';

class RentGridItemWidget extends StatefulWidget {
  final KPI kpi;

  const RentGridItemWidget({
    super.key,
    required this.kpi,
    required this.index,
  });

  final int index;

  @override
  State<RentGridItemWidget> createState() => _RentGridItemWidgetState();
}

class _RentGridItemWidgetState extends State<RentGridItemWidget> {
  //todo: this should be removed once we have real data from api
  final List<GridItemData> gridItemsData = const [
    GridItemData(
        title: "the_total_number_of_properties_units_rented",
        imagePath: ImageAssets.soldOrRentedUnits,
        valueUnit: ''),
    GridItemData(
      title: "total_rental_contracts_number",
      imagePath: ImageAssets.totalNumRentContracts,
      valueUnit: '',
    ),
    GridItemData(
        title: "average_rental_price_per_unit_property",
        imagePath: ImageAssets.averageRentUnitPrice,
        valueUnit: 'ر.ق'),
    GridItemData(
        title: "the_total_value_of_lease_contracts",
        imagePath: ImageAssets.totalValRentContracts,
        valueUnit: 'ر.ق'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(AppSizeR.s20)),
        boxShadow: [
          BoxShadow(
              offset: const Offset(1, 1),
              spreadRadius: AppSizeR.s2,
              blurRadius: AppSizeR.s11,
              color: ColorManager.black.withAlpha(30)),
        ],
        gradient: LinearGradient(
          colors: [
            ColorManager.platinum,
            ColorManager.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.2, 1.0],
        ),
      ),
      child: Column(children: [
        SizedBox(height: AppSizeH.s20),
        Row(
          children: [
            Expanded(
              child: Text(gridItemsData[widget.index].title.tr(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
          ],
        ),
        SizedBox(
          height: AppSizeH.s17,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: AppSizeW.s24),
            Flexible(
              child: BlocBuilder<RentGridKPIsBloc, RentGridKPIsState>(
                bloc: context.read<RentGridKPIsBloc>(),
                builder: (context, state) {
                  if (state.isLoading) {
                    return const CircularProgressIndicator();
                  } else if (state.totalContracts.isNotEmpty &&
                      widget.kpi == KPI.totalContracts) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          child: Text(
                              state.totalContracts.first.kpiVal
                                  .formatWithCommas()
                                  .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: AppSizeSp.s18)),
                        ),
                        Text(gridItemsData[widget.index].valueUnit,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontSize: AppSizeSp.s18, height: 0.5)),
                      ],
                    );
                  } else if (state.totalRentedUnits.isNotEmpty &&
                      widget.kpi == KPI.totalRentedUntis) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          child: Text(
                              state.totalRentedUnits.first.kpiVal
                                  .formatWithCommas()
                                  .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: AppSizeSp.s18)),
                        ),
                        Text(gridItemsData[widget.index].valueUnit,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontSize: AppSizeSp.s18, height: 0.5)),
                      ],
                    );
                  } else if (state.hasError) {
                    return Text(state.errorMessage);
                  } else if (state.meanValue.isNotEmpty &&
                      widget.kpi == KPI.meanRentUnitValue) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          child: Text(
                              state.meanValue.first.kpiVal
                                  .formatWithCommas()
                                  .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: AppSizeSp.s18)),
                        ),
                        Text(gridItemsData[widget.index].valueUnit,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontSize: AppSizeSp.s18, height: 0.5)),
                      ],
                    );
                  } else if (state.meanValue.isNotEmpty &&
                      widget.kpi == KPI.totalContractsValue) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          child: Text(
                              state.contractsValue.first.kpiVal
                                  .formatWithCommas()
                                  .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: AppSizeSp.s18)),
                        ),
                        Text(gridItemsData[widget.index].valueUnit,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontSize: AppSizeSp.s18, height: 0.5)),
                      ],
                    );
                  }
                  return Text(AppStrings().dataBeingCollectedAndAudited,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: AppSizeSp.s10));
                },
              ),
            ),
            SizedBox(width: AppSizeW.s16),
            SvgPicture.asset(
              gridItemsData[widget.index].imagePath,
              height: AppSizeH.s70,
              width: AppSizeW.s70,
              color: ColorManager.primary,
            ),
          ],
        )
      ]),
    );
  }
}

// todo: remove this once you have real data
class GridItemData {
  final String title;

  final String imagePath;
  final String valueUnit;

  const GridItemData(
      {required this.title, required this.imagePath, required this.valueUnit});
}
