import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/presentations/features/sell/blocs/sell_grid_kpis_bloc/sell_grid_kpis_bloc.dart';
import 'package:ebla/presentations/features/sell/widgets/sell_grid_item_widget.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:ebla/presentations/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SalesView extends StatefulWidget {
  const SalesView({super.key});

  @override
  State<SalesView> createState() => _SalesViewState();
}

class _SalesViewState extends State<SalesView> {
  late SellGridKPIsBloc sellGridKPIsBloc;

  @override
  void initState() {
    sellGridKPIsBloc = instance<SellGridKPIsBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizeW.s20),
        child: StaggeredGridView(
          // for development only: UniqueKey forces the rebuild of the widget on hot reload
          key: UniqueKey(),
          itemsCount: 4,
          rightSectionTopPadding: AppSizeH.s17,
          mainAxisSpacing: AppSizeH.s22,
          crossAxisSpacing: AppSizeW.s23,
          gridItemChildBuilder: (context, index) {
            return BlocProvider.value(
              value: sellGridKPIsBloc,
              child: SellGridItemWidget(
                response: RentDefault(
                    kpi1Val: 100, kpi4Val: 400, kpi7Val: 700, kpi13Val: 1300),
                kpi: SellGridKPIs.values[index],
                index: index,
              ),
            );
          },
        ),
      ),
    );
  }
}
