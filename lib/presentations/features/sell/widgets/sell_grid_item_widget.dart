import 'package:easy_localization/easy_localization.dart';
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
    required this.response,
  });

  @override
  State<SellGridItemWidget> createState() => _SellGridItemWidgetState();
}

class _SellGridItemWidgetState extends State<SellGridItemWidget> {
  List<SellGridItemData> gridItemsData = [];

  @override
  void initState() {
    gridItemsData = const [
      SellGridItemData(
        kpi: SellGridKPIs.totalContracts,
        title: "the_total_number_of_sell_contracts",
        imagePath: IconAssets.totalSellContracts,
        valueUnit: '',
      ),
      SellGridItemData(
        kpi: SellGridKPIs.totalSoldUnits,
        title: "the_total_number_of_properties_units_sold",
        imagePath: ImageAssets.soldOrRentedUnits,
        valueUnit: '',
      ),
      SellGridItemData(
        kpi: SellGridKPIs.totalTransactionsValue,
        title: "the_total_value_of_sell_contracts",
        imagePath: IconAssets.totalSellTransactionsValue,
        valueUnit: "currency",
      ),
      SellGridItemData(
        kpi: SellGridKPIs.meanSellUnitValue,
        title: "average_sell_price_per_unit_property",
        imagePath: ImageAssets.averageRentUnitPrice,
        valueUnit: "currency",
      ),
      SellGridItemData(
        kpi: SellGridKPIs.totalSoldSpaces,
        title: "total_sold_areas",
        imagePath: ImageAssets.averageSquareMeterPrice,
        valueUnit: 'square_meter',
      ),
      SellGridItemData(
        kpi: SellGridKPIs.meanSoldAreaValue,
        title: "sell_average_price_per_square_foot",
        imagePath: ImageAssets.totalRentedSpaces,
        valueUnit: 'currency',
      ),
    ];
    super.initState();
  }

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
      child: Stack(
        children: [
          Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                          child: Text(
                              gridItemsData
                                  .firstWhere(
                                      (element) => element.kpi == widget.kpi)
                                  .title
                                  .tr(),
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSizeH.s5,
                ),
                BlocBuilder<SellGridKPIsBloc, SellGridKPIsState>(
                  bloc: context.read<SellGridKPIsBloc>(),
                  builder: (context, state) {
                    if (state.isLoading || state.hasError) {
                      if (widget.kpi == SellGridKPIs.totalContracts) {
                        // KPI1
                        // اجمالي عدد معاملات البيع
                        return GridValueWithUnitWidget(
                          countUp: false,
                          value: widget.response.kpi1Val,
                          unit: gridItemsData
                              .firstWhere(
                                  (element) => element.kpi == widget.kpi)
                              .valueUnit,
                        );
                      } else if (widget.kpi == SellGridKPIs.totalSoldUnits) {
                        // KPI4
                        // إجمالي عدد العقارات \\ الوحدات المباعة
                        return GridValueWithUnitWidget(
                          countUp: false,
                          value: widget.response.kpi4Val,
                          unit: gridItemsData
                              .firstWhere(
                                  (element) => element.kpi == widget.kpi)
                              .valueUnit,
                        );
                      } else if (widget.kpi ==
                          SellGridKPIs.totalTransactionsValue) {
                        // KPI7
                        // إجمالي قيمة عقود البيع
                        return GridValueWithUnitWidget(
                          countUp: false,
                          value: widget.response.kpi7Val,
                          unit: gridItemsData
                              .firstWhere(
                                  (element) => element.kpi == widget.kpi)
                              .valueUnit,
                        );
                      } else if (widget.kpi == SellGridKPIs.totalSoldSpaces) {
                        // KPI0
                        // إجمالي المساحات المباعة
                        return GridValueWithUnitWidget(
                          countUp: false,
                          value: widget.response.kpi10Val,
                          unit: gridItemsData
                              .firstWhere(
                                  (element) => element.kpi == widget.kpi)
                              .valueUnit,
                        );
                      } else if (widget.kpi == SellGridKPIs.meanSellUnitValue) {
                        // KPI13
                        // متوسط سعر البيع للوحدة \\ العقار
                        return GridValueWithUnitWidget(
                          countUp: false,
                          value: widget.response.kpi13Val,
                          unit: gridItemsData
                              .firstWhere(
                                  (element) => element.kpi == widget.kpi)
                              .valueUnit,
                        );
                      } else if (widget.kpi == SellGridKPIs.meanSoldAreaValue) {
                        // KPI16
                        // متوسط سعر البيع لكل قدم مربع
                        return GridValueWithUnitWidget(
                          countUp: false,
                          value: widget.response.kpi16Val,
                          unit: gridItemsData
                              .firstWhere(
                                  (element) => element.kpi == widget.kpi)
                              .valueUnit,
                          dataCollectedAndAudited: true,
                        );
                      }
                    }

                    ///-------------------Data not from default ----------------
                    else if (state.totalContracts.isNotEmpty &&
                        widget.kpi == SellGridKPIs.totalContracts) {
                      // KPI1
                      // اجمالي عدد معاملات البيع
                      return GridValueWithUnitWidget(
                        countUp: true,
                        duration: 1,
                        begin: widget.response.kpi1Val,
                        end: state.totalContracts.first.kpiVal.toDouble(),
                      );
                    } else if (state.totalSoldUnits.isNotEmpty &&
                        widget.kpi == SellGridKPIs.totalSoldUnits) {
                      // KPI4
                      // إجمالي عدد العقارات \\ الوحدات المباعة
                      return GridValueWithUnitWidget(
                        countUp: true,
                        duration: 1,
                        begin: widget.response.kpi4Val,
                        end: state.totalSoldUnits.first.kpiVal.toDouble(),
                      );
                    } else if (state.totalTransactionsValue.isNotEmpty &&
                        widget.kpi == SellGridKPIs.totalTransactionsValue) {
                      // KPI7
                      // إجمالي قيمة عقود البيع
                      return GridValueWithUnitWidget(
                        countUp: true,
                        duration: 1,
                        begin: widget.response.kpi7Val,
                        end: state.totalTransactionsValue.first.kpiVal
                            .toDouble(),
                        unit: gridItemsData
                            .firstWhere((element) => element.kpi == widget.kpi)
                            .valueUnit,
                      );
                    } else if (state.totalSoldSpaces.isNotEmpty &&
                        widget.kpi == SellGridKPIs.totalSoldSpaces) {
                      // KPI0
                      // إجمالي المساحات المباعة
                      return GridValueWithUnitWidget(
                        countUp: true,
                        duration: 1,
                        begin: widget.response.kpi10Val,
                        end: state.totalSoldSpaces.first.kpiVal.toDouble(),
                        unit: gridItemsData
                            .firstWhere((element) => element.kpi == widget.kpi)
                            .valueUnit,
                      );
                    } else if (state.meanSellUnitValue.isNotEmpty &&
                        widget.kpi == SellGridKPIs.meanSellUnitValue) {
                      // KPI13
                      // متوسط سعر البيع للوحدة \\ العقار
                      return GridValueWithUnitWidget(
                        countUp: true,
                        duration: 1,
                        begin: widget.response.kpi13Val,
                        end: state.meanSellUnitValue.first.kpiVal.toDouble(),
                        unit: gridItemsData
                            .firstWhere((element) => element.kpi == widget.kpi)
                            .valueUnit,
                      );
                    } else if (state.meanSoldAreaValue.isNotEmpty &&
                        widget.kpi == SellGridKPIs.meanSoldAreaValue) {
                      // KPI16
                      // متوسط سعر البيع لكل قدم مربع
                      return GridValueWithUnitWidget(
                        countUp: true,
                        duration: 1,
                        begin: widget.response.kpi16Val,
                        end: state.meanSoldAreaValue.first.kpiVal.toDouble(),
                        unit: gridItemsData
                            .firstWhere((element) => element.kpi == widget.kpi)
                            .valueUnit,
                      );
                    }
                    return GridValueWithUnitWidget(
                      countUp: false,
                      begin: 0,
                      end: 0,
                      unit: gridItemsData
                          .firstWhere((element) => element.kpi == widget.kpi)
                          .valueUnit,
                    );
                  },
                ),
              ]),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: AppSizeH.s72,
              ),
              Flexible(
                flex: 1,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: SvgPicture.asset(
                    gridItemsData
                        .firstWhere((element) => element.kpi == widget.kpi)
                        .imagePath,
                    height: AppSizeH.s70,
                    width: AppSizeW.s70,
                    color: ColorManager.primary.withOpacity(0.6),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// todo: remove this once you have real data
class SellGridItemData {
  final String title;

  final String imagePath;
  final String valueUnit;
  final SellGridKPIs kpi;

  const SellGridItemData({
    required this.title,
    required this.imagePath,
    required this.valueUnit,
    required this.kpi,
  });
}
