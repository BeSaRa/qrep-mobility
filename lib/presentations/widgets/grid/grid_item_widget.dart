import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/presentations/features/mortagage/blocs/mortgage_grid_kpis_bloc/mortgage_grid_kpis_bloc.dart';
import 'package:ebla/presentations/features/sell/blocs/sell_grid_kpis_bloc/sell_grid_kpis_bloc.dart';
import 'package:ebla/presentations/features/mortagage/blocs/mortgage_bloc.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/widgets/grid/grid_value_with_unit_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../domain/models/rent_models/rent_models.dart';

import '../../resources/values_manager.dart';
import '../../features/rent/blocs/rent_bloc/rent_grid_kpis_bloc/rent_grid_kpis_bloc.dart';

class GridItemWidget extends StatefulWidget {
  final RentGridKPIs? rentKPI;
  final SellGridKPIs? sellKPI;
  final MortgageGridKPIs? mortgageKPI;
  final GridItemType gridItemType;
  final RentDefault response;

  const GridItemWidget({
    super.key,
    required this.gridItemType,
    required this.rentKPI,
    required this.response,
    required this.sellKPI,
    required this.mortgageKPI,
  });

  @override
  State<GridItemWidget> createState() => _GridItemWidgetState();
}

class _GridItemWidgetState extends State<GridItemWidget> {
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
          return rentGridItemsData
              .singleWhere((element) => element.kpi == widget.rentKPI)
              .title
              .tr();

        case GridItemType.sell:
          return sellGridItemsData
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
                          getTitle(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontWeight: FontWeight.w700),
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
                    List<BaseRentResponse> dataState = [];
                    bool hasError = false;
                    num defaultValue = 0;

                    dataState =
                        RentGridKPIsBloc.getState(state, widget.rentKPI);
                    hasError =
                        RentGridKPIsBloc.getErrorValue(state, widget.rentKPI);
                    defaultValue = RentGridKPIsBloc.getKPIVal(
                        widget.response, widget.rentKPI);

                    return GridValueWithUnitWidget(
                      countUp:
                          dataState.isNotEmpty || !state.isLoading || !hasError,
                      defaultValue: defaultValue,
                      end: dataState.isNotEmpty
                          ? dataState.first.kpiVal
                          : defaultValue,
                      unit: (widget.rentKPI == RentGridKPIs.totalRentedSpaces ||
                              widget.rentKPI == RentGridKPIs.meanRentAreaValue)
                          ? ''
                          : rentGridItemsData
                              .firstWhere(
                                  (element) => element.kpi == widget.rentKPI)
                              .valueUnit,
                      dataCollectedAndAudited:
                          widget.rentKPI == RentGridKPIs.totalRentedSpaces ||
                              widget.rentKPI == RentGridKPIs.meanRentAreaValue,
                    );
                  },
                ),
              if (widget.gridItemType == GridItemType.sell)
                BlocBuilder<SellGridKPIsBloc, SellGridKPIsState>(
                  bloc: context.read<SellGridKPIsBloc>(),
                  builder: (context, state) {
                    List<BaseRentResponse> dataState = [];
                    bool hasError = false;
                    num defaultValue = 0;

                    dataState =
                        SellGridKPIsBloc.getState(state, widget.sellKPI);
                    hasError =
                        SellGridKPIsBloc.getErrorValue(state, widget.sellKPI);
                    defaultValue = SellGridKPIsBloc.getKPIVal(
                        widget.response, widget.sellKPI);

                    return GridValueWithUnitWidget(
                      countUp:
                          dataState.isNotEmpty || !state.isLoading || !hasError,
                      defaultValue: defaultValue,
                      end: dataState.isNotEmpty
                          ? dataState.first.kpiVal
                          : defaultValue,
                      unit: sellGridItemsData
                          .firstWhere(
                              (element) => element.kpi == widget.sellKPI)
                          .valueUnit,
                    );
                  },
                ),
              if (widget.gridItemType == GridItemType.mortgage)
                BlocBuilder<MortgageGridKPIsBloc, MortgageGridKPIsState>(
                  bloc: context.read<MortgageGridKPIsBloc>(),
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                            ],
                          ));
                    } else if (state.hasErrorTotalMortgageTransactions ||
                        state.hasErrortotalMortgageUnitsNum ||
                        state.hasErrorTotalMortgageTransactionsValue) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                context.read<MortgageGridKPIsBloc>().add(
                                    MortgageGridKPIsEvent.getData(
                                        request: context
                                            .read<MortgageBloc>()
                                            .requestMeanValue));
                              },
                              icon: const Icon(Icons.refresh)),
                        ],
                      );
                    }
                    List<BaseRentResponse> dataState = [];
                    bool hasError = false;
                    num defaultValue = 0;
                    dataState = MortgageGridKPIsBloc.getState(
                        state, widget.mortgageKPI);
                    hasError = MortgageGridKPIsBloc.getErrorValue(
                        state, widget.mortgageKPI);
                    defaultValue = 0;
                    return GridValueWithUnitWidget(
                      countUp:
                          dataState.isNotEmpty || !state.isLoading || !hasError,
                      defaultValue: defaultValue,
                      end: dataState.isNotEmpty
                          ? dataState.first.kpiVal
                          : defaultValue,
                      unit: mortgageGridItemsData
                          .firstWhere(
                              (element) => element.kpi == widget.mortgageKPI)
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
              SizedBox(
                height: AppSizeH.s80,
              ),
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: SvgPicture.asset(
                        getImagePath(),
                        height: AppSizeH.s70,
                        width: AppSizeW.s70,
                        color: ColorManager.primary.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
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
