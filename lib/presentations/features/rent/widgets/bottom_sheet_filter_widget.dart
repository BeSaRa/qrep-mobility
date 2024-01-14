import 'package:easy_localization/easy_localization.dart' as local;
import 'package:ebla/app/extensions.dart';
import 'package:ebla/presentations/features/rent/blocs/cubits/validator_cubit.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:ebla/utils/global_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../app/app_preferences.dart';
import '../../../../app/depndency_injection.dart';
import '../../../../domain/models/rent_models/rent_models.dart';
import '../../../widgets/widgets.dart';
import '../../main/blocs/lookup_bloc/lookup_bloc.dart';
import '../blocs/cubits/values_filters_cubit.dart';
import '../blocs/rent_bloc/rent_bloc.dart';

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
  final streetController = TextEditingController();
  final rentValueFromController = TextEditingController();
  final rentValueToController = TextEditingController();
  final areaValueFromController = TextEditingController();
  final areaValueToController = TextEditingController();
  late ValidatorCubit validatorFromValueCubit;
  late ValidatorCubit validatorToValueCubit;
  late ValidatorCubit validatorFromAreaCubit;
  late ValidatorCubit validatorToAreaCubit;

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
      case 4:
        return [1, 2, 3, 4];
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
                  .read<LookupBloc>()
                  .lookUpRent
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
            valuesFiltersCubit.monthsFromApril = getFromAprilMonths(context);

            if (valuesFiltersCubit.month == const PeriodTimeDetails()) {
              if (valuesFiltersCubit.year.id == 2019) {
                valuesFiltersCubit
                    .changeMonth(valuesFiltersCubit.monthsFromApril.first);
                context.read<RentBloc>().requestMeanValue.issueDateEndMonth !=
                        null
                    ? valuesFiltersCubit.month = valuesFiltersCubit
                        .monthsFromApril
                        .firstWhere((element) =>
                            element.value[0] ==
                            context
                                .read<RentBloc>()
                                .requestMeanValue
                                .issueDateEndMonth)
                    : valuesFiltersCubit.month =
                        valuesFiltersCubit.monthsFromApril.first;
              } else {
                valuesFiltersCubit.changeMonth(valuesFiltersCubit.months.first);
                context.read<RentBloc>().requestMeanValue.issueDateEndMonth !=
                        null
                    ? valuesFiltersCubit.month = valuesFiltersCubit.months
                        .firstWhere((element) =>
                            element.value[0] ==
                            context
                                .read<RentBloc>()
                                .requestMeanValue
                                .issueDateEndMonth)
                    : valuesFiltersCubit.month =
                        valuesFiltersCubit.months.first;
              }
            }

            return valuesFiltersCubit.year.id == 2019
                ? SingleDropDownValue<PeriodTimeDetails>(
                    onChanged: (month) {
                      valuesFiltersCubit.changeMonth(month!);
                    },
                    value: valuesFiltersCubit.month,
                    list: valuesFiltersCubit.monthsFromApril)
                : SingleDropDownValue<PeriodTimeDetails>(
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
                                '${valuesFiltersCubit.pickerDateRange?.startDate?.toLocal().toFormattedString()}---${valuesFiltersCubit.pickerDateRange?.endDate?.toLocal().toFormattedString()}',
                                style: Theme.of(context).textTheme.labelSmall,
                              )
                            : Text(
                                AppStrings().chooseDate,
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
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    validatorFromValueCubit = ValidatorCubit(0);
    validatorToValueCubit = ValidatorCubit(0);
    validatorFromAreaCubit = ValidatorCubit(0);
    validatorToAreaCubit = ValidatorCubit(0);
    valuesFiltersCubit = ValuesFiltersCubit(const RentLookupModel());
    generateYears(2019, DateTime.now().year).forEach((element) {
      valuesFiltersCubit.yearsLists.add(RentLookupModel(
          arName: element.toString(), id: element, enName: element.toString()));
    });
    valuesFiltersCubit.furniture = getObjectByLookupKey(
          context.read<LookupBloc>().lookUpRent?.furnitureStatusList ?? [],
          context.read<RentBloc>().requestMeanValue.furnitureStatus ?? -1,
        ) ??
        const RentLookupModel();
    //Nationality
    // valuesFiltersCubit.nationality = getObjectByLookupKey(
    //       context.read<RentBloc>().loockUpRent?.nationalityList ?? [],
    //       context.read<RentBloc>().requestMeanValue.nationalityCode ?? 1,
    //     ) ??
    //     const RentLookupModel();
    //Property and Purpose
    List<RentLookupModel> listMunicipalityWithAll = [];
    listMunicipalityWithAll
        .addAll(context.read<LookupBloc>().lookUpRent?.municipalityList ?? []);
    if (!listMunicipalityWithAll.contains(const RentLookupModel(
        isActive: true,
        lookupKey: -1,
        arName: "الكل",
        enName: "All",
        id: -1))) {
      listMunicipalityWithAll.add(const RentLookupModel(
          isActive: true,
          lookupKey: -1,
          arName: "الكل",
          enName: "All",
          id: -1));
    }
    context.read<LookupBloc>().lookUpRent = context
        .read<LookupBloc>()
        .lookUpRent
        ?.copyWith(municipalityList: listMunicipalityWithAll);
    valuesFiltersCubit.municapility = getObjectById(
          context.read<LookupBloc>().lookUpRent?.municipalityList ?? [],
          context.read<RentBloc>().requestMeanValue.municipalityId ?? 1,
        ) ??
        const RentLookupModel();
    valuesFiltersCubit.zone = getObjectByLookupKey(
          context.read<LookupBloc>().lookUpRent?.zoneList ?? [],
          context.read<RentBloc>().requestMeanValue.zoneId ?? 0,
        ) ??
        const RentLookupModel();
    context
        .read<RentBloc>()
        .requestMeanValue
        .propertyTypeList
        ?.forEach((element) {
      valuesFiltersCubit.propertyTypeList.add(getObjectByLookupKey(
            context.read<LookupBloc>().lookUpRent?.propertyTypeList ?? [],
            element,
          ) ??
          const RentLookupModel());
    });
    context.read<RentBloc>().requestMeanValue.purposeList?.forEach((element) {
      valuesFiltersCubit.rentPurposeList.add(getObjectByLookupKey(
            context.read<LookupBloc>().lookUpRent?.rentPurposeList ?? [],
            element,
          ) ??
          const RentLookupModel());
    });
    valuesFiltersCubit.bedRoom = getObjectById(
          context.read<LookupBloc>().lookUpRent?.bedRooms ?? [],
          context.read<RentBloc>().requestMeanValue.bedRoomsCount == 0
              ? -1
              : context.read<RentBloc>().requestMeanValue.bedRoomsCount ?? -1,
        ) ??
        const RentLookupModel();
    valuesFiltersCubit.periodTime = getObjectById(
          context.read<LookupBloc>().lookUpRent?.periodTime ?? [],
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
                .read<LookupBloc>()
                .lookUpRent
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
    valuesFiltersCubit.unit = context.read<RentBloc>().requestMeanValue.unit;
    // context.read<RentBloc>().requestMeanValue.streetNo != null
    //     ? streetController.text =
    //         context.read<RentBloc>().requestMeanValue.streetNo.toString()
    //     : null;
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
    context.read<RentBloc>().requestMeanValue.areaFrom != null
        ? areaValueFromController.text =
            context.read<RentBloc>().requestMeanValue.areaFrom.toString()
        : null;
    context.read<RentBloc>().requestMeanValue.areaTo != null
        ? areaValueToController.text =
            context.read<RentBloc>().requestMeanValue.areaTo.toString()
        : null;
    context.read<RentBloc>().requestMeanValue.rentPaymentMonthlyPerUnitFrom !=
            null
        ? rentValueFromController.text = context
            .read<RentBloc>()
            .requestMeanValue
            .rentPaymentMonthlyPerUnitFrom
            .toString()
        : null;
    context.read<RentBloc>().requestMeanValue.rentPaymentMonthlyPerUnitTo !=
            null
        ? rentValueToController.text = context
            .read<RentBloc>()
            .requestMeanValue
            .rentPaymentMonthlyPerUnitTo
            .toString()
        : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Form(
        key: _formkey,
        child: SingleChildScrollView(
          // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                      valuesFiltersCubit.bedRoom = getObjectById(
                            context.read<LookupBloc>().lookUpRent?.bedRooms ??
                                [],
                            -1,
                          ) ??
                          const RentLookupModel();
                      valuesFiltersCubit.municapility = getObjectByLookupKey(
                            context
                                    .read<LookupBloc>()
                                    .lookUpRent
                                    ?.municipalityList ??
                                [],
                            1,
                          ) ??
                          const RentLookupModel();
                      valuesFiltersCubit.zone = getObjectByLookupKey(
                            context.read<LookupBloc>().lookUpRent?.zoneList ??
                                [],
                            -1,
                          ) ??
                          const RentLookupModel();
                      valuesFiltersCubit.rentPaymentMonthlyPerUnitFrom = null;
                      valuesFiltersCubit.rentPaymentMonthlyPerUnitTo = null;
                      valuesFiltersCubit.unit = 2;
                      valuesFiltersCubit.year =
                          valuesFiltersCubit.yearsLists.last;
                      valuesFiltersCubit.periodTime = getObjectById(
                            context.read<LookupBloc>().lookUpRent?.periodTime ??
                                [],
                            1,
                          ) ??
                          const RentLookupModel();
                      valuesFiltersCubit.rentPurposeList.clear();
                      valuesFiltersCubit.rentPurposeList
                          .add(getObjectByLookupKey(
                                context
                                        .read<LookupBloc>()
                                        .lookUpRent
                                        ?.rentPurposeList ??
                                    [],
                                -1,
                              ) ??
                              const RentLookupModel());
                      valuesFiltersCubit.propertyTypeList.clear();
                      valuesFiltersCubit.propertyTypeList
                          .add(getObjectByLookupKey(
                                context
                                        .read<LookupBloc>()
                                        .lookUpRent
                                        ?.propertyTypeList ??
                                    [],
                                -1,
                              ) ??
                              const RentLookupModel());
                      valuesFiltersCubit.changeUnit(2);
                      valuesFiltersCubit.furniture = getObjectByLookupKey(
                            context
                                    .read<LookupBloc>()
                                    .lookUpRent
                                    ?.furnitureStatusList ??
                                [],
                            -1,
                          ) ??
                          const RentLookupModel();
                      // });
                      streetController.clear();
                      rentValueFromController.clear();
                      rentValueToController.clear();
                      areaValueFromController.clear();
                      areaValueToController.clear();
                      // context.read<RentBloc>().requestMeanValue = context
                      //     .read<RentBloc>()
                      //     .requestMeanValue
                      //     .copyWith(
                      //       streetNo: null,
                      //       areaFrom: valuesFiltersCubit.areaFrom,
                      //       areaTo: valuesFiltersCubit.areaTo,
                      //       bedRoomsCount: valuesFiltersCubit.bedRoom.id == -1
                      //           ? 0
                      //           : valuesFiltersCubit.bedRoom.id,
                      //       furnitureStatus: valuesFiltersCubit.furniture.lookupKey,
                      //       municipalityId:
                      //           valuesFiltersCubit.municapility.lookupKey,
                      //       zoneId: valuesFiltersCubit.zone.lookupKey,
                      //       rentPaymentMonthlyPerUnitFrom:
                      //           valuesFiltersCubit.rentPaymentMonthlyPerUnitFrom,
                      //       rentPaymentMonthlyPerUnitTo:
                      //           valuesFiltersCubit.rentPaymentMonthlyPerUnitTo,
                      //       unit: valuesFiltersCubit.unit,
                      //       issueDateYear: valuesFiltersCubit.year.id,
                      //       issueDateQuarterList: getissueDateQuarterList(
                      //           valuesFiltersCubit.periodTime.id),
                      //       issueDateStartMonth:
                      //           valuesFiltersCubit.periodTime.id == 4
                      //               ? valuesFiltersCubit.month.value[0] - 1
                      //               : 1,
                      //       issueDateEndMonth: valuesFiltersCubit.periodTime.id == 4
                      //           ? valuesFiltersCubit.month.value[0]
                      //           : valuesFiltersCubit.periodTime.id == 1
                      //               ? DateTime.now().month
                      //               : 12,
                      //       periodId: valuesFiltersCubit.periodTime.id,
                      //       issueDateFrom: valuesFiltersCubit.periodTime.id == 5
                      //           ? valuesFiltersCubit.pickerDateRange?.startDate
                      //               ?.toIso8601String()
                      //           : null,
                      //       issueDateTo: valuesFiltersCubit.periodTime.id == 5
                      //           ? valuesFiltersCubit.pickerDateRange?.endDate
                      //               ?.toIso8601String()
                      //           : null,
                      //       purposeList: valuesFiltersCubit.rentPurposeList
                      //           .map((e) => e.lookupKey)
                      //           .toList(),
                      //       propertyTypeList: valuesFiltersCubit.propertyTypeList
                      //           .map((e) => e.lookupKey)
                      //           .toList(),
                      //     );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.restart_alt,
                          color: ColorManager.golden,
                          size: AppSizeSp.s15,
                        ),
                        Text(
                          AppStrings().reset,
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
                        Text(AppStrings().municipal,
                            style: Theme.of(context).textTheme.labelMedium),
                        // const SingleDropDownValue(),
                        BlocBuilder(
                          bloc: valuesFiltersCubit,
                          builder: (context, states) {
                            return SingleDropDownValue<RentLookupModel>(
                                value: valuesFiltersCubit.municapility,
                                onChanged: (municapility) {
                                  valuesFiltersCubit
                                      .changeMunicapility(municapility!);
                                  valuesFiltersCubit.changeZone(context
                                          .read<LookupBloc>()
                                          .lookUpRent
                                          ?.zoneList
                                          .firstWhere((element) {
                                        return element.lookupKey == -1;
                                      }) ??
                                      const RentLookupModel());
                                },
                                list: context
                                        .read<LookupBloc>()
                                        .lookUpRent
                                        ?.municipalityList ??
                                    []);
                          },
                        )
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
                          AppStrings().zone,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        BlocBuilder(
                          bloc: valuesFiltersCubit,
                          builder: (context, states) {
                            return SingleDropDowmSearchWidget<RentLookupModel>(
                                onChanged: (zone) {
                                  valuesFiltersCubit.changeZone(zone!);
                                },
                                value: valuesFiltersCubit.zone,
                                list: filterDataBymunicipalityId(
                                    valuesFiltersCubit.municapility.id,
                                    context
                                            .read<LookupBloc>()
                                            .lookUpRent
                                            ?.zoneList ??
                                        []));
                          },
                        )
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
                        Text(AppStrings().propertyType,
                            style: Theme.of(context).textTheme.labelMedium),
                        // const SingleDropDownValue(),
                        BlocProvider.value(
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
                                list: context
                                        .read<LookupBloc>()
                                        .lookUpRent
                                        ?.propertyTypeList ??
                                    [],
                              );
                            },
                          ),
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
                          AppStrings().propertyUsage,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        BlocProvider.value(
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
                                  list: context
                                          .read<LookupBloc>()
                                          .lookUpRent
                                          ?.rentPurposeList ??
                                      []);
                            },
                          ),
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
                        Text(AppStrings().numberOfRooms,
                            style: Theme.of(context).textTheme.labelMedium),
                        // const SingleDropDownValue(),
                        BlocBuilder(
                          bloc: valuesFiltersCubit,
                          builder: (context, states) {
                            return SingleDropDownValue<RentLookupModel>(
                                value: valuesFiltersCubit.bedRoom,
                                onChanged: (bedRooms) {
                                  valuesFiltersCubit.changeBedRooms(bedRooms!);
                                },
                                list: context
                                        .read<LookupBloc>()
                                        .lookUpRent
                                        ?.bedRooms ??
                                    []);
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
                          AppStrings().duration,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        BlocBuilder(
                          bloc: valuesFiltersCubit,
                          builder: (context, states) {
                            return SingleDropDownValue<RentLookupModel>(
                                onChanged: (periodTime) {
                                  valuesFiltersCubit
                                      .changePeriodTime(periodTime!);
                                  // valuesFiltersCubit.periodTime = periodTime!;
                                },
                                value: valuesFiltersCubit.periodTime,
                                list: context
                                        .read<LookupBloc>()
                                        .lookUpRent
                                        ?.periodTime ??
                                    []);
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
                        Text(AppStrings().durationDetails,
                            style: Theme.of(context).textTheme.labelMedium),
                        // const SingleDropDownValue(),

                        Row(
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
                                  context.read<LookupBloc>().lookUpRent ??
                                      const RentLookupResponse(),
                                ));
                              },
                            )
                          ],
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
                        Text(AppStrings().furnitureStatus,
                            style: Theme.of(context).textTheme.labelMedium),
                        // const SingleDropDownValue(),
                        BlocBuilder(
                          bloc: valuesFiltersCubit,
                          builder: (context, states) {
                            return SingleDropDownValue<RentLookupModel>(
                                value: valuesFiltersCubit.furniture,
                                onChanged: (furniture) {
                                  valuesFiltersCubit
                                      .changeFurniture(furniture!);
                                },
                                list: context
                                        .read<LookupBloc>()
                                        .lookUpRent
                                        ?.furnitureStatusList ??
                                    []);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: AppSizeW.s8),
                  //todo change it to dropdown
                  // Expanded(
                  //   child: Column(
                  //     mainAxisSize: MainAxisSize.min,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         AppStrings().street,
                  //         style: Theme.of(context).textTheme.labelMedium,
                  //       ),
                  //       TextFilterWidget(controller: streetController),
                  //     ],
                  //   ),
                  // )
                  // Expanded(
                  //   child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  // Text(
                  //   "الجنسية",
                  //   style: Theme.of(context).textTheme.labelMedium,
                  // ),
                  //       BlocBuilder(
                  //         bloc: valuesFiltersCubit,
                  //         builder: (context, states) {
                  //           return SingleDropDownValue<RentLookupModel>(
                  //               onChanged: (nationality) {
                  //                 valuesFiltersCubit
                  //                     .changeNationality(nationality!);
                  //               },
                  //               value: valuesFiltersCubit.nationality,
                  //               list: context
                  //                       .read<RentBloc>()
                  //                       .loockUpRent
                  //                       ?.nationalityList ??
                  //                   []);
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
              // SizedBox(height: AppSizeH.s12),
              // Text(AppStrings().measuringUnit,
              //     style: Theme.of(context).textTheme.labelMedium),
              // SizedBox(height: AppSizeH.s12),
              // BlocProvider.value(
              //   value: valuesFiltersCubit,
              //   child: const ChooseUnitWidget(),
              // ),
              SizedBox(height: AppSizeH.s12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            "${AppStrings().rentRaneValue} (${AppStrings().from})",
                            style: Theme.of(context).textTheme.labelMedium),
                        Row(
                          children: [
                            BlocBuilder(
                              bloc: validatorFromValueCubit,
                              builder: (context, state) {
                                return Expanded(
                                    child: BlocBuilder(
                                  bloc: valuesFiltersCubit,
                                  builder: (context, state) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextFilterWidget(
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(
                                                context
                                                    .read<LookupBloc>()
                                                    .lookUpRent
                                                    ?.maxParams[1]
                                                    .maxVal
                                                    .toString()
                                                    .length),
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'^[1-9]\d*')),
                                          ],
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          hintText:
                                              '${context.read<LookupBloc>().lookUpRent?.maxParams[1].minVal}',
                                          controller: rentValueFromController,
                                          validator: (value) {
                                            validatorFromValueCubit.validator(
                                                value,
                                                context
                                                        .read<LookupBloc>()
                                                        .lookUpRent
                                                        ?.maxParams[1]
                                                        .maxVal ??
                                                    0,
                                                context
                                                        .read<LookupBloc>()
                                                        .lookUpRent
                                                        ?.maxParams[1]
                                                        .minVal ??
                                                    0,
                                                rentValueToController.text);

                                            // validatorFromValueCubit.checkValue(
                                            //     rentValueFromController.text,
                                            //     rentValueToController.text);
                                            return validatorFromValueCubit
                                                        .state !=
                                                    0
                                                ? ""
                                                : null;
                                          },
                                        ),
                                        validatorFromValueCubit.state == 3
                                            ? Text(
                                                AppStrings()
                                                    .maxValueValidate
                                                    .tr(args: [
                                                  '(${AppStrings().to})'
                                                ]),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                      color: ColorManager.red,
                                                    ))
                                            : validatorFromValueCubit.state == 2
                                                ? Text(
                                                    "${AppStrings().maxValue}:${context.read<LookupBloc>().lookUpRent?.maxParams[1].maxVal}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                          color:
                                                              ColorManager.red,
                                                        ))
                                                : validatorFromValueCubit
                                                            .state ==
                                                        1
                                                    ? Text(
                                                        "${AppStrings().minValue}:${context.read<LookupBloc>().lookUpRent?.maxParams[1].minVal}",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall!
                                                            .copyWith(
                                                              color:
                                                                  ColorManager
                                                                      .red,
                                                            ))
                                                    : const SizedBox()
                                      ],
                                    );
                                  },
                                ));
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: AppSizeW.s8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            "${AppStrings().rentRaneValue} (${AppStrings().to})",
                            style: Theme.of(context).textTheme.labelMedium),
                        Row(
                          children: [
                            BlocBuilder(
                              bloc: validatorToValueCubit,
                              builder: (context, state) {
                                return Expanded(
                                    child: BlocBuilder(
                                  bloc: valuesFiltersCubit,
                                  builder: (context, state) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextFilterWidget(
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(
                                                context
                                                    .read<LookupBloc>()
                                                    .lookUpRent
                                                    ?.maxParams[1]
                                                    .maxVal
                                                    .toString()
                                                    .length),
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'^[1-9]\d*')),
                                          ],
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          hintText:
                                              '${context.read<LookupBloc>().lookUpRent?.maxParams[1].maxVal}',
                                          controller: rentValueToController,
                                          validator: (value) {
                                            validatorToValueCubit.validator(
                                                value,
                                                context
                                                        .read<LookupBloc>()
                                                        .lookUpRent
                                                        ?.maxParams[1]
                                                        .maxVal ??
                                                    0,
                                                context
                                                        .read<LookupBloc>()
                                                        .lookUpRent
                                                        ?.maxParams[1]
                                                        .minVal ??
                                                    0,
                                                rentValueFromController.text,
                                                isFromValue: false);
                                            // validatorToValueCubit.checkValue(
                                            //     rentValueFromController.text,
                                            //     rentValueToController.text);
                                            return validatorToValueCubit
                                                        .state !=
                                                    0
                                                ? ""
                                                : null;
                                          },
                                        ),
                                        validatorToValueCubit.state == 3
                                            ? Text(
                                                AppStrings()
                                                    .minValueValidate
                                                    .tr(args: [
                                                  '(${AppStrings().from})'
                                                ]),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                      color: ColorManager.red,
                                                    ))
                                            : validatorToValueCubit.state == 2
                                                ? Text(
                                                    "${AppStrings().maxValue}:${context.read<LookupBloc>().lookUpRent?.maxParams[1].maxVal}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                          color:
                                                              ColorManager.red,
                                                        ))
                                                : validatorToValueCubit.state ==
                                                        1
                                                    ? Text(
                                                        "${AppStrings().minValue}:${context.read<LookupBloc>().lookUpRent?.maxParams[1].minVal}",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall!
                                                            .copyWith(
                                                              color:
                                                                  ColorManager
                                                                      .red,
                                                            ))
                                                    : const SizedBox()
                                      ],
                                    );
                                  },
                                ));
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizeH.s12),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Expanded(
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         // mainAxisAlignment: MainAxisAlignment.start,
              //         children: [
              //           Text(
              //               "${AppStrings().areaRangeValue} (${AppStrings().from})",
              //               style: Theme.of(context).textTheme.labelMedium),
              //           Row(
              //             children: [
              //               BlocBuilder(
              //                 bloc: validatorFromAreaCubit,
              //                 builder: (context, state) {
              //                   return Expanded(
              //                       child: BlocBuilder(
              //                     bloc: valuesFiltersCubit,
              //                     builder: (context, state) {
              //                       return Column(
              //                         crossAxisAlignment:
              //                             CrossAxisAlignment.start,
              //                         children: [
              //                           TextFilterWidget(
              //                             inputFormatters: [
              //                               LengthLimitingTextInputFormatter(
              //                                   context
              //                                       .read<LookupBloc>()
              //                                       .loockUpRent
              //                                       ?.maxParams[0]
              //                                       .maxVal
              //                                       .toString()
              //                                       .length),
              //                               FilteringTextInputFormatter.allow(
              //                                   RegExp(r'^[1-9]\d*')),
              //                             ],
              //                             autovalidateMode: AutovalidateMode
              //                                 .onUserInteraction,
              //                             hintText:
              //                                 '${context.read<LookupBloc>().loockUpRent?.maxParams[0].minVal}',
              //                             controller: areaValueFromController,
              //                             validator: (value) {
              //                               validatorFromAreaCubit.validator(
              //                                   value,
              //                                   context
              //                                           .read<LookupBloc>()
              //                                           .loockUpRent
              //                                           ?.maxParams[0]
              //                                           .maxVal ??
              //                                       0,
              //                                   context
              //                                           .read<LookupBloc>()
              //                                           .loockUpRent
              //                                           ?.maxParams[0]
              //                                           .minVal ??
              //                                       0,
              //                                   areaValueToController.text);
              //                               return validatorFromAreaCubit
              //                                           .state !=
              //                                       0
              //                                   ? ""
              //                                   : null;
              //                             },
              //                           ),
              //                           validatorFromAreaCubit.state == 3
              //                               ? Text(
              //                                   AppStrings()
              //                                       .maxValueValidate
              //                                       .tr(args: [
              //                                     '(${AppStrings().to})'
              //                                   ]),
              //                                   style: Theme.of(context)
              //                                       .textTheme
              //                                       .bodySmall!
              //                                       .copyWith(
              //                                         color: ColorManager.red,
              //                                       ))
              //                               : validatorFromAreaCubit.state == 2
              //                                   ? Text(
              //                                       "${AppStrings().maxValue}:${context.read<LookupBloc>().loockUpRent?.maxParams[0].maxVal}",
              //                                       style: Theme.of(context)
              //                                           .textTheme
              //                                           .bodySmall!
              //                                           .copyWith(
              //                                             color:
              //                                                 ColorManager.red,
              //                                           ))
              //                                   : validatorFromAreaCubit
              //                                               .state ==
              //                                           1
              //                                       ? Text(
              //                                           "${AppStrings().minValue}:${context.read<LookupBloc>().loockUpRent?.maxParams[0].minVal}",
              //                                           style: Theme.of(context)
              //                                               .textTheme
              //                                               .bodySmall!
              //                                               .copyWith(
              //                                                 color:
              //                                                     ColorManager
              //                                                         .red,
              //                                               ))
              //                                       : const SizedBox()
              //                         ],
              //                       );
              //                     },
              //                   ));
              //                 },
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //     SizedBox(width: AppSizeW.s8),
              //     Expanded(
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         // mainAxisAlignment: MainAxisAlignment.start,
              //         children: [
              //           Text(
              //               "${AppStrings().areaRangeValue} (${AppStrings().to})",
              //               style: Theme.of(context).textTheme.labelMedium),
              //           Row(
              //             children: [
              //               BlocBuilder(
              //                 bloc: validatorToAreaCubit,
              //                 builder: (context, state) {
              //                   return Expanded(
              //                       child: BlocBuilder(
              //                     bloc: valuesFiltersCubit,
              //                     builder: (context, state) {
              //                       return Column(
              //                         crossAxisAlignment:
              //                             CrossAxisAlignment.start,
              //                         children: [
              //                           TextFilterWidget(
              //                             inputFormatters: [
              //                               LengthLimitingTextInputFormatter(
              //                                   context
              //                                       .read<LookupBloc>()
              //                                       .loockUpRent
              //                                       ?.maxParams[0]
              //                                       .maxVal
              //                                       .toString()
              //                                       .length),
              //                               FilteringTextInputFormatter.allow(
              //                                   RegExp(r'^[1-9]\d*')),
              //                             ],
              //                             autovalidateMode: AutovalidateMode
              //                                 .onUserInteraction,
              //                             hintText:
              //                                 '${context.read<LookupBloc>().loockUpRent?.maxParams[0].maxVal}',
              //                             controller: areaValueToController,
              //                             validator: (value) {
              //                               validatorToAreaCubit.validator(
              //                                   value,
              //                                   context
              //                                           .read<LookupBloc>()
              //                                           .loockUpRent
              //                                           ?.maxParams[0]
              //                                           .maxVal ??
              //                                       0,
              //                                   context
              //                                           .read<LookupBloc>()
              //                                           .loockUpRent
              //                                           ?.maxParams[0]
              //                                           .minVal ??
              //                                       0,
              //                                   areaValueFromController.text,
              //                                   isFromValue: false);
              //                               return validatorToAreaCubit.state !=
              //                                       0
              //                                   ? ""
              //                                   : null;
              //                             },
              //                           ),
              //                           validatorToAreaCubit.state == 3
              //                               ? Text(
              //                                   AppStrings()
              //                                       .minValueValidate
              //                                       .tr(args: [
              //                                     '(${AppStrings().from})'
              //                                   ]),
              //                                   style: Theme.of(context)
              //                                       .textTheme
              //                                       .bodySmall!
              //                                       .copyWith(
              //                                         color: ColorManager.red,
              //                                       ))
              //                               : validatorToAreaCubit.state == 2
              //                                   ? Text(
              //                                       "${AppStrings().maxValue}:${context.read<LookupBloc>().loockUpRent?.maxParams[0].maxVal}",
              //                                       style: Theme.of(context)
              //                                           .textTheme
              //                                           .bodySmall!
              //                                           .copyWith(
              //                                             color:
              //                                                 ColorManager.red,
              //                                           ))
              //                                   : validatorToAreaCubit.state ==
              //                                           1
              //                                       ? Text(
              //                                           "${AppStrings().minValue}:${context.read<LookupBloc>().loockUpRent?.maxParams[0].minVal}",
              //                                           style: Theme.of(context)
              //                                               .textTheme
              //                                               .bodySmall!
              //                                               .copyWith(
              //                                                 color:
              //                                                     ColorManager
              //                                                         .red,
              //                                               ))
              //                                       : const SizedBox()
              //                         ],
              //                       );
              //                     },
              //                   ));
              //                 },
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              // // BlocBuilder(
              // //   bloc: valuesFiltersCubit,
              // //   builder: (context, state) {
              // //     return SliderWidget(
              // //       title: AppStrings().areaFromTo,
              // //       startValue:
              // //           '${(valuesFiltersCubit.rangeValuesArea?.start.toDouble() ?? context.read<LookupBloc>().loockUpRent?.maxParams[0].minVal.toDouble())?.toInt().formatWithCommas()}',
              // //       endValue:
              // //           '${(valuesFiltersCubit.rangeValuesArea?.end.toDouble() ?? context.read<LookupBloc>().loockUpRent?.maxParams[0].maxVal.toDouble())?.toInt().formatWithCommas()}',
              // //       values: valuesFiltersCubit.rangeValuesArea ??
              // //           RangeValues(
              // //               valuesFiltersCubit.areaFrom?.toDouble() ??
              // //                   context
              // //                       .read<LookupBloc>()
              // //                       .loockUpRent
              // //                       ?.maxParams[0]
              // //                       .minVal
              // //                       .toDouble() ??
              // //                   0,
              // //               valuesFiltersCubit.areaTo?.toDouble() ??
              // //                   context
              // //                       .read<LookupBloc>()
              // //                       .loockUpRent
              // //                       ?.maxParams[0]
              // //                       .maxVal
              // //                       .toDouble() ??
              // //                   1000000),
              // //       onChanges: (rangeValues) {
              // //         valuesFiltersCubit.changeRangeValuesArea(rangeValues);
              // //       },
              // //       min: context
              // //               .read<LookupBloc>()
              // //               .loockUpRent
              // //               ?.maxParams[0]
              // //               .minVal
              // //               .toDouble() ??
              // //           0,
              // //       max: context
              // //               .read<LookupBloc>()
              // //               .loockUpRent
              // //               ?.maxParams[0]
              // //               .maxVal
              // //               .toDouble() ??
              // //           1000000,
              // //     );
              // //   },
              // // ),
              //
              // SizedBox(height: AppSizeH.s12),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Row(children: [
                  BlocBuilder(
                    bloc: valuesFiltersCubit,
                    builder: (context, state) {
                      return Expanded(
                        child: CustomElevatedButton(
                          isPrimary: true,
                          title: AppStrings().search,
                          onPress: () {
                            if (_formkey.currentState!.validate()) {
                              context.read<RentBloc>().requestMeanValue =
                                  context
                                      .read<RentBloc>()
                                      .requestMeanValue
                                      .copyWith(
                                        areaFrom: areaValueFromController
                                                .text.isEmpty
                                            ? null
                                            : int.parse(
                                                areaValueFromController.text),
                                        areaTo:
                                            areaValueToController.text.isEmpty
                                                ? null
                                                : int.parse(
                                                    areaValueToController.text),
                                        rentPaymentMonthlyPerUnitFrom:
                                            rentValueFromController.text.isEmpty
                                                ? null
                                                : int.parse(
                                                    rentValueFromController
                                                        .text),
                                        rentPaymentMonthlyPerUnitTo:
                                            rentValueToController.text.isEmpty
                                                ? null
                                                : int.parse(
                                                    rentValueToController.text),
                                        bedRoomsCount:
                                            valuesFiltersCubit.bedRoom.id == -1
                                                ? 0
                                                : valuesFiltersCubit.bedRoom.id,
                                        municipalityId: valuesFiltersCubit
                                            .municapility.lookupKey,
                                        zoneId:
                                            valuesFiltersCubit.zone.lookupKey,
                                        unit: valuesFiltersCubit.unit,
                                        furnitureStatus: valuesFiltersCubit
                                            .furniture.lookupKey,
                                        issueDateYear:
                                            valuesFiltersCubit.year.id,
                                        issueDateQuarterList:
                                            getissueDateQuarterList(
                                                valuesFiltersCubit
                                                    .periodTime.id),
                                        issueDateStartMonth: valuesFiltersCubit
                                                    .periodTime.id ==
                                                4
                                            ? valuesFiltersCubit.month.value[0]
                                            : 1,
                                        issueDateEndMonth: valuesFiltersCubit
                                                    .periodTime.id ==
                                                4
                                            ? valuesFiltersCubit.month.value[0]
                                            : valuesFiltersCubit
                                                        .periodTime.id ==
                                                    1
                                                ? valuesFiltersCubit.year.id ==
                                                        DateTime.now().year
                                                    ? DateTime.now().month
                                                    : 12
                                                : 12,
                                        periodId:
                                            valuesFiltersCubit.periodTime.id,
                                        issueDateFrom:
                                            valuesFiltersCubit.periodTime.id ==
                                                    5
                                                ? valuesFiltersCubit
                                                    .pickerDateRange?.startDate
                                                    ?.toUtc()
                                                    .toIso8601String()
                                                : null,
                                        issueDateTo:
                                            valuesFiltersCubit.periodTime.id ==
                                                    5
                                                ? valuesFiltersCubit
                                                    .pickerDateRange?.endDate
                                                    ?.toUtc()
                                                    .toIso8601String()
                                                : null,
                                        purposeList: valuesFiltersCubit
                                            .rentPurposeList
                                            .map((e) => e.lookupKey)
                                            .toList(),
                                        propertyTypeList: valuesFiltersCubit
                                            .propertyTypeList
                                            .map((e) => e.lookupKey)
                                            .toList(),
                                        halfYearDuration:
                                            valuesFiltersCubit.periodTime.id ==
                                                    2
                                                ? listEquals(
                                                        getissueDateQuarterList(
                                                            valuesFiltersCubit
                                                                .periodTime.id),
                                                        [1, 2])
                                                    ? 1
                                                    : 2
                                                : null,
                                        offset: 0,
                                        // streetNo: streetController.text.isEmpty ? null
                                        //    : int.parse(streetController.text),
                                      );
                              Navigator.of(context).pop(true);
                            }
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(width: AppSizeW.s8),
                  Expanded(
                    child: CustomElevatedButton(
                      isPrimary: false,
                      title: AppStrings().cancel,
                      onPress: () {
                        Navigator.of(context).pop();
                      },
                      backgroundColor:
                          instance<AppPreferences>().getTheme().brightness ==
                                  Brightness.light
                              ? ColorManager.porcelain
                              : ColorManager.greyCloud,
                    ),
                  ),
                ]),
              ),
              SizedBox(height: AppSizeW.s12),
            ],
          ),
        ),
      ),
    );
  }
}
