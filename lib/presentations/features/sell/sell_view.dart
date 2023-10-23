import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/domain/models/requests/rent_requests/request_mean_value.dart';
import 'package:ebla/presentations/features/sell/blocs/sell_grid_kpis_bloc/sell_grid_kpis_bloc.dart';
import 'package:ebla/presentations/features/sell/widgets/sell_grid_item_widget.dart';
import 'package:ebla/presentations/features/sell/blocs/bloc/sell_bloc.dart';

import 'package:ebla/presentations/resources/resources.dart';
import 'package:ebla/presentations/widgets/widgets.dart';
import 'package:ebla/presentations/features/sell/blocs/sell_default/sell_default_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalesView extends StatefulWidget {
  const SalesView({super.key});

  @override
  State<SalesView> createState() => _SalesViewState();
}

class _SalesViewState extends State<SalesView> {
  late SellGridKPIsBloc sellGridKPIsBloc;

  @override
  void initState() {
    sellGridKPIsBloc = instance<SellGridKPIsBloc>()
      ..add(SellGridKPIsEvent.getData(
          request: RequestMeanValue(
        municipalityId: 1,
        propertyTypeList: [-1],
        purposeList: [-1],
        issueDateQuarterList: [1, 2, 3, 4],
        furnitureStatus: -1,
        issueDateYear: 2023,
        issueDateStartMonth: 1,
        issueDateEndMonth: DateTime.now().month,
        zoneId: -1,
        limit: 5,
        periodId: 1,
        offset: 0,
      )));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<SellBloc>(),
      builder: (context, SellState state) {
        return state.map(
          loadingSellLookup: (value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          loadedSellLookup: (value) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSizeW.s31),
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
                                  kpi1Val: 100,
                                  kpi4Val: 400,
                                  kpi7Val: 700,
                                  kpi13Val: 1300),
                              kpi: SellGridKPIs.values[index],
                              index: index,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          errorSellLookUp: (value) {
            return Center(
              child: Container(
                child: const Text('Error LookUp Sell '),
              ),
            );
          },
        );
      },
    );
  }
}
