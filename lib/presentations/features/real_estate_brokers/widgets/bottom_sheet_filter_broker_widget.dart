import 'package:ebla/presentations/features/real_estate_brokers/blocs/lookup_bloc/look_up_broker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/models/models.dart';
import '../../../../utils/global_functions.dart';
import '../../../resources/resources.dart';
import '../../../widgets/widgets.dart';
import '../../rent/blocs/rent_bloc/cubits/cubit/values_filters_cubit.dart';

class BottomSheetFilterBrokerWidget extends StatefulWidget {
  const BottomSheetFilterBrokerWidget({super.key});

  @override
  State<BottomSheetFilterBrokerWidget> createState() =>
      _BottomSheetFilterBrokerWidgetState();
}

class _BottomSheetFilterBrokerWidgetState
    extends State<BottomSheetFilterBrokerWidget> {
  late ValuesFiltersCubit valuesFiltersCubit;

  @override
  void initState() {
    valuesFiltersCubit = ValuesFiltersCubit(const RentLookupModel());
    valuesFiltersCubit.municapility = getObjectByLookupKey(
          context.read<LookUpBrokerBloc>().lookupBroker?.municipalityList ?? [],
          context.read<LookUpBrokerBloc>().requestBroker.municipalityId ?? 4,
        ) ??
        const RentLookupModel();
    valuesFiltersCubit.brokerCategory = getObjectByLookupKey(
          context.read<LookUpBrokerBloc>().lookupBroker?.brokerCategoryList ??
              [],
          context.read<LookUpBrokerBloc>().requestBroker.brokerCategoryId ?? 2,
        ) ??
        const RentLookupModel();

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
              onTap: () {},
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
                      return SingleDropDownValue<RentLookupModel>(
                          value: valuesFiltersCubit.municapility,
                          onChanged: (municapility) {
                            valuesFiltersCubit
                                .changeMunicapility(municapility!);
                          },
                          list: context
                                  .read<LookUpBrokerBloc>()
                                  .lookupBroker
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
                      return SingleDropDownValue<RentLookupModel>(
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
        Row(children: [
          BlocBuilder(
            bloc: valuesFiltersCubit,
            builder: (context, state) {
              return Expanded(
                child: CustomElevatedButton(
                  isPrimary: true,
                  title: AppStrings().search,
                  onPress: () {
                    context.read<LookUpBrokerBloc>().requestBroker =
                        context.read<LookUpBrokerBloc>().requestBroker.copyWith(
                              municipalityId: valuesFiltersCubit
                                  .municapility.municipalityId,
                              brokerCategoryId:
                                  valuesFiltersCubit.brokerCategory.id,
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
            ),
          ),
        ]),
        SizedBox(height: AppSizeW.s23),
      ],
    );
  }
}
