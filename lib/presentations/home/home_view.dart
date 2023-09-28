import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ebla/presentations/widgets/bottom_sheet_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app/app_preferences.dart';
import '../../app/depndency_injection.dart';
import '../resources/color_manager.dart';
import '../resources/theme_manager.dart';
import '../resources/values_manager.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/main_data_container.dart';
import '../widgets/single_dropdown_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, this.title = 'press'});
  final String title;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
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
                        onPress: () {
                          bottomSheetWidget(
                            context,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text('البلدية',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium),
                                            const SingleDropDownValue(),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: AppSizeW.s8),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              'المنطقة',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium,
                                            ),
                                            const SingleDropDownValue(),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: AppSizeH.s12),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text('نوع العقار',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium),
                                            const SingleDropDownValue(),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: AppSizeW.s8),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              'استخدام العقار',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium,
                                            ),
                                            const SingleDropDownValue(),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: AppSizeH.s12),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text('عدد الغرف',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium),
                                            const SingleDropDownValue(),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: AppSizeW.s8),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              'المدة الزمنية',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium,
                                            ),
                                            const SingleDropDownValue(),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: AppSizeH.s12),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text('تفاصيل المدة الزمنية',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium),
                                            const SingleDropDownValue(),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: AppSizeW.s8),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium,
                                            ),
                                            const SingleDropDownValue(),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: AppSizeH.s12),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'وحدة القياس',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                      SizedBox(height: AppSizeH.s5),
                                      const ChooseUnitWidget(),
                                    ],
                                  ),
                                  SizedBox(height: AppSizeH.s12),
                                  Row(children: [
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
                                    )
                                  ]),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const ChooseUnitWidget()
              ],
            ),
          ),
        ));
  }
}

class ChooseUnitWidget extends StatefulWidget {
  const ChooseUnitWidget({
    super.key,
  });

  @override
  State<ChooseUnitWidget> createState() => _ChooseUnitWidgetState();
}

class _ChooseUnitWidgetState extends State<ChooseUnitWidget> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizeH.s36,
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(AppSizeR.s25),
              onTap: () {
                setState(() {
                  index = 1;
                });
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: index == 1
                      ? ColorManager.golden
                      : ColorManager.whiteSmoke,
                  border: Border.all(width: 1, color: ColorManager.silver),
                  borderRadius: BorderRadius.circular(AppSizeR.s25),
                ),
                child: Text(
                  'متر',
                  style: index == 1
                      ? Theme.of(context).textTheme.displaySmall
                      : Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
          SizedBox(width: AppSizeW.s8),
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  index = 2;
                });
              },
              borderRadius: BorderRadius.circular(AppSizeR.s25),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: index == 2
                      ? ColorManager.golden
                      : ColorManager.whiteSmoke,
                  border: Border.all(width: 1, color: ColorManager.silver),
                  borderRadius: BorderRadius.circular(AppSizeR.s25),
                ),
                child: Text(
                  'قدم',
                  style: index == 2
                      ? Theme.of(context).textTheme.displaySmall
                      : Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontWeight: FontWeight.w400),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
