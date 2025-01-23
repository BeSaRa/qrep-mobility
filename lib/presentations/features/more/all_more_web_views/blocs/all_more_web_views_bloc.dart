import 'package:ebla/presentations/features/more/all_more_web_views/blocs/all_more_web_views_event.dart';
import 'package:ebla/presentations/features/more/all_more_web_views/blocs/all_more_web_views_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';

class AboutTheAuthorityBloc
    extends Bloc<AboutTheAuthorityEvent, AboutTheAuthorityState> {
  final WebViewController controller;

  AboutTheAuthorityBloc(this.controller) : super(AboutTheAuthorityLoading()) {
    on<InitializeAboutAuthWebView>((event, emit) async {
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
        emit(AboutTheAuthorityError(e.toString()));
      }
    });

    on<PageStarted>((event, emit) {
      emit(AboutTheAuthorityLoading());
    });

    on<PageLoaded>((event, emit) async {
      print("The function is being called");
      //Here i ensure that we do not emit the loaded state if an error occurred
      if (state is AboutTheAuthorityError) {
        return;
      }
      try {
        emit(AboutTheAuthorityLoaded());
      } catch (e) {
        emit(AboutTheAuthorityError("Failed to retrieve URL: ${e.toString()}"));
      }
    });

    on<PageDidnNotLoad>((event, emit) {
      final errorMessage = event.description ??
          "Failed to load content (Error code: ${event.errorCode})";
      emit(AboutTheAuthorityError(errorMessage));
    });

    on<RunJavaScript>((
      event,
      emit,
    ) async {
      try {
        
        const String baseUrl = "assets/webviews";

        // Check theme mode
        if (event.isDarkMode) {
          final String darkModeCss = await rootBundle
              .loadString('$baseUrl/webviews_dark_styles.js');
          await controller.runJavaScript(darkModeCss);
        }
        //--------------About the authority Tap in web header---------------
        if (event.pageName == "aboutTheAuthority" ||
            event.pageName == "visionAndMission" ||
            event.pageName == "tasksAndResponsibilitiesOftheAuthority") {
          final String jsCode = await rootBundle
              .loadString('$baseUrl/about_the_authority/about_the_authority.js');
          await controller.runJavaScript(jsCode);
        }
        //--------------Contact Tap in web header---------------------------
        else if (event.pageName == "contactUs") {
          final String jsCode =await rootBundle.loadString('$baseUrl/contact/contact.js');
          await controller.runJavaScript(jsCode);
        }
        //--------------Media Tap in web header---------------------------
        else if (event.pageName == "authorityNews") {
          final String jsCode =await rootBundle.loadString('$baseUrl/media_center/media_center.js');
          await controller.runJavaScript(jsCode);
        }
        //--------------services Tap in web header---------------------------
        else if (event.pageName == "services") {
          final String jsCode =await rootBundle.loadString('$baseUrl/services.js');
          await controller.runJavaScript(jsCode);
        }
      } catch (e) {
        emit(AboutTheAuthorityError(
            "Failed to run JavaScript: ${e.toString()}"));
      }
    });
  }
}
