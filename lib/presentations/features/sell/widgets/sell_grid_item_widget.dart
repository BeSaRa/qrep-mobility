import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/app/extensions.dart';
import 'package:ebla/presentations/features/sell/blocs/sell_grid_kpis_bloc/sell_grid_kpis_bloc.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/widgets/grid_value_with_unit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../domain/models/rent_models/rent_models.dart';
import '../../../resources/values_manager.dart';

class SellGridItemWidget extends StatefulWidget {
  final SellGridKPIs kpi;
  final RentDefault response;

  const SellGridItemWidget({
    super.key,
    required this.kpi,
    required this.index,
    required this.response,
  });

  final int index;

  @override
  State<SellGridItemWidget> createState() => _SellGridItemWidgetState();
}

class _SellGridItemWidgetState extends State<SellGridItemWidget> {
  //todo: this should be removed once we have real data from api
  final List<GridItemData> gridItemsData = const [
    GridItemData(
        title: "the_total_number_of_properties_units_sold",
        imagePath: ImageAssets.soldOrRentedUnits,
        valueUnit: ''),
    GridItemData(
      title: "the_total_number_of_sell_contracts",
      imagePath: ImageAssets.totalNumRentContracts,
      valueUnit: '',
    ),
    GridItemData(
        title: "average_sell_price_per_unit_property",
        imagePath: ImageAssets.averageRentUnitPrice,
        valueUnit: "currency"),
    GridItemData(
        title: "the_total_value_of_sell_contracts",
        imagePath: ImageAssets.totalValRentContracts,
        valueUnit: "currency"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizeH.s140,
      clipBehavior: Clip.hardEdge,
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
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(height: AppSizeH.s20),
        Flexible(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizeW.s20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(gridItemsData[widget.index].title.tr(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: AppSizeH.s17,
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(width: AppSizeW.s24),
              BlocBuilder<SellGridKPIsBloc, SellGridKPIsState>(
                bloc: context.read<SellGridKPIsBloc>(),
                builder: (context, state) {
                  if (state.isLoading || state.hasError) {
                    if (widget.kpi == SellGridKPIs.totalContracts) {
                      // KPI1
                      return GridValueWithUnitWidget(
                        countUp: false,
                        value:
                            (widget.response.kpi1Val ?? 0).formatWithCommas(),
                        unit: gridItemsData[widget.index].valueUnit,
                      );
                    } else if (widget.kpi == SellGridKPIs.totalSoldUnits) {
                      // KPI4
                      return GridValueWithUnitWidget(
                        countUp: false,
                        value:
                            (widget.response.kpi4Val ?? 0).formatWithCommas(),
                        unit: gridItemsData[widget.index].valueUnit,
                      );
                    } else if (widget.kpi == SellGridKPIs.meanSellValue) {
                      // KPI13
                      return GridValueWithUnitWidget(
                        countUp: false,
                        value:
                            (widget.response.kpi13Val ?? 0).formatWithCommas(),
                        unit: gridItemsData[widget.index].valueUnit,
                      );
                    } else if (widget.kpi == SellGridKPIs.totalTransactions) {
                      // KPI7
                      return GridValueWithUnitWidget(
                        countUp: false,
                        value:
                            (widget.response.kpi7Val ?? 0).formatWithCommas(),
                        unit: gridItemsData[widget.index].valueUnit,
                      );
                    }
                  } else if (state.totalContracts.isNotEmpty &&
                      widget.kpi == SellGridKPIs.totalContracts) {
                    // KPI1
                    return GridValueWithUnitWidget(
                      countUp: true,
                      duration: 1,
                      begin: widget.response.kpi1Val ?? 0,
                      end: state.totalContracts.first.kpiVal.toDouble(),
                    );
                  } else if (state.totalSoldUnits.isNotEmpty &&
                      widget.kpi == SellGridKPIs.totalSoldUnits) {
                    // KPI4
                    return GridValueWithUnitWidget(
                      countUp: true,
                      duration: 1,
                      begin: widget.response.kpi1Val ?? 0,
                      end: state.totalSoldUnits.first.kpiVal.toDouble(),
                    );
                  } else if (state.meanValue.isNotEmpty &&
                      widget.kpi == SellGridKPIs.meanSellValue) {
                    // KPI13
                    return GridValueWithUnitWidget(
                      countUp: true,
                      duration: 1,
                      begin: widget.response.kpi1Val ?? 0,
                      end: state.meanValue.first.kpiVal.toDouble(),
                      unit: gridItemsData[widget.index].valueUnit,
                    );
                  } else if (state.meanValue.isNotEmpty &&
                      widget.kpi == SellGridKPIs.totalTransactions) {
                    // KPI17
                    return GridValueWithUnitWidget(
                      countUp: true,
                      duration: 1,
                      begin: widget.response.kpi1Val ?? 0,
                      end: state.contractsValue.first.kpiVal.toDouble(),
                      unit: gridItemsData[widget.index].valueUnit,
                    );
                  }
                  return GridValueWithUnitWidget(
                    countUp: false,
                    begin: 0,
                    end: 0,
                    unit: gridItemsData[widget.index].valueUnit,
                  );
                },
              ),
              SizedBox(width: AppSizeW.s16),
              AspectRatio(
                aspectRatio: 1,
                child: SvgPicture.asset(
                  gridItemsData[widget.index].imagePath,
                  height: AppSizeH.s70,
                  width: AppSizeW.s70,
                  color: ColorManager.primary,
                ),
              ),
            ],
          ),
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
