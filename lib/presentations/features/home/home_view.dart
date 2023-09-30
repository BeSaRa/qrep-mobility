import 'package:easy_localization/easy_localization.dart' as local;

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
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
            TextButton(
                onPressed: () async {},
                child: Text(
                  "press",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.tertiary),
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
    );
  }
}
