import 'package:ebla/presentations/features/rent/blocs/rent_bloc/rent_grid_kpis_bloc/rent_grid_kpis_bloc.dart';

import 'package:ebla/presentations/widgets/staggered_grid_view.dart';
import 'package:flutter/material.dart';

import '../../resources/values_manager.dart';
import 'widgets/rent_grid_item_widget.dart';

class RentView extends StatefulWidget {
  const RentView({super.key});

  @override
  State<RentView> createState() => _RentViewState();
}

class _RentViewState extends State<RentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizeW.s16),
        child: StaggeredGridView(
          // for development only: UniqueKey forces the rebuild of the widget on hot reload
          key: UniqueKey(),
          itemsCount: 4,
          rightSectionTopPadding: AppSizeH.s17,
          mainAxisSpacing: AppSizeH.s22,
          crossAxisSpacing: AppSizeW.s23,
          gridItemChildBuilder: (context, index) {
            return RentGridItemWidget(
              kpi: KPI.values[index],
              index: index,
            );
          },
        ),
      ),
    );
  }
}
