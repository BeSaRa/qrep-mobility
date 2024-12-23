import 'package:ebla/presentations/features/investor_journey/blocs/investor_journey_event.dart';
import 'package:ebla/presentations/features/investor_journey/blocs/investor_journey_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';

class InvestorJourneyBloc
    extends Bloc<InvestorJourneyEvent, InvestorJourneyState> {
  final WebViewController controller;

  InvestorJourneyBloc(this.controller) : super(InvestorJourneyLoading()) {
    on<InitializeWebView>((event, emit) async {
      try {
        controller
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(NavigationDelegate(
            onPageStarted: (url) => add(PageStarted()),
            onPageFinished: (url) => add(PageLoaded()),
            onWebResourceError: (error) =>
                add(PageDidnNotLoad(error.errorCode, error.description)),
          ))
          ..loadRequest(Uri.parse(event.url));
      } catch (e) {
        emit(InvestorJourneyError(e.toString()));
      }
    });

    on<PageStarted>((event, emit) {
      emit(InvestorJourneyLoading());
    });

    on<PageLoaded>((event, emit) async {
      //Here i ensure that we do not emit the loaded state if an error occurred
      if (state is InvestorJourneyError) {
        return;
      }
      emit(InvestorJourneyLoaded());
    });

    on<PageDidnNotLoad>((event, emit) {
      final errorMessage = event.description ??
          "Failed to load content (Error code: ${event.errorCode})";
      emit(InvestorJourneyError(errorMessage));
    });

    on<RunJavaScript>((event, emit) async {
      try {
        const String webviewsURL = "assets/webviews";

        // Check theme mode
        // final isDarkMode = Theme.of(context).brightness == Brightness.dark;
        if (event.isDarkMode) {
          final String darkModeCss = await rootBundle
              .loadString('$webviewsURL/webviews_dark_styles.js');
          await controller.runJavaScript(darkModeCss);
        }

        // Load JavaScript based on the step number
        if (event.stepNumber == "0") {
          final String investorJsCode =
              await rootBundle.loadString('$webviewsURL/investor_journey.js');
          await controller.runJavaScript(investorJsCode);
        } else if (event.stepNumber == "1") {
          final String propertyDeveloperJsCode =
              await rootBundle.loadString('$webviewsURL/property_developer.js');
          await controller.runJavaScript(propertyDeveloperJsCode);
        } else {
          final String professionalsJsCode =
              await rootBundle.loadString('$webviewsURL/professionals.js');
          await controller.runJavaScript(professionalsJsCode);
        }
      } catch (e) {
        emit(InvestorJourneyError("Failed to run JavaScript: ${e.toString()}"));
      }
    });
  }
}
