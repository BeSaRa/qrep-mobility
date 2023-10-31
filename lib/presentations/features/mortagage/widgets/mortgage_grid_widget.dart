import 'package:ebla/presentations/features/mortagage/blocs/mortgage_grid_kpis_bloc/mortgage_grid_kpis_bloc.dart';
import 'package:ebla/presentations/features/mortagage/widgets/mortgage_grid_item_widget.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter/material.dart';

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
          const Flexible(
              child: MortgageGridItemWidget(
            kpi: MortgageGridKPIs.totalMortgageTransactions,
          )),
          SizedBox(
            width: widget.crossAxisSpacing,
          ),
          Flexible(
            child: Column(
              children: [
                const MortgageGridItemWidget(
                  kpi: MortgageGridKPIs.totalMortgageUnitsNum,
                ),
                SizedBox(
                  height: widget.mainAxisSpacing,
                ),
                const MortgageGridItemWidget(
                    kpi: MortgageGridKPIs.totalMortgageTransactionsValue),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
