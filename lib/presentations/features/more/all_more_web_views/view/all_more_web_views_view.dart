import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/app/constants.dart';
import 'package:ebla/presentations/features/more/all_more_web_views/blocs/all_more_web_views_bloc.dart';
import 'package:ebla/presentations/features/more/all_more_web_views/blocs/all_more_web_views_event.dart';
import 'package:ebla/presentations/features/more/all_more_web_views/blocs/all_more_web_views_state.dart';
import 'package:ebla/presentations/widgets/animated_pulse_logo.dart';
import 'package:ebla/presentations/widgets/error_widget.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class AllMoreWebViews extends StatelessWidget {
  const AllMoreWebViews({super.key, required this.pageName, this.aiSearchUrl});

  final String pageName;
  final String? aiSearchUrl;

  String _getInitUrl(BuildContext context, String pageName) {
    switch (pageName) {
      case "aboutTheAuthority":
        return context.locale == ENGLISH_LOCAL
            ? '${Constant.aqaratBaseUrl}/en/about-the-authority/'
            : '${Constant.aqaratBaseUrl}/%d9%86%d8%a8%d8%b0%d8%a9-%d8%b9%d9%86-%d8%a7%d9%84%d9%87%d9%8a%d8%a6%d8%a9/';
      case "visionAndMission":
        return context.locale == ENGLISH_LOCAL
            ? "${Constant.aqaratBaseUrl}/en/vision-and-mission/"
            : '${Constant.aqaratBaseUrl}/%d8%a7%d9%84%d8%b1%d8%a4%d9%8a%d8%a9-%d9%88%d8%a7%d9%84%d8%b1%d8%b3%d8%a7%d9%84%d8%a9/';
      case "tasksAndResponsibilitiesOftheAuthority":
        return context.locale == ENGLISH_LOCAL
            ? "${Constant.aqaratBaseUrl}/en/tasks-and-responsibilities-of-the-authority/"
            : '${Constant.aqaratBaseUrl}/%d9%85%d9%87%d8%a7%d9%85-%d9%88%d8%a7%d8%ae%d8%aa%d8%b5%d8%a7%d8%b5%d8%a7%d8%aa-%d8%a7%d9%84%d9%87%d9%8a%d8%a6%d8%a9/';
      case "contactUs":
        return context.locale == ENGLISH_LOCAL
            ? "${Constant.aqaratBaseUrl}/en/contact-us/"
            : '${Constant.aqaratBaseUrl}/%d8%aa%d9%88%d8%a7%d8%b5%d9%84-%d9%85%d8%b9%d9%86%d8%a7/';
      case "authorityNews":
        return context.locale == ENGLISH_LOCAL
            ? "${Constant.aqaratBaseUrl}/en/authority-news/"
            : '${Constant.aqaratBaseUrl}/%d8%a3%d8%ae%d8%a8%d8%a7%d8%b1-%d8%a7%d9%84%d9%87%d9%8a%d8%a6%d8%a9/';
      case "services":
        return context.locale == ENGLISH_LOCAL
            ? "${Constant.aqaratBaseUrl}/en/services/"
            : '${Constant.aqaratBaseUrl}/%d8%a7%d9%84%d8%ae%d8%af%d9%85%d8%a7%d8%aa/';
      case "faqs":
        return context.locale == ENGLISH_LOCAL
            ? "${Constant.aqaratBaseUrl}/en/faqs/"
            : '${Constant.aqaratBaseUrl}/الأسئلة-الشائعة/';
      case "privacyPolicy":
        return context.locale == ENGLISH_LOCAL
            ? "${Constant.aqaratBaseUrl}/en/privacy-policy/"
            : '${Constant.aqaratBaseUrl}/privacy-policy-ar/';
      case "realEstateCalendar":
        {
          return context.locale == ENGLISH_LOCAL
              ? "${Constant.aqaratBaseUrl}/en/real-estate-calendar/"
              // : 'https://www.aqarat.gov.qa/event/mipim/';
              // // : '${Constant.aqaratBaseUrl}/event/mipim/';
              // : 'https://www.aqarat.gov.qa/الأحداث/';
              : '${Constant.aqaratBaseUrl}/الأحداث/';
        }
      case "videoLibrary":
        return context.locale == ENGLISH_LOCAL
            ? "${Constant.aqaratBaseUrl}/en/video-library/"
            : '${Constant.aqaratBaseUrl}/مكتبة-الفيديو/';
      //this come from AI Search Page
      case "aiSearchUrl":
        return aiSearchUrl ?? "https://www.aqarat.gov.qa/";
      default:
        return context.locale == ENGLISH_LOCAL
            ? '${Constant.aqaratBaseUrl}/en/about-the-authority/'
            : '${Constant.aqaratBaseUrl}/%d9%86%d8%a8%d8%b0%d8%a9-%d8%b9%d9%86-%d8%a7%d9%84%d9%87%d9%8a%d8%a6%d8%a9/';
    }
  }

  @override
  Widget build(BuildContext context) {
    final url = _getInitUrl(context, pageName);
    return BlocProvider(
      create: (context) => AboutTheAuthorityBloc(WebViewController())
        ..add(InitializeAboutAuthWebView(url)),
      child: BlocBuilder<AboutTheAuthorityBloc, AboutTheAuthorityState>(
        builder: (context, state) {
          final bloc = context.read<AboutTheAuthorityBloc>();
          if (state is AboutTheAuthorityLoading) {
            return const AnimatedPulesLogo();
          } else if (state is AboutTheAuthorityError) {
            return Scaffold(
              appBar: _costumeAppBar(context),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizeW.s20),
                child: ErrorGlobalWidget(
                  message: state.message,
                  onPressed: () {
                    if (pageName == "realEstateCalendar" &&
                        bloc.state.urlHistory.length != 1) {
                      bloc.add(WebViewNavigationRequested(
                          bloc.state.urlHistory.last));
                    } else {
                      bloc.add(InitializeAboutAuthWebView(
                          _getInitUrl(context, pageName)));
                    }
                  },
                ),
              ),
            );
          } else {
            final isDarkMode = Theme.of(context).brightness == Brightness.dark;
            bloc.add(RunJavaScript(pageName, isDarkMode, context.locale));

            return Scaffold(
              appBar: _costumeAppBar(context),
              body: WebViewWidget(
                controller: bloc.controller,
              ),
            );
          }
        },
      ),
    );
  }

  AppBar _costumeAppBar(BuildContext context) {
    final bloc = context.read<AboutTheAuthorityBloc>();
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
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
          fit: BoxFit.fill,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              log("zak ${bloc.state.urlHistory.length}");
              if (pageName == "realEstateCalendar" &&
                  bloc.state.urlHistory.length != 1) {
                bloc.add(PopWebView());
              } else {
                Navigator.maybePop(context);
              }
            },
            // onTap: () {
            //   Navigator.maybePop(context);
            // },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.arrow_back,
                  color: ColorManager.cloudyGrey,
                ),
                SizedBox(width: AppSizeW.s5),
                Text(
                  (pageName == "realEstateCalendar" &&
                          bloc.state.urlHistory.length != 1)
                      ? AppStrings().back
                      : AppStrings().main,
                  // aiSearchUrl != null ? AppStrings().back : AppStrings().main,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          Text(
            _getPageTitle(pageName),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }

  // get the page title based on step number
  String _getPageTitle(String pageName) {
    switch (pageName) {
      case "aboutTheAuthority":
        return AppStrings().aboutTheAuthority;
      case "visionAndMission":
        return AppStrings().visionAndMission;
      case "tasksAndResponsibilitiesOftheAuthority":
        return AppStrings().tasksAndResponsibilitiesOftheAuthority;
      case "contactUs":
        return AppStrings().contactUs;
      case "authorityNews":
        return AppStrings().authorityNews;
      case "services":
        return AppStrings().services;
      case "aiSearchUrl":
        return AppStrings().aiSearch;
      case "faqs":
        return AppStrings().faqs;
      case "privacyPolicy":
        return AppStrings().privacyPolicy;
      case "realEstateCalendar":
        return AppStrings().calendar;
      case "videoLibrary":
        return AppStrings().video;
      default:
        return AppStrings().aboutTheAuthority;
    }
  }
}

//worked one in en
