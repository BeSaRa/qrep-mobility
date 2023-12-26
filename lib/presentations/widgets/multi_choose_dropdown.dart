import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/presentations/features/rent/blocs/cubits/values_filters_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../resources/resources.dart';

class MultiChooseDropDownWidget extends StatefulWidget {
  final List<RentLookupModel> list;
  final List<RentLookupModel> selectedItems;

  // final RentLookupModel? selectedValue;
  final bool? isPurpose;

  const MultiChooseDropDownWidget({
    super.key,
    required this.list,
    required this.selectedItems,
    // this.selectedValue,
    this.isPurpose,
  });

  @override
  State<MultiChooseDropDownWidget> createState() =>
      _MultiChooseDropDownWidgetState();
}

class _MultiChooseDropDownWidgetState extends State<MultiChooseDropDownWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext ctxt) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(AppSizeR.s5),
          border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.onTertiaryContainer)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<RentLookupModel>(
          isExpanded: true,
          isDense: true,
          hint: BlocBuilder(
            bloc: context.read<ValuesFiltersCubit>(),
            builder: (ctxt, state) {
              return widget.isPurpose ?? false
                  ? Text(
                      context
                          .read<ValuesFiltersCubit>()
                          .rentPurposeList
                          .map((e) {
                        return context.locale == ARABIC_LOCAL
                            ? e.arName
                            : e.enName;
                      }).join(','),
                      style: Theme.of(ctxt).textTheme.labelSmall,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    )
                  : Text(
                      context
                          .read<ValuesFiltersCubit>()
                          .propertyTypeList
                          .map((e) {
                        return context.locale == ARABIC_LOCAL
                            ? e.arName
                            : e.enName;
                      }).join(','),
                      style: Theme.of(ctxt).textTheme.labelSmall,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    );
            },
          ),
          items: widget.list.map((RentLookupModel item) {
            return DropdownMenuItem(
              value: item,
              enabled: false,
              child: BlocBuilder(
                bloc: context.read<ValuesFiltersCubit>(),
                builder: (ctxt, state) {
                  return InkWell(
                    onTap: widget.isPurpose ?? false
                        ? item.lookupKey == -1
                            ? () {
                                context
                                    .read<ValuesFiltersCubit>()
                                    .rentPurposeList
                                    .clear();
                                context
                                    .read<ValuesFiltersCubit>()
                                    .addToPurposeList(item);
                              }
                            : () {
                                context
                                    .read<ValuesFiltersCubit>()
                                    .rentPurposeList
                                    .removeWhere(
                                        (element) => element.lookupKey == -1);
                                if (context
                                    .read<ValuesFiltersCubit>()
                                    .rentPurposeList
                                    .contains(item)) {
                                  context
                                      .read<ValuesFiltersCubit>()
                                      .removeFromPurposeList(item);
                                } else {
                                  context
                                      .read<ValuesFiltersCubit>()
                                      .addToPurposeList(item);
                                }
                              }
                        : item.lookupKey == -1
                            ? () {
                                context
                                    .read<ValuesFiltersCubit>()
                                    .propertyTypeList
                                    .clear();
                                context
                                    .read<ValuesFiltersCubit>()
                                    .addToPropertyList(item);
                              }
                            : () {
                                context
                                    .read<ValuesFiltersCubit>()
                                    .propertyTypeList
                                    .removeWhere(
                                        (element) => element.lookupKey == -1);
                                if (context
                                    .read<ValuesFiltersCubit>()
                                    .propertyTypeList
                                    .contains(item)) {
                                  context
                                      .read<ValuesFiltersCubit>()
                                      .removeFromPropertyList(item);
                                } else {
                                  context
                                      .read<ValuesFiltersCubit>()
                                      .addToPropertyList(item);
                                }
                              },
                    child: Container(
                      height: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: AppSizeW.s11),
                      child: widget.isPurpose ?? false
                          ? Row(
                              children: [
                                if (context
                                    .read<ValuesFiltersCubit>()
                                    .rentPurposeList
                                    .contains(item))
                                  const Icon(Icons.check_box_outlined)
                                else
                                  const Icon(
                                    Icons.check_box_outline_blank,
                                  ),
                                SizedBox(width: AppSizeW.s11),
                                Expanded(
                                  child: Text(
                                    context.locale == ARABIC_LOCAL
                                        ? item.arName
                                        : item.enName,
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                    softWrap: true,
                                    // overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                if (context
                                    .read<ValuesFiltersCubit>()
                                    .propertyTypeList
                                    .contains(item))
                                  const Icon(Icons.check_box_outlined)
                                else
                                  const Icon(
                                    Icons.check_box_outline_blank,
                                  ),
                                SizedBox(width: AppSizeW.s11),
                                Expanded(
                                  child: Text(
                                    context.locale == ARABIC_LOCAL
                                        ? item.arName
                                        : item.enName,
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
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
          onChanged: (RentLookupModel? value) {},
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
