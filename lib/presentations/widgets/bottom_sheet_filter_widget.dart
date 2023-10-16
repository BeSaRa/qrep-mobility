import 'package:ebla/app/extensions.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/widgets/date_range_picker.dart';
import 'package:ebla/presentations/widgets/mutli_dropdown_widget.dart';
import 'package:ebla/presentations/widgets/range_slider_filter_widget.dart';
import 'package:ebla/presentations/widgets/single_dropdown_widget.dart';
import 'package:ebla/utils/global_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../domain/models/rent_models/rent_models.dart';
import '../features/rent/blocs/rent_bloc/cubits/cubit/values_filters_cubit.dart';
import '../features/rent/blocs/rent_bloc/rent_bloc.dart';
import '../resources/values_manager.dart';
import 'custom_elevated_button.dart';
import 'multi_choose_dropdown.dart';

// enum PeriodTime { year, halfYear, quarterYear, monthly, specificPeriod }

class BottomSheetFilterWidget extends StatefulWidget {
  const BottomSheetFilterWidget({
    super.key,
  });

  @override
  State<BottomSheetFilterWidget> createState() =>
      _BottomSheetFilterWidgetState();
}

class _BottomSheetFilterWidgetState extends State<BottomSheetFilterWidget> {
  // PickerDateRange? pickerDateRange;

  List<int>? getissueDateQuarterList(int id) {
    switch (id) {
      case 1:
        return [1, 2, 3, 4];
      case 2:
        return valuesFiltersCubit.periodTimeHalfDetails.value;
      case 3:
        List<int> values = [];
        for (var element in valuesFiltersCubit.quarterYear) {
          values.add(element.value[0]);
        }
        return values;
      //       break;
      default:
        return null;
    }
  }

