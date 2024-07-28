import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../domain/models/rent_models/rent_models.dart';
import '../resources/resources.dart';

class SingleDropDowmSearchWidget<T> extends StatefulWidget {
  final List<T> list;
  final T? value;
  final Function(T?)? onChanged;

  const SingleDropDowmSearchWidget(
      {super.key, required this.list, this.value, this.onChanged});

  @override
  State<SingleDropDowmSearchWidget<T>> createState() =>
      _SingleDropDowmSearchWidgetState<T>();
}

class _SingleDropDowmSearchWidgetState<T>
    extends State<SingleDropDowmSearchWidget<T>> {
  final TextEditingController textEditingController = TextEditingController();

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
                        item is LookupModel
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
              color: Theme.of(context).canvasColor,
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
            // padding: EdgeInsets.symmetric(horizontal: AppSizeW.s16),
            height: AppSizeH.s36,
            // width: 140,
          ),
          // menuItemStyleData: MenuItemStyleData(
          //   height: AppSizeH.s40,
          //   padding: EdgeInsets.symmetric(vertical: AppSizeH.s4),
          // ),
          dropdownSearchData: DropdownSearchData(
            searchController: textEditingController,
            searchInnerWidgetHeight: AppSizeH.s50,
            searchInnerWidget: Container(
              // height: AppSizeH.s50,
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: AppSizeW.s11,
                vertical: AppSizeH.s11,
              ),
              child: TextFormField(
                // expands: true,
                maxLines: 1,
                minLines: 1,
                style: Theme.of(context).textTheme.labelSmall,
                controller: textEditingController,
                cursorColor: ColorManager.golden,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: AppSizeW.s8,
                    vertical: AppSizeH.s8,
                  ),
                  hintText: "${AppStrings().search}...",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: ColorManager.golden),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorManager.golden),
                    borderRadius: BorderRadius.circular(AppSizeR.s8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorManager.golden),
                    borderRadius: BorderRadius.circular(AppSizeR.s8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorManager.golden),
                    borderRadius: BorderRadius.circular(AppSizeR.s8),
                  ),
                ),
              ),
            ),
            searchMatchFn: (item, searchValue) {
              return item.value.toString().contains(searchValue);
            },
          ),
          onMenuStateChange: (isOpen) {
            if (!isOpen) {
              textEditingController.clear();
            }
          },
        ),
      ),
    );
  }
}
