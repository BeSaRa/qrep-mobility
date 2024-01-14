import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/resources.dart';
import '../../sell/blocs/sell_bloc/sell_bloc.dart';
import '../blocs/cubits/values_filters_cubit.dart';

class ChooseUnitWidget extends StatefulWidget {
  const ChooseUnitWidget({
    super.key,
  });

  @override
  State<ChooseUnitWidget> createState() => _ChooseUnitWidgetState();
}

class _ChooseUnitWidgetState extends State<ChooseUnitWidget> {
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
                    context.read<SellBloc>().setUnit(1);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: context.read<ValuesFiltersCubit>().unit == 1
                          ? ColorManager.golden
                          : Theme.of(context).canvasColor,
                      border: Border.all(width: 1, color: ColorManager.silver),
                      borderRadius: BorderRadius.circular(AppSizeR.s25),
                    ),
                    child: Text(
                      AppStrings().meter,
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
                    context.read<SellBloc>().setUnit(2);
                  },
                  borderRadius: BorderRadius.circular(AppSizeR.s25),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: context.read<ValuesFiltersCubit>().unit == 2
                          ? ColorManager.golden
                          : Theme.of(context).canvasColor,
                      border: Border.all(width: 1, color: ColorManager.silver),
                      borderRadius: BorderRadius.circular(AppSizeR.s25),
                    ),
                    child: Text(
                      AppStrings().foot,
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
