import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InvestorJourneyView extends StatefulWidget {
  const InvestorJourneyView({super.key, required this.stepNumber});
  final String stepNumber;

  @override
  _InvestorJourneyViewState createState() => _InvestorJourneyViewState();
}

class _InvestorJourneyViewState extends State<InvestorJourneyView> {
  late final WebViewController _controller;
  bool _isLoading = true;
  String _url = '';
  String _getUrl(String stepNumber) {
    switch (stepNumber) {
      case "0":
        return context.locale == ENGLISH_LOCAL
            ? 'https://ministry.v2202305135856227727.ultrasrv.de/en/investors-journey/'
            : 'https://ministry.v2202305135856227727.ultrasrv.de/%D8%B1%D8%AD%D9%84%D8%A9-%D8%A7%D9%84%D9%85%D8%B3%D8%AA%D8%AB%D9%85%D8%B1/';
      case "1":
        return context.locale == ENGLISH_LOCAL
            ? "https://ministry.v2202305135856227727.ultrasrv.de/en/real-estate-developers/?lang=en"
            : 'https://ministry.v2202305135856227727.ultrasrv.de/%d8%a7%d9%84%d9%85%d8%b7%d9%88%d8%b1%d9%8a%d9%86-%d8%a7%d9%84%d8%b9%d9%82%d8%a7%d8%b1%d9%8a%d9%8a%d9%86/';
      case "2":
        return context.locale == ENGLISH_LOCAL
            ? "https://www.aqarat.gov.qa/en/professionals/?lang=en"
            : 'https://ministry.v2202305135856227727.ultrasrv.de/%d9%85%d8%b2%d8%a7%d9%88%d9%84%d9%8a-%d8%a7%d9%84%d9%85%d9%87%d9%86%d8%a9-3/';
      default:
        return context.locale == ENGLISH_LOCAL
            ? 'https://ministry.v2202305135856227727.ultrasrv.de/en/investors-journey/'
            : 'https://ministry.v2202305135856227727.ultrasrv.de/%D8%B1%D8%AD%D9%84%D8%A9-%D8%A7%D9%84%D9%85%D8%B3%D8%AA%D8%AB%D9%85%D8%B1/';
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _url = _getUrl(widget.stepNumber);
    _initializeWebView();
  }

  void _initializeWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            _isLoading = true;
          });
        },
        onPageFinished: (url) {
          setState(() {
            _isLoading = false;
          });
          _injectCustomJavaScript();
        },
      ))
      ..loadRequest(Uri.parse(_url));
  }

  void _injectCustomJavaScript() async {
    const String webviewsURL = "assets/webviews";

    // dark mode CSS if the theme is dark
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    if (isDarkMode) {
      final String darkModeCss =
          await rootBundle.loadString('$webviewsURL/webviews_dark_styles.js');

      if (mounted) {
        await _controller.runJavaScript(darkModeCss);
      }
    }
//===========================Start Investor Journey=====================
    if (widget.stepNumber == "0") {
      final String investorJsCode =
          await rootBundle.loadString('$webviewsURL/investor_journey.js');
      _controller.runJavaScript(investorJsCode);
    }
//===========================End Investor Journey=====================
//===========================Start Property Developer=================
    else if (widget.stepNumber == "1") {
      final String propertyDeveloperJsCode =
          await rootBundle.loadString('$webviewsURL/property_developer.js');
      _controller.runJavaScript(propertyDeveloperJsCode);
    }
//===========================End Property Developer===================
//===========================Start Professionals======================
    else {
      final String professionalsJsCode =
          await rootBundle.loadString('$webviewsURL/professionals.js');
      _controller.runJavaScript(professionalsJsCode);
    }
//===========================End Professionals===================
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _costumeAppBar(context),
        body: Stack(
          children: [
            WebViewWidget(controller: _controller),
            if (_isLoading)
              Center(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Theme.of(context).scaffoldBackgroundColor
                      : ColorManager.white,
                ),
              ),
            if (_isLoading) const Center(child: CircularProgressIndicator()),
          ],
        ),
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
          Text(
            _getPageTitle(widget.stepNumber),
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
