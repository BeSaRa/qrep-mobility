import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, this.title = 'press'});
  final String title;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizeW.s15),
            child: Column(
              children: [
                TextButton(
                    onPressed: () async {},
                    child: Text(
                      "press",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary),
                    )),
                const MainDataContainer(
                  title: 'سعر البيع',
                  totalPrice: '4,032,530',
                  value: '1530',
                  valueDescription: 'سعر القدم المربع',
                  titleInfo: 'الحالة:',
                  valueInfo: 'مباع',
                  location: 'الدوحة',
                  descripton: '2 Beds Apartment',
                ),
                const SizedBox(
                  height: 20,
                ),
                const MainDataContainer(
                  title: 'قيمة الايجار',
                  totalPrice: '5,000',
                  value: '3200',
                  valueDescription: 'المساحة',
                  titleInfo: 'عدد الغرف: ',
                  valueInfo: '3',
                  location: 'الدوحة',
                  // descripton: '2 Beds Apartment',
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'البلدية',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: AppSizeSp.s16,
                              color: ColorManager.black),
                        ),
                        const SingleDropDownValue(),
                      ],
                    )),
                    SizedBox(width: AppSizeW.s8),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'البلدية',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: AppSizeSp.s16,
                              color: ColorManager.black),
                        ),
                        const SingleDropDownValue(),
                      ],
                    )),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class SingleDropDownValue extends StatefulWidget {
  const SingleDropDownValue({super.key});

  @override
  State<SingleDropDownValue> createState() => _SingleDropDownValue();
}

class _SingleDropDownValue extends State<SingleDropDownValue> {
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        // height: AppSizeH.s36,
        decoration: BoxDecoration(
            color: Hex16Color.fromHex('#F4F4F4'),
            borderRadius: BorderRadius.circular(AppSizeR.s5),
            border: Border.all(width: 1, color: Hex16Color.fromHex('#C1C1C1'))),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            isDense: true,
            hint: Text(
              'Select Item',
              style: TextStyle(
                fontSize: AppSizeSp.s14,
                color: Theme.of(context).hintColor,
              ),
            ),
            items: items
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: AppSizeSp.s14,
                        ),
                      ),
                    ))
                .toList(),
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
                color: Hex16Color.fromHex('#F4F4F4'),
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
      ),
    );
  }
}

class MainDataContainer extends StatelessWidget {
  final String title;
  final String totalPrice;
  final String value;
  final String valueDescription;
  final String titleInfo;
  final String valueInfo;
  final String location;
  final String? descripton;

  const MainDataContainer({
    super.key,
    required this.title,
    required this.totalPrice,
    required this.value,
    required this.valueDescription,
    required this.titleInfo,
    required this.valueInfo,
    required this.location,
    this.descripton,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppSizeH.s12),
        decoration: BoxDecoration(
          color: ColorManager.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(1, 1),
                spreadRadius: AppSizeR.s2,
                blurRadius: AppSizeR.s11,
                color: ColorManager.black.withAlpha(6))
          ],
          borderRadius: BorderRadius.circular(AppSizeR.s12),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizeW.s14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: AppSizeSp.s13,
                        color: Hex16Color.fromHex('#A29475')),
                  ),
                  Text(
                    totalPrice,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: AppSizeSp.s23,
                        color: ColorManager.primary),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSizeH.s20),
            Padding(
              padding: EdgeInsetsDirectional.only(start: AppSizeW.s15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        value,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: AppSizeSp.s23,
                            color: ColorManager.black),
                      ),
                      SizedBox(width: AppSizeW.s4),
                      Text(
                        valueDescription,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: AppSizeSp.s13,
                            color: Hex16Color.fromHex('#A29475')),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Hex16Color.fromHex('#FFE5FE'),
                        borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(AppSizeR.s5),
                            bottomStart: Radius.circular(AppSizeR.s5))),
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSizeW.s25, vertical: AppSizeH.s5),
                    child: Row(
                      children: [
                        Text(
                          titleInfo,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: AppSizeSp.s13,
                              color: ColorManager.black),
                        ),
                        Text(
                          valueInfo,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: AppSizeSp.s13,
                              color: ColorManager.black),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: AppSizeH.s12),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  start: AppSizeW.s15, end: AppSizeW.s24),
              child: Divider(
                color: Hex16Color.fromHex('#E1E1E1'),
                height: AppSizeH.s1,
              ),
            ),
            SizedBox(height: AppSizeH.s7),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizeW.s15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: ColorManager.primary,
                          size: AppSizeH.s16,
                        ),
                        Text(
                          location,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: AppSizeSp.s13,
                              color: Hex16Color.fromHex('#A29475')),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: AppSizeW.s1,
                    height: AppSizeH.s15,
                    color: Hex16Color.fromHex('#E1E1E1'),
                  ),
                  Expanded(
                    child: Text(
                      descripton ?? "",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: AppSizeSp.s13,
                          color: Hex16Color.fromHex('#A29475')),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
