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
import '../features/rent/widgets/choose_unit_filters_widget.dart';
import '../features/rent/widgets/slider_filter_widget.dart';
import '../resources/values_manager.dart';
import 'custom_elevated_button.dart';
import 'multi_choose_dropdown.dart';
import 'range_slider_widget.dart';

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

            if (context.read<RentBloc>().requestMeanValue.periodId != 3) {
              valuesFiltersCubit.quarterYear.clear();
              valuesFiltersCubit.quarterYear.add(success.quarterYearList.first);
            } else {
              valuesFiltersCubit.quarterYear.clear();
              context
                  .read<RentBloc>()
                  .loockUpRent
                  ?.quarterYearList
                  .forEach((element) {
                if (context
                        .read<RentBloc>()
                        .requestMeanValue
                        .issueDateQuarterList
                        ?.contains(element.value[0]) ??
                    false) {
                  valuesFiltersCubit.quarterYear.add(element);
                }
              });
            }

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
          context.read<RentBloc>().requestMeanValue.municipalityId ?? 1,
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
          context.read<RentBloc>().requestMeanValue.bedRoomsCount == 0
              ? -1
              : context.read<RentBloc>().requestMeanValue.bedRoomsCount ?? -1,
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
    context.read<RentBloc>().requestMeanValue.periodId == 2
        ? valuesFiltersCubit.periodTimeHalfDetails = context
                .read<RentBloc>()
                .loockUpRent
                ?.halfYearList
                .firstWhere((element) =>
                    context
                        .read<RentBloc>()
                        .requestMeanValue
                        .issueDateQuarterList ==
                    element.value) ??
            const PeriodTimeDetails()
        : null;
    if (context
                .read<RentBloc>()
                .requestMeanValue
                .rentPaymentMonthlyPerUnitFrom !=
            null &&
        context.read<RentBloc>().requestMeanValue.rentPaymentMonthlyPerUnitTo !=
            null) {
      valuesFiltersCubit.changeRangeRentPaymentMonthlyPerUnit(RangeValues(
          context
              .read<RentBloc>()
              .requestMeanValue
              .rentPaymentMonthlyPerUnitFrom!
              .toDouble(),
          context
              .read<RentBloc>()
              .requestMeanValue
              .rentPaymentMonthlyPerUnitTo!
              .toDouble()));
    }
    if (context.read<RentBloc>().requestMeanValue.areaFrom != null &&
        context.read<RentBloc>().requestMeanValue.areaTo != null) {
      valuesFiltersCubit.changeRangeValuesArea(RangeValues(
          context.read<RentBloc>().requestMeanValue.areaFrom!.toDouble(),
          context.read<RentBloc>().requestMeanValue.areaTo!.toDouble()));
    }
    // valuesFiltersCubit.rentPaymentMonthlyPerUnitTo =
    //     context.read<RentBloc>().requestMeanValue.rentPaymentMonthlyPerUnitTo;
    // valuesFiltersCubit.areaFrom =
    //     context.read<RentBloc>().requestMeanValue.areaFrom;
    // valuesFiltersCubit.areaTo =
    //     context.read<RentBloc>().requestMeanValue.areaTo;

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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  // setState(() {
                  valuesFiltersCubit
                      .changeRangeRentPaymentMonthlyPerUnitReset();
                  valuesFiltersCubit.bedRoom =
                      const RentLookupModel(arName: 'الكل', id: -1);
                  valuesFiltersCubit.municapility = getObjectById(
                        context
                                .read<RentBloc>()
                                .loockUpRent
                                ?.municipalityList ??
                            [],
                        1,
                      ) ??
                      const RentLookupModel();
                  valuesFiltersCubit.zone = getObjectByLookupKey(
                        context.read<RentBloc>().loockUpRent?.zoneList ?? [],
                        -1,
                      ) ??
                      const RentLookupModel();
                  valuesFiltersCubit.rentPaymentMonthlyPerUnitFrom = null;
                  valuesFiltersCubit.rentPaymentMonthlyPerUnitTo = null;
                  valuesFiltersCubit.unit = 1;
                  valuesFiltersCubit.year = valuesFiltersCubit.yearsLists.last;
                  valuesFiltersCubit.periodTime = getObjectById(
                        context.read<RentBloc>().loockUpRent?.periodTime ?? [],
                        1,
                      ) ??
                      const RentLookupModel();
                  valuesFiltersCubit.rentPurposeList.clear();
                  valuesFiltersCubit.rentPurposeList.add(getObjectByLookupKey(
                        context.read<RentBloc>().loockUpRent?.rentPurposeList ??
                            [],
                        -1,
                      ) ??
                      const RentLookupModel());
                  valuesFiltersCubit.propertyTypeList.clear();
                  valuesFiltersCubit.propertyTypeList.add(getObjectByLookupKey(
                        context
                                .read<RentBloc>()
                                .loockUpRent
                                ?.propertyTypeList ??
                            [],
                        -1,
                      ) ??
                      const RentLookupModel());
                  valuesFiltersCubit.changeUnit(1);
                  // });
                  context.read<RentBloc>().requestMeanValue = context
                      .read<RentBloc>()
                      .requestMeanValue
                      .copyWith(
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
                          issueDateStartMonth:
                              valuesFiltersCubit.periodTime.id == 4
                                  ? valuesFiltersCubit.month.value[0] - 1
                                  : 1,
                          issueDateEndMonth:
                              valuesFiltersCubit.periodTime.id == 4
                                  ? valuesFiltersCubit.month.value[0]
                                  : valuesFiltersCubit.periodTime.id == 1
                                      ? DateTime.now().month
                                      : 12,
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
                              .map((e) => e.lookupKey)
                              .toList(),
                          propertyTypeList: valuesFiltersCubit.propertyTypeList
                              .map((e) => e.lookupKey)
                              .toList());
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.replay_outlined,
                      color: ColorManager.golden,
                      size: AppSizeSp.s15,
                    ),
                    Text(
                      'إعادة ضبط',
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: ColorManager.golden),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: AppSizeH.s8),
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
          BlocBuilder(
            bloc: valuesFiltersCubit,
            builder: (context, state) {
              return SliderWidget(
                title: 'قيمه العقار من - إلى',
                startValue:
                    '${(valuesFiltersCubit.rangeRentPaymentMonthlyPerUnit?.start.toDouble() ?? context.read<RentBloc>().loockUpRent?.maxParams[1].minVal.toDouble())?.toInt().formatWithCommas()}',
                endValue:
                    '${(valuesFiltersCubit.rangeRentPaymentMonthlyPerUnit?.end.toDouble() ?? context.read<RentBloc>().loockUpRent?.maxParams[1].maxVal.toDouble())?.toInt().formatWithCommas()}',
                values: valuesFiltersCubit.rangeRentPaymentMonthlyPerUnit ??
                    RangeValues(
                        valuesFiltersCubit.rentPaymentMonthlyPerUnitFrom
                                ?.toDouble() ??
                            context
                                .read<RentBloc>()
                                .loockUpRent
                                ?.maxParams[1]
                                .minVal
                                .toDouble() ??
                            0,
                        valuesFiltersCubit.rentPaymentMonthlyPerUnitTo
                                ?.toDouble() ??
                            context
                                .read<RentBloc>()
                                .loockUpRent
                                ?.maxParams[1]
                                .maxVal
                                .toDouble() ??
                            1000000),
                onChanges: (rangeValues) {
                  valuesFiltersCubit
                      .changeRangeRentPaymentMonthlyPerUnit(rangeValues);
                },
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
              );
            },
          ),
          SizedBox(height: AppSizeH.s12),
          BlocBuilder(
            bloc: valuesFiltersCubit,
            builder: (context, state) {
              return SliderWidget(
                title: 'المساحة من - إلى',
                startValue:
                    '${(valuesFiltersCubit.rangeValuesArea?.start.toDouble() ?? context.read<RentBloc>().loockUpRent?.maxParams[0].minVal.toDouble())?.toInt().formatWithCommas()}',
                endValue:
                    '${(valuesFiltersCubit.rangeValuesArea?.end.toDouble() ?? context.read<RentBloc>().loockUpRent?.maxParams[0].maxVal.toDouble())?.toInt().formatWithCommas()}',
                values: valuesFiltersCubit.rangeValuesArea ??
                    RangeValues(
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
                            1000000),
                onChanges: (rangeValues) {
                  valuesFiltersCubit.changeRangeValuesArea(rangeValues);
                },
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
              );
            },
          ),
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
                      // print(
                      //     'before request ${context.read<RentBloc>().requestMeanValue}');
                      context.read<RentBloc>().requestMeanValue = context
                          .read<RentBloc>()
                          .requestMeanValue
                          .copyWith(
                              areaFrom:
                                  valuesFiltersCubit.rangeValuesArea?.start,
                              areaTo: valuesFiltersCubit.rangeValuesArea?.end,
                              rentPaymentMonthlyPerUnitFrom: valuesFiltersCubit
                                  .rangeRentPaymentMonthlyPerUnit?.start,
                              rentPaymentMonthlyPerUnitTo: valuesFiltersCubit
                                  .rangeRentPaymentMonthlyPerUnit?.end,
                              bedRoomsCount: valuesFiltersCubit.bedRoom.id == -1
                                  ? 0
                                  : valuesFiltersCubit.bedRoom.id,
                              municipalityId:
                                  valuesFiltersCubit.municapility.id,
                              zoneId: valuesFiltersCubit.zone.lookupKey,
                              unit: valuesFiltersCubit.unit,
                              issueDateYear: valuesFiltersCubit.year.id,
                              issueDateQuarterList: getissueDateQuarterList(
                                  valuesFiltersCubit.periodTime.id),
                              issueDateStartMonth:
                                  valuesFiltersCubit.periodTime.id == 4
                                      ? valuesFiltersCubit.month.value[0] - 1
                                      : 1,
                              issueDateEndMonth:
                                  valuesFiltersCubit.periodTime.id == 4
                                      ? valuesFiltersCubit.month.value[0]
                                      : valuesFiltersCubit.periodTime.id == 1
                                          ? DateTime.now().month
                                          : 12,
                              periodId: valuesFiltersCubit.periodTime.id,
                              issueDateFrom: valuesFiltersCubit.periodTime.id == 5
                                  ? valuesFiltersCubit.pickerDateRange?.startDate
                                      ?.toIso8601String()
                                  : null,
                              issueDateTo: valuesFiltersCubit.periodTime.id == 5
                                  ? valuesFiltersCubit.pickerDateRange?.endDate?.toIso8601String()
                                  : null,
                              purposeList: valuesFiltersCubit.rentPurposeList.map((e) => e.lookupKey).toList(),
                              propertyTypeList: valuesFiltersCubit.propertyTypeList.map((e) => e.lookupKey).toList());
                      Navigator.of(context).pop(true);
                      // print(
                      //     'after request ${context.read<RentBloc>().requestMeanValue}');
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
