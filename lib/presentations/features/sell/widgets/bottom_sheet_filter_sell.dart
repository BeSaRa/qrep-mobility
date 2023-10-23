import 'package:ebla/presentations/features/sell/blocs/sell_bloc/sell_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/models/rent_models/rent_models.dart';
import '../../../../utils/global_functions.dart';
import '../../../resources/resources.dart';
import '../../../widgets/widgets.dart';
import '../../rent/blocs/rent_bloc/cubits/cubit/values_filters_cubit.dart';

class BottomSheetFilterSellWidget extends StatefulWidget {
  const BottomSheetFilterSellWidget({super.key});

  @override
  State<BottomSheetFilterSellWidget> createState() =>
      _BottomSheetFilterSellWidgetState();
}

class _BottomSheetFilterSellWidgetState
    extends State<BottomSheetFilterSellWidget> {
  late ValuesFiltersCubit valuesFiltersCubit;
  @override
  void initState() {
    valuesFiltersCubit = ValuesFiltersCubit(const RentLookupModel());

    //municipal and areaCode
    valuesFiltersCubit.municapility = getObjectByLookupKey(
          context.read<SellBloc>().loockUpSell?.municipalityList ?? [],
          context.read<SellBloc>().requestSell.municipalityId ?? 1,
        ) ??
        const RentLookupModel();
    valuesFiltersCubit.zone = getObjectByLookupKey(
          context.read<SellBloc>().loockUpSell?.zoneList ?? [],
          context.read<SellBloc>().requestSell.zoneId ?? 0,
        ) ??
        const RentLookupModel();
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
                                      .read<SellBloc>()
                                      .loockUpSell
                                      ?.zoneList
                                      .first ??
                                  const RentLookupModel());
                            },
                            list: context
                                    .read<SellBloc>()
                                    .loockUpSell
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
                        return SingleDropDownValue<RentLookupModel>(
                            onChanged: (zone) {
                              valuesFiltersCubit.changeZone(zone!);
                            },
                            value: valuesFiltersCubit.zone,
                            list: filterDataBymunicipalityId(
                                valuesFiltersCubit.municapility.lookupKey,
                                context
                                        .read<SellBloc>()
                                        .loockUpSell
                                        ?.districtList ??
                                    []));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
