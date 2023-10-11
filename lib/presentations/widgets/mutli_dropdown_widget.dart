import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../domain/models/rent_models/rent_models.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class MultiDropDownValue extends StatefulWidget {
  final List<RentLookupModel> list;
  const MultiDropDownValue({super.key, required this.list});

  @override
  State<MultiDropDownValue> createState() => _MultiDropDownValue();
}

class _MultiDropDownValue extends State<MultiDropDownValue> {
  List<RentLookupModel> selectedItems = [];
  // final List<String> items = [
  //   'Item1',
  //   'Item2',
  //   'Item3',
  //   'Item4',
  //   'Item5',
  //   'Item6',
  //   'Item7',
  //   'Item8',
  //   'Item9',
  //   'Item00',
  //   'Item89',
  //   'Item678',
  //   'Item123',
  //   'Item32',
  //   '43',
  //   'dfasdqwe',
  //   'qwe',
  //   'Itemasd8',
  //   'zxc',
  //   'Itemxcvsd00Itemxcvsd00Itemxcvsd00',
  //   'asdq',
  //   'zxcqawe',
  // ];
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
            selectedItems.isEmpty
                ? "All"
                : '${selectedItems.map((e) => e.arName)}',
            style: Theme.of(context).textTheme.labelSmall,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          ),
          items: widget.list.map((RentLookupModel item) {
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
                      padding: EdgeInsets.symmetric(horizontal: AppSizeW.s11),
                      child: Row(
                        children: [
                          if (isSelected)
                            const Icon(Icons.check_box_outlined)
                          else
                            const Icon(Icons.check_box_outline_blank),
                          SizedBox(width: AppSizeW.s11),
                          Expanded(
                            child: Text(
                              item.arName,
                              style: Theme.of(context).textTheme.labelSmall,
                              softWrap: true,
                              // overflow: TextOverflow.ellipsis,
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
          onChanged: (RentLookupModel? value) {
            setState(() {
              selectedValue = value;
            });
          },
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
            padding: EdgeInsets.symmetric(horizontal: AppSizeW.s16),
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
