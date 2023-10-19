import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:flutter/material.dart';

import '../../../resources/resources.dart';

class SelectedMunicipality extends StatefulWidget {
  final RentLookupModel model;
  const SelectedMunicipality({super.key, required this.model});

  @override
  State<SelectedMunicipality> createState() => _SelectedMunicipalityState();
}

class _SelectedMunicipalityState extends State<SelectedMunicipality> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
          alignment: AlignmentDirectional.centerStart,
          padding: EdgeInsets.symmetric(horizontal: AppSizeW.s12),
          height: AppSizeH.s38,
          width: AppSizeW.s100,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  offset: const Offset(1, 1),
                  spreadRadius: AppSizeR.s2,
                  blurRadius: AppSizeR.s11,
                  color: ColorManager.black.withAlpha(6))
            ],
            color: ColorManager.white,
            border: Border.all(style: BorderStyle.none),
            borderRadius: BorderRadius.circular(AppSizeR.s25),
          ),
          child: Text(
            widget.model.arName,
            style: Theme.of(context).textTheme.labelSmall,
          )),
    );
  }
}
