import 'package:ebla/presentations/features/real_estate_brokers/blocs/lookup_bloc/look_up_broker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/app_preferences.dart';
import '../../../../app/depndency_injection.dart';

import '../../../../domain/models/rent_models/rent_models.dart';
import '../../../../utils/global_functions.dart';
import '../../../resources/resources.dart';

import '../../../widgets/widgets.dart';

import '../../rent/blocs/cubits/values_filters_cubit.dart';

class BottomSheetFilterBrokerWidget extends StatefulWidget {
  final String brokerName;
  const BottomSheetFilterBrokerWidget({super.key, required this.brokerName});

  @override
  State<BottomSheetFilterBrokerWidget> createState() =>
      _BottomSheetFilterBrokerWidgetState();
}

class _BottomSheetFilterBrokerWidgetState
    extends State<BottomSheetFilterBrokerWidget> {
  late ValuesFiltersCubit valuesFiltersCubit;
  @override
  void initState() {
    valuesFiltersCubit = ValuesFiltersCubit(const LookupModel());

    List<LookupModel> listMunicipalityWithAll = [];
    List<LookupModel> oldMunicipalityList =
        context.read<LookUpBrokerBloc>().lookupBrokerOv?.municipalityList ?? [];

    if (!oldMunicipalityList.contains(const LookupModel(
        isActive: true,
        lookupKey: -1,
        arName: "الكل",
        enName: "All",
        id: -1,
        value: 0,
        selected: false,
        yoy: 0,
        hasPrice: false,
        municipalityId: 0))) {
      listMunicipalityWithAll.insert(
          0,
          const LookupModel(
              isActive: true,
              lookupKey: -1,
              arName: "الكل",
              enName: "All",
              id: -1,
              value: 0,
              selected: false,
              yoy: 0,
              hasPrice: false,
              municipalityId: 0));
    }
    listMunicipalityWithAll.addAll(
        context.read<LookUpBrokerBloc>().lookupBrokerOv?.municipalityList ??
            []);
    context.read<LookUpBrokerBloc>().lookupBrokerOv = context
        .read<LookUpBrokerBloc>()
        .lookupBrokerOv
        ?.copyWith(municipalityList: listMunicipalityWithAll);
    valuesFiltersCubit.municapility = getObjectByLookupKey(
          context.read<LookUpBrokerBloc>().lookupBrokerOv?.municipalityList ??
              [],
          context.read<LookUpBrokerBloc>().requestBroker.municipalityId ?? 4,
        ) ??
        const LookupModel();
    valuesFiltersCubit.brokerCategory = getObjectByLookupKey(
          context.read<LookUpBrokerBloc>().lookupBroker?.brokerCategoryList ??
              [],
          context.read<LookUpBrokerBloc>().requestBroker.brokerCategoryId ?? 2,
        ) ??
        const LookupModel();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                valuesFiltersCubit.municapility = getObjectByLookupKey(
                      context
                              .read<LookUpBrokerBloc>()
                              .lookupBrokerOv
                              ?.municipalityList ??
                          [],
                      -1,
                    ) ??
                    const LookupModel();
                valuesFiltersCubit.brokerCategory = getObjectByLookupKey(
                      context
                              .read<LookUpBrokerBloc>()
                              .lookupBroker
                              ?.brokerCategoryList ??
                          [],
                      2,
                    ) ??
                    const LookupModel();
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
        //Municipal
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
                          },
                          list: context
                                  .read<LookUpBrokerBloc>()
                                  .lookupBrokerOv
                                  ?.municipalityList ??
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
                children: [
                  Text(AppStrings().brokerageCompanyActivity,
                      style: Theme.of(context).textTheme.labelMedium),
                  // const SingleDropDownValue(),
                  BlocBuilder(
                    bloc: valuesFiltersCubit,
                    builder: (context, states) {
                      return SingleDropDownValue<LookupModel>(
                          value: valuesFiltersCubit.brokerCategory,
                          onChanged: (broker) {
                            valuesFiltersCubit.changeBrokerCategory(broker!);
                          },
                          list: context
                                  .read<LookUpBrokerBloc>()
                                  .lookupBroker
                                  ?.brokerCategoryList ??
                              []);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: AppSizeW.s30),
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
                      context.read<LookUpBrokerBloc>().requestBroker = context
                          .read<LookUpBrokerBloc>()
                          .requestBroker
                          .copyWith(
                            municipalityId:
                                valuesFiltersCubit.municapility.lookupKey,
                            brokerCategoryId:
                                valuesFiltersCubit.brokerCategory.lookupKey,
                          );
                      Navigator.of(context).pop(true);
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
        //         CriteriaObject criteria = CriteriaObject(
        //             municipalityId: valuesFiltersCubit.municapility.lookupKey,
        //             brokerCategoryId:
        //                 valuesFiltersCubit.brokerCategory.lookupKey,
        //             brokerName:
        //                 widget.brokerName.isEmpty ? null : widget.brokerName);
        //         var res = await showDialog(
        //             context: context,
        //             builder: (BuildContext ctxt) => Dialog(
        //                     child: CreateFavWidget(
        //                   criteria: criteria,
        //                   page: Indicators.broker,
        //                 )));
        //         if (res != null && res == true) {
        //           successToast(AppStrings().addFavouriteSuccess, context);
        //         }
        //       },
        //     ),
        //   ),
        // SizedBox(height: AppSizeW.s23),
      ],
    );
  }
}
