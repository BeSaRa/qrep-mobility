import 'package:easy_localization/easy_localization.dart';

import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/widgets/grid_value_with_unit_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../domain/models/rent_models/rent_models.dart';

import '../../../resources/values_manager.dart';
import '../blocs/rent_bloc/rent_grid_kpis_bloc/rent_grid_kpis_bloc.dart';

class RentGridItemWidget extends StatefulWidget {
  final KPI kpi;
  final RentDefault response;

  const RentGridItemWidget({
    super.key,
    required this.kpi,
    required this.response,
  });

  @override
  State<RentGridItemWidget> createState() => _RentGridItemWidgetState();
}

class _RentGridItemWidgetState extends State<RentGridItemWidget> {
  //todo: this should be removed once we have real data from api
  List<RentGridItemData> gridItemsData = [];

  @override
  void initState() {
    gridItemsData = const [
      RentGridItemData(
        kpi: KPI.totalRentedUnits,
        title: "the_total_number_of_properties_units_rented",
        imagePath: ImageAssets.soldOrRentedUnits,
        valueUnit: '',
      ),
      RentGridItemData(
        kpi: KPI.totalContracts,
        title: "total_rental_contracts_number",
        imagePath: ImageAssets.totalNumRentContracts,
        valueUnit: '',
      ),
      RentGridItemData(
          kpi: KPI.meanRentUnitValue,
          title: "average_rental_price_per_unit_property",
          imagePath: ImageAssets.averageRentUnitPrice,
          valueUnit: 'currency'),
      RentGridItemData(
          kpi: KPI.totalContractsValue,
          title: "the_total_value_of_lease_contracts",
          imagePath: ImageAssets.totalValRentContracts,
          valueUnit: 'currency'),
      RentGridItemData(
          kpi: KPI.totalRentedSpaces,
          title: "total_rented_space",
          imagePath: ImageAssets.totalRentedSpaces,
          valueUnit: 'square_meter'),
      RentGridItemData(
          kpi: KPI.meanAreaValue,
          title: "the_average_price_per_square_meter_square_foot",
          imagePath: ImageAssets.averageSquareMeterPrice,
          valueUnit: 'currency'),
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
      child: Column(
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
                            .firstWhere((element) => element.kpi == widget.kpi)
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
            height: AppSizeH.s17,
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(width: AppSizeW.s24),
                BlocBuilder<RentGridKPIsBloc, RentGridKPIsState>(
                  bloc: context.read<RentGridKPIsBloc>(),
                  builder: (context, state) {
                    if (state.isLoading || state.hasError) {
                      if (widget.kpi == KPI.totalContracts) {
                        // KPI1
                        // إجمالي عدد عقود الإيجار
                        return GridValueWithUnitWidget(
                          countUp: false,
                          value: widget.response.kpi1Val ?? 0,
                          unit: gridItemsData
                              .firstWhere(
                                  (element) => element.kpi == widget.kpi)
                              .valueUnit,
                        );
                      } else if (widget.kpi == KPI.totalRentedUnits) {
                        // KPI4
                        // إجمالي عدد الوحدات \\ العقارات المستأجرة
                        return GridValueWithUnitWidget(
                          countUp: false,
                          value: widget.response.kpi4Val,
                          unit: gridItemsData
                              .firstWhere(
                                  (element) => element.kpi == widget.kpi)
                              .valueUnit,
                        );
                      } else if (widget.kpi == KPI.totalContractsValue) {
                        // KPI7
                        // إجمالي قيمة عقود الإيجار
                        return GridValueWithUnitWidget(
                          countUp: false,
                          value: widget.response.kpi7Val,
                          unit: gridItemsData
                              .firstWhere(
                                  (element) => element.kpi == widget.kpi)
                              .valueUnit,
                        );
                      } else if (widget.kpi == KPI.totalRentedSpaces) {
                        // KPI0
                        // إجمالي المساحات المؤجرة
                        // todo: edit this once you have a valid response
                        return GridValueWithUnitWidget(
                          countUp: false,
                          value: widget.response.kpi10Val,
                          unit: '',
                          dataCollectedAndAudited: true,
                        );
                      } else if (widget.kpi == KPI.meanRentUnitValue) {
                        // KPI13
                        // متوسط قيمة الإيجار لكل وحدة \\ عقار
                        return GridValueWithUnitWidget(
                          countUp: false,
                          value: widget.response.kpi13Val,
                          unit: gridItemsData
                              .firstWhere(
                                  (element) => element.kpi == widget.kpi)
                              .valueUnit,
                        );
                      } else if (widget.kpi == KPI.meanAreaValue) {
                        // KPI16
                        // متوسط السعر لكل متر مربع \\ قدم مربع
                        return GridValueWithUnitWidget(
                          countUp: false,
                          value: widget.response.kpi16Val,
                          // unit: gridItemsData[widget.index].valueUnit,
                          dataCollectedAndAudited: true,
                        );
                      }
                    }

                    ///-------------------Data not from default ----------------
                    else if (state.totalContracts.isNotEmpty &&
                        widget.kpi == KPI.totalContracts) {
                      // KPI1
                      // إجمالي عدد عقود الإيجار
                      return GridValueWithUnitWidget(
                        countUp: true,
                        duration: 1,
                        begin: widget.response.kpi1Val,
                        end: state.totalContracts.first.kpiVal,
                      );
                    } else if (state.totalRentedUnits.isNotEmpty &&
                        widget.kpi == KPI.totalRentedUnits) {
                      // KPI4
                      // إجمالي عدد الوحدات \\ العقارات المستأجرة
                      return GridValueWithUnitWidget(
                        countUp: true,
                        duration: 1,
                        begin: widget.response.kpi4Val,
                        end: state.totalRentedUnits.first.kpiVal.toDouble(),
                      );
                    } else if (state.totalContractsValue.isNotEmpty &&
                        widget.kpi == KPI.totalContractsValue) {
                      // KPI7
                      // إجمالي قيمة عقود الإيجار
                      return GridValueWithUnitWidget(
                        countUp: true,
                        duration: 1,
                        begin: widget.response.kpi7Val,
                        end: state.totalContractsValue.first.kpiVal.toDouble(),
                        unit: gridItemsData
                            .firstWhere((element) => element.kpi == widget.kpi)
                            .valueUnit,
                      );
                    } else if (state.totalRentedSpace.isNotEmpty &&
                        widget.kpi == KPI.totalRentedSpaces) {
                      // KPI0
                      // إجمالي المساحات المؤجرة
                      return GridValueWithUnitWidget(
                        countUp: true,
                        duration: 1,
                        begin: widget.response.kpi10Val,
                        end: state.totalRentedSpace.first.kpiVal.toDouble(),
                        unit: gridItemsData
                            .firstWhere((element) => element.kpi == widget.kpi)
                            .valueUnit,
                      );
                    } else if (state.meanRentUnitValue.isNotEmpty &&
                        widget.kpi == KPI.meanRentUnitValue) {
                      // KPI13
                      // متوسط قيمة الإيجار لكل وحدة \\ عقار
                      return GridValueWithUnitWidget(
                        countUp: true,
                        duration: 1,
                        begin: widget.response.kpi13Val,
                        end: state.meanRentUnitValue.first.kpiVal.toDouble(),
                        unit: gridItemsData
                            .firstWhere((element) => element.kpi == widget.kpi)
                            .valueUnit,
                      );
                    } else if (state.meanAreaValue.isNotEmpty &&
                        widget.kpi == KPI.meanAreaValue) {
                      // KPI16
                      // متوسط السعر لكل متر مربع \\ قدم مربع
                      return GridValueWithUnitWidget(
                        countUp: true,
                        duration: 1,
                        begin: widget.response.kpi16Val,
                        end: state.meanAreaValue.first.kpiVal.toDouble(),
                        // unit: gridItemsData[widget.index].valueUnit,
                        dataCollectedAndAudited: true,
                      );
                    }
                    // todo: consider using something else other than showing dataCollectedAndAudited when reaching this case, (should not be reached)
                    return const GridValueWithUnitWidget(
                      countUp: false,
                      begin: 0,
                      end: 0,
                      unit: '',
                      dataCollectedAndAudited: true,
                    );
                  },
                ),
                SizedBox(width: AppSizeW.s16),
                AspectRatio(
                  aspectRatio: 1,
                  child: SvgPicture.asset(
                    gridItemsData
                        .firstWhere((element) => element.kpi == widget.kpi)
                        .imagePath,
                    height: AppSizeH.s70,
                    width: AppSizeW.s70,
                    color: ColorManager.primary,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// todo: remove this once you have real data
class RentGridItemData {
  final String title;

  final String imagePath;
  final String valueUnit;
  final KPI kpi;

  const RentGridItemData({
    required this.title,
    required this.imagePath,
    required this.valueUnit,
    required this.kpi,
  });
}
