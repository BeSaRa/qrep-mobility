import 'package:easy_localization/easy_localization.dart' as local;

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/theme_manager.dart';
import 'package:ebla/presentations/widgets/range_slider_widget.dart';

import 'package:ebla/presentations/widgets/staggered_grid_view.dart';

import 'package:flutter/material.dart';

import '../../../app/app_preferences.dart';
import '../../../app/depndency_injection.dart';
import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/main_data_container.dart';
import '../../widgets/single_dropdown_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, this.title = 'press'});
  final String title;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // bool _switchValue = false;
  //todo: this should be removed once we have real data from api
  List<GridItemData> gridItemsData = const [
    GridItemData(
        title: "إجمالي عدد  \nعقود الإيجار",
        value: "983",
        imagePath: 'imagePath',
        valueUnit: ''),
    GridItemData(
        title: "إجمالي عدد الوحدات \n العقارات المستأجرة \\",
        value: "983",
        imagePath: 'imagePath',
        valueUnit: ''),
    GridItemData(
        title: "متوسط قيمة الإيجار\n لكل وحدة \\ عقار",
        value: "5,790",
        imagePath: "imagePath",
        valueUnit: 'ر.ق'),
    GridItemData(
        title: "إجمالي قيمة عقود\n الإيجار",
        value: "716,104",
        imagePath: "imagePath",
        valueUnit: 'ر.ق'),
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizeW.s15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: AppSizeH.s24,
              ),
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
                      Text('البلدية',
                          style: Theme.of(context).textTheme.labelMedium),
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
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const SingleDropDownValue(),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizeH.s60),
              Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      isPrimary: false,
                      title: 'إلغاء',
                      onPress: () {},
                    ),
                  ),
                  SizedBox(width: AppSizeW.s8),
                  Expanded(
                    child: CustomElevatedButton(
                      isPrimary: true,
                      title: 'بحث',
                      onPress: () {},
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GridItemData {
  final String title;
  final String value;
  final String imagePath;
  final String valueUnit;

  const GridItemData(
      {required this.title,
      required this.value,
      required this.imagePath,
      required this.valueUnit});
}
