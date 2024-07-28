import 'dart:convert';

import 'package:easy_localization/easy_localization.dart' as local;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/app_preferences.dart';
import '../../../../app/depndency_injection.dart';
import '../../../domain/models/favourite/favourite_models.dart';
import '../../../domain/models/models.dart';
import '../../../utils/global_functions.dart';
import '../../resources/resources.dart';
import '../../widgets/widgets.dart';
import '../main/mains.dart';

class BottomSheetFavWidget extends StatefulWidget {
  final String criteria;
  final Indicators indicator;
  const BottomSheetFavWidget(
      {super.key, required this.criteria, required this.indicator});

  @override
  State<BottomSheetFavWidget> createState() => _BottomSheetFavWidgetState();
}

class _BottomSheetFavWidgetState extends State<BottomSheetFavWidget> {
  late CriteriaObject criteriaObject;
  late LookupModel lookup;

  @override
  void initState() {
    Map<String, dynamic> valueMap = json.decode(widget.criteria);
    criteriaObject = CriteriaObject.fromJson(valueMap);
    // rentValueFromController.text=criteriaObject.

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Form(
          child: SingleChildScrollView(
            // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSizeH.s8),
                  Wrap(
                    spacing: AppSizeW.s8,
                    children: [
                      ///municipality
                      if (criteriaObject.municipalityId != null)
                        FavFilterWidget(
                          label: AppStrings().municipal,
                          value: getMunicipalityName(widget.indicator,
                                  criteriaObject.municipalityId) ??
                              '',
                        ),

                      ///broker category id
                      if (criteriaObject.brokerCategoryId != null)
                        FavFilterWidget(
                          label: AppStrings().brokerageCompanyActivity,
                          value: getBrokerCategoryName(widget.indicator,
                                  criteriaObject.brokerCategoryId) ??
                              '',
                        ),

                      ///broker name
                      if (criteriaObject.brokerName != null)
                        FavFilterWidget(
                          label: AppStrings().brokerCompanyName,
                          value: criteriaObject.brokerName ?? '',
                        ),

                      ///zone
                      if (criteriaObject.zoneId != null ||
                          criteriaObject.areaCode != null)
                        FavFilterWidget(
                          label: AppStrings().zone,
                          value: getZoneName(
                                  widget.indicator,
                                  criteriaObject.zoneId ??
                                      criteriaObject.areaCode) ??
                              '',
                        ),

                      ///property type
                      if (criteriaObject.propertyTypeList?.isNotEmpty ?? false)
                        FavFilterWidget(
                          label: AppStrings().propertyType,
                          value: getPropertyTypeName(widget.indicator,
                                  criteriaObject.propertyTypeList ?? []) ??
                              '',
                        ),

                      ///property usage
                      if (criteriaObject.purposeList?.isNotEmpty ?? false)
                        FavFilterWidget(
                          label: AppStrings().propertyUsage,
                          value: getPropertyUsageName(widget.indicator,
                                  criteriaObject.purposeList ?? []) ??
                              '',
                        ),

                      ///number of rooms
                      if (criteriaObject.bedRoomsCount != null)
                        FavFilterWidget(
                          label: AppStrings().numberOfRooms,
                          value: getBedRoomsCount(widget.indicator,
                                  criteriaObject.bedRoomsCount) ??
                              '',
                        ),

                      ///duration
                      if (criteriaObject.durationType != null)
                        FavFilterWidget(
                          label: AppStrings().duration,
                          value: getDurationName(widget.indicator,
                                  criteriaObject.durationType) ??
                              '',
                        ),

                      ///half year duration
                      if (criteriaObject.halfYearDuration != null)
                        FavFilterWidget(
                          label: AppStrings().halfYear,
                          value: getHalfYearDurationName(widget.indicator,
                                  criteriaObject.halfYearDuration) ??
                              '',
                        ),

                      ///year
                      if (criteriaObject.issueDateYear != null)
                        FavFilterWidget(
                          label: AppStrings().year,
                          value: criteriaObject.issueDateYear.toString(),
                        ),

                      ///quarter
                      if (criteriaObject.issueDateQuarterList?.isNotEmpty ??
                          false)
                        FavFilterWidget(
                          label: AppStrings().quarter,
                          value: getQuarterYearDurationName(widget.indicator,
                                  criteriaObject.issueDateQuarterList!) ??
                              '',
                        ),

                      ///month
                      if (criteriaObject.issueDateMonth != null)
                        FavFilterWidget(
                          label: AppStrings().month,
                          value: getIssueMonthName(
                                  criteriaObject.issueDateMonth ?? 1) ??
                              '',
                        ),

                      ///month start
                      if (criteriaObject.issueDateStartMonth != null)
                        FavFilterWidget(
                          label: AppStrings().month,
                          value: getIssueMonthName(
                                  criteriaObject.issueDateStartMonth ?? 1) ??
                              '',
                        ),

                      ///month end
                      if (criteriaObject.issueDateEndMonth != null)
                        FavFilterWidget(
                          label: AppStrings().month,
                          value: getIssueMonthName(
                                  criteriaObject.issueDateEndMonth ?? 1) ??
                              '',
                        ),

                      ///furniture status
                      if (criteriaObject.furnitureStatus != null)
                        FavFilterWidget(
                          label: AppStrings().furnitureStatus,
                          value: getFurnitureStatusName(widget.indicator,
                                  criteriaObject.furnitureStatus) ??
                              '',
                        ),

                      ///nationality
                      if (criteriaObject.nationalityCode != null)
                        FavFilterWidget(
                          label: AppStrings().nationality,
                          value: getNationalityName(widget.indicator,
                                  criteriaObject.nationalityCode) ??
                              '',
                        ),

                      ///unit
                      if (criteriaObject.unit != null)
                        FavFilterWidget(
                          label: AppStrings().measuringUnit,
                          value: criteriaObject.unit == 1
                              ? AppStrings().meterSquareFull
                              : AppStrings().footSquareFull,
                        ),

                      /// from area
                      if (criteriaObject.areaFrom != null)
                        FavFilterWidget(
                          label:
                              "${AppStrings().areaRangeValue} ${AppStrings().from}",
                          value: criteriaObject.areaFrom.toString(),
                        ),

                      /// to area
                      if (criteriaObject.areaTo != null)
                        FavFilterWidget(
                          label:
                              "${AppStrings().areaRangeValue} ${AppStrings().to}",
                          value: criteriaObject.areaTo.toString(),
                        ),

                      /// from rent monthly
                      if (criteriaObject.rentPaymentMonthlyPerUnitFrom != null)
                        FavFilterWidget(
                          label:
                              '${AppStrings().realStateValue} ${AppStrings().from}',
                          value: criteriaObject.rentPaymentMonthlyPerUnitFrom
                              .toString(),
                        ),

                      ///to rent monthly
                      if (criteriaObject.rentPaymentMonthlyPerUnitTo != null)
                        FavFilterWidget(
                          label:
                              '${AppStrings().realStateValue} ${AppStrings().to}',
                          value: criteriaObject.rentPaymentMonthlyPerUnitTo
                              .toString(),
                        ),

                      ///real estate value
                      if (criteriaObject.realEstateValueFrom != null)
                        FavFilterWidget(
                          label:
                              "${AppStrings().realStateValue} ${AppStrings().from}",
                          value: criteriaObject.realEstateValueFrom.toString(),
                        ),
                      if (criteriaObject.realEstateValueTo != null)
                        FavFilterWidget(
                          label:
                              "${AppStrings().realStateValue} ${AppStrings().to}",
                          value: criteriaObject.realEstateValueTo.toString(),
                        ),
                    ],
                  ),
                  SizedBox(height: AppSizeH.s12),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(children: [
                      Expanded(
                        child: CustomElevatedButton(
                          isPrimary: true,
                          title: AppStrings().apply,
                          onPress: () {
                            switch (widget.indicator) {
                              case Indicators.broker:
                                initRealEstateBroker();
                                Navigator.pop(context,
                                    {"class": 0, "object": criteriaObject});

                              case Indicators.sell:
                                initSellModule();
                                Navigator.pop(context,
                                    {"class": 2, "object": criteriaObject});

                              case Indicators.rental:
                                initRentModule();
                                Navigator.pop(context,
                                    {"class": 1, "object": criteriaObject});
                                ;
                              case Indicators.mortgage:
                                initMortgageModule();
                                Navigator.pop(context,
                                    {"class": 3, "object": criteriaObject});
                              default:
                                Navigator.pop(context,
                                    {"class": 1, "object": criteriaObject});
                            }
                          },
                        ),
                      ),
                      SizedBox(width: AppSizeW.s8),
                      Expanded(
                        child: CustomElevatedButton(
                          isPrimary: false,
                          title: AppStrings().cancel,
                          onPress: () {
                            Navigator.of(context).pop();
                          },
                          backgroundColor: instance<AppPreferences>()
                                      .getTheme()
                                      .brightness ==
                                  Brightness.light
                              ? ColorManager.porcelain
                              : ColorManager.greyCloud,
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(height: AppSizeW.s18),
                ]),
          ),
        ));
  }

  String? getMunicipalityName(Indicators indicator, id) {
    if (id == -1) {
      return context.locale == ARABIC_LOCAL ? "الكل" : "All";
    } else {
      switch (indicator) {
        case Indicators.broker:
          return context.locale == ARABIC_LOCAL
              ? (getObjectByLookupKey(
                  context.read<LookupBloc>().lookupBrokerOv?.municipalityList ??
                      [],
                  id ?? 4,
                )?.arName)
              : (getObjectByLookupKey(
                  context.read<LookupBloc>().lookupBrokerOv?.municipalityList ??
                      [],
                  id ?? 4,
                )?.enName);
        case Indicators.sell:
          return context.locale == ARABIC_LOCAL
              ? (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpSell?.municipalityList ?? [],
                  id ?? 1,
                )?.arName)
              : (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpSell?.municipalityList ?? [],
                  id ?? 1,
                )?.enName);
        case Indicators.mortgage:
          return context.locale == ARABIC_LOCAL
              ? (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpMortgage?.municipalityList ??
                      [],
                  id ?? 1,
                )?.arName)
              : (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpMortgage?.municipalityList ??
                      [],
                  id ?? 1,
                )?.enName);
        case Indicators.rental:
          return context.locale == ARABIC_LOCAL
              ? (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpRent?.municipalityList ?? [],
                  id ?? 1,
                )?.arName)
              : (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpRent?.municipalityList ?? [],
                  id ?? 1,
                )?.enName);
        default:
          return context.locale == ARABIC_LOCAL
              ? (getObjectByLookupKey(
                  context.read<LookupBloc>().lookupBrokerOv?.municipalityList ??
                      [],
                  id ?? 4,
                )?.arName)
              : (getObjectByLookupKey(
                  context.read<LookupBloc>().lookupBrokerOv?.municipalityList ??
                      [],
                  id ?? 4,
                )?.enName);
      }
    }
  }

  String? getBrokerCategoryName(Indicators indicator, id) {
    if (id == -1) {
      return context.locale == ARABIC_LOCAL ? "الكل" : "All";
    } else {
      switch (indicator) {
        case Indicators.broker:
          return context.locale == ARABIC_LOCAL
              ? (getObjectByLookupKey(
                  context.read<LookupBloc>().lookupBroker?.brokerCategoryList ??
                      [],
                  2,
                )?.arName)
              : (getObjectByLookupKey(
                  context.read<LookupBloc>().lookupBroker?.brokerCategoryList ??
                      [],
                  2,
                )?.enName);

        default:
          return context.locale == ARABIC_LOCAL
              ? (getObjectByLookupKey(
                  context.read<LookupBloc>().lookupBrokerOv?.municipalityList ??
                      [],
                  id ?? 4,
                )?.arName)
              : (getObjectByLookupKey(
                  context.read<LookupBloc>().lookupBrokerOv?.municipalityList ??
                      [],
                  id ?? 4,
                )?.enName);
      }
    }
  }

  String? getZoneName(Indicators indicator, id) {
    if (id == -1) {
      return context.locale == ARABIC_LOCAL ? "الكل" : "All";
    } else {
      switch (indicator) {
        case Indicators.sell:
          return context.locale == ARABIC_LOCAL
              ? (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpSell?.districtList ?? [],
                  id ?? 1,
                )?.arName)
              : (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpSell?.districtList ?? [],
                  id ?? 1,
                )?.enName);
        case Indicators.mortgage:
          return context.locale == ARABIC_LOCAL
              ? (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpMortgage?.districtList ?? [],
                  id ?? 1,
                )?.arName)
              : (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpMortgage?.districtList ?? [],
                  id ?? 1,
                )?.enName);
        case Indicators.rental:
          return context.locale == ARABIC_LOCAL
              ? (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpRent?.zoneList ?? [],
                  id ?? 1,
                )?.arName)
              : (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpRent?.zoneList ?? [],
                  id ?? 1,
                )?.enName);
        default:
          return context.locale == ARABIC_LOCAL
              ? (getObjectByLookupKey(
                  context.read<LookupBloc>().lookupBrokerOv?.zoneList ?? [],
                  id ?? 4,
                )?.arName)
              : (getObjectByLookupKey(
                  context.read<LookupBloc>().lookupBrokerOv?.zoneList ?? [],
                  id ?? 4,
                )?.enName);
      }
    }
  }

  String? getPropertyTypeName(Indicators indicator, List<int> id) {
    String name = "";
    switch (indicator) {
      case Indicators.sell:
        if (id.first == -1) {
          name = context.locale == ARABIC_LOCAL ? "الكل" : "All";
        } else {
          for (var e in id) {
            name += context.locale == ARABIC_LOCAL
                ? (getObjectByLookupKey(
                      context.read<LookupBloc>().lookUpSell?.propertyTypeList ??
                          [],
                      e,
                    )?.arName) ??
                    ''
                : (getObjectByLookupKey(
                      context.read<LookupBloc>().lookUpSell?.propertyTypeList ??
                          [],
                      e,
                    )?.enName) ??
                    '';
            name += id.last != e ? ',' : '';
          }
        }
        return name;
      case Indicators.mortgage:
        if (id.first == -1) {
          name = context.locale == ARABIC_LOCAL ? "الكل" : "All";
        } else {
          for (var e in id) {
            name += context.locale == ARABIC_LOCAL
                ? (getObjectByLookupKey(
                      context
                              .read<LookupBloc>()
                              .lookUpMortgage
                              ?.propertyTypeList ??
                          [],
                      e,
                    )?.arName) ??
                    ''
                : (getObjectByLookupKey(
                      context
                              .read<LookupBloc>()
                              .lookUpMortgage
                              ?.propertyTypeList ??
                          [],
                      e,
                    )?.enName) ??
                    '';
            name += id.last != e ? ',' : '';
          }
        }
        return name;
      case Indicators.rental:
        if (id.first == -1) {
          name = context.locale == ARABIC_LOCAL ? "الكل" : "All";
        } else {
          for (var e in id) {
            name += context.locale == ARABIC_LOCAL
                ? (getObjectByLookupKey(
                      context.read<LookupBloc>().lookUpRent?.propertyTypeList ??
                          [],
                      e,
                    )?.arName) ??
                    ''
                : (getObjectByLookupKey(
                      context.read<LookupBloc>().lookUpRent?.propertyTypeList ??
                          [],
                      e,
                    )?.enName) ??
                    '';
            name += id.last != e ? ',' : '';
          }
        }
        return name;
      default:
        if (id.first == -1) {
          name = context.locale == ARABIC_LOCAL ? "الكل" : "All";
        } else {
          for (var e in id) {
            name += context.locale == ARABIC_LOCAL
                ? (getObjectByLookupKey(
                      context
                              .read<LookupBloc>()
                              .lookupBrokerOv
                              ?.propertyTypeList ??
                          [],
                      e,
                    )?.arName) ??
                    ''
                : (getObjectByLookupKey(
                      context
                              .read<LookupBloc>()
                              .lookupBrokerOv
                              ?.propertyTypeList ??
                          [],
                      e,
                    )?.enName) ??
                    '';
            name += id.last != e ? ',' : '';
          }
        }
        return name;
    }
  }

  String? getPropertyUsageName(Indicators indicator, List<int> id) {
    String name = "";
    switch (indicator) {
      case Indicators.sell:
        if (id.first == -1) {
          name = context.locale == ARABIC_LOCAL ? "الكل" : "All";
        } else {
          for (var e in id) {
            name += context.locale == ARABIC_LOCAL
                ? (getObjectByLookupKey(
                      context.read<LookupBloc>().lookUpSell?.rentPurposeList ??
                          [],
                      e,
                    )?.arName) ??
                    ''
                : (getObjectByLookupKey(
                      context.read<LookupBloc>().lookUpSell?.rentPurposeList ??
                          [],
                      e,
                    )?.enName) ??
                    '';
            name += id.last != e ? ',' : '';
          }
        }
        return name;
      case Indicators.mortgage:
        if (id.first == -1) {
          name = context.locale == ARABIC_LOCAL ? "الكل" : "All";
        } else {
          for (var e in id) {
            name += context.locale == ARABIC_LOCAL
                ? (getObjectByLookupKey(
                      context
                              .read<LookupBloc>()
                              .lookUpMortgage
                              ?.rentPurposeList ??
                          [],
                      e,
                    )?.arName) ??
                    ''
                : (getObjectByLookupKey(
                      context
                              .read<LookupBloc>()
                              .lookUpMortgage
                              ?.rentPurposeList ??
                          [],
                      e,
                    )?.enName) ??
                    '';
            name += id.last != e ? ',' : '';
          }
        }
        return name;
      case Indicators.rental:
        if (id.first == -1) {
          name = context.locale == ARABIC_LOCAL ? "الكل" : "All";
        } else {
          for (var e in id) {
            name += context.locale == ARABIC_LOCAL
                ? (getObjectByLookupKey(
                      context.read<LookupBloc>().lookUpRent?.rentPurposeList ??
                          [],
                      e,
                    )?.arName) ??
                    ''
                : (getObjectByLookupKey(
                      context.read<LookupBloc>().lookUpRent?.rentPurposeList ??
                          [],
                      e,
                    )?.enName) ??
                    '';
            name += id.last != e ? ',' : '';
          }
        }
        return name;
      default:
        if (id.first == -1) {
          name = context.locale == ARABIC_LOCAL ? "الكل" : "All";
        } else {
          for (var e in id) {
            name += context.locale == ARABIC_LOCAL
                ? (getObjectByLookupKey(
                      context
                              .read<LookupBloc>()
                              .lookupBrokerOv
                              ?.rentPurposeList ??
                          [],
                      e,
                    )?.arName) ??
                    ''
                : (getObjectByLookupKey(
                      context
                              .read<LookupBloc>()
                              .lookupBrokerOv
                              ?.rentPurposeList ??
                          [],
                      e,
                    )?.enName) ??
                    '';
            name += id.last != e ? ',' : '';
          }
        }
        return name;
    }
  }

  String? getBedRoomsCount(Indicators indicator, id) {
    switch (indicator) {
      case Indicators.sell:
        return context.locale == ARABIC_LOCAL
            ? (getObjectByLookupKey(
                context.read<LookupBloc>().lookUpSell?.rooms ?? [],
                id ?? 1,
              )?.arName)
            : (getObjectByLookupKey(
                context.read<LookupBloc>().lookUpSell?.rooms ?? [],
                id ?? 1,
              )?.enName);
      case Indicators.mortgage:
        return context.locale == ARABIC_LOCAL
            ? (getObjectByLookupKey(
                context.read<LookupBloc>().lookUpMortgage?.rooms ?? [],
                id ?? 1,
              )?.arName)
            : (getObjectByLookupKey(
                context.read<LookupBloc>().lookUpMortgage?.rooms ?? [],
                id ?? 1,
              )?.enName);
      case Indicators.rental:
        return context.locale == ARABIC_LOCAL
            ? (getObjectByLookupKey(
                context.read<LookupBloc>().lookUpRent?.rooms ?? [],
                id ?? 1,
              )?.arName)
            : (getObjectByLookupKey(
                context.read<LookupBloc>().lookUpRent?.rooms ?? [],
                id ?? 1,
              )?.enName);
      default:
        return context.locale == ARABIC_LOCAL
            ? (getObjectByLookupKey(
                context.read<LookupBloc>().lookUpRent?.rooms ?? [],
                id ?? 1,
              )?.arName)
            : (getObjectByLookupKey(
                context.read<LookupBloc>().lookUpRent?.rooms ?? [],
                id ?? 1,
              )?.enName);
    }
  }

  String? getDurationName(Indicators indicator, id) {
    if (id == -1) {
      return context.locale == ARABIC_LOCAL ? "الكل" : "All";
    } else {
      switch (indicator) {
        case Indicators.sell:
          return context.locale == ARABIC_LOCAL
              ? (getObjectById(
                  context.read<LookupBloc>().lookUpSell?.periodTime ?? [],
                  id ?? 1,
                )?.arName)
              : (getObjectById(
                  context.read<LookupBloc>().lookUpSell?.periodTime ?? [],
                  id ?? 1,
                )?.enName);
        case Indicators.mortgage:
          return context.locale == ARABIC_LOCAL
              ? (getObjectById(
                  context.read<LookupBloc>().lookUpMortgage?.periodTime ?? [],
                  id ?? 1,
                )?.arName)
              : (getObjectById(
                  context.read<LookupBloc>().lookUpMortgage?.periodTime ?? [],
                  id ?? 1,
                )?.enName);
        case Indicators.rental:
          return context.locale == ARABIC_LOCAL
              ? (getObjectById(
                  context.read<LookupBloc>().lookUpRent?.periodTime ?? [],
                  id ?? 1,
                )?.arName)
              : (getObjectById(
                  context.read<LookupBloc>().lookUpRent?.periodTime ?? [],
                  id ?? 1,
                )?.enName);
        default:
          return context.locale == ARABIC_LOCAL
              ? (getObjectById(
                  context.read<LookupBloc>().lookUpRent?.periodTime ?? [],
                  id ?? 1,
                )?.arName)
              : (getObjectById(
                  context.read<LookupBloc>().lookUpRent?.periodTime ?? [],
                  id ?? 1,
                )?.enName);
      }
    }
  }

  String? getHalfYearDurationName(Indicators indicator, id) {
    String name = "";
    if (id == -1) {
      return context.locale == ARABIC_LOCAL ? "الكل" : "All";
    } else {
      switch (indicator) {
        case Indicators.sell:
          context.read<LookupBloc>().lookUpSell?.halfYearList.map((e) {
            if ((e.value.first == 1 || e.value.last == 2) && id == 1) {
              name = context.locale == ARABIC_LOCAL ? e.name : e.enName;
            } else if ((e.value.first == 3 || e.value.last == 4) && id == 2) {
              name = context.locale == ARABIC_LOCAL ? e.name : e.enName;
            }
          }).toList();
          return name;
        case Indicators.mortgage:
          context.read<LookupBloc>().lookUpMortgage?.halfYearList.map((e) {
            if ((e.value.first == 1 || e.value.last == 2) && id == 1) {
              name = context.locale == ARABIC_LOCAL ? e.name : e.enName;
            } else if ((e.value.first == 3 || e.value.last == 4) && id == 2) {
              name = context.locale == ARABIC_LOCAL ? e.name : e.enName;
            }
          }).toList();
          return name;
        case Indicators.rental:
          context.read<LookupBloc>().lookUpRent?.halfYearList.map((e) {
            print(e);
            print(id);
            if ((e.value.first == 1 || e.value.last == 2) && id == 1) {
              name = context.locale == ARABIC_LOCAL ? e.name : e.enName;
            } else if ((e.value.first == 3 || e.value.last == 4) && id == 2) {
              name = context.locale == ARABIC_LOCAL ? e.name : e.enName;
            }
          }).toList();
          return name;
        default:
          context.read<LookupBloc>().lookUpSell?.halfYearList.map((e) {
            if (e.value.first == id) {
              name = context.locale == ARABIC_LOCAL ? e.name : e.enName;
            }
          }).toList();
          return name;
      }
    }
  }

  String? getQuarterYearDurationName(Indicators indicator, List<int> id) {
    String name = "";
    switch (indicator) {
      case Indicators.sell:
        if (id.first == -1) {
          name = context.locale == ARABIC_LOCAL ? "الكل" : "All";
        } else {
          for (var e in id) {
            context.read<LookupBloc>().lookUpSell?.quarterYearList.map((f) {
              if (f.value.first == e) {
                name += context.locale == ARABIC_LOCAL ? f.name : f.enName;
              }
            }).toList();
            name += id.last != e ? ',' : '';
          }
        }
        return name;
      case Indicators.mortgage:
        if (id.first == -1) {
          name = context.locale == ARABIC_LOCAL ? "الكل" : "All";
        } else {
          for (var e in id) {
            context.read<LookupBloc>().lookUpMortgage?.quarterYearList.map((f) {
              if (f.value.first == e) {
                name += context.locale == ARABIC_LOCAL ? f.name : f.enName;
              }
            }).toList();
            name += id.last != e ? ',' : '';
          }
        }
        return name;
      case Indicators.rental:
        if (id.first == -1) {
          name = context.locale == ARABIC_LOCAL ? "الكل" : "All";
        } else {
          for (var e in id) {
            context.read<LookupBloc>().lookUpRent?.quarterYearList.map((f) {
              if (f.value.first == e) {
                name += context.locale == ARABIC_LOCAL ? f.name : f.enName;
              }
            }).toList();
            name += id.last != e ? ',' : '';
          }
        }
        return name;
      default:
        if (id.first == -1) {
          name = context.locale == ARABIC_LOCAL ? "الكل" : "All";
        } else {
          for (var e in id) {
            context.read<LookupBloc>().lookUpRent?.quarterYearList.map((f) {
              if (f.value.first == e) {
                name += context.locale == ARABIC_LOCAL ? f.name : f.enName;
              }
            }).toList();
            name += id.last != e ? ',' : '';
          }
        }
        return name;
    }
  }

  String? getIssueDateYearName(Indicators indicator, id) {
    if (id == -1) {
      return context.locale == ARABIC_LOCAL ? "الكل" : "All";
    } else {
      switch (indicator) {
        case Indicators.sell:
          return context.locale == ARABIC_LOCAL
              ? (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpSell?.periodTime ?? [],
                  id ?? 1,
                )?.arName)
              : (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpSell?.periodTime ?? [],
                  id ?? 1,
                )?.enName);
        case Indicators.mortgage:
          return context.locale == ARABIC_LOCAL
              ? (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpMortgage?.periodTime ?? [],
                  id ?? 1,
                )?.arName)
              : (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpMortgage?.periodTime ?? [],
                  id ?? 1,
                )?.enName);
        case Indicators.rental:
          return context.locale == ARABIC_LOCAL
              ? (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpRent?.periodTime ?? [],
                  id ?? 1,
                )?.arName)
              : (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpRent?.periodTime ?? [],
                  id ?? 1,
                )?.enName);
        default:
          return context.locale == ARABIC_LOCAL
              ? (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpRent?.periodTime ?? [],
                  id ?? 1,
                )?.arName)
              : (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpRent?.periodTime ?? [],
                  id ?? 1,
                )?.enName);
      }
    }
  }

  String? getIssueMonthName(int id) {
    if (id == -1) {
      return context.locale == ARABIC_LOCAL ? "الكل" : "All";
    } else {
      List<PeriodTimeDetails> months = [];
      PeriodTimeDetails month = const PeriodTimeDetails();
      months = getAllMonthsInYear(context);
      months.map((e) {
        if (e.value.first == id) {
          return context.locale == ARABIC_LOCAL ? e.name : e.enName;
        } else {
          return "";
        }
      }).toList();
    }
  }

  String? getFurnitureStatusName(Indicators indicator, id) {
    if (id == -1) {
      return context.locale == ARABIC_LOCAL ? "الكل" : "All";
    } else {
      switch (indicator) {
        case Indicators.sell:
          return context.locale == ARABIC_LOCAL
              ? (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpSell?.furnitureStatusList ??
                      [],
                  id ?? 1,
                )?.arName)
              : (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpSell?.furnitureStatusList ??
                      [],
                  id ?? 1,
                )?.enName);
        case Indicators.mortgage:
          return context.locale == ARABIC_LOCAL
              ? (getObjectByLookupKey(
                  context
                          .read<LookupBloc>()
                          .lookUpMortgage
                          ?.furnitureStatusList ??
                      [],
                  id ?? 1,
                )?.arName)
              : (getObjectByLookupKey(
                  context
                          .read<LookupBloc>()
                          .lookUpMortgage
                          ?.furnitureStatusList ??
                      [],
                  id ?? 1,
                )?.enName);
        case Indicators.rental:
          return context.locale == ARABIC_LOCAL
              ? (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpRent?.furnitureStatusList ??
                      [],
                  id ?? 1,
                )?.arName)
              : (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpRent?.furnitureStatusList ??
                      [],
                  id ?? 1,
                )?.enName);
        default:
          return context.locale == ARABIC_LOCAL
              ? (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpRent?.furnitureStatusList ??
                      [],
                  id ?? 1,
                )?.arName)
              : (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpRent?.furnitureStatusList ??
                      [],
                  id ?? 1,
                )?.enName);
      }
    }
  }

  String? getNationalityName(Indicators indicator, id) {
    if (id == -1) {
      return context.locale == ARABIC_LOCAL ? "الكل" : "All";
    } else {
      switch (indicator) {
        case Indicators.sell:
          return context.locale == ARABIC_LOCAL
              ? (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpSell?.nationalityList ?? [],
                  id ?? 1,
                )?.arName)
              : (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpSell?.nationalityList ?? [],
                  id ?? 1,
                )?.enName);
        case Indicators.mortgage:
          return context.locale == ARABIC_LOCAL
              ? (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpMortgage?.nationalityList ??
                      [],
                  id ?? 1,
                )?.arName)
              : (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpMortgage?.nationalityList ??
                      [],
                  id ?? 1,
                )?.enName);
        case Indicators.rental:
          return context.locale == ARABIC_LOCAL
              ? (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpRent?.nationalityList ?? [],
                  id ?? 1,
                )?.arName)
              : (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpRent?.nationalityList ?? [],
                  id ?? 1,
                )?.enName);
        default:
          return context.locale == ARABIC_LOCAL
              ? (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpRent?.nationalityList ?? [],
                  id ?? 1,
                )?.arName)
              : (getObjectByLookupKey(
                  context.read<LookupBloc>().lookUpRent?.nationalityList ?? [],
                  id ?? 1,
                )?.enName);
      }
    }
  }
}

class FavFilterWidget extends StatelessWidget {
  final String label;
  final String value;
  const FavFilterWidget({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizeH.s6),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2.3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            TextFilterWidget(
              controller: TextEditingController(),
              enabled: false,
              hintText: value,
            ),
          ],
        ),
      ),
    );
  }
}
