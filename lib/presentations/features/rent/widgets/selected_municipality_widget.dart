import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/global_functions.dart';
import '../../../resources/resources.dart';
import '../blocs/rent_bloc/rent_bloc.dart';

class SelectedMunicipality extends StatefulWidget {
  final RentLookupModel model;
  final Function(RentLookupModel?)? onChanged;

  const SelectedMunicipality({super.key, required this.model, this.onChanged});

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
        child: BlocBuilder(
            bloc: context.read<RentBloc>(),
            builder: (context, RentState state) {
              if (state.isLoadingRentLookup) {
                return const LinearProgressIndicator();
              }
              if (state.rentLookup != const RentLookupResponse()) {
                return SingleDrowDown<RentLookupModel>(
                    onChanged: widget.onChanged,
                    //  (municipal) {
                    //   context.read<RentBloc>().requestMeanValue = context
                    //       .read<RentBloc>()
                    //       .requestMeanValue
                    //       .copyWith(
                    //           municipalityId: municipal?.lookupKey, zoneId: -1);

                    //   setState(() {});
                    // },
                    value: getObjectById(
                            context
                                    .read<RentBloc>()
                                    .loockUpRent
                                    ?.municipalityList ??
                                [],
                            context
                                    .read<RentBloc>()
                                    .requestMeanValue
                                    .municipalityId ??
                                1) ??
                        const RentLookupModel(),
                    list: context
                            .read<RentBloc>()
                            .loockUpRent
                            ?.municipalityList ??
                        []);
                //       SingleDropDownValue<RentLookupModel>(
                // value: context
                //         .read<RentBloc>()
                //         .loockUpRent
                //         ?.municipalityList[0] ??
                //               const RentLookupModel(),
                //           onChanged: (municapility) {
                //             // valuesFiltersCubit.changeMunicapility(municapility!);
                //             // valuesFiltersCubit
                //             //     .changeZone(state.rentLookup.zoneList.first);
                //           },
                //           list: state.rentLookup.municipalityList);
                //     }
              }
              return const Text('Error');
            }),
        // Text(
        //   context.locale == ARABIC_LOCAL
        //       ? widget.model.arName
        //       : widget.model.enName,
        //   style: Theme.of(context).textTheme.labelSmall,
        // ),
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
    );
  }
}
