import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../domain/models/rent_models/rent_models.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class SingleDropDownValue extends StatefulWidget {
  final List<RentLookupModel> list;
  const SingleDropDownValue({super.key, required this.list});

  @override
  State<SingleDropDownValue> createState() => _SingleDropDownValue();
}

class _SingleDropDownValue extends State<SingleDropDownValue> {
  RentLookupModel? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: AppSizeH.s36,
      decoration: BoxDecoration(
          color: ColorManager.whiteSmoke,
          borderRadius: BorderRadius.circular(AppSizeR.s5),
          border: Border.all(width: 1, color: ColorManager.silver)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<RentLookupModel>(
          isExpanded: true,
          isDense: true,
          hint: Text(
            'Select Item',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          items: widget.list
              .map((RentLookupModel item) => DropdownMenuItem<RentLookupModel>(
                    value: item,
                    child: Text(
                      item.arName,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ))
              .toList(),
          // value: selectedValue?.enName ?? '',
          value: selectedValue,
          onChanged: (RentLookupModel? value) {
            setState(() {
              // selectedValue?.copyWith(enName: value ?? '');
              selectedValue = value;
            });
          },
          dropdownStyleData: DropdownStyleData(
            maxHeight: AppSizeH.s200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizeR.s5),
              color: ColorManager.whiteSmoke,
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
                color: ColorManager.primary,
              ),
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: ColorManager.primary,
              )),
          buttonStyleData: ButtonStyleData(
            // padding: EdgeInsets.symmetric(horizontal: AppSizeW.s16),
            height: AppSizeH.s36,
            // width: 140,
          ),
          menuItemStyleData: MenuItemStyleData(
            height: AppSizeH.s40,
          ),
        ),
      ),
    );
  }
}
