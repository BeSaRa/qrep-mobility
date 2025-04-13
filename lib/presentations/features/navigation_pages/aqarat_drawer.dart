import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart' as local;
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:go_router/go_router.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/app_preferences.dart';
import '../../../app/depndency_injection.dart';
import '../../resources/resources.dart';
import '../../widgets/widgets.dart';
import '../auth/blocs/login_bloc/login_bloc.dart';
import '../main/cubit/bottom_nav_cubit.dart';
import '../more/blocs/cubits/change_language_cubit.dart';
// import '../more/more_view.dart';

class AqaratDrawer extends StatefulWidget {
  const AqaratDrawer({super.key});

  @override
  State<AqaratDrawer> createState() => _AqaratDrawerState();
}

class _AqaratDrawerState extends State<AqaratDrawer> {
  final AppPreferences appPreferences = instance<AppPreferences>();
  late ChangeLanguageCubit changeLanguageCubit;
  late LoginBloc loginBloc;
  String guestId = "1FE57C12-22F3-4AF9-9DBE-C7EB9D5063D1";

  @override
  void initState() {
    loginBloc = instance<LoginBloc>();
    changeLanguageCubit = ChangeLanguageCubit(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: AppSizeR.s20,
        children: [
          const Spacer(),
          DrawerWidget(
            color: ColorManager.primary,
            icon: IconAssets.home,
            title: AppStrings().main,
            onTap: () {
              context.read<BottomNavCubit>().changePage(0);
              context.goNamed(context
                  .read<BottomNavCubit>()
                  .paths[context.read<BottomNavCubit>().state]);
            },
          ),
          DrawerWidget(
            color: ColorManager.grey,
            icon: IconAssets.user,
            title: AppStrings().manageUser,
            onTap: () {},
          ),
          DrawerWidget(
            color: ColorManager.grey,
            icon: IconAssets.menu,
            title: AppStrings().manageAccount,
            onTap: () {},
          ),
          DrawerWidget(
            color: ColorManager.cloudyGrey,
            icon: IconAssets.chat,
            title: AppStrings().faqs,
            onTap: () {
              context.pushNamed(RoutesNames.aboutTheAuthority,
                  pathParameters: {"pageName": "faqs"});
              // context.pushNamed(RoutesNames.faq);
            },
          ),
          DrawerWidget(
            color: ColorManager.cloudyGrey,
            icon: IconAssets.phoneCall,
            title: AppStrings().contactUs,
            onTap: () {
              context.pushNamed(RoutesNames.aboutTheAuthority,
                  pathParameters: {"pageName": "contactUs"});
            },
          ),
          DrawerWidget(
            color: ColorManager.cloudyGrey,
            icon: IconAssets.privacyPolicy,
            title: AppStrings().privacyPolicy,
            onTap: () {
                context.pushNamed(RoutesNames.aboutTheAuthority,
                  pathParameters: {"pageName": "privacyPolicy"});
            },
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizeH.s18),
            child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: AppSizeW.s10,
                  children: [
                    Icon(
                      Icons.login,
                      color: ColorManager.white,
                    ),
                    Text(AppStrings().login),
                  ],
                )),
          ),
          EblaTabBarWidget(
            initialIndex: context.locale == ARABIC_LOCAL ? 0 : 1,
            firstTab: Tab(
              text: 'عربي',
            ),
            secondTab: Tab(
              text: 'English',
            ),
            onPressed: (index) {
              changeLanguageCubit.save(index);
              if (changeLanguageCubit.state == 0) {
                appPreferences.setAppLanguage(lang: 'ar');
                context.setLocale(ARABIC_LOCAL);
              }
              if (changeLanguageCubit.state == 1) {
                appPreferences.setAppLanguage(lang: 'en');
                context.setLocale(ENGLISH_LOCAL);
              }
            },
          ),
          ThemeSwitcher.withTheme(builder: (context, switcher, theme) {
            return EblaTabBarWidget(
              initialIndex: instance<AppPreferences>().getTheme().brightness ==
                      Brightness.light
                  ? 0
                  : 1,
              firstTab: Tab(
                // text: '',
                // AppStrings().light,
                icon: Icon(CupertinoIcons.brightness),
              ),
              secondTab: Tab(
                // text: "",
                // AppStrings().dark,
                icon: Icon(CupertinoIcons.moon),
              ),
              onPressed: (index) {
                if (theme.brightness == Brightness.light && index == 1) {
                  ThemeData newTheme =
                      (theme.brightness == Brightness.light && index == 1)
                          ? darkTheme()
                          : lightTheme();
                  switcher.changeTheme(theme: newTheme);
                  instance<AppPreferences>().setTheme(themeData: newTheme);
                } else if (theme.brightness == Brightness.dark && index == 0) {
                  ThemeData newTheme =
                      (theme.brightness == Brightness.light && index == 1)
                          ? darkTheme()
                          : lightTheme();
                  switcher.changeTheme(theme: newTheme);
                  instance<AppPreferences>().setTheme(themeData: newTheme);
                }
              },
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AppSizeW.s12,
            children: [
              ImageIcon(
                AssetImage(IconAssets.twitter),
                color: ColorManager.primary,
                size: AppSizeW.s18,
              ),
              ImageIcon(
                AssetImage(IconAssets.video),
                color: ColorManager.primary,
                size: AppSizeW.s18,
              ),
              ImageIcon(
                AssetImage(IconAssets.linkedIN),
                color: ColorManager.primary,
                size: AppSizeW.s18,
              ),
              ImageIcon(
                AssetImage(IconAssets.instagram),
                color: ColorManager.primary,
                size: AppSizeW.s18,
              ),
              ImageIcon(
                AssetImage(IconAssets.facebook),
                color: ColorManager.primary,
                size: AppSizeW.s18,
              ),
            ],
          ),
          Text(
            "ver 1.0.3",
            style: Theme.of(context).textTheme.labelSmall,
          ),
          SizedBox(
            height: AppSizeH.s3,
          )
        ],
      ),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  final String title;
  final Color color;
  final String icon;
  final Function onTap;
  const DrawerWidget({
    super.key,
    required this.title,
    required this.color,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppSizeW.s8, vertical: AppSizeH.s2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: AppSizeW.s10,
              children: [
                ImageIcon(
                  AssetImage(icon),
                  color: color,
                ),
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontSize: AppSizeSp.s16, color: color),
                )
              ],
            ),
          ),
        ),
        Divider(
          color: ColorManager.porcelain,
          endIndent: AppSizeW.s5,
        ),
      ],
    );
  }
}
