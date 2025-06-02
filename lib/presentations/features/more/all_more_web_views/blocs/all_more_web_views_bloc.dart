import 'dart:developer';

import 'package:ebla/presentations/features/more/all_more_web_views/blocs/all_more_web_views_event.dart';
import 'package:ebla/presentations/features/more/all_more_web_views/blocs/all_more_web_views_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';

// class AboutTheAuthorityBloc
//     extends Bloc<AboutTheAuthorityEvent, AboutTheAuthorityState> {
//   final WebViewController controller;

//   AboutTheAuthorityBloc(this.controller) : super(AboutTheAuthorityLoading()) {
//     on<InitializeAboutAuthWebView>((event, emit) async {
//       try {
//         controller
//           ..setJavaScriptMode(JavaScriptMode.unrestricted)
//           ..setNavigationDelegate(NavigationDelegate(
//             onPageStarted: (url) => add(PageStarted()),
//             onPageFinished: (url) => add(PageLoaded()),
//             onWebResourceError: (error) =>
//                 add(PageDidnNotLoad(error.errorCode, error.description)),
//           ))
//           ..loadRequest(Uri.parse(event.url));
//       } catch (e) {
//         emit(AboutTheAuthorityError(e.toString()));
//       }
//     });

//     on<PageStarted>((event, emit) {
//       emit(AboutTheAuthorityLoading());
//     });

//     on<PageLoaded>((event, emit) async {
//       //Here i ensure that we do not emit the loaded state if an error occurred
//       if (state is AboutTheAuthorityError) {
//         return;
//       }
//       try {
//         emit(AboutTheAuthorityLoaded());
//       } catch (e) {
//         emit(AboutTheAuthorityError("Failed to retrieve URL: ${e.toString()}"));
//       }
//     });

