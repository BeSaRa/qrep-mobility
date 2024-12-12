import 'package:ebla/presentations/features/more/more_view.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:ebla/presentations/widgets/text_field_filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InvestorJourneyView extends StatefulWidget {
  const InvestorJourneyView({super.key, required this.stepNumber});
  final String stepNumber;
  @override
  State<InvestorJourneyView> createState() => _InvestorJourneyViewState();
}

class _InvestorJourneyViewState extends State<InvestorJourneyView> {
  late final WebViewController controller;
  bool isLoading = true;
  String getUrl(String stepNumber) {
    // Return the URL based on the step number
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
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (url) {
            setState(() {
              isLoading = false;
            });
            controller.runJavaScript(
                "document.querySelector('header.mkdf-mobile-header').style.display = 'none';");

            controller.runJavaScript(
              '''
//remove the chatbot-toggler
            document.querySelector('button.chatbot-toggler').style.display = 'none';

// adjust the viewport for better responsiveness
              var meta = document.createElement('meta');
              meta.name = 'viewport';
              meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no';
              document.getElementsByTagName('head')[0].appendChild(meta);
              ''',
            );
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
          getUrl(widget.stepNumber),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: EblaAppBar(
          title: widget.stepNumber == "0"
              ? AppStrings().investorJourney
              : widget.stepNumber == "1"
                  ? AppStrings().propertyDevelopers
                  : AppStrings().professionPracticers,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: WebViewWidget(
                controller: controller,
              ),
            ),
            if (isLoading)
              Center(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height,
                  color: ColorManager.white,
                ),
              ),
            if (isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
