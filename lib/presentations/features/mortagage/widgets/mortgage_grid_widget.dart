import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/presentations/widgets/grid/grid_item_widget.dart';
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
          Flexible(
              child: GridItemWidget(
            gridItemType: GridItemType.mortgage,
            response: RentDefault(),
            rentKPI: null,
            sellKPI: null,
            mortgageKPI: MortgageGridKPIs.totalMortgageTransactions,
          )),
          SizedBox(
            width: widget.crossAxisSpacing,
          ),
          Flexible(
            child: Column(
              children: [
                GridItemWidget(
                  gridItemType: GridItemType.mortgage,
                  response: RentDefault(),
                  rentKPI: null,
                  sellKPI: null,
                  mortgageKPI: MortgageGridKPIs.totalMortgageUnitsNum,
                ),
                SizedBox(
                  height: widget.mainAxisSpacing,
                ),
                GridItemWidget(
                  gridItemType: GridItemType.mortgage,
                  response: RentDefault(),
                  rentKPI: null,
                  sellKPI: null,
                  mortgageKPI: MortgageGridKPIs.totalMortgageTransactionsValue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
