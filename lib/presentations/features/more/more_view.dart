// ignore_for_file: use_build_context_synchronously

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart' as local;
import 'package:ebla/app/constants.dart';
import 'package:ebla/presentations/features/more/blocs/cubits/change_language_cubit.dart';
import 'package:ebla/presentations/features/auth/views/login_view.dart';
import 'package:ebla/presentations/features/more/blocs/user_bloc/user_bloc.dart';
import 'package:ebla/presentations/features/more/widgets/more_view_shimmer.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/language_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/app_preferences.dart';
import '../../../app/depndency_injection.dart';
import '../../resources/strings_manager.dart';
import '../../resources/theme_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/ebla_tab_bar.dart';
import '../../widgets/widgets.dart';
import '../auth/blocs/login_bloc/login_bloc.dart';
import '../main/blocs/lookup_bloc/lookup_bloc.dart';
import 'widgets/dialog_signout.dart';

class MoreView extends StatefulWidget {
  const MoreView({super.key});

  @override
  State<MoreView> createState() => _MoreViewState();
}

class _MoreViewState extends State<MoreView> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  late ChangeLanguageCubit changeLanguageCubit;
  late LoginBloc loginBloc;
  String guestId = "1FE57C12-22F3-4AF9-9DBE-C7EB9D5063D1";

  @override
  void initState() {
    super.initState();
    loginBloc = instance<LoginBloc>();
    changeLanguageCubit = ChangeLanguageCubit(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleAppBar(),
      body: BlocBuilder(
        bloc: context.read<UserBloc>(),
        builder: (context, UserState state) {
          return state.map(
            loading: (value) {
              return const MoreViewShimmer();
            },
            loaded: (value) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3.50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: AppSizeW.s65,
                            height: AppSizeW.s65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppSizeH.s25),
                              gradient: LinearGradient(
                                colors: [
                                  Theme.of(context)
                                      .shadowColor
                                      .withOpacity(0.7),
                                  Theme.of(context).primaryColor,
                                  Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.8),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                context.read<UserBloc>().user?.id == guestId
                                    ? "G"
                                    : context
                                            .read<UserBloc>()
                                            .user
                                            ?.firstName[0] ??
                                        "G",
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(
                                        fontSize: AppSizeSp.s18,
                                        fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                          Text(
                            context.read<UserBloc>().user?.id == guestId
                                ? "Guest"
                                : context.read<UserBloc>().user?.firstName ??
                                    "Guest",
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ),
                    MoreWidgetButton(
                      icon: Icons.remove_red_eye_outlined,
                      title: AppStrings().watchList,
                      onPressed: () {},
                    ),
                    BlocBuilder(
                      bloc: loginBloc,
                      builder: (context, LoginState state) {
                        return MoreWidgetButton(
                          icon: context.read<UserBloc>().user?.id == guestId
                              ? Icons.login
                              : Icons.person,
                          title: context.read<UserBloc>().user?.id == guestId
                              ? AppStrings().login
                              : context.read<UserBloc>().user != null
                                  ? context.read<UserBloc>().user!.firstName
                                  : AppStrings().login,
                          onPressed: context.read<UserBloc>().user?.id ==
                                  guestId
                              ? () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext ctxt) =>
                                        MultiBlocProvider(
                                      providers: [
                                        BlocProvider.value(value: loginBloc),
                                        BlocProvider.value(
                                            value: context.read<UserBloc>())
                                      ],
                                      child: _buildPopupDialog(context),
                                    ),
                                  );
                                }
                              : null,
                        );
                      },
                    ),
                    ThemeSwitcher.withTheme(
                        builder: (context, switcher, theme) {
                      return MoreWidgetButton(
                          icon: Icons.color_lens_outlined,
                          title: AppStrings().theme,
                          isButton: false,
                          widget: Directionality(
                              textDirection: TextDirection.rtl,
                              child: EblaTabBarWidget(
                                initialIndex: instance<AppPreferences>()
                                            .getTheme()
                                            .brightness ==
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
                                  } else if (theme.brightness ==
                                          Brightness.dark &&
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
                    context.read<UserBloc>().user?.id == guestId
                        ? const SizedBox()
                        : GestureDetector(
                            onTap: () async {
                              var res = await showDialog(
                                context: context,
                                builder: (BuildContext ctxt) =>
                                    MultiBlocProvider(
                                        providers: [
                                      BlocProvider.value(value: loginBloc),
                                      BlocProvider.value(
                                          value: context.read<UserBloc>())
                                    ],
                                        child: const Dialog(
                                          child: DialogsignOut(),
                                        )),
                              );
                              if (res != null && res) {
                                await instance<AppPreferences>()
                                    .setUserToken(Constant.guestToken);
                                await instance<AppPreferences>()
                                    .setUserRefreshToken("");
                                await resetAllModules();
                                context
                                    .read<LookupBloc>()
                                    .add(const LookupEvent.initilaEvent());
                                context
                                    .read<UserBloc>()
                                    .add(const UserEvent.initialUser());
                                context
                                    .read<UserBloc>()
                                    .add(const UserEvent.getUserInfo());
                              }
                            },
                            child: const MoreWidgetButton(
                              isButton: false,
                              icon: Icons.logout,
                              title: "تسجيل الخروج",
                            ),
                          ),
                  ],
                ),
              );
            },
            error: (value) {
              return ErrorGlobalWidget(
                message: value.message,
                onPressed: () {
                  context.read<UserBloc>().add(const UserEvent.getUserInfo());
                },
              );
            },
          );
        },
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
      flexibleSpace: ShaderMask(
        shaderCallback: (rect) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.transparent],
          ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
        },
        blendMode: BlendMode.dstIn,
        child: Image.asset(
          ImageAssets.appbarBg,
          // height: 400,

          fit: BoxFit.fill,
        ),
      ),
      // Image(
      //   height: AppSizeH.s50,
      //   width: double.infinity,
      //   image: const AssetImage(
      //     ImageAssets.appbarBg,
      //   ),
      //   fit: BoxFit.cover,
      // ),
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
                  child: Center(
                    child: Text(
                      AppStrings().moreTitle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: AppSizeW.s50,
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
  // TODO: implement preferredSize
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
    return InkWell(
      onTap: isButton
          ? () {
              onPressed!();
            }
          : null,
      child: Container(
        height: AppSizeH.s56,
        padding:
            EdgeInsetsDirectional.only(start: AppSizeW.s19, end: AppSizeW.s7),
        margin: EdgeInsets.symmetric(
            horizontal: AppSizeH.s20, vertical: AppSizeW.s6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizeR.s20),
          color: ColorManager.white,
          border: Border.all(
            width: AppSizeW.s2,
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
              padding: EdgeInsets.symmetric(horizontal: AppSizeH.s6),
              child: Text(title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: AppSizeSp.s16, fontWeight: FontWeight.w400)),
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
    );
  }
}
