import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/presentations/features/rent/blocs/rent_bloc/rent_bloc.dart';
import 'package:ebla/presentations/features/rent/blocs/rent_bloc/rent_grid_kpis_bloc/rent_grid_kpis_bloc.dart';
import 'package:ebla/presentations/features/rent/blocs/summery_bloc/rent_summery_bloc.dart';
import 'package:ebla/presentations/resources/language_manager.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:ebla/presentations/widgets/main_data_container.dart';
import 'package:ebla/presentations/widgets/staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../app/depndency_injection.dart';
import '../../../domain/models/requests/rent_requests/request_mean_value.dart';
import '../../../utils/global_functions.dart';
import '../../resources/assets_manager.dart';
import '../../resources/values_manager.dart';
import 'widgets/rent_grid_item_widget.dart';

class RentView extends StatefulWidget {
  const RentView({super.key});

  @override
  State<RentView> createState() => _RentViewState();
}

class _RentViewState extends State<RentView> {
  late RentGridKPIsBloc rentGridKPIsBloc;

  late RentSummeryBloc rentSummeryBloc;

  @override
  void initState() {
    rentGridKPIsBloc = instance<RentGridKPIsBloc>()
      ..add(RentGridKPIsEvent.getData(
        request: RequestMeanValue(
          municipalityId: 1,
          propertyTypeList: [-1],
          purposeList: [-1],
          issueDateQuarterList: [1, 2, 3, 4],
          furnitureStatus: -1,
          issueDateYear: 2023,
          issueDateStartMonth: 1,
          issueDateEndMonth: 10,
          zoneId: -1,
          limit: 5,
        ),
      ));
    rentSummeryBloc = instance<RentSummeryBloc>()
      ..add(RentSummeryEvent.getRentSummary(
        request: RequestMeanValue(
          municipalityId: 1,
          propertyTypeList: [-1],
          purposeList: [-1],
          issueDateQuarterList: [1, 2, 3, 4],
          furnitureStatus: -1,
          issueDateYear: 2023,
          issueDateStartMonth: 1,
          issueDateEndMonth: 10,
          zoneId: -1,
          limit: 5,
        ),
      ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppSizeW.s16, vertical: AppSizeH.s50),
        child: ListView(
          children: [
            StaggeredGridView(
              // for development only: UniqueKey forces the rebuild of the widget on hot reload
              key: UniqueKey(),
              itemsCount: 4,
              rightSectionTopPadding: AppSizeH.s17,
              mainAxisSpacing: AppSizeH.s22,
              crossAxisSpacing: AppSizeW.s23,
              gridItemChildBuilder: (context, index) {
                return BlocProvider.value(
                  value: rentGridKPIsBloc,
                  child: RentGridItemWidget(
                    kpi: KPI.values[index],
                    index: index,
                  ),
                );
              },
            ),
            SizedBox(
              height: AppSizeH.s20,
            ),
            BlocBuilder<RentSummeryBloc, RentSummeryState>(
              bloc: rentSummeryBloc,
              builder: (context, state) {
                if (state.isLoadingRentSummery) {
                  return Center(
                    child: SizedBox(
                        width: AppSizeW.s50,
                        height: AppSizeW.s50,
                        child: const CircularProgressIndicator()),
                  );
                }
                if (state.rentSummery != const RentListSummary()) {
                  return ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        //todo check the location
                        return MainDataContainer(
                          title: AppStrings().rentValue,
                          totalPrice: state.rentSummery.transactionList[index]
                              .rentPaymentMeterMT
                              .toStringAsFixed(4),
                          value: state.rentSummery.transactionList[index].area
                              .toStringAsFixed(0),
                          valueDescription: AppStrings().rentArea,
                          titleInfo: AppStrings().roomsCount,
                          valueInfo: state
                              .rentSummery.transactionList[index].bedRoomsCount
                              .toString(),
                          location: context.locale == ARABIC_LOCAL ?
                          getObjectById(context
                              .read<RentBloc>()
                              .loockUpRent
                              ?.municipalityList ?? [],
                              state
                                  .rentSummery.transactionList[index]
                                  .municipalityid)!.arName : getObjectById(
                              context
                                  .read<RentBloc>()
                                  .loockUpRent
                                  ?.municipalityList ?? [],
                              state
                                  .rentSummery.transactionList[index]
                                  .municipalityid)!.enName,
                        );
                      });
                }
                if (state.isHasErrorRentSummery) {
                  return SizedBox(
                      height: AppSizeH.s150,
                      width: AppSizeH.s150,
                      child: Lottie.asset(ImageAssets.animationError));
                }
                return ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return const MainDataContainer(
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
      ),
    );
  }
}
