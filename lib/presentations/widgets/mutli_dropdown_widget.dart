import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class MultiDropDownValue extends StatefulWidget {
  const MultiDropDownValue({super.key});

  @override
  State<MultiDropDownValue> createState() => _MultiDropDownValue();
}

class _MultiDropDownValue extends State<MultiDropDownValue> {
  List<String> selectedItems = [];
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
    'Item9',
    'Item00',
    'Item89',
    'Item678',
    'Item123',
    'Item32',
    '43',
    'dfasdqwe',
    'qwe',
    'Itemasd8',
    'zxc',
    'Itemxcvsd00',
    'asdq',
    'zxcqawe',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: AppSizeH.s36,
      decoration: BoxDecoration(
          color: ColorManager.whiteSmoke,
          borderRadius: BorderRadius.circular(AppSizeR.s5),
          border: Border.all(width: 1, color: ColorManager.silver)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          isDense: true,
          hint: Text(
            'Select Item',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          items: items.map((String item) {
            return DropdownMenuItem(
              value: item,
              //disable default onTap to avoid closing menu when selecting an item
              enabled: false,
              child: StatefulBuilder(
                builder: (context, menuSetState) {
                  final isSelected = selectedItems.contains(item);
                  return InkWell(
                    onTap: () {
                      isSelected
                          ? selectedItems.remove(item)
                          : selectedItems.add(item);
                      //This rebuilds the StatefulWidget to update the button's text
                      setState(() {});
                      //This rebuilds the dropdownMenu Widget to update the check mark
                      menuSetState(() {});
                    },
                    child: Container(
                      height: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          if (isSelected)
                            const Icon(Icons.check_box_outlined)
                          else
                            const Icon(Icons.check_box_outline_blank),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              item,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }).toList(),
          value: selectedValue,
          onChanged: (String? value) {
            setState(() {
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
            padding: EdgeInsets.symmetric(horizontal: AppSizeW.s16),
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