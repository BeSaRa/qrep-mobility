import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/presentations/features/rent/blocs/rent_bloc/rent_bloc.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChosenPeriodWidget extends StatefulWidget {
  final int id;
  final String arName;
  final String enName;

  const ChosenPeriodWidget({super.key,
    required this.id,
    required this.arName,
    required this.enName});

  @override
  State<ChosenPeriodWidget> createState() => _ChosenPeriodWidgetState();
}

class _ChosenPeriodWidgetState extends State<ChosenPeriodWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: AppSizeW.s9),
        padding: EdgeInsets.symmetric(horizontal: AppSizeW.s6),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: context
              .read<RentBloc>()
              .requestMeanValue
              .periodId == widget.id
              ? ColorManager.golden
              : ColorManager.whiteSmoke,
          border: Border.all(width: 1, color: ColorManager.silver),
          borderRadius: BorderRadius.circular(AppSizeR.s25),
        ),
        child: FittedBox(
          child: Text(
            context.locale == ARABIC_LOCAL ? widget.arName : widget.enName,
            style: context
                .read<RentBloc>()
                .requestMeanValue
                .periodId == widget.id
                ? Theme
                .of(context)
                .textTheme
                .displaySmall
                : Theme
                .of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