//     on<PageDidnNotLoad>((event, emit) {
//       final errorMessage = event.description ??
//           "Failed to load content (Error code: ${event.errorCode})";
//       emit(AboutTheAuthorityError(errorMessage));
//     });
class AboutTheAuthorityBloc
    extends Bloc<AboutTheAuthorityEvent, AboutTheAuthorityState> {
  final WebViewController controller;

  AboutTheAuthorityBloc(this.controller)
      : super(const AboutTheAuthorityLoading(urlHistory: [])) {
    // ... existing event handlers

    on<InitializeAboutAuthWebView>((event, emit) async {
      try {
        //zak2
        emit(AboutTheAuthorityLoading(urlHistory: [event.url]));
        log("zak init");
        controller
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(NavigationDelegate(
            onPageStarted: (url) => add(PageStarted(url)),
            onPageFinished: (url) => add(PageLoaded(url)),

            ///zak Here I solve the problem of the event/ usrls

            // onWebResourceError: (error) =>
            //     add(PageDidnNotLoad(error.errorCode, error.description)),
            onNavigationRequest: (request) {
              //to prevent adding url if this url is the last element in the list (this happen when error accord)
              if (request.url != state.urlHistory.last) {
                add(WebViewNavigationRequested(request.url));
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
          ))
          ..loadRequest(Uri.parse(event.url));
      } catch (e) {
        emit(AboutTheAuthorityError(
          message: e.toString(),
          urlHistory: state.urlHistory,
        ));
      }
    });

    on<WebViewNavigationRequested>((event, emit) {
      final newHistory = [...state.urlHistory, event.url];
      emit(state.copyWith(urlHistory: newHistory));
      controller.loadRequest(Uri.parse(event.url));
    });

    on<PopWebView>((event, emit) {
      if (state.urlHistory.length > 1) {
        final newHistory =
            state.urlHistory.sublist(0, state.urlHistory.length - 1);
        final previousUrl = newHistory.last;
        emit(state.copyWith(urlHistory: newHistory));
        controller.loadRequest(Uri.parse(previousUrl));
      }
    });

    // Update existing events to maintain history
    on<PageStarted>((event, emit) {
      log("zak started");
      emit(AboutTheAuthorityLoading(urlHistory: state.urlHistory));
    });

    on<PageLoaded>((event, emit) {
      log("zak loaded");
      //zak2
      if (state is AboutTheAuthorityError) return;
      emit(AboutTheAuthorityLoaded(urlHistory: state.urlHistory));
    });

    String getUserFriendlyMessage(int errorCode, String? description) {
      switch (errorCode) {
        case -1: // ERROR_UNKNOWN
          return "Unknown error occurred. Please check your internet connection or try again.";
        case -2: // ERROR_HOST_LOOKUP
          return "Network error: Couldn't resolve host. Check your internet connection.";
        case -6: // ERROR_CONNECT
          return "Connection failed. The server might be down.";
        case -8: // ERROR_TIMEOUT
          return "Request timed out. Please try again.";
        case -10: // ERROR_UNSUPPORTED_SCHEME
          return "Unsupported URL scheme.";
        case -11: // ERROR_FAILED_SSL_HANDSHAKE
          return "Security error: Invalid SSL certificate.";
        case -12: // ERROR_BAD_URL
          return "Invalid URL format.";
        case -14: // ERROR_FILE_NOT_FOUND
          return "The requested page was not found (404).";
        default:
          return description ?? "Loading failed (Error code: $errorCode)";
      }
    }

    on<PageDidnNotLoad>((event, emit) async {
      log("zak didnt load");
      // Create detailed error message
      final errorDetails = '''
  WebView Error Occurred:
  - Code: ${event.errorCode}
  - Description: ${event.description}
  - History: ${state.urlHistory}
  ''';

      // Log the full error details for debugging
      debugPrint(errorDetails);
      // if (event.errorCode == -1 && state.urlHistory.isNotEmpty) {
      //   await Future.delayed(const Duration(seconds: 2));
      //   controller.loadRequest(Uri.parse(state.urlHistory.last));
      //   return;
      // }
      // Categorize the error
      final userMessage =
          getUserFriendlyMessage(event.errorCode, event.description);

      emit(AboutTheAuthorityError(
        message: userMessage,
        urlHistory: state.urlHistory,
        // errorCode: event.errorCode, // Add this to your state
        // errorDetails: errorDetails, // Add this to your state
      ));
    });

    on<RunJavaScript>((
      event,
      emit,
    ) async {
      try {
        const String baseUrl = "assets/webviews";

        // Check theme mode
        if (event.isDarkMode) {
          final String darkModeCss =
              await rootBundle.loadString('$baseUrl/webviews_dark_styles.js');
          await controller.runJavaScript(darkModeCss);
        }
        //--------------About the authority Tap in web header---------------
        if (event.pageName == "aboutTheAuthority" ||
            event.pageName == "visionAndMission" ||
            event.pageName == "tasksAndResponsibilitiesOftheAuthority") {
          final String jsCode = await rootBundle.loadString(
              '$baseUrl/about_the_authority/about_the_authority.js');
          await controller.runJavaScript(jsCode);
        }
        //--------------Contact Tap in web header---------------------------
        else if (event.pageName == "contactUs") {
          final String jsCode =
              await rootBundle.loadString('$baseUrl/contact/contact.js');
          await controller.runJavaScript(jsCode);
        }
        //--------------Media Tap in web header---------------------------
        else if (event.pageName == "authorityNews") {
          final String jsCode = await rootBundle
              .loadString('$baseUrl/media_center/media_center.js');
          await controller.runJavaScript(jsCode);
        }
        //--------------services Tap in web header---------------------------
        else if (event.pageName == "services") {
          final String jsCode =
              await rootBundle.loadString('$baseUrl/services.js');
          await controller.runJavaScript(jsCode);
        }
        //--------------Ai Search ref_url ---------------------------
        else if (event.pageName == "aiSearchUrl") {
          final String jsCode =
              await rootBundle.loadString('$baseUrl/services.js');
          await controller.runJavaScript(jsCode);
        }
        //--------------FAQ & privacyPolicy ref_url ---------------------------
        else if (event.pageName == "faqs" ||
            event.pageName == "privacyPolicy") {
          final String jsCode =
              await rootBundle.loadString('$baseUrl/drawer.js');
          await controller.runJavaScript(jsCode);
        }
        //-------------- Real Estate Calendar && videoLibrary  ref_url ---------------------------
        else if (event.pageName == "realEstateCalendar" ||
            event.pageName == "videoLibrary") {
          final String jsCode =
              await rootBundle.loadString('$baseUrl/realEstateCalendar.js');
          await controller.runJavaScript(jsCode);
        }
      } catch (e) {
        emit(AboutTheAuthorityError(
            message: "Failed to run JavaScript: ${e.toString()}",
            urlHistory: state.urlHistory));
      }
    });
  }
}
