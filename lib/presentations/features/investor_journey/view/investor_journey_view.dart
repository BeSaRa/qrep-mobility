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
  String _getUrl(String stepNumber) {
    switch (stepNumber) {
      case "0":
        return 'https://ministry.v2202305135856227727.ultrasrv.de/%D8%B1%D8%AD%D9%84%D8%A9-%D8%A7%D9%84%D9%85%D8%B3%D8%AA%D8%AB%D9%85%D8%B1/';
      case "1":
        return 'property developer URL';
      case "2":
        return 'profession practicers URL';
      default:
        return 'https://ministry.v2202305135856227727.ultrasrv.de/%D8%B1%D8%AD%D9%84%D8%A9-%D8%A7%D9%84%D9%85%D8%B3%D8%AA%D8%AB%D9%85%D8%B1/';
    }
  }

  @override
  void initState() {
    super.initState();
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
      ..loadRequest(Uri.parse(_getUrl(widget.stepNumber)));
  }

  void _injectCustomJavaScript() async {
    const String webviewsURL = "assets/webviews";
    // Load JS file content as a string
    final String jsCode =
        await rootBundle.loadString('$webviewsURL/investor_journey.js');
    _controller.runJavaScript(jsCode);

    // dark mode CSS if the theme is dark
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    if (isDarkMode) {
      final String darkModeCss = await rootBundle
          .loadString('$webviewsURL/investor_journey_dark_styles.js');

      if (mounted) {
        await _controller.runJavaScript(darkModeCss);
      }
    }
    // if (Theme.of(context).brightness == Brightness.dark) {
    //   final String darkModeCss = await rootBundle
    //       .loadString('$webviewsURL/investor_journey_dark_styles.js');
    //   await _controller.runJavaScript(darkModeCss);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _costumeAppBar(context),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: WebViewWidget(controller: _controller),
            ),
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