  Widget getPeriodTimeById(
    int id,
    RentLookupResponse success,
  ) {
    switch (id) {
      case 1:
        valuesFiltersCubit.pickerDateRange = null;
        valuesFiltersCubit.month = const PeriodTimeDetails();
        valuesFiltersCubit.quarterYear.clear();
        valuesFiltersCubit.periodTimeHalfDetails = const PeriodTimeDetails();
        return const SizedBox();
      case 2:
        return BlocBuilder(
          bloc: valuesFiltersCubit,
          builder: (context, state) {
            valuesFiltersCubit.pickerDateRange = null;
            valuesFiltersCubit.month = const PeriodTimeDetails();
            valuesFiltersCubit.quarterYear.clear();
            valuesFiltersCubit.periodTimeHalfDetails ==
                    const PeriodTimeDetails()
                ? valuesFiltersCubit.periodTimeHalfDetails =
                    success.halfYearList.first
                : null;
            return SingleDropDownValue<PeriodTimeDetails>(
                onChanged: (halfYear) {
                  valuesFiltersCubit.changehalfYear(halfYear!);
                },
                value: valuesFiltersCubit.periodTimeHalfDetails,
                list: success.halfYearList);
          },
        );
      case 3:
        return BlocBuilder(
          bloc: valuesFiltersCubit,
          builder: (context, state) {
            valuesFiltersCubit.pickerDateRange = null;
            valuesFiltersCubit.month = const PeriodTimeDetails();
            valuesFiltersCubit.periodTimeHalfDetails =
                const PeriodTimeDetails();
            valuesFiltersCubit.quarterYear.isEmpty
                ? valuesFiltersCubit.quarterYear
                    .add(success.quarterYearList.first)
                : null;
            return MultiDropDownValue<PeriodTimeDetails>(
              list: success.quarterYearList,
              selectedItems: valuesFiltersCubit.quarterYear,
            );
          },
        );
      case 4:
        return BlocBuilder(
          bloc: valuesFiltersCubit,
          builder: (context, state) {
            valuesFiltersCubit.pickerDateRange = null;
            valuesFiltersCubit.periodTimeHalfDetails =
                const PeriodTimeDetails();
            valuesFiltersCubit.quarterYear.clear();
            valuesFiltersCubit.months = getAllMonthsInYear(context);
            if (valuesFiltersCubit.month == const PeriodTimeDetails()) {
              context.read<RentBloc>().requestMeanValue.issueDateEndMonth !=
                      null
                  ? valuesFiltersCubit.month = valuesFiltersCubit.months
                      .firstWhere((element) =>
                          element.value[0] ==
                          context
                              .read<RentBloc>()
                              .requestMeanValue
                              .issueDateEndMonth)
                  : valuesFiltersCubit.month = valuesFiltersCubit.months.first;
            }

            return SingleDropDownValue<PeriodTimeDetails>(
                onChanged: (month) {
                  valuesFiltersCubit.changeMonth(month!);
                },
                value: valuesFiltersCubit.month,
                list: valuesFiltersCubit.months);
          },
        );
      case 5:
        return BlocBuilder(
          bloc: valuesFiltersCubit,
          builder: (context, state) {
            valuesFiltersCubit.month = const PeriodTimeDetails();
            valuesFiltersCubit.periodTimeHalfDetails =
                const PeriodTimeDetails();
            valuesFiltersCubit.quarterYear.clear();
            return Container(
              alignment: AlignmentDirectional.centerStart,
              height: AppSizeH.s40,
              padding: EdgeInsets.symmetric(
                  vertical: AppSizeH.s4, horizontal: AppSizeW.s11),
              decoration: BoxDecoration(
                  color: ColorManager.whiteSmoke,
                  borderRadius: BorderRadius.circular(AppSizeR.s5),
                  border: Border.all(width: 1, color: ColorManager.silver)),
              child: InkWell(
                onTap: () async {
                  valuesFiltersCubit.pickerDateRange =
                      await showDatePickerPopup(
                          context, valuesFiltersCubit.pickerDateRange);
                  setState(() {});
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: FittedBox(
                        child: valuesFiltersCubit.pickerDateRange != null
                            ? Text(
                                '${valuesFiltersCubit.pickerDateRange?.startDate.toFormattedString()}---${valuesFiltersCubit.pickerDateRange?.endDate.toFormattedString()}',
                                style: Theme.of(context).textTheme.labelSmall,
                              )
                            : Text(
                                'حدد تاريخ',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                      ),
                    ),
                    SizedBox(width: AppSizeW.s4),
                    const Icon(Icons.calendar_month),
                  ],
                ),
              ),
            );
          },
        );

      default:
        throw Exception('Invalid period time id');
    }
  }

  late ValuesFiltersCubit valuesFiltersCubit;

  @override
  void initState() {
    valuesFiltersCubit = ValuesFiltersCubit(const RentLookupModel());
    generateYears(2019, DateTime.now().year).forEach((element) {
      valuesFiltersCubit.yearsLists
          .add(RentLookupModel(arName: element.toString(), id: element));
    });

    valuesFiltersCubit.municapility = getObjectById(
          context.read<RentBloc>().loockUpRent?.municipalityList ?? [],
          context.read<RentBloc>().requestMeanValue.municipalityId ?? 0,
        ) ??
        const RentLookupModel();
    valuesFiltersCubit.zone = getObjectByLookupKey(
          context.read<RentBloc>().loockUpRent?.zoneList ?? [],
          context.read<RentBloc>().requestMeanValue.zoneId ?? 0,
        ) ??
        const RentLookupModel();
    context
        .read<RentBloc>()
        .requestMeanValue
        .propertyTypeList
        ?.forEach((element) {
      valuesFiltersCubit.propertyTypeList.add(getObjectByLookupKey(
            context.read<RentBloc>().loockUpRent?.propertyTypeList ?? [],
            element,
          ) ??
          const RentLookupModel());
    });
    context.read<RentBloc>().requestMeanValue.purposeList?.forEach((element) {
      valuesFiltersCubit.rentPurposeList.add(getObjectByLookupKey(
            context.read<RentBloc>().loockUpRent?.rentPurposeList ?? [],
            element,
          ) ??
          const RentLookupModel());
    });
    valuesFiltersCubit.bedRoom = getObjectById(
          context.read<RentBloc>().loockUpRent?.bedRooms ?? [],
          -1,
        ) ??
        const RentLookupModel();
    valuesFiltersCubit.periodTime = getObjectById(
          context.read<RentBloc>().loockUpRent?.periodTime ?? [],
          context.read<RentBloc>().requestMeanValue.periodId,
        ) ??
        const RentLookupModel();
    valuesFiltersCubit.year =
        context.read<RentBloc>().requestMeanValue.issueDateYear != null
            ? getObjectById(
                  valuesFiltersCubit.yearsLists,
                  context.read<RentBloc>().requestMeanValue.issueDateYear ??
                      DateTime.now().year,
                ) ??
                valuesFiltersCubit.yearsLists.last
            : valuesFiltersCubit.yearsLists.last;

    valuesFiltersCubit.rentPaymentMonthlyPerUnitFrom =
        context.read<RentBloc>().requestMeanValue.rentPaymentMonthlyPerUnitFrom;
    valuesFiltersCubit.rentPaymentMonthlyPerUnitTo =
        context.read<RentBloc>().requestMeanValue.rentPaymentMonthlyPerUnitTo;
    valuesFiltersCubit.areaFrom =
        context.read<RentBloc>().requestMeanValue.areaFrom;
    valuesFiltersCubit.areaTo =
        context.read<RentBloc>().requestMeanValue.areaTo;

    valuesFiltersCubit.pickerDateRange = (context
                    .read<RentBloc>()
                    .requestMeanValue
                    .issueDateFrom !=
                null &&
            context.read<RentBloc>().requestMeanValue.issueDateTo != null)
        ? PickerDateRange(
            DateTime.parse(
                context.read<RentBloc>().requestMeanValue.issueDateFrom ?? ''),
            DateTime.parse(
                context.read<RentBloc>().requestMeanValue.issueDateTo ?? ''))
        : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                          return BlocBuilder(
                            bloc: valuesFiltersCubit,
                            builder: (context, states) {
                              return SingleDropDownValue<RentLookupModel>(
                                  value: valuesFiltersCubit.municapility,
                                  onChanged: (municapility) {
                                    valuesFiltersCubit
                                        .changeMunicapility(municapility!);
                                    valuesFiltersCubit.changeZone(
                                        state.rentLookup.zoneList.first);
                                  },
                                  list: state.rentLookup.municipalityList);
                            },
                          );
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
                          return BlocBuilder(
                            bloc: valuesFiltersCubit,
                            builder: (context, states) {
                              return SingleDropDownValue<RentLookupModel>(
                                  onChanged: (zone) {
                                    valuesFiltersCubit.changeZone(zone!);
                                  },
                                  value: valuesFiltersCubit.zone,
                                  list: filterDataBymunicipalityId(
                                      valuesFiltersCubit.municapility.id,
                                      state.rentLookup.zoneList));
                            },
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
                          // valuesFiltersCubit.propertyTypeList.clear();
                          // valuesFiltersCubit.propertyTypeList
                          //     .add(valuesFiltersCubit.propertyType);
                          return BlocProvider.value(
                            value: valuesFiltersCubit,
                            child: BlocBuilder(
                              bloc: valuesFiltersCubit,
                              builder: (context, states) {
                                return MultiChooseDropDownWidget(
                                  isPurpose: false,
                                  // selectedValue:
                                  //     valuesFiltersCubit.propertyType,
                                  selectedItems:
                                      valuesFiltersCubit.propertyTypeList,
                                  list: state.rentLookup.propertyTypeList,
                                );
                              },
                            ),
                          );
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
                          // valuesFiltersCubit.rentPurposeList.clear();
                          // valuesFiltersCubit.rentPurposeList
                          //     .add(valuesFiltersCubit.purposeType);
                          return BlocProvider.value(
                            value: valuesFiltersCubit,
                            child: BlocBuilder(
                              bloc: valuesFiltersCubit,
                              builder: (context, states) {
                                return MultiChooseDropDownWidget(
                                    isPurpose: true,
                                    // selectedValue:
                                    //     valuesFiltersCubit.purposeType,
                                    selectedItems:
                                        valuesFiltersCubit.rentPurposeList,
                                    list: state.rentLookup.rentPurposeList);
                              },
                            ),
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
                          return BlocBuilder(
                            bloc: valuesFiltersCubit,
                            builder: (context, states) {
                              return SingleDropDownValue<RentLookupModel>(
                                  value: valuesFiltersCubit.bedRoom,
                                  onChanged: (bedRooms) {
                                    valuesFiltersCubit
                                        .changeBedRooms(bedRooms!);
                                  },
                                  list: state.rentLookup.bedRooms);
                            },
                          );
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
                          return BlocBuilder(
                            bloc: valuesFiltersCubit,
                            builder: (context, states) {
                              return SingleDropDownValue<RentLookupModel>(
                                  onChanged: (periodTime) {
                                    valuesFiltersCubit
                                        .changePeriodTime(periodTime!);
                                    // valuesFiltersCubit.periodTime = periodTime!;
                                  },
                                  value: valuesFiltersCubit.periodTime,
                                  list: state.rentLookup.periodTime);
                            },
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
                              Expanded(
                                  child: BlocBuilder(
                                bloc: valuesFiltersCubit,
                                builder: (context, state) {
                                  return SingleDropDownValue<RentLookupModel>(
                                      onChanged: (year) {
                                        valuesFiltersCubit.changeYear(year!);
                                      },
                                      value: valuesFiltersCubit.year,
                                      list: valuesFiltersCubit.yearsLists);
                                },
                              )),
                              SizedBox(width: AppSizeW.s8),
                              BlocBuilder(
                                bloc: valuesFiltersCubit,
                                builder: (context, states) {
                                  return Expanded(
                                      child: getPeriodTimeById(
                                    valuesFiltersCubit.periodTime.id,
                                    state.rentLookup,
                                  ));
                                },
                              )
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
          Text('وحدة القياس', style: Theme.of(context).textTheme.labelMedium),
          SizedBox(height: AppSizeH.s12),
          BlocProvider.value(
            value: valuesFiltersCubit,
            child: const ChooseUnitWidget(),
          ),
          SizedBox(height: AppSizeH.s4),
          RangeSliderFilterWidget(
              min: context
                      .read<RentBloc>()
                      .loockUpRent
                      ?.maxParams[1]
                      .minVal
                      .toDouble() ??
                  0,
              max: context
                      .read<RentBloc>()
                      .loockUpRent
                      ?.maxParams[1]
                      .maxVal
                      .toDouble() ??
                  1000000,
              onValueChanged: (startValue, endValue) {
                valuesFiltersCubit.rentPaymentMonthlyPerUnitFrom = startValue;
                valuesFiltersCubit.rentPaymentMonthlyPerUnitTo = endValue;
              },
              title: 'قيمه العقار من - إلى',
              rangeValues: RangeValues(
                  valuesFiltersCubit.rentPaymentMonthlyPerUnitFrom
                          ?.toDouble() ??
                      context
                          .read<RentBloc>()
                          .loockUpRent
                          ?.maxParams[1]
                          .minVal
                          .toDouble() ??
                      0,
                  valuesFiltersCubit.rentPaymentMonthlyPerUnitTo?.toDouble() ??
                      context
                          .read<RentBloc>()
                          .loockUpRent
                          ?.maxParams[1]
                          .maxVal
                          .toDouble() ??
                      1000000)),
          SizedBox(height: AppSizeH.s12),
          RangeSliderFilterWidget(
              min: context
                      .read<RentBloc>()
                      .loockUpRent
                      ?.maxParams[0]
                      .minVal
                      .toDouble() ??
                  0,
              max: context
                      .read<RentBloc>()
                      .loockUpRent
                      ?.maxParams[0]
                      .maxVal
                      .toDouble() ??
                  1000000,
              onValueChanged: (startValue, endValue) {
                valuesFiltersCubit.areaFrom = startValue;
                valuesFiltersCubit.areaTo = endValue;
              },
              title: 'المساحة من - إلى',
              rangeValues: RangeValues(
                  valuesFiltersCubit.areaFrom?.toDouble() ??
                      context
                          .read<RentBloc>()
                          .loockUpRent
                          ?.maxParams[0]
                          .minVal
                          .toDouble() ??
                      0,
                  valuesFiltersCubit.areaTo?.toDouble() ??
                      context
                          .read<RentBloc>()
                          .loockUpRent
                          ?.maxParams[0]
                          .maxVal
                          .toDouble() ??
                      1000000)),
          SizedBox(height: AppSizeH.s12),
          Row(children: [
            BlocBuilder(
              bloc: valuesFiltersCubit,
              builder: (context, state) {
                return Expanded(
                  child: CustomElevatedButton(
                    isPrimary: true,
                    title: 'بحث',
                    onPress: () {
                      context.read<RentBloc>().requestMeanValue = context.read<RentBloc>().requestMeanValue.copyWith(
                          areaFrom: valuesFiltersCubit.areaFrom,
                          areaTo: valuesFiltersCubit.areaTo,
                          bedRoomsCount: valuesFiltersCubit.bedRoom.id == -1
                              ? 0
                              : valuesFiltersCubit.bedRoom.id,
                          municipalityId: valuesFiltersCubit.municapility.id,
                          zoneId: valuesFiltersCubit.zone.lookupKey,
                          rentPaymentMonthlyPerUnitFrom:
                              valuesFiltersCubit.rentPaymentMonthlyPerUnitFrom,
                          rentPaymentMonthlyPerUnitTo:
                              valuesFiltersCubit.rentPaymentMonthlyPerUnitTo,
                          unit: valuesFiltersCubit.unit,
                          issueDateYear: valuesFiltersCubit.year.id,
                          issueDateQuarterList: getissueDateQuarterList(
                              valuesFiltersCubit.periodTime.id),
                          issueDateStartMonth: valuesFiltersCubit.periodTime.id == 4
                              ? valuesFiltersCubit.month.value[0] - 1
                              : null,
                          issueDateEndMonth: valuesFiltersCubit.periodTime.id == 4
                              ? valuesFiltersCubit.month.value[0]
                              : null,
                          periodId: valuesFiltersCubit.periodTime.id,
                          issueDateFrom: valuesFiltersCubit.periodTime.id == 5
                              ? valuesFiltersCubit.pickerDateRange?.startDate
                                  ?.toIso8601String()
                              : null,
                          issueDateTo: valuesFiltersCubit.periodTime.id == 5
                              ? valuesFiltersCubit.pickerDateRange?.endDate
                                  ?.toIso8601String()
                              : null,
                          purposeList: valuesFiltersCubit.rentPurposeList
                              .map((e) => e.id)
                              .toList(),
                          propertyTypeList:
                              valuesFiltersCubit.propertyTypeList.map((e) => e.lookupKey).toList());
                    },
                  ),
                );
              },
            ),
            SizedBox(width: AppSizeW.s8),
            Expanded(
              child: CustomElevatedButton(
                isPrimary: false,
                title: 'إلغاء',
                onPress: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ]),
          SizedBox(height: AppSizeW.s12),
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
  @override
  void initState() {
    context.read<ValuesFiltersCubit>().unit =
        context.read<RentBloc>().requestMeanValue.unit;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<ValuesFiltersCubit>(),
      builder: (context, state) {
        return SizedBox(
          height: AppSizeH.s36,
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(AppSizeR.s25),
                  onTap: () {
                    context.read<ValuesFiltersCubit>().changeUnit(1);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: context.read<ValuesFiltersCubit>().unit == 1
                          ? ColorManager.golden
                          : ColorManager.whiteSmoke,
                      border: Border.all(width: 1, color: ColorManager.silver),
                      borderRadius: BorderRadius.circular(AppSizeR.s25),
                    ),
                    child: Text(
                      'متر',
                      style: context.read<ValuesFiltersCubit>().unit == 1
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
                    context.read<ValuesFiltersCubit>().changeUnit(2);
                  },
                  borderRadius: BorderRadius.circular(AppSizeR.s25),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: context.read<ValuesFiltersCubit>().unit == 2
                          ? ColorManager.golden
                          : ColorManager.whiteSmoke,
                      border: Border.all(width: 1, color: ColorManager.silver),
                      borderRadius: BorderRadius.circular(AppSizeR.s25),
                    ),
                    child: Text(
                      'قدم',
                      style: context.read<ValuesFiltersCubit>().unit == 2
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
      },
    );
  }
}
