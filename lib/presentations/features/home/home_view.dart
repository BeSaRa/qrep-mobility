import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:ebla/presentations/features/rent/bloc/rent_bloc.dart';
import 'package:ebla/presentations/features/rent/widgets/rent_grid_item_widget.dart';
import 'package:ebla/presentations/resources/theme_manager.dart';
import 'package:ebla/presentations/widgets/growth_rate_widget.dart';
import 'package:ebla/presentations/widgets/staggered_grid_view.dart';
import 'package:ebla/presentations/widgets/bottom_sheet_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/app_preferences.dart';
import '../../../app/depndency_injection.dart';
import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/bottom_sheet_filter_widget.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/mutli_dropdown_widget.dart';
import '../../widgets/news_item_widgets.dart';
import '../../widgets/search_text_field_widget.dart';
import '../../widgets/statistics_rent_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, this.title = 'press'});
  final String title;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late RentBloc rentBloc;
  final _textController = TextEditingController();

  @override
  void initState() {
    rentBloc = instance<RentBloc>()..add(const RentEvent.getRentLookupEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              rentBloc.add(const RentEvent.getRentLookupEvent());
              // bottomSheetWidget(
              //   context,
              //   child: const BosttomSheetFilterWidget(),
              // );
            },
            icon: Icon(
              Icons.filter_list_rounded,
              size: 40,
              color: ColorManager.golden,
            ),
          ),
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
            Row(
              children: [
                Expanded(
                    child: SearchTextFieldWidget(controller: _textController)),
                const Expanded(flex: 2, child: SizedBox())
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: AppSizeH.s30,
                  ),
                  StatisticsRentWidget(statistics: [
                    StatisticsModel(title: 'فريج بن محمود', number: '820'),
                    StatisticsModel(title: 'المطار العتيق', number: '819'),
                    StatisticsModel(
                        title: 'القطيفية + القصار + عنيزة', number: '720'),
                    StatisticsModel(title: 'ام غو يلينه', number: '680'),
                    StatisticsModel(
                        title: 'المنصورة + فريج بن درهم', number: '540'),
                    StatisticsModel(
                        title:
                            'فريج بن عمران + فريج الهتمي الجديد + مدينة حمد الطبية',
                        number: '451'),
                  ]),
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
                        return RentGridItemWidget(index: index);
                      },
                    ),
                  ),
                  SizedBox(height: AppSizeH.s20),
                  Row(
                    children: [
                      const Expanded(child: GrowthRateWidget(index: 0)),
                      SizedBox(
                        width: AppSizeW.s20,
                      ),
                      const Expanded(child: GrowthRateWidget(index: 1)),
                    ],
                  ),
                  const NewsItemWidget(
                      date: '15 مارس 2023',
                      label:
                          'وزارة البلدية تطلق المرحلة الأولى من مشروع المنصة العقارية لدولة قطر'),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
