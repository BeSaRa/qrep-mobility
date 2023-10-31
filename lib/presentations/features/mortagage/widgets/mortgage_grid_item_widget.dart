import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/presentations/features/mortagage/blocs/mortgage_bloc.dart';
import 'package:ebla/presentations/features/mortagage/blocs/mortgage_grid_kpis_bloc/mortgage_grid_kpis_bloc.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:ebla/presentations/widgets/grid_value_with_unit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MortgageGridItemWidget extends StatefulWidget {
  final MortgageGridKPIs kpi;

  const MortgageGridItemWidget({
    super.key,
    required this.kpi,
  });

  @override
  State<MortgageGridItemWidget> createState() => _MortgageGridItemWidgetState();
}

class _MortgageGridItemWidgetState extends State<MortgageGridItemWidget> {
  List<MortgageGridItemData> gridItemsData = [];

  @override
  void initState() {
    gridItemsData = [
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
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontWeight: FontWeight.w700)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppSizeH.s5,
              ),
              BlocBuilder<MortgageGridKPIsBloc, MortgageGridKPIsState>(
                bloc: context.read<MortgageGridKPIsBloc>(),
                builder: (context, state) {
                  if (state.hasError) {
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
                  } else if (state.isLoading) {
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
                  } else if (state.totalMortgageTransactions.isNotEmpty &&
                      widget.kpi ==
                          MortgageGridKPIs.totalMortgageTransactions) {
                    /// KPI1
                    /// عدد معاملات الرهن
                    return GridValueWithUnitWidget(
                      countUp: true,
                      duration: 1,
                      begin: 0,
                      end: state.totalMortgageTransactions.first.kpiVal
                          .toDouble(),
                      unit: gridItemsData
                          .firstWhere((element) => element.kpi == widget.kpi)
                          .valueUnit,
                    );
                  } else if (state.totalMortgageUnitsNum.isNotEmpty &&
                      widget.kpi == MortgageGridKPIs.totalMortgageUnitsNum) {
                    // KPI3
                    /// إجمالي عدد الوحدات المرهونة
                    return GridValueWithUnitWidget(
                      countUp: true,
                      duration: 1,
                      begin: 0,
                      end: state.totalMortgageUnitsNum.first.kpiVal.toDouble(),
                      unit: gridItemsData
                          .firstWhere((element) => element.kpi == widget.kpi)
                          .valueUnit,
                    );
                  } else if (state.totalMortgageTransactionsValue.isNotEmpty &&
                      widget.kpi ==
                          MortgageGridKPIs.totalMortgageTransactionsValue) {
                    // KPI5
                    /// إجمالي قيمة معاملات الرهن
                    return GridValueWithUnitWidget(
                      countUp: true,
                      duration: 1,
                      begin: 0,
                      end: state.totalMortgageTransactionsValue.first.kpiVal
                          .toDouble(),
                      unit: gridItemsData
                          .firstWhere((element) => element.kpi == widget.kpi)
                          .valueUnit,
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
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
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
                        gridItemsData
                            .firstWhere((element) => element.kpi == widget.kpi)
                            .imagePath,
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

// todo: remove this once you have real data
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
