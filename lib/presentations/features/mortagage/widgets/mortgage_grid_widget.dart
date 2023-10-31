import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:ebla/presentations/widgets/grid_value_with_unit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MortgageGrid extends StatefulWidget {
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  const MortgageGrid(
      {super.key,
      required this.crossAxisSpacing,
      required this.mainAxisSpacing});

  @override
  State<MortgageGrid> createState() => _MortgageGridState();
}

class _MortgageGridState extends State<MortgageGrid> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizeH.s280 + (2 * widget.mainAxisSpacing),
      child: Row(
        children: [
          Flexible(
              child: MortgageGridItemWidget(
            kpi: MortgageGridKPIs.totalMortgageTransactions,
          )),
          SizedBox(
            width: widget.crossAxisSpacing,
          ),
          Flexible(
            child: Column(
              children: [
                MortgageGridItemWidget(
                  kpi: MortgageGridKPIs.totalMortgageUnitsNum,
                ),
                SizedBox(
                  height: widget.mainAxisSpacing,
                ),
                const MortgageGridItemWidget(
                    kpi: MortgageGridKPIs.totalMortgageTransactionsValue),
                // Flexible(child: Placeholder()),
                // Flexible(child: Placeholder()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MortgageGridItemWidget extends StatefulWidget {
  final MortgageGridKPIs kpi;
  const MortgageGridItemWidget({super.key, required this.kpi});

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
      child: Column(
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
                GridValueWithUnitWidget(
                  countUp: false,
                  value: 999,
                  unit: gridItemsData
                      .firstWhere((element) => element.kpi == widget.kpi)
                      .valueUnit,
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

enum MortgageGridKPIs {
  /// KPI1
  totalMortgageTransactions,

  /// KPI3
  totalMortgageUnitsNum,

  /// KPI5
  totalMortgageTransactionsValue,
}
