import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:flutter/material.dart';

import '../resources/resources.dart';

class SelectedMunicipality extends StatefulWidget {
  final List<RentLookupModel> list;
  final RentLookupModel? value;
  final Function(RentLookupModel?)? onChanged;

  const SelectedMunicipality(
      {super.key, this.onChanged, this.value, required this.list});

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
                color: ColorManager.textBlack.withAlpha(6))
          ],
          color: Theme.of(context).cardTheme.color,
          border: Border.all(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(AppSizeR.s25),
        ),
        child: SingleDrowDown<RentLookupModel>(
            onChanged: widget.onChanged,
            value: widget.value,
            // getObjectById(
            //         context.read<RentBloc>().loockUpRent?.municipalityList ?? [],
            //         context.read<RentBloc>().requestMeanValue.municipalityId ??
            //             1) ??
            //     const RentLookupModel(),
            list: widget.list
            // context.read<RentBloc>().loockUpRent?.municipalityList ?? [],
            ),
      ),
    );
  }
}

class SingleDrowDown<T> extends StatefulWidget {
  final List<T> list;
  final T? value;
  final Function(T?)? onChanged;

  const SingleDrowDown(
      {super.key, required this.list, this.value, this.onChanged});

  @override
  State<SingleDrowDown<T>> createState() => _SingleDrowDownState<T>();
}

class _SingleDrowDownState<T> extends State<SingleDrowDown<T>> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        isExpanded: true,
        // isDense: true,
        hint: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizeW.s10),
          child: Text(
            AppStrings().selectItems,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
        items: widget.list
            .map((T item) => DropdownMenuItem<T>(
                  value: item,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizeW.s11),
                    child: Text(
                      item is RentLookupModel
                          ? context.locale == ARABIC_LOCAL
                              ? item.arName
                              : item.enName
                          : item is PeriodTimeDetails
                              ? context.locale == ARABIC_LOCAL
                                  ? item.name
                                  : item.enName
                              : '$item',
                      style: Theme.of(context).textTheme.labelSmall,
                      softWrap: true,
                    ),
                  ),
                ))
            .toList(),
        // value: selectedValue?.enName ?? '',
        value: widget.value,
        // onChanged: (T? value) {
        //   setState(() {
        //     // selectedValue?.copyWith(enName: value ?? '');
        //     selectedValue = value;
        //   });
        // },
        onChanged: widget.onChanged,
        dropdownStyleData: DropdownStyleData(
          maxHeight: AppSizeH.s200,
          width: double.infinity,
          useSafeArea: true,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizeR.s5),
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          // offset: const Offset(-20, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: Radius.circular(AppSizeR.s5),
            thickness: MaterialStateProperty.all(6),
            thumbVisibility: MaterialStateProperty.all(true),
          ),
        ),
        iconStyleData: IconStyleData(
            openMenuIcon: Icon(
              Icons.keyboard_arrow_up_rounded,
              color: ColorManager.cloudyGrey,
            ),
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: ColorManager.cloudyGrey,
            )),
        buttonStyleData: ButtonStyleData(
          // padding: EdgeInsets.symmetric(horizontal: AppSizeW.s16),
          height: AppSizeH.s36,
          // width: 140,
        ),
        menuItemStyleData: MenuItemStyleData(
          height: AppSizeH.s40,
          padding: EdgeInsets.symmetric(vertical: AppSizeH.s4),
        ),
      ),
    );
  }
}
