import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../domain/models/rent_models/rent_models.dart';
import '../resources/resources.dart';

class MultiDropDownValue<T> extends StatefulWidget {
  final List<T> list;
  final List<T> selectedItems;

  const MultiDropDownValue({
    super.key,
    required this.list,
    required this.selectedItems,
  });

  @override
  State<MultiDropDownValue<T>> createState() => _MultiDropDownValue<T>();
}

class _MultiDropDownValue<T> extends State<MultiDropDownValue<T>> {
  // List<T> selectedItems = [];

  T? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: AppSizeH.s36,
      decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(AppSizeR.s5),
          border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.onTertiaryContainer)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<T>(
          isExpanded: true,
          isDense: true,
          hint: Text(
            widget.selectedItems.map((e) {
              return e is PeriodTimeDetails
                  ? context.locale == ARABIC_LOCAL
                      ? e.name
                      : e.enName
                  : e;
            }).join(','),
            style: Theme.of(context).textTheme.labelSmall,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          ),
          items: widget.list.map((T item) {
            return DropdownMenuItem(
              value: item,
              //disable default onTap to avoid closing menu when selecting an item
              enabled: false,
              child: StatefulBuilder(
                builder: (context, menuSetState) {
                  final isSelected = widget.selectedItems.contains(item);
                  return InkWell(
                    onTap: () {
                      isSelected
                          ? widget.selectedItems.length == 1
                              ? null
                              : widget.selectedItems.remove(item)
                          : widget.selectedItems.add(item);
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
                              item is PeriodTimeDetails
                                  ? context.locale == ARABIC_LOCAL
                                      ? item.name
                                      : item.enName
                                  : '$item',
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
          // value: selectedValue,
          onChanged: (T? value) {},
          dropdownStyleData: DropdownStyleData(
            maxHeight: AppSizeH.s200,
            width: double.infinity,
            useSafeArea: true,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizeR.s5),
              color: Theme.of(context).cardTheme.color,
            ),
            // offset: const Offset(-20, 0),
            scrollbarTheme: ScrollbarThemeData(
              radius: Radius.circular(AppSizeR.s5),
              thickness: WidgetStateProperty.all(6),
              thumbVisibility: WidgetStateProperty.all(true),
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
