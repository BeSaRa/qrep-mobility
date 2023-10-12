import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/presentations/features/rent/blocs/rent_bloc/rent_grid_kpis_bloc/rent_grid_kpis_bloc.dart';
import 'package:ebla/presentations/features/rent/blocs/summery_bloc/rent_summery_bloc.dart';
import 'package:ebla/presentations/widgets/main_data_container.dart';
import 'package:ebla/presentations/widgets/staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../resources/strings_manager.dart';
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
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
              right: AppSizeW.s16,
              left: AppSizeW.s16,
              top: AppSizeW.s25,
            ),
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
          SizedBox(
            height: AppSizeH.s14,
          ),
          Text(
            AppStrings().rentContractList,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          BlocBuilder<RentSummeryBloc, RentSummeryState>(
            builder: (context, state) {
              if (state.isLoadingRentSummery) {
                return SizedBox(
                    height: AppSizeW.s50,
                    width: AppSizeW.s50,
                    child: const CircularProgressIndicator());
              }
              if (state.rentSummery != const RentListSummary()) {
                return ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return MainDataContainer(
                        title:
                            state.rentSummery.transactionList[index].unitTenant,
                        totalPrice: '',
                        value: '',
                        valueDescription: '',
                        titleInfo: '',
                        valueInfo: '',
                        location: '',
                      );
                    });
              }
              return ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return MainDataContainer(
                      title: '',
                      totalPrice: '',
                      value: '',
                      valueDescription: '',
                      titleInfo: '',
                      valueInfo: '',
                      location: '',
                    );
                  });
            },
          )
        ],
      ),
    );
  }
}
