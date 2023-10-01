import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart' as local;
import 'package:ebla/presentations/features/more/cubits/change_language_cubit.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/language_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/app_preferences.dart';
import '../../../app/depndency_injection.dart';
import '../../resources/strings_manager.dart';
import '../../resources/theme_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/ebla_tab_bar.dart';

class MoreView extends StatefulWidget {
  const MoreView({super.key});

  @override
  State<MoreView> createState() => _MoreViewState();
}

class _MoreViewState extends State<MoreView> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  late ChangeLanguageCubit changeLanguageCubit;

  @override
  void initState() {
    super.initState();
    changeLanguageCubit = ChangeLanguageCubit(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100, // Set this height
        flexibleSpace: SvgPicture.asset(
          ImageAssets.appbarBg,
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
        title: Column(
          children: [
            SizedBox(
              height: AppSizeH.s40,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: AppSizeH.s50,
                    child: Text(
                      AppStrings().moreTitle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: context.locale == ARABIC_LOCAL
                              ? AppSizeSp.s20
                              : AppSizeSp.s16),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Theme.of(context).disabledColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Text(
                        AppStrings().support,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: SvgPicture.asset(
                          IconAssets.supportIcon,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          MoreWidgetButton(
            icon: Icons.remove_red_eye_outlined,
            title: AppStrings().watchList,
          ),
          MoreWidgetButton(
            icon: Icons.login,
            title: AppStrings().login,
          ),
          ThemeSwitcher.withTheme(builder: (context, switcher, theme) {
            return MoreWidgetButton(
                icon: Icons.color_lens_outlined,
                title: AppStrings().theme,
                isButton: false,
                widget: Directionality(
                    textDirection: TextDirection.rtl,
                    child: EblaTabBarWidget(
                      initialIndex:
                          instance<AppPreferences>().getTheme().brightness ==
                                  Brightness.light
                              ? 0
                              : 1,
                      firstTab: AppStrings().light,
                      secondTab: AppStrings().dark,
                      onPressed: (index) {
                        ThemeData newTheme =
                            theme.brightness == Brightness.light
                                ? darkTheme()
                                : lightTheme();
                        switcher.changeTheme(theme: newTheme);
                        instance<AppPreferences>()
                            .setTheme(themeData: newTheme);
                      },
                    )));
          }),
          MoreWidgetButton(
            icon: Icons.language_outlined,
            title: AppStrings().language,
            isButton: false,
            widget: EblaTabBarWidget(
              initialIndex: context.locale == ARABIC_LOCAL ? 0 : 1,
              firstTab: 'عربي',
              secondTab: 'English',
              onPressed: (index) {
                changeLanguageCubit.save(index);
                if (changeLanguageCubit.state == 0) {
                  _appPreferences.setAppLanguage(lang: 'ar');
                  context.setLocale(ARABIC_LOCAL);
                }
                if (changeLanguageCubit.state == 1) {
                  _appPreferences.setAppLanguage(lang: 'en');
                  context.setLocale(ENGLISH_LOCAL);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MoreWidgetButton extends StatelessWidget {
  const MoreWidgetButton({
    super.key,
    required this.icon,
    required this.title,
    this.isButton = true,
    this.widget,
    this.onPressed,
  });

  final IconData icon;

  final String title;
  final bool isButton;
  final Widget? widget;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isButton
          ? () {
              onPressed!();
            }
          : null,
      child: Container(
        height: 56,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorManager.white,
          border: Border.all(
            width: 2.0,
            // assign the color to the border color
            color: ColorManager.grey,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400)),
            ),
            const Spacer(),
            isButton
                ? Icon(
                    Icons.arrow_forward_ios,
                    color: ColorManager.grey,
                    size: 18.sp,
                  )
                : widget ?? Container()
          ],
        ),
      ),
    );
  }
}
