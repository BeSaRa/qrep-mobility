import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart' as local;
import 'package:ebla/presentations/features/more/cubits/change_language_cubit.dart';
import 'package:ebla/presentations/features/more/login_view.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/language_manager.dart';
import 'package:flutter/material.dart';

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
      appBar: const TitleAppBar(),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3.50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: AppSizeW.s80,
                  height: AppSizeW.s80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSizeH.s25),
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).shadowColor.withOpacity(0.7),
                          Theme.of(context).primaryColor,
                          Theme.of(context).primaryColor.withOpacity(0.8),
                        ],
                      )),
                  child: Center(
                    child: Text(
                      'G',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontSize: AppSizeSp.s18, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                Text(
                  'Guest',
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
          ),
          MoreWidgetButton(
            icon: Icons.remove_red_eye_outlined,
            title: AppStrings().watchList,
          ),
          MoreWidgetButton(
            icon: Icons.login,
            title: AppStrings().login,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog(context),
              );
            },
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
                        if (theme.brightness == Brightness.light &&
                            index == 1) {
                          ThemeData newTheme =
                              (theme.brightness == Brightness.light &&
                                      index == 1)
                                  ? darkTheme()
                                  : lightTheme();
                          switcher.changeTheme(theme: newTheme);
                          instance<AppPreferences>()
                              .setTheme(themeData: newTheme);
                        } else if (theme.brightness == Brightness.dark &&
                            index == 0) {
                          ThemeData newTheme =
                              (theme.brightness == Brightness.light &&
                                      index == 1)
                                  ? darkTheme()
                                  : lightTheme();
                          switcher.changeTheme(theme: newTheme);
                          instance<AppPreferences>()
                              .setTheme(themeData: newTheme);
                        }
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

  Widget _buildPopupDialog(BuildContext context) {
    return const Dialog(
      child: LoginView(),
    );
  }
}

class TitleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TitleAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      toolbarHeight: AppSizeH.s100,
      // Set this height
      flexibleSpace: Image(
        height: AppSizeH.s50,
        width: double.infinity,
        image: const AssetImage(
          ImageAssets.appbarBg,
        ),
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
                padding: EdgeInsets.symmetric(
                    horizontal: AppSizeW.s12, vertical: AppSizeH.s10),
                decoration: BoxDecoration(
                    color: ColorManager.mercury,
                    borderRadius: BorderRadius.circular(AppSizeW.s20)),
                child: Row(
                  children: [
                    Text(
                      AppStrings().support,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SizedBox(
                      width: AppSizeW.s2,
                    ),
                    SizedBox(
                      height: AppSizeW.s30,
                      width: AppSizeW.s30,
                      child: const Image(
                        image: AssetImage(
                          IconAssets.supportIcon,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, AppSizeH.s100);
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
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: AppSizeH.s20, vertical: AppSizeW.s6),
      child: InkWell(
        splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
        splashColor: ColorManager.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSizeR.s20),
        onTap: isButton
            ? () {
                onPressed!();
              }
            : null,
        child: Ink(
          height: AppSizeH.s56,
          padding:
              EdgeInsetsDirectional.only(start: AppSizeW.s19, end: AppSizeW.s7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizeR.s20),
            color: Colors.transparent,
            border: Border.all(
              width: AppSizeW.s2,
              // assign the color to the border color
              color: ColorManager.grey,
            ),
          ),
          child: Container(
            color: Colors.transparent,
            margin: EdgeInsets.symmetric(
                horizontal: AppSizeH.s20, vertical: AppSizeW.s6),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).primaryColor,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizeH.s6),
                  child: Text(title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: AppSizeSp.s16,
                          fontWeight: FontWeight.w400)),
                ),
                const Spacer(),
                isButton
                    ? Icon(
                        Icons.arrow_forward_ios,
                        color: ColorManager.grey,
                        size: AppSizeSp.s18,
                      )
                    : widget ?? const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
