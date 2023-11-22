import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/presentations/features/more/widgets/dialog_disabled_filters_warning.dart';
import 'package:ebla/presentations/features/mortagage/blocs/mortgage_grid_kpis_bloc/mortgage_grid_kpis_bloc.dart';
import 'package:ebla/presentations/features/rent/blocs/cubits/cubit/change_status_cubit.dart';
import 'package:ebla/presentations/features/rent/blocs/rent_bloc/rent_bloc.dart';
import 'package:ebla/presentations/features/sell/blocs/sell_bloc/sell_bloc.dart';
import 'package:ebla/presentations/features/sell/blocs/sell_grid_kpis_bloc/sell_grid_kpis_bloc.dart';

import 'package:ebla/presentations/resources/resources.dart';

import 'package:ebla/presentations/widgets/grid/grid_value_with_unit_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui' as ui;

import '../../../domain/models/rent_models/rent_models.dart';

import '../../features/rent/blocs/rent_bloc/rent_grid_kpis_bloc/rent_grid_kpis_bloc.dart';

class GridItemWidget extends StatefulWidget {
  final RentGridKPIs? rentKPI;
  final SellGridKPIs? sellKPI;
  final MortgageGridKPIs? mortgageKPI;
  final GridItemType gridItemType;
  final RentDefault defaultResponse;
  final bool useDefaultValue;

  const GridItemWidget({
    super.key,
    required this.gridItemType,
    required this.rentKPI,
    required this.defaultResponse,
    required this.sellKPI,
    required this.mortgageKPI,
    this.useDefaultValue = true,
  });

  @override
  State<GridItemWidget> createState() => _GridItemWidgetState();
}

class _GridItemWidgetState extends State<GridItemWidget> {
  late ChangeStatusCubit updateTitleCubit;
  num beginVal = 0;
  num endVal = 0;
  ValueNotifier<num> changeRateValue = ValueNotifier<num>(0);

  @override
  void initState() {
    super.initState();
    updateTitleCubit = ChangeStatusCubit();
    beginVal = widget.useDefaultValue
        ? getDefaultVal(gridItemType: widget.gridItemType)
        : 0;
    endVal = beginVal;
  }

