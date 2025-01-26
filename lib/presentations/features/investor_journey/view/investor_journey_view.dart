import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/presentations/features/investor_journey/blocs/investor_journey_bloc.dart';
import 'package:ebla/presentations/features/investor_journey/blocs/investor_journey_state.dart';
import 'package:ebla/presentations/widgets/animated_pulse_logo.dart';
import 'package:ebla/presentations/widgets/error_widget.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../blocs/investor_journey_event.dart';

class InvestorJourneyView extends StatelessWidget {
  const InvestorJourneyView({super.key, required this.stepNumber});

  final String stepNumber;
  String _getInitUrl(BuildContext context, String stepNumber) {
    switch (stepNumber) {
      case "0":
        return context.locale == ENGLISH_LOCAL
            ? 'https://www.aqarat.gov.qa/en/investors-journey/'
            : 'https://www.aqarat.gov.qa/%D8%B1%D8%AD%D9%84%D8%A9-%D8%A7%D9%84%D9%85%D8%B3%D8%AA%D8%AB%D9%85%D8%B1/';
      case "1":
        return context.locale == ENGLISH_LOCAL
            ? "https://www.aqarat.gov.qa/en/real-estate-developers/?lang=en"
            : 'https://www.aqarat.gov.qa/%d8%a7%d9%84%d9%85%d8%b7%d9%88%d8%b1%d9%8a%d9%86-%d8%a7%d9%84%d8%b9%d9%82%d8%a7%d8%b1%d9%8a%d9%8a%d9%86/';
      case "2":
        return context.locale == ENGLISH_LOCAL
            ? "https://www.aqarat.gov.qa/en/professionals/?lang=en"
            : 'https://www.aqarat.gov.qa/%d9%85%d8%b2%d8%a7%d9%88%d9%84%d9%8a-%d8%a7%d9%84%d9%85%d9%87%d9%86%d8%a9-3/';
      default:
        return context.locale == ENGLISH_LOCAL
            ? 'https://www.aqarat.gov.qa/en/investors-journey/'
            : 'https://www.aqarat.gov.qa/%D8%B1%D8%AD%D9%84%D8%A9-%D8%A7%D9%84%D9%85%D8%B3%D8%AA%D8%AB%D9%85%D8%B1/';
    }
  }

  @override
  Widget build(BuildContext context) {
    final url = _getInitUrl(context, stepNumber);
    return BlocProvider(
      create: (context) =>
          InvestorJourneyBloc(WebViewController())..add(InitializeWebView(url)),
      child: BlocBuilder<InvestorJourneyBloc, InvestorJourneyState>(
        builder: (context, state) {
          final bloc = context.read<InvestorJourneyBloc>();
          if (state is InvestorJourneyLoaded) {
            final isDarkMode = Theme.of(context).brightness == Brightness.dark;
            bloc.add(RunJavaScript(stepNumber, isDarkMode, context.locale));
          }
          if (state is InvestorJourneyLoading) {
            return const AnimatedPulesLogo();
          } else if (state is InvestorJourneyError) {
            return ErrorGlobalWidget(
              message: state.message,
              onPressed: () {
                bloc.add(InitializeWebView(_getInitUrl(context, stepNumber)));
              },
            );
          } else {
            return Scaffold(
              appBar: _costumeAppBar(context),
              body: WebViewWidget(controller: bloc.controller),
            );
          }
        },
      ),
    );
  }

  AppBar _costumeAppBar(BuildContext context) {
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
              Navigator.maybePop(context);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizeW.s10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: ColorManager.cloudyGrey,
                  ),
                  SizedBox(width: AppSizeW.s5),
                  Text(
                    AppStrings().main,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
          ),
          Text(
            _getPageTitle(stepNumber),
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ],
      ),
    );
  }

  // get the page title based on step number
  String _getPageTitle(String stepNumber) {
    switch (stepNumber) {
      case "0":
        return AppStrings().investorJourney;
      case "1":
        return AppStrings().propertyDevelopers;
      case "2":
        return AppStrings().professionPracticers;
      default:
        return AppStrings().investorJourney;
    }
  }
}
