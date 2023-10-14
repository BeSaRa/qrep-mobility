import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../domain/models/rent_models/rent_models.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class SingleDropDownValue<T> extends StatefulWidget {
  final List<T> list;
  final T? value;
  final Function(T?)? onChanged;

  const SingleDropDownValue(
      {super.key, required this.list, this.value, this.onChanged});

  @override
  State<SingleDropDownValue<T>> createState() => _SingleDropDownValue<T>();
}

class _SingleDropDownValue<T> extends State<SingleDropDownValue<T>> {
  // T? selectedValue;

  @override
  void initState() {
    // selectedValue = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: AppSizeH.s36,
      decoration: BoxDecoration(
          color: ColorManager.whiteSmoke,
          borderRadius: BorderRadius.circular(AppSizeR.s5),
          border: Border.all(width: 1, color: ColorManager.silver)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<T>(
          isExpanded: true,
          // isDense: true,
          hint: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizeW.s10),
            child: Text(
              'Select Item',
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
                            ? item.arName
                            : item is PeriodTimeDetails
                                ? item.name
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
            maxHeight: AppSizeH.s200, width: double.infinity, useSafeArea: true,

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
            padding: EdgeInsets.symmetric(vertical: AppSizeH.s4),
          ),
        ),
      ),
    );
  }
}