  List<RentGridItemData> rentGridItemsData = const [
    RentGridItemData(
      kpi: RentGridKPIs.totalContracts,
      title: "total_rental_contracts_number",
      imagePath: ImageAssets.totalNumRentContracts,
      valueUnit: '',
    ),
    RentGridItemData(
      kpi: RentGridKPIs.totalRentedUnits,
      title: "the_total_number_of_properties_units_rented",
      imagePath: ImageAssets.soldOrRentedUnits,
      valueUnit: '',
    ),
    RentGridItemData(
        kpi: RentGridKPIs.totalContractsValue,
        title: "the_total_value_of_lease_contracts",
        imagePath: ImageAssets.totalValRentContracts,
        valueUnit: "qr"),
    RentGridItemData(
        kpi: RentGridKPIs.meanRentUnitValue,
        title: "average_rental_price_per_unit_property",
        imagePath: ImageAssets.averageRentUnitPrice,
        valueUnit: "qr"),
    RentGridItemData(
        kpi: RentGridKPIs.totalRentedSpaces,
        title: "total_rented_space",
        imagePath: ImageAssets.averageSquareMeterPrice,
        valueUnit: 'square_meter'),
    RentGridItemData(
        kpi: RentGridKPIs.meanRentAreaValue,
        title: "the_average_price_per_square_meter_square_foot",
        imagePath: ImageAssets.totalRentedSpaces,
        valueUnit: "qr"),
  ];
  List<SellGridItemData> sellGridItemsData = const [
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
      valueUnit: "qr",
    ),
    SellGridItemData(
      kpi: SellGridKPIs.meanSellUnitValue,
      title: "average_sell_price_per_unit_property",
      imagePath: ImageAssets.averageRentUnitPrice,
      valueUnit: "qr",
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
      valueUnit: "qr",
    ),
  ];
  List<MortgageGridItemData> mortgageGridItemsData = [
    // عدد معاملات الرهن
    const MortgageGridItemData(
      kpi: MortgageGridKPIs.totalMortgageTransactions,
      title: "total_mortgage_transactions",
      imagePath: IconAssets.totalMortgageTransactions,
      valueUnit: '',
    ),
    // "إجمالي عدد الوحدات المرهونة"
    const MortgageGridItemData(
      kpi: MortgageGridKPIs.totalMortgageUnitsNum,
      title: "the_total_number_of_mortgaged_units",
      imagePath: IconAssets.totalMortgageUnitsNum,
      valueUnit: '',
    ),
    // "إجمالي قيمة معاملات الرهن"
    const MortgageGridItemData(
      kpi: MortgageGridKPIs.totalMortgageTransactionsValue,
      title: "total_value_of_mortgage_transactions",
      imagePath: IconAssets.totalMortgageTransactionsValue,
      valueUnit: "qr",
    ),
  ];

  String getImagePath() {
    try {
      switch (widget.gridItemType) {
        case GridItemType.rent:
          return rentGridItemsData
              .singleWhere((element) => element.kpi == widget.rentKPI)
              .imagePath;

        case GridItemType.sell:
          return sellGridItemsData
              .singleWhere((element) => element.kpi == widget.sellKPI)
              .imagePath;

        case GridItemType.mortgage:
          return (mortgageGridItemsData.singleWhere(
            (element) => element.kpi == widget.mortgageKPI,
          )).imagePath;
        default:
          return '';
      }
    } catch (e) {
      return '';
    }
  }

  String getTitle() {
    try {
      switch (widget.gridItemType) {
        case GridItemType.rent:
          return widget.rentKPI == RentGridKPIs.meanRentAreaValue
              ? context.read<RentBloc>().requestMeanValue.unit == 1
                  ? AppStrings().avgPricePerSquareMeter
                  : AppStrings().avgPricePerSquareFoot
              : rentGridItemsData
                  .singleWhere((element) => element.kpi == widget.rentKPI)
                  .title
                  .tr();

        case GridItemType.sell:
          return widget.sellKPI == SellGridKPIs.meanSoldAreaValue
              ? context.read<SellBloc>().requestSell.unit == 1
                  ? AppStrings().avgPricePerSquareMeter
                  : AppStrings().avgPricePerSquareFoot
              : sellGridItemsData
                  .singleWhere((element) => element.kpi == widget.sellKPI)
                  .title
                  .tr();

        case GridItemType.mortgage:
          return (mortgageGridItemsData.singleWhere(
            (element) => element.kpi == widget.mortgageKPI,
          )).title.tr();
        default:
          return '';
      }
    } catch (e) {
      return '';
    }
  }

  num getDefaultVal({required GridItemType gridItemType}) {
    switch (gridItemType) {
      case GridItemType.rent:
        return RentGridKPIsBloc.getDefaultValue(
            widget.defaultResponse, widget.rentKPI);
      case GridItemType.sell:
        return SellGridKPIsBloc.getDefaultKpiVal(
            widget.defaultResponse, widget.sellKPI);
      case GridItemType.mortgage:
        // no default values for mortgage
        return 0;
      default:
    }
    return 0;
  }

  bool isDisabled() {
    switch (widget.gridItemType) {
      case GridItemType.rent:
        return (widget.rentKPI == RentGridKPIs.meanRentUnitValue ||
                widget.rentKPI == RentGridKPIs.meanRentAreaValue) &&
            (context.read<RentBloc>().requestMeanValue.zoneId == -1 ||
                (context
                        .read<RentBloc>()
                        .requestMeanValue
                        .propertyTypeList
                        ?.contains(-1) ??
                    false) ||
                (context
                        .read<RentBloc>()
                        .requestMeanValue
                        .purposeList
                        ?.contains(-1) ??
                    false));
      case GridItemType.sell:
        return (widget.sellKPI == SellGridKPIs.meanSellUnitValue ||
                widget.sellKPI == SellGridKPIs.meanSoldAreaValue) &&
            (context.read<SellBloc>().requestSell.areaCode == -1 ||
                (context
                        .read<SellBloc>()
                        .requestSell
                        .propertyTypeList
                        ?.contains(-1) ??
                    false) ||
                (context
                        .read<SellBloc>()
                        .requestSell
                        .purposeList
                        ?.contains(-1) ??
                    false));
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppSizeH.s144,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(AppSizeR.s20)),
          boxShadow: [
            BoxShadow(
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
        child: BlocBuilder(
            bloc: context.read<ChangeStatusCubit>(),
            builder: (context, state) {
              return isDisabled()
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: AppSizeH.s15),
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: AppSizeW.s20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    getTitle(),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.visible,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(fontSize: AppSizeSp.s14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            showDialog(
                                context: context,
                                builder: (BuildContext ctxt) =>
                                    DialogDisabledFiltersWarning(
                                      message:
                                          """${AppStrings().zone}: ${AppStrings().valuesOtherThanAll}
${AppStrings().propertyType}: ${AppStrings().singleValueOtherThanAll}
${AppStrings().propertyUsage}: ${AppStrings().singleValueOtherThanAll}""",
                                    ));
                          },
                          icon: Icon(Icons.info_outline_rounded,
                              size: AppSizeSp.s30),
                        )
                      ],
                    )
                  : Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: AppSizeH.s15),
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppSizeW.s20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        getTitle(),
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.visible,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(fontSize: AppSizeSp.s14),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: AppSizeH.s5,
                            ),
                            if (widget.gridItemType == GridItemType.rent)
                              BlocBuilder<RentGridKPIsBloc, RentGridKPIsState>(
                                bloc: context.read<RentGridKPIsBloc>(),
                                builder: (context, state) {
                                  List<BaseRentResponse> dataState =
                                      RentGridKPIsBloc.getState(
                                          state, widget.rentKPI);

                                  if (!state.isLoading) {
                                    // endVal ---> (0: kpiVal)
                                    beginVal = endVal;
                                    endVal = dataState.isEmpty
                                        ? 0
                                        : dataState.first.kpiVal;
                                  }

                                  WidgetsBinding.instance
                                      .addPostFrameCallback((timeStamp) {
                                    changeRateValue.value = dataState.isNotEmpty
                                        ? dataState.first.kpiYoYVal
                                        : 0;
                                  });
                                  return GridValueWithUnitWidget(
                                    begin: beginVal,
                                    end: endVal,
                                    unit: (widget.rentKPI ==
                                                RentGridKPIs
                                                    .totalRentedSpaces ||
                                            widget.rentKPI ==
                                                RentGridKPIs.meanRentAreaValue)
                                        ? ''
                                        : rentGridItemsData
                                            .firstWhere((element) =>
                                                element.kpi == widget.rentKPI)
                                            .valueUnit,
                                    dataCollectedAndAudited: widget.rentKPI ==
                                            RentGridKPIs.totalRentedSpaces ||
                                        widget.rentKPI ==
                                            RentGridKPIs.meanRentAreaValue,
                                  );
                                },
                              ),
                            if (widget.gridItemType == GridItemType.sell)
                              BlocBuilder<SellGridKPIsBloc, SellGridKPIsState>(
                                bloc: context.read<SellGridKPIsBloc>(),
                                builder: (context, state) {
                                  var dataState = SellGridKPIsBloc.getState(
                                      state, widget.sellKPI);

                                  if (!state.isLoading) {
                                    // endVal ---> (0: kpiVal)
                                    beginVal = endVal;
                                    endVal = dataState.isEmpty
                                        ? 0
                                        : SellGridKPIsBloc
                                            .getKpiValOrYoYFromTypeAndUnit(
                                                dataState: dataState,
                                                unitType: context
                                                    .read<SellBloc>()
                                                    .requestSell
                                                    .unit,
                                                returnYoYVal: false);
                                  }

                                  WidgetsBinding.instance
                                      .addPostFrameCallback((timeStamp) {
                                    changeRateValue.value = dataState.isNotEmpty
                                        ? SellGridKPIsBloc
                                            .getKpiValOrYoYFromTypeAndUnit(
                                                dataState: dataState,
                                                unitType: context
                                                    .read<SellBloc>()
                                                    .requestSell
                                                    .unit,
                                                returnYoYVal: true)
                                        : 0;
                                  });
                                  return GridValueWithUnitWidget(
                                    begin: beginVal,
                                    end: endVal,
                                    unit: widget.sellKPI ==
                                            SellGridKPIs.totalSoldSpaces
                                        ? context
                                                    .read<SellBloc>()
                                                    .requestSell
                                                    .unit ==
                                                1
                                            ? 'square_meter'
                                            : 'square_foot'
                                        : sellGridItemsData
                                            .firstWhere((element) =>
                                                element.kpi == widget.sellKPI)
                                            .valueUnit,
                                  );
                                },
                              ),
                            if (widget.gridItemType == GridItemType.mortgage)
                              BlocBuilder<MortgageGridKPIsBloc,
                                  MortgageGridKPIsState>(
                                bloc: context.read<MortgageGridKPIsBloc>(),
                                builder: (context, state) {
                                  List<BaseRentResponse> dataState =
                                      MortgageGridKPIsBloc.getState(
                                          state, widget.mortgageKPI);

                                  if (!state.isLoading) {
                                    beginVal = endVal;
                                    endVal = dataState.isEmpty
                                        ? 0
                                        : dataState.first.kpiVal;
                                  }

                                  WidgetsBinding.instance
                                      .addPostFrameCallback((timeStamp) {
                                    changeRateValue.value = dataState.isNotEmpty
                                        ? dataState.first.kpiYoYVal
                                        : 0;
                                  });

                                  return GridValueWithUnitWidget(
                                    begin: beginVal,
                                    end: endVal,
                                    unit: mortgageGridItemsData
                                        .firstWhere((element) =>
                                            element.kpi == widget.mortgageKPI)
                                        .valueUnit,
                                  );
                                },
                              ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(height: AppSizeH.s94),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsetsDirectional.only(
                                    start: AppSizeW.s12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    (widget.rentKPI !=
                                                RentGridKPIs
                                                    .totalRentedSpaces &&
                                            widget.rentKPI !=
                                                RentGridKPIs.meanRentAreaValue)
                                        ? ValueListenableBuilder(
                                            valueListenable: changeRateValue,
                                            builder: (context, value, child) {
                                              return Flexible(
                                                child: FittedBox(
                                                  child: Row(
                                                    children: [
                                                      Transform.flip(
                                                        flipY: value.isNegative,
                                                        child: SvgPicture.asset(
                                                          color: value
                                                                  .isNegative
                                                              ? ColorManager.red
                                                                  .withAlpha(95)
                                                              : null,
                                                          IconAssets.arrow,
                                                          height: AppSizeH.s8,
                                                          width: AppSizeW.s8,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width: AppSizeW.s5),
                                                      Text(
                                                        textDirection: ui
                                                            .TextDirection.ltr,
                                                        '${value.toStringAsFixed(2)} % YoY',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleSmall!
                                                            .copyWith(
                                                                fontSize:
                                                                    AppSizeSp
                                                                        .s15),
                                                        textAlign:
                                                            TextAlign.end,
                                                      ),
                                                      SizedBox(
                                                          width: AppSizeW.s5),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          )
                                        : const SizedBox(),
                                    AspectRatio(
                                      aspectRatio: 1,
                                      child: SvgPicture.asset(
                                        getImagePath(),
                                        width: AppSizeW.s56,
                                        color: ColorManager.primary
                                            .withOpacity(0.6),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
            }));
  }
}

//----------------------------data_object---------------------------------------
class RentGridItemData {
  final String title;

  final String imagePath;
  final String valueUnit;
  final RentGridKPIs kpi;

  const RentGridItemData({
    required this.title,
    required this.imagePath,
    required this.valueUnit,
    required this.kpi,
  });
}

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

class MortgageGridItemData {
  final String title;

  final String imagePath;
  final String valueUnit;
  final MortgageGridKPIs kpi;

  const MortgageGridItemData({
    required this.title,
    required this.imagePath,
    required this.valueUnit,
    required this.kpi,
  });
}

//--------------------------enums-----------------------------------------------
enum GridItemType {
  rent,
  sell,
  mortgage,
}

enum RentGridKPIs {
  /// KPI1
  totalContracts,

  /// KPI4
  totalRentedUnits,

  /// KPI7
  totalContractsValue,

  /// KPI13
  meanRentUnitValue,

  /// KPI10
  totalRentedSpaces,

  /// KPI16
  meanRentAreaValue,
}

enum SellGridKPIs {
  /// KPI1
  totalContracts,

  /// KPI4
  totalSoldUnits,

  /// KPI7
  totalTransactionsValue,

  /// KPI13
  meanSellUnitValue,

  /// KPI10
  totalSoldSpaces,

  /// KPI16
  meanSoldAreaValue,
}

enum MortgageGridKPIs {
  /// KPI1
  totalMortgageTransactions,

  /// KPI3
  totalMortgageUnitsNum,

  /// KPI5
  totalMortgageTransactionsValue,
}
