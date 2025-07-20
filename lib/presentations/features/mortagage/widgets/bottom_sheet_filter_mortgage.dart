import 'package:easy_localization/easy_localization.dart' as local;
import 'package:ebla/app/extensions.dart';

import 'package:ebla/presentations/features/favourite/bloc/create_favourite_bloc/create_favourite_bloc.dart';

import 'package:ebla/presentations/features/mortagage/blocs/mortgage_bloc.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../app/app_preferences.dart';
import '../../../../app/depndency_injection.dart';
import '../../../../domain/models/rent_models/rent_models.dart';
import '../../../../utils/global_functions.dart';
import '../../../resources/resources.dart';
import '../../../widgets/widgets.dart';
import '../../main/blocs/lookup_bloc/lookup_bloc.dart';
import '../../rent/blocs/cubits/validator_cubit.dart';
import '../../rent/blocs/cubits/values_filters_cubit.dart';

class BottomSheetFilterMortgageWidget extends StatefulWidget {
  const BottomSheetFilterMortgageWidget({super.key});

  @override
  State<BottomSheetFilterMortgageWidget> createState() =>
      _BottomSheetFilterMortgageWidgetState();
}

class _BottomSheetFilterMortgageWidgetState
    extends State<BottomSheetFilterMortgageWidget> {
  final streetController = TextEditingController();
  final areaValueFromController = TextEditingController();
  final areaValueToController = TextEditingController();
  final mortgageValueFromController = TextEditingController();
  final mortgageValueToController = TextEditingController();
  late ValuesFiltersCubit valuesFiltersCubit;
  late ValidatorCubit validatorFromValueCubit;
  late ValidatorCubit validatorToValueCubit;
  late ValidatorCubit validatorFromAreaCubit;
  late ValidatorCubit validatorToAreaCubit;
  late CreateFavouriteBloc favouriteBloc;
  final _formkey = GlobalKey<FormState>();

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
    LookupResponse success,
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

            if (context.read<MortgageBloc>().requestMeanValue.periodId != 3) {
              valuesFiltersCubit.quarterYear.clear();
              valuesFiltersCubit.quarterYear.add(success.quarterYearList.first);
            } else {
              valuesFiltersCubit.quarterYear.clear();
              context
                  .read<LookupBloc>()
                  .lookUpMortgage
                  ?.quarterYearList
                  .forEach((element) {
                if (context
                        .read<MortgageBloc>()
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
              context.read<MortgageBloc>().requestMeanValue.issueDateEndMonth !=
                      null
                  ? valuesFiltersCubit.month = valuesFiltersCubit.months
                      .firstWhere((element) =>
                          element.value[0] ==
                          context
                              .read<MortgageBloc>()
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

  @override
  void initState() {
    valuesFiltersCubit = ValuesFiltersCubit(const LookupModel());
    validatorFromValueCubit = ValidatorCubit(0);
    validatorToValueCubit = ValidatorCubit(0);
    validatorFromAreaCubit = ValidatorCubit(0);
    validatorToAreaCubit = ValidatorCubit(0);
    //Year
    valuesFiltersCubit = ValuesFiltersCubit(const LookupModel());
    generateYears(2006, DateTime.now().year).forEach((element) {
      valuesFiltersCubit.yearsLists.add(LookupModel(
          arName: element.toString(), id: element, enName: element.toString()));
    });
    favouriteBloc = instance<CreateFavouriteBloc>();
    List<LookupModel> listDistrictWithAll = [];
    listDistrictWithAll
        .addAll(context.read<LookupBloc>().lookUpMortgage?.districtList ?? []);
    if (!listDistrictWithAll.contains(const LookupModel(
        isActive: true,
        lookupKey: -1,
        arName: "الكل",
        enName: "All",
        id: -1))) {
      listDistrictWithAll.insert(
          0,
          const LookupModel(
              isActive: true,
              lookupKey: -1,
              arName: "الكل",
              enName: "All",
              id: -1));
    }

    context.read<LookupBloc>().lookUpMortgage = context
        .read<LookupBloc>()
        .lookUpMortgage
        ?.copyWith(districtList: listDistrictWithAll);
    List<LookupModel> listMunicipalityWithAll = [];
    listMunicipalityWithAll.addAll(
        context.read<LookupBloc>().lookUpMortgage?.municipalityList ?? []);
    if (!listMunicipalityWithAll.contains(const LookupModel(
        isActive: true,
        lookupKey: -1,
        arName: "الكل",
        enName: "All",
        id: -1))) {
      listMunicipalityWithAll.insert(
          0,
          const LookupModel(
              isActive: true,
              lookupKey: -1,
              arName: "الكل",
              enName: "All",
              id: -1));
    }

    context.read<LookupBloc>().lookUpMortgage = context
        .read<LookupBloc>()
        .lookUpMortgage
        ?.copyWith(
            municipalityList: listMunicipalityWithAll,
            districtList: listDistrictWithAll);
    //municipal and areaCode
    valuesFiltersCubit.municapility = getObjectByLookupKey(
          context.read<LookupBloc>().lookUpMortgage?.municipalityList ?? [],
          context.read<MortgageBloc>().requestMeanValue.municipalityId ?? 1,
        ) ??
        const LookupModel();
    valuesFiltersCubit.zone = getObjectByLookupKey(
          context.read<LookupBloc>().lookUpMortgage?.districtList ?? [],
          context.read<MortgageBloc>().requestMeanValue.areaCode.toInt(),
        ) ??
        const LookupModel();
    //Property and Purpose
    List<LookupModel> listPropertyWithAll = [];
    listPropertyWithAll.addAll(
        context.read<LookupBloc>().lookUpMortgage?.propertyTypeList ?? []);
    if (!listPropertyWithAll.contains(const LookupModel(
        isActive: true,
        lookupKey: -1,
        arName: "الكل",
        enName: "All",
        id: -1))) {
      listPropertyWithAll.insert(
          0,
          const LookupModel(
              isActive: true,
              lookupKey: -1,
              arName: "الكل",
              enName: "All",
              id: -1));
    }
    context.read<MortgageBloc>().requestMeanValue.realEstateValueFrom != null
        ? mortgageValueFromController.text = context
            .read<MortgageBloc>()
            .requestMeanValue
            .realEstateValueFrom
            .toString()
        : null;
    context.read<MortgageBloc>().requestMeanValue.realEstateValueTo != null
        ? mortgageValueToController.text = context
            .read<MortgageBloc>()
            .requestMeanValue
            .realEstateValueTo
            .toString()
        : null;
    context.read<LookupBloc>().lookUpMortgage = context
        .read<LookupBloc>()
        .lookUpMortgage
        ?.copyWith(propertyTypeList: listPropertyWithAll);
    context
        .read<MortgageBloc>()
        .requestMeanValue
        .propertyTypeList
        ?.forEach((element) {
      valuesFiltersCubit.propertyTypeList.add(getObjectByLookupKey(
            context.read<LookupBloc>().lookUpMortgage?.propertyTypeList ?? [],
            element,
          ) ??
          const LookupModel());
    });
    context
        .read<MortgageBloc>()
        .requestMeanValue
        .purposeList
        ?.forEach((element) {
      valuesFiltersCubit.rentPurposeList.add(getObjectByLookupKey(
            context.read<LookupBloc>().lookUpMortgage?.rentPurposeList ?? [],
            element,
          ) ??
          const LookupModel());
    });
    //Year
    valuesFiltersCubit.year =
        context.read<MortgageBloc>().requestMeanValue.issueDateYear != null
            ? getObjectById(
                  valuesFiltersCubit.yearsLists,
                  context.read<MortgageBloc>().requestMeanValue.issueDateYear ??
                      DateTime.now().year,
                ) ??
                valuesFiltersCubit.yearsLists.last
            : valuesFiltersCubit.yearsLists.last;

    //Period
    valuesFiltersCubit.periodTime = getObjectById(
          context.read<LookupBloc>().lookUpMortgage?.periodTime ?? [],
          context.read<MortgageBloc>().requestMeanValue.periodId,
        ) ??
        const LookupModel();

    //Half Year
    context.read<MortgageBloc>().requestMeanValue.periodId == 2
        ? valuesFiltersCubit.periodTimeHalfDetails = context
                .read<LookupBloc>()
                .lookUpMortgage
                ?.halfYearList
                .firstWhere((element) =>
                    context
                        .read<MortgageBloc>()
                        .requestMeanValue
                        .issueDateQuarterList
                        ?.first ==
                    element.value.first) ??
            const PeriodTimeDetails()
        : null;
    //Period Time
    valuesFiltersCubit.pickerDateRange = (context
                    .read<MortgageBloc>()
                    .requestMeanValue
                    .issueDateFrom !=
                null &&
            context.read<MortgageBloc>().requestMeanValue.issueDateTo != null)
        ? PickerDateRange(
            DateTime.parse(
                context.read<MortgageBloc>().requestMeanValue.issueDateFrom ??
                    ''),
            DateTime.parse(
                context.read<MortgageBloc>().requestMeanValue.issueDateTo ??
                    ''))
        : null;
    //Unit
    valuesFiltersCubit.unit =
        context.read<MortgageBloc>().requestMeanValue.unit;
    //Range realEstateValue
    if (context.read<MortgageBloc>().requestMeanValue.realEstateValueFrom !=
            null &&
        context.read<MortgageBloc>().requestMeanValue.realEstateValueTo !=
            null) {
      valuesFiltersCubit.changeRangeRealEstateValue(RangeValues(
          context
              .read<MortgageBloc>()
              .requestMeanValue
              .realEstateValueFrom!
              .toDouble(),
          context
              .read<MortgageBloc>()
              .requestMeanValue
              .realEstateValueTo!
              .toDouble()));
    }
    //Range Area
    if (context.read<MortgageBloc>().requestMeanValue.areaFrom != null &&
        context.read<MortgageBloc>().requestMeanValue.areaTo != null) {
      valuesFiltersCubit.changeRangeValuesArea(RangeValues(
          context.read<MortgageBloc>().requestMeanValue.areaFrom!.toDouble(),
          context.read<MortgageBloc>().requestMeanValue.areaTo!.toDouble()));
    }
    context.read<MortgageBloc>().requestMeanValue.areaFrom != null
        ? areaValueFromController.text =
            context.read<MortgageBloc>().requestMeanValue.areaFrom.toString()
        : null;
    context.read<MortgageBloc>().requestMeanValue.areaTo != null
        ? areaValueToController.text =
            context.read<MortgageBloc>().requestMeanValue.areaTo.toString()
        : null;
    //Street
    // context.read<MortgageBloc>().requestMeanValue.streetNo != null
    //     ? streetController.text =
    //         context.read<MortgageBloc>().requestMeanValue.streetNo.toString()
    //     : null;
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Reset Filter
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      // setState(() {
                      valuesFiltersCubit.changeRangeRealEstateValueReset();
                      // valuesFiltersCubit.bedRoom = const RentLookupModel(
                      //     arName: 'الكل', id: -1, enName: 'ALL');
                      // valuesFiltersCubit.bedRoom = getObjectById(
                      //       context.read<MortgageBloc>().lookUpMortgage?.bedRooms ??
                      //           [],
                      //       -1,
                      //     ) ??
                      //     const RentLookupModel();
                      valuesFiltersCubit.municapility = getObjectByLookupKey(
                            context
                                    .read<LookupBloc>()
                                    .lookUpMortgage
                                    ?.municipalityList ??
                                [],
                            -1,
                          ) ??
                          const LookupModel();
                      valuesFiltersCubit.zone = getObjectByLookupKey(
                            context
                                    .read<LookupBloc>()
                                    .lookUpMortgage
                                    ?.districtList ??
                                [],
                            -1,
                          ) ??
                          const LookupModel();
                      valuesFiltersCubit.realEstateValueFrom = null;
                      valuesFiltersCubit.realEstateValueTo = null;

                      valuesFiltersCubit.year =
                          valuesFiltersCubit.yearsLists.last;
                      valuesFiltersCubit.periodTime = getObjectById(
                            context
                                    .read<LookupBloc>()
                                    .lookUpMortgage
                                    ?.periodTime ??
                                [],
                            1,
                          ) ??
                          const LookupModel();
                      valuesFiltersCubit.rentPurposeList.clear();
                      valuesFiltersCubit.rentPurposeList
                          .add(getObjectByLookupKey(
                                context
                                        .read<LookupBloc>()
                                        .lookUpMortgage
                                        ?.rentPurposeList ??
                                    [],
                                -1,
                              ) ??
                              const LookupModel());
                      valuesFiltersCubit.propertyTypeList.clear();
                      valuesFiltersCubit.propertyTypeList
                          .add(getObjectByLookupKey(
                                context
                                        .read<LookupBloc>()
                                        .lookUpMortgage
                                        ?.propertyTypeList ??
                                    [],
                                -1,
                              ) ??
                              const LookupModel());

                      valuesFiltersCubit.changeUnit(1);
                      mortgageValueFromController.clear();
                      mortgageValueToController.clear();
                      // valuesFiltersCubit.unit = 2;
                      // });
                      streetController.clear();
                      areaValueFromController.clear();
                      areaValueToController.clear();
                      // context.read<MortgageBloc>().requestMeanValue = context
                      //     .read<MortgageBloc>()
                      //     .requestMeanValue
                      //     .copyWith(
                      //         streetNo: null,
                      //         areaFrom: valuesFiltersCubit.areaFrom,
                      //         areaTo: valuesFiltersCubit.areaTo,
                      //         areaCode: valuesFiltersCubit.zone.lookupKey,
                      //         // bedRoomsCount: valuesFiltersCubit.bedRoom.id == -1
                      //         //     ? 0
                      //         //     : valuesFiltersCubit.bedRoom.id,
                      //         municipalityId:
                      //             valuesFiltersCubit.municapility.lookupKey,
                      //         // zoneId: valuesFiltersCubit.zone.lookupKey,
                      //         realEstateValueFrom:
                      //             valuesFiltersCubit.realEstateValueFrom,
                      //         realEstateValueTo:
                      //             valuesFiltersCubit.realEstateValueTo,
                      //         unit: valuesFiltersCubit.unit,
                      //         issueDateYear: valuesFiltersCubit.year.id,
                      //         issueDateQuarterList: getissueDateQuarterList(
                      //             valuesFiltersCubit.periodTime.id),
                      //         issueDateStartMonth:
                      //             valuesFiltersCubit.periodTime.id == 4
                      //                 ? valuesFiltersCubit.month.value[0] - 1
                      //                 : 1,
                      //         issueDateEndMonth:
                      //             valuesFiltersCubit.periodTime.id == 4
                      //                 ? valuesFiltersCubit.month.value[0]
                      //                 : valuesFiltersCubit.periodTime.id == 1
                      //                     ? DateTime.now().month
                      //                     : 12,
                      //         periodId: valuesFiltersCubit.periodTime.id,
                      //         issueDateFrom: valuesFiltersCubit.periodTime.id == 5
                      //             ? valuesFiltersCubit.pickerDateRange?.startDate
                      //                 ?.toIso8601String()
                      //             : null,
                      //         issueDateTo: valuesFiltersCubit.periodTime.id == 5
                      //             ? valuesFiltersCubit.pickerDateRange?.endDate
                      //                 ?.toIso8601String()
                      //             : null,
                      //         purposeList: valuesFiltersCubit.rentPurposeList
                      //             .map((e) => e.lookupKey)
                      //             .toList(),
                      //         propertyTypeList: valuesFiltersCubit.propertyTypeList
                      //             .map((e) => e.lookupKey)
                      //             .toList());
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
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: ColorManager.golden,
                                  ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: AppSizeH.s8),

              //Municipal and Zone
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
                            return SingleDropDownValue<LookupModel>(
                                value: valuesFiltersCubit.municapility,
                                onChanged: (municapility) {
                                  valuesFiltersCubit
                                      .changeMunicapility(municapility!);
                                  valuesFiltersCubit.changeZone(context
                                          .read<LookupBloc>()
                                          .lookUpMortgage
                                          ?.districtList
                                          .firstWhere((element) {
                                        return element.lookupKey == -1;
                                      }) ??
                                      const LookupModel());
                                },
                                list: context
                                        .read<LookupBloc>()
                                        .lookUpMortgage
                                        ?.municipalityList ??
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
                          AppStrings().zone,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        BlocBuilder(
                          bloc: valuesFiltersCubit,
                          builder: (context, states) {
                            return SingleDropDowmSearchWidget<LookupModel>(
                                onChanged: (zone) {
                                  valuesFiltersCubit.changeZone(zone!);
                                },
                                value: valuesFiltersCubit.zone,
                                list: filterDataBymunicipalityId(
                                    valuesFiltersCubit.municapility.lookupKey,
                                    context
                                            .read<LookupBloc>()
                                            .lookUpMortgage
                                            ?.districtList ??
                                        []));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //property and purpose
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
                                        .lookUpMortgage
                                        ?.propertyTypeList ??
                                    [],
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: AppSizeW.s8),
                  // Expanded(
                  //   child: Column(
                  //     mainAxisSize: MainAxisSize.min,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         AppStrings().propertyUsage,
                  //         style: Theme.of(context).textTheme.labelMedium,
                  //       ),
                  //       BlocProvider.value(
                  //         value: valuesFiltersCubit,
                  //         child: BlocBuilder(
                  //           bloc: valuesFiltersCubit,
                  //           builder: (context, states) {
                  //             return MultiChooseDropDownWidget(
                  //                 isPurpose: true,
                  //                 // selectedValue:
                  //                 //     valuesFiltersCubit.purposeType,
                  //                 selectedItems:
                  //                     valuesFiltersCubit.rentPurposeList,
                  //                 list: context
                  //                         .read<LookupBloc>()
                  //                         .lookUpMortgage
                  //                         ?.rentPurposeList ??
                  //                     []);
                  //           },
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                ],
              ),
              //Year and periodTime
              SizedBox(height: AppSizeH.s12),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                  return SingleDropDownValue<LookupModel>(
                                      onChanged: (year) {
                                        valuesFiltersCubit.changeYear(year!);
                                      },
                                      value: valuesFiltersCubit.year,
                                      list: valuesFiltersCubit.yearsLists);
                                },
                              ),
                            ),
                            // SizedBox(width: AppSizeW.s8),
                            //
                          ],
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
                          AppStrings().duration,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        BlocBuilder(
                          bloc: valuesFiltersCubit,
                          builder: (context, states) {
                            return SingleDropDownValue<LookupModel>(
                                onChanged: (periodTime) {
                                  valuesFiltersCubit
                                      .changePeriodTime(periodTime!);
                                  // valuesFiltersCubit.periodTime = periodTime!;
                                },
                                value: valuesFiltersCubit.periodTime,
                                list: context
                                        .read<LookupBloc>()
                                        .lookUpMortgage
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
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
                  // ),
                  SizedBox(width: AppSizeW.s8),
                  BlocBuilder(
                    bloc: valuesFiltersCubit,
                    builder: (context, states) {
                      return Expanded(
                        child: getPeriodTimeById(
                          valuesFiltersCubit.periodTime.id,
                          context.read<LookupBloc>().lookUpMortgage ??
                              const LookupResponse(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              // SizedBox(height: AppSizeH.s12),
              // Text(AppStrings().measuringUnit,
              //     style: Theme.of(context).textTheme.labelMedium),
              //
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
                            "${AppStrings().mortgageRealEstateValue} (${AppStrings().from})",
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
                                                    .lookUpMortgage
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
                                              '${context.read<LookupBloc>().lookUpMortgage?.maxParams[1].minVal}',
                                          controller:
                                              mortgageValueFromController,
                                          validator: (value) {
                                            validatorFromValueCubit.validator(
                                                value,
                                                context
                                                        .read<LookupBloc>()
                                                        .lookUpMortgage
                                                        ?.maxParams[1]
                                                        .maxVal ??
                                                    0,
                                                context
                                                        .read<LookupBloc>()
                                                        .lookUpMortgage
                                                        ?.maxParams[1]
                                                        .minVal ??
                                                    0,
                                                mortgageValueToController.text);
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
                                                    "${AppStrings().maxValue}:${context.read<LookupBloc>().lookUpMortgage?.maxParams[1].maxVal}",
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
                                                        "${AppStrings().minValue}:${context.read<LookupBloc>().lookUpMortgage?.maxParams[1].minVal}",
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
                            "${AppStrings().mortgageRealEstateValue} (${AppStrings().to})",
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
                                                        .lookUpMortgage
                                                        ?.maxParams[1]
                                                        .maxVal
                                                        .toString()
                                                        .length ??
                                                    100000000),
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'^[1-9]\d*')),
                                          ],
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          hintText:
                                              '${context.read<LookupBloc>().lookUpMortgage?.maxParams[1].maxVal}',
                                          controller: mortgageValueToController,
                                          validator: (value) {
                                            validatorToValueCubit.validator(
                                                value,
                                                context
                                                        .read<LookupBloc>()
                                                        .lookUpMortgage
                                                        ?.maxParams[1]
                                                        .maxVal ??
                                                    0,
                                                context
                                                        .read<LookupBloc>()
                                                        .lookUpMortgage
                                                        ?.maxParams[1]
                                                        .minVal ??
                                                    0,
                                                mortgageValueFromController
                                                    .text,
                                                isFromValue: false);
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
                                                    "${AppStrings().maxValue}:${context.read<LookupBloc>().lookUpMortgage?.maxParams[1].maxVal}",
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
                                                        "${AppStrings().minValue}:${context.read<LookupBloc>().lookUpMortgage?.maxParams[1].minVal}",
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
              // BlocBuilder(
              //   bloc: valuesFiltersCubit,
              //   builder: (context, state) {
              //     return SliderWidget(
              //       title: AppStrings().realStateValueFromTo,
              //       startValue:
              //           '${(valuesFiltersCubit.rangerealEstateValue?.start.toDouble() ?? context.read<LookupBloc>().lookUpMortgage?.maxParams[1].minVal.toDouble())?.toInt().formatWithCommas()}',
              //       endValue:
              //           '${(valuesFiltersCubit.rangerealEstateValue?.end.toDouble() ?? context.read<LookupBloc>().lookUpMortgage?.maxParams[1].maxVal.toDouble())?.toInt().formatWithCommas()}',
              //       values: valuesFiltersCubit.rangerealEstateValue ??
              //           RangeValues(
              //               valuesFiltersCubit.realEstateValueFrom?.toDouble() ??
              //                   context
              //                       .read<LookupBloc>()
              //                       .lookUpMortgage
              //                       ?.maxParams[1]
              //                       .minVal
              //                       .toDouble() ??
              //                   0,
              //               valuesFiltersCubit.realEstateValueTo?.toDouble() ??
              //                   context
              //                       .read<LookupBloc>()
              //                       .lookUpMortgage
              //                       ?.maxParams[1]
              //                       .maxVal
              //                       .toDouble() ??
              //                   1000000),
              //       onChanges: (rangeValues) {
              //         valuesFiltersCubit.changeRangeRealEstateValue(rangeValues);
              //       },
              //       min: context
              //               .read<LookupBloc>()
              //               .lookUpMortgage
              //               ?.maxParams[1]
              //               .minVal
              //               .toDouble() ??
              //           0,
              //       max: context
              //               .read<LookupBloc>()
              //               .lookUpMortgage
              //               ?.maxParams[1]
              //               .maxVal
              //               .toDouble() ??
              //           1000000,
              //     );
              //   },
              // ),
              // SizedBox(height: AppSizeH.s12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            "${AppStrings().areaRangeValue} (${AppStrings().from})",
                            style: Theme.of(context).textTheme.labelMedium),
                        Row(
                          children: [
                            BlocBuilder(
                              bloc: validatorFromAreaCubit,
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
                                                    .lookUpMortgage
                                                    ?.maxParams[0]
                                                    .maxVal
                                                    .toString()
                                                    .length),
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'^[1-9]\d*')),
                                          ],
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          hintText:
                                              '${context.read<LookupBloc>().lookUpMortgage?.maxParams[0].minVal}',
                                          controller: areaValueFromController,
                                          validator: (value) {
                                            validatorFromAreaCubit.validator(
                                                value,
                                                context
                                                        .read<LookupBloc>()
                                                        .lookUpMortgage
                                                        ?.maxParams[0]
                                                        .maxVal ??
                                                    0,
                                                context
                                                        .read<LookupBloc>()
                                                        .lookUpMortgage
                                                        ?.maxParams[0]
                                                        .minVal ??
                                                    0,
                                                areaValueToController.text);
                                            return validatorFromAreaCubit
                                                        .state !=
                                                    0
                                                ? ""
                                                : null;
                                          },
                                        ),
                                        validatorFromAreaCubit.state == 3
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
                                            : validatorFromAreaCubit.state == 2
                                                ? Text(
                                                    "${AppStrings().maxValue}:${context.read<LookupBloc>().lookUpMortgage?.maxParams[0].maxVal}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                          color:
                                                              ColorManager.red,
                                                        ))
                                                : validatorFromAreaCubit
                                                            .state ==
                                                        1
                                                    ? Text(
                                                        "${AppStrings().minValue}:${context.read<LookupBloc>().lookUpMortgage?.maxParams[0].minVal}",
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
                            "${AppStrings().areaRangeValue} (${AppStrings().to})",
                            style: Theme.of(context).textTheme.labelMedium),
                        Row(
                          children: [
                            BlocBuilder(
                              bloc: validatorToAreaCubit,
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
                                                    .lookUpMortgage
                                                    ?.maxParams[0]
                                                    .maxVal
                                                    .toString()
                                                    .length),
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'^[1-9]\d*')),
                                          ],
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          hintText:
                                              '${context.read<LookupBloc>().lookUpMortgage?.maxParams[0].maxVal}',
                                          controller: areaValueToController,
                                          validator: (value) {
                                            validatorToAreaCubit.validator(
                                                value,
                                                context
                                                        .read<LookupBloc>()
                                                        .lookUpMortgage
                                                        ?.maxParams[0]
                                                        .maxVal ??
                                                    0,
                                                context
                                                        .read<LookupBloc>()
                                                        .lookUpMortgage
                                                        ?.maxParams[0]
                                                        .minVal ??
                                                    0,
                                                areaValueFromController.text,
                                                isFromValue: false);
                                            return validatorToAreaCubit.state !=
                                                    0
                                                ? ""
                                                : null;
                                          },
                                        ),
                                        validatorToAreaCubit.state == 3
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
                                            : validatorToAreaCubit.state == 2
                                                ? Text(
                                                    "${AppStrings().maxValue}:${context.read<LookupBloc>().lookUpMortgage?.maxParams[0].maxVal}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                          color:
                                                              ColorManager.red,
                                                        ))
                                                : validatorToAreaCubit.state ==
                                                        1
                                                    ? Text(
                                                        "${AppStrings().minValue}:${context.read<LookupBloc>().lookUpMortgage?.maxParams[0].minVal}",
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
                            //     'before request ${context.read<RentBloc>().requestMeanValue}');
                            if (_formkey.currentState!.validate()) {
                              context.read<MortgageBloc>().requestMeanValue =
                                  context
                                      .read<MortgageBloc>()
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
                                        realEstateValueFrom:
                                            mortgageValueFromController
                                                    .text.isEmpty
                                                ? null
                                                : double.parse(
                                                    mortgageValueFromController
                                                        .text),
                                        realEstateValueTo:
                                            mortgageValueToController
                                                    .text.isEmpty
                                                ? null
                                                : double.parse(
                                                    mortgageValueToController
                                                        .text),
                                        // bedRoomsCount: valuesFiltersCubit.bedRoom.id == -1
                                        //     ? 0
                                        //     : valuesFiltersCubit.bedRoom.id,
                                        municipalityId: valuesFiltersCubit
                                            .municapility.lookupKey,
                                        // zoneId: valuesFiltersCubit.zone.lookupKey,
                                        areaCode:
                                            valuesFiltersCubit.zone.lookupKey,
                                        unit: valuesFiltersCubit.unit,
                                        issueDateYear:
                                            valuesFiltersCubit.year.id,
                                        issueDateQuarterList: valuesFiltersCubit
                                                    .periodTime.id ==
                                                3
                                            ? getissueDateQuarterList(
                                                valuesFiltersCubit
                                                    .periodTime.id)
                                            : valuesFiltersCubit
                                                        .periodTime.id ==
                                                    2
                                                ? valuesFiltersCubit
                                                            .periodTimeHalfDetails
                                                            .value
                                                            .first ==
                                                        1
                                                    ? [1, 2]
                                                    : [3, 4]
                                                : [1, 2, 3, 4],
                                        // getissueDateQuarterList(
                                        //     valuesFiltersCubit
                                        //         .periodTime.id),
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
                                        // streetNo: streetController.text.isEmpty ? null : int.parse(streetController.text)
                                      );
                              Navigator.of(context).pop(true);
                            }

                            //     'after request ${context.read<MortgageBloc>().requestMeanValue}');
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
              // if (context.read<LoggedInUserCubit>().state)
              //   Center(
              //     child: CustomElevatedButton(
              //       isPrimary: true,
              //       title: AppStrings().addFavourite,
              //       onPress: () async {
              //         if (_formkey.currentState!.validate()) {
              //           CriteriaObject criteria = CriteriaObject(
              //             areaFrom: areaValueFromController.text.isEmpty
              //                 ? null
              //                 : double.parse(areaValueFromController.text),
              //             areaTo: areaValueToController.text.isEmpty
              //                 ? null
              //                 : double.parse(areaValueToController.text),
              //             municipalityId:
              //                 valuesFiltersCubit.municapility.lookupKey,
              //             areaCode: valuesFiltersCubit.zone.lookupKey,
              //             unit: null,
              //             realEstateValueFrom: mortgageValueFromController
              //                     .text.isEmpty
              //                 ? null
              //                 : double.parse(mortgageValueFromController.text),
              //             realEstateValueTo: mortgageValueToController
              //                     .text.isEmpty
              //                 ? null
              //                 : double.parse(mortgageValueToController.text),
              //             issueDateYear: valuesFiltersCubit.year.id,
              //             issueDateQuarterList:
              //                 valuesFiltersCubit.periodTime.id == 3
              //                     ? getissueDateQuarterList(
              //                         valuesFiltersCubit.periodTime.id)
              //                     : null,
              //             issueDateStartMonth:
              //                 valuesFiltersCubit.periodTime.id == 4
              //                     ? valuesFiltersCubit.month.value[0] - 1
              //                     : 1,
              //             issueDateEndMonth:
              //                 valuesFiltersCubit.periodTime.id == 4
              //                     ? valuesFiltersCubit.month.value[0]
              //                     : valuesFiltersCubit.periodTime.id == 1
              //                         ? valuesFiltersCubit.year.id ==
              //                                 DateTime.now().year
              //                             ? DateTime.now().month
              //                             : 12
              //                         : 12,
              //             periodId: valuesFiltersCubit.periodTime.id,
              //             issueDateFrom: valuesFiltersCubit.periodTime.id == 5
              //                 ? valuesFiltersCubit.pickerDateRange?.startDate
              //                     ?.toUtc()
              //                     .toIso8601String()
              //                 : null,
              //             issueDateTo: valuesFiltersCubit.periodTime.id == 5
              //                 ? valuesFiltersCubit.pickerDateRange?.endDate
              //                     ?.toUtc()
              //                     .toIso8601String()
              //                 : null,
              //             purposeList: valuesFiltersCubit.rentPurposeList
              //                 .map((e) => e.lookupKey)
              //                 .toList(),
              //             propertyTypeList: valuesFiltersCubit.propertyTypeList
              //                 .map((e) => e.lookupKey)
              //                 .toList(),
              //             halfYearDuration:
              //                 valuesFiltersCubit.periodTime.id == 2
              //                     ? listEquals(
              //                             getissueDateQuarterList(
              //                                 valuesFiltersCubit.periodTime.id),
              //                             [1, 2])
              //                         ? 1
              //                         : 2
              //                     : null,
              //           );
              //           var res = await showDialog(
              //               context: context,
              //               builder: (BuildContext ctxt) => Dialog(
              //                       child: CreateFavWidget(
              //                     criteria: criteria,
              //                     page: Indicators.mortgage,
              //                   )));
              //           if (res != null && res == true) {
              //             successToast(
              //                 AppStrings().addFavouriteSuccess, context);
              //           }
              //         }
              //       },
              //     ),
              //   ),
              // SizedBox(height: AppSizeH.s12),
            ],
          ),
        ),
      ),
    );
  }
}
