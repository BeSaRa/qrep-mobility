import 'package:ebla/app/depndency_injection.dart';

import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/widgets/range_slider_filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/models/requests/rent_requests/request_mean_value.dart';
import '../../../resources/values_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../blocs/rent_bloc/rent_grid_kpis_bloc/rent_grid_kpis_bloc.dart';

class RentGridItemWidget extends StatefulWidget {
  final KPI kpi;
  const RentGridItemWidget({
    super.key,
    required this.kpi,
    required this.index,
  });

  final int index;

  @override
  State<RentGridItemWidget> createState() => _RentGridItemWidgetState();
}

class _RentGridItemWidgetState extends State<RentGridItemWidget> {
  late RentGridKPIsBloc rentGridKPIsBloc;
  //todo: this should be removed once we have real data from api
  final List<GridItemData> gridItemsData = const [
    GridItemData(
        title: "إجمالي عدد الوحدات \n العقارات المستأجرة \\",
        value: "983",
        imagePath: ImageAssets.soldOrRentedUnits,
        valueUnit: ''),
    GridItemData(
      title: "إجمالي عدد  \nعقود الإيجار",
      value: "983",
      imagePath: ImageAssets.totalNumRentContracts,
      valueUnit: '',
    ),
    GridItemData(
        title: "متوسط قيمة الإيجار\n لكل وحدة \\ عقار",
        value: "5,790",
        imagePath: ImageAssets.averageRentUnitPrice,
        valueUnit: 'ر.ق'),
    GridItemData(
        title: "إجمالي قيمة عقود\n الإيجار",
        value: "716,104",
        imagePath: ImageAssets.totalValRentContracts,
        valueUnit: 'ر.ق'),
  ];

  @override
  void initState() {
    super.initState();
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(children: [
        SizedBox(height: AppSizeH.s16),
        Row(
          children: [
            Expanded(
              child: Text(gridItemsData[widget.index].title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
          ],
        ),
        SizedBox(
          height: AppSizeH.s14,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: AppSizeW.s24),
            Flexible(
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  BlocBuilder<RentGridKPIsBloc, RentGridKPIsState>(
                    bloc: rentGridKPIsBloc,
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const CircularProgressIndicator();
                      } else if (state.totalContracts.isNotEmpty &&
                          widget.kpi == KPI.totalContracts) {
                        return FittedBox(
                          child: Text(
                              state.totalContracts.first.kpiVal
                                  .formatWithCommas()
                                  .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: AppSizeSp.s18)),
                        );
                      } else if (state.totalRentedUnits.isNotEmpty &&
                          widget.kpi == KPI.totalRentedUntis) {
                        return FittedBox(
                          child: Text(
                              state.totalContracts.first.kpiVal
                                  .formatWithCommas()
                                  .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: AppSizeSp.s18)),
                        );
                      } else if (state.hasError) {
                        return Text(state.errorMessage);
                      }
                      return FittedBox(
                        child: Text('default value',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: AppSizeSp.s18)),
                      );
                    },
                  ),
                  Text(gridItemsData[widget.index].valueUnit,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: AppSizeSp.s18, height: 0.5)),
                ],
              ),
            ),
            SizedBox(width: AppSizeW.s16),
            SvgPicture.asset(
              gridItemsData[widget.index].imagePath,
              height: AppSizeH.s70,
              width: AppSizeW.s70,
              color: ColorManager.primary,
            ),
          ],
        )
      ]),
    );
  }
}

// todo: remove this once you have real data
class GridItemData {
  final String title;
  final String value;
  final String imagePath;
  final String valueUnit;

  const GridItemData(
      {required this.title,
      required this.value,
      required this.imagePath,
      required this.valueUnit});
}
