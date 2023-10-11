import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/widgets/mutli_dropdown_widget.dart';
import 'package:ebla/presentations/widgets/range_slider_filter_widget.dart';
import 'package:ebla/presentations/widgets/single_dropdown_widget.dart';
import 'package:ebla/utils/global_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/rent_models/rent_models.dart';
import '../features/rent/blocs/rent_bloc/rent_bloc.dart';
import '../resources/values_manager.dart';
import 'custom_elevated_button.dart';

class BottomSheetFilterWidget extends StatefulWidget {
  const BottomSheetFilterWidget({
    super.key,
  });

  @override
  State<BottomSheetFilterWidget> createState() =>
      _BottomSheetFilterWidgetState();
}

class _BottomSheetFilterWidgetState extends State<BottomSheetFilterWidget> {
  final double minPrice = 0.0;

  final double maxPrice = 2000000.0;

  List<RentLookupModel> lists = [];

  @override
  void initState() {
    generateYears(2019, DateTime.now().year).forEach((element) {
      lists.add(RentLookupModel(arName: element.toString()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('البلدية',
                        style: Theme.of(context).textTheme.labelMedium),
                    // const SingleDropDownValue(),
                    BlocBuilder(
                      bloc: context.read<RentBloc>(),
                      builder: (context, RentState state) {
                        if (state.isLoadingRentLookup) {
                          return const LinearProgressIndicator();
                        }
                        if (state.rentLookup != const RentLookupResponse()) {
                          return SingleDropDownValue(
                              list: state.rentLookup.municipalityList);
                        }
                        return const Text('Error');
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(width: AppSizeW.s8),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'المنطقة',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    BlocBuilder(
                      bloc: context.read<RentBloc>(),
                      builder: (context, RentState state) {
                        if (state.isLoadingRentLookup) {
                          return const LinearProgressIndicator();
                        }
                        if (state.rentLookup != const RentLookupResponse()) {
                          return MultiDropDownValue(
                              list: filterDataBymunicipalityId(
                                  2, state.rentLookup.zoneList));
                        }
                        return const Text('Error');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizeH.s12),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('نوع العقار',
                        style: Theme.of(context).textTheme.labelMedium),
                    // const SingleDropDownValue(),
                    BlocBuilder(
                      bloc: context.read<RentBloc>(),
                      builder: (context, RentState state) {
                        if (state.isLoadingRentLookup) {
                          return const LinearProgressIndicator();
                        }
                        if (state.rentLookup != const RentLookupResponse()) {
                          return MultiDropDownValue(
                              list: state.rentLookup.propertyTypeList);
                        }
                        return const Text('Error');
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(width: AppSizeW.s8),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'استخدام العقار',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    BlocBuilder(
                      bloc: context.read<RentBloc>(),
                      builder: (context, RentState state) {
                        if (state.isLoadingRentLookup) {
                          return const LinearProgressIndicator();
                        }
                        if (state.rentLookup != const RentLookupResponse()) {
                          return MultiDropDownValue(
                              list: state.rentLookup.rentPurposeList);
                        }
                        return const Text('Error');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizeH.s12),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('عدد الغرف',
                        style: Theme.of(context).textTheme.labelMedium),
                    // const SingleDropDownValue(),
                    BlocBuilder(
                      bloc: context.read<RentBloc>(),
                      builder: (context, RentState state) {
                        if (state.isLoadingRentLookup) {
                          return const LinearProgressIndicator();
                        }
                        if (state.rentLookup != const RentLookupResponse()) {
                          return MultiDropDownValue(
                              list: state.rentLookup.bedRooms);
                        }
                        return const Text('Error');
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(width: AppSizeW.s8),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'المدة الزمنية',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    BlocBuilder(
                      bloc: context.read<RentBloc>(),
                      builder: (context, RentState state) {
                        if (state.isLoadingRentLookup) {
                          return const LinearProgressIndicator();
                        }
                        if (state.rentLookup != const RentLookupResponse()) {
                          return SingleDropDownValue(
                              list: state.rentLookup.periodTime);
                        }
                        return const Text('Error');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizeH.s12),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('تفاصيل المدة الزمنية',
                        style: Theme.of(context).textTheme.labelMedium),
                    // const SingleDropDownValue(),

                    BlocBuilder(
                      bloc: context.read<RentBloc>(),
                      builder: (context, RentState state) {
                        if (state.isLoadingRentLookup) {
                          return const LinearProgressIndicator();
                        }
                        if (state.rentLookup != const RentLookupResponse()) {
                          return Row(
                            children: [
                              Expanded(child: SingleDropDownValue(list: lists)),
                              SizedBox(width: AppSizeW.s8),
                              const Expanded(
                                  child: SingleDropDownValue(list: [])),
                            ],
                          );
                        }
                        return const Text('Error');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizeH.s12),
          const RangeSliderFilterWidget(
              title: 'قيمه العقار من - إلى',
              rangeValues: RangeValues(0, 1000000)),
          SizedBox(height: AppSizeH.s12),
          const RangeSliderFilterWidget(
              title: 'المساحة من - إلى', rangeValues: RangeValues(0, 1000000)),
          SizedBox(height: AppSizeH.s12),
          Row(children: [
            Expanded(
              child: CustomElevatedButton(
                isPrimary: true,
                title: 'بحث',
                onPress: () {},
              ),
            ),
            SizedBox(width: AppSizeW.s8),
            Expanded(
              child: CustomElevatedButton(
                isPrimary: false,
                title: 'إلغاء',
                onPress: () {},
              ),
            ),
          ]),
          SizedBox(width: AppSizeW.s23),
          SizedBox(height: AppSizeH.s12),
        ],
      ),
    );
  }
}

class ChooseUnitWidget extends StatefulWidget {
  const ChooseUnitWidget({
    super.key,
  });

  @override
  State<ChooseUnitWidget> createState() => _ChooseUnitWidgetState();
}

class _ChooseUnitWidgetState extends State<ChooseUnitWidget> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizeH.s36,
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(AppSizeR.s25),
              onTap: () {
                setState(() {
                  index = 1;
                });
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: index == 1
                      ? ColorManager.golden
                      : ColorManager.whiteSmoke,
                  border: Border.all(width: 1, color: ColorManager.silver),
                  borderRadius: BorderRadius.circular(AppSizeR.s25),
                ),
                child: Text(
                  'متر',
                  style: index == 1
                      ? Theme.of(context).textTheme.displaySmall
                      : Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
          SizedBox(width: AppSizeW.s8),
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  index = 2;
                });
              },
              borderRadius: BorderRadius.circular(AppSizeR.s25),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: index == 2
                      ? ColorManager.golden
                      : ColorManager.whiteSmoke,
                  border: Border.all(width: 1, color: ColorManager.silver),
                  borderRadius: BorderRadius.circular(AppSizeR.s25),
                ),
                child: Text(
                  'قدم',
                  style: index == 2
                      ? Theme.of(context).textTheme.displaySmall
                      : Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontWeight: FontWeight.w400),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
