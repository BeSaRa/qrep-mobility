import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart' as local;
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

import '../../../app/app_preferences.dart';
import '../../../app/depndency_injection.dart';
import '../../resources/resources.dart';
import '../../widgets/widgets.dart';

import '../main/cubit/bottom_nav_cubit.dart';
import '../more/blocs/cubits/change_language_cubit.dart';

class AqaratDrawer extends StatefulWidget {
  const AqaratDrawer({super.key});

  @override
  State<AqaratDrawer> createState() => _AqaratDrawerState();
}

class _AqaratDrawerState extends State<AqaratDrawer> {
  final AppPreferences appPreferences = instance<AppPreferences>();
  late ChangeLanguageCubit changeLanguageCubit;

  String guestId = "1FE57C12-22F3-4AF9-9DBE-C7EB9D5063D1";

  @override
  void initState() {
    changeLanguageCubit = ChangeLanguageCubit(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 2,
      backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: AppSizeR.s20,
        children: [
          const Spacer(),
          DrawerWidget(
            color: Theme.of(context).colorScheme.primary,
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
            color: Theme.of(context).colorScheme.onTertiary,
            icon: IconAssets.user,
            title: AppStrings().manageUser,
            onTap: () {},
          ),
          DrawerWidget(
            color: Theme.of(context).colorScheme.onTertiary,
            icon: IconAssets.menu,
            title: AppStrings().manageAccount,
            onTap: () {},
          ),
          DrawerWidget(
            color: Theme.of(context).colorScheme.secondaryFixedDim,
            icon: IconAssets.chat,
            title: AppStrings().faqs,
            onTap: () {
              context.pushNamed(RoutesNames.aboutTheAuthority,
                  pathParameters: {"pageName": "faqs"});
              // context.pushNamed(RoutesNames.faq);
            },
          ),
          DrawerWidget(
            color: Theme.of(context).colorScheme.secondaryFixedDim,
            icon: IconAssets.phoneCall,
            title: AppStrings().contactUs,
            onTap: () {
              context.pushNamed(RoutesNames.aboutTheAuthority,
                  pathParameters: {"pageName": "contactUs"});
            },
          ),
          DrawerWidget(
            color: Theme.of(context).colorScheme.secondaryFixedDim,
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
                    Text(
                      AppStrings().login,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                )),
          ),
          EblaTabBarWidget(
            initialIndex: context.locale == ARABIC_LOCAL ? 0 : 1,
            firstTab: const Tab(
              text: 'عربي',
            ),
            secondTab: const Tab(
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
              firstTab: const Tab(
                // text: '',
                // AppStrings().light,
                icon: Icon(CupertinoIcons.brightness),
              ),
              secondTab: const Tab(
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
              GestureDetector(
                onTap: () {
                  _launchUrl("https://x.com/AqaratQa");
                },
                child: ImageIcon(
                  const AssetImage(IconAssets.twitter),
                  color: Theme.of(context).colorScheme.primary,
                  size: AppSizeW.s18,
                ),
              ),
              GestureDetector(
                onTap: () {
                  _launchUrl("https://www.youtube.com/@AqaratQa");
                },
                child: ImageIcon(
                  const AssetImage(IconAssets.video),
                  color: Theme.of(context).colorScheme.primary,
                  size: AppSizeW.s18,
                ),
              ),
              GestureDetector(
                onTap: () {
                  _launchUrl(
                      "https://www.linkedin.com/company/%D8%A7%D9%84%D9%87%D9%8A%D8%A6%D8%A9-%D8%A7%D9%84%D8%B9%D8%A7%D9%85%D8%A9-%D9%84%D8%AA%D9%86%D8%B8%D9%8A%D9%85-%D8%A7%D9%84%D9%82%D8%B7%D8%A7%D8%B9-%D8%A7%D9%84%D8%B9%D9%82%D8%A7%D8%B1%D9%8A-%D8%B9%D9%82%D8%A7%D8%B1%D8%A7%D8%AA/");
                },
                child: ImageIcon(
                  const AssetImage(IconAssets.linkedIN),
                  color: Theme.of(context).colorScheme.primary,
                  size: AppSizeW.s18,
                ),
              ),
              GestureDetector(
                onTap: () {
                  _launchUrl("https://www.instagram.com/aqaratq/reels/?__d=1");
                },
                child: ImageIcon(
                  const AssetImage(IconAssets.instagram),
                  color: Theme.of(context).colorScheme.primary,
                  size: AppSizeW.s18,
                ),
              ),
              GestureDetector(
                onTap: () {
                  _launchUrl("https://m.facebook.com/AqaratQa/");
                },
                child: ImageIcon(
                  const AssetImage(IconAssets.facebook),
                  color: Theme.of(context).colorScheme.primary,
                  size: AppSizeW.s18,
                ),
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

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
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
