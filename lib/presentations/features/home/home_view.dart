import 'package:easy_localization/easy_localization.dart' as local;

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/theme_manager.dart';
import 'package:ebla/presentations/widgets/range_slider_widget.dart';

import 'package:ebla/presentations/widgets/staggered_grid_view.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ebla/presentations/widgets/bottom_sheet_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../app/app_preferences.dart';
import '../../../app/depndency_injection.dart';
import '../../resources/color_manager.dart';
import '../../resources/theme_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/bottom_sheet_filter_widget.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/main_data_container.dart';
import '../../widgets/mutli_dropdown_widget.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          ThemeSwitcher.withTheme(
            builder: (context, switcher, theme) {
              return CupertinoSwitch(
                value: theme.isDarkTheme,
                trackColor: ColorManager.whiteSmoke,
                onChanged: (value) {
                  ThemeData newTheme = theme.brightness == Brightness.light
                      ? darkTheme()
                      : lightTheme();
                  switcher.changeTheme(theme: newTheme);
                  instance<AppPreferences>().setTheme(themeData: newTheme);
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizeW.s15),
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: IconButton(
                onPressed: () {
                  bottomSheetWidget(
                    context,
                    child: const BosttomSheetFilterWidget(),
                  );
                },
                icon: Icon(
                  Icons.filter_list_rounded,
                  size: 40,
                  color: ColorManager.golden,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  TextButton(
                      onPressed: () async {},
                      child: Text(
                        "press",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary),
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizeW.s16),
                    child: StaggeredGridView(
                      // for development only: UniqueKey forces the rebuild of the widget on hot reload
                      key: UniqueKey(),
                      itemsCount: 4,
                      rightSectionTopPadding: AppSizeH.s17,
                      mainAxisSpacing: AppSizeH.s22,
                      crossAxisSpacing: AppSizeW.s23,
                      gridItemChildBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(AppSizeR.s20)),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(1, 1),
                                  spreadRadius: AppSizeR.s2,
                                  blurRadius: AppSizeR.s11,
                                  color: ColorManager.black.withAlpha(30)),
                            ],
                            gradient: LinearGradient(
                              colors: [
                                ColorManager.platinum,
                                ColorManager.white,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: const [0.2, 1.0],
                            ),
                          ),
                          child: Column(children: [
                            SizedBox(height: AppSizeH.s16),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(gridItemsData[index].title,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: AppSizeSp.s13,
                                          fontWeight: FontWeight.w700)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AppSizeH.s14,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width: AppSizeW.s28),
                                Flexible(
                                  child: Wrap(
                                    alignment: WrapAlignment.center,
                                    children: [
                                      FittedBox(
                                        child: Text(
                                          gridItemsData[index].value,
                                          style: TextStyle(
                                              fontSize: AppSizeSp.s18,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Text(
                                        gridItemsData[index].valueUnit,
                                        style: TextStyle(
                                            fontSize: AppSizeSp.s18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Image.asset(
                                    matchTextDirection:
                                        Directionality.of(context) ==
                                            TextDirection.ltr,
                                    ImageAssets.soldOrRentedUnits,
                                    height: AppSizeH.s65,
                                    width: AppSizeW.s65,
                                  ),
                                ),
                              ],
                            )
                          ]),
                        );
                      },
                    ),
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
                  SizedBox(height: AppSizeH.s60),
                  Row(
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          isPrimary: true,
                          title: 'بحث',
                          onPress: () {
                            bottomSheetWidget(
                              context,
                              child: const BosttomSheetFilterWidget(),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: AppSizeW.s8),
                      Expanded(
                        child: CustomElevatedButton(
                          isPrimary: false,
                          title: 'إلغاء',
                          onPress: () {},
                        ),
                      ),
                    ],
                  ),
                  const MultiDropDownValue(),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('data'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
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
