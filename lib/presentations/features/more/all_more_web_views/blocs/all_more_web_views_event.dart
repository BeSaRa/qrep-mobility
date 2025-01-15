import 'dart:ui';

abstract class AboutTheAuthorityEvent {}

class InitializeAboutAuthWebView extends AboutTheAuthorityEvent {
  final String url;
  InitializeAboutAuthWebView(this.url);
}

class PageLoaded extends AboutTheAuthorityEvent {}

class PageStarted extends AboutTheAuthorityEvent {}

class PageDidnNotLoad extends AboutTheAuthorityEvent {
  final int errorCode;
  final String? description;

  PageDidnNotLoad(this.errorCode, this.description);
}

class RunJavaScript extends AboutTheAuthorityEvent {
  final String pageName;
  final bool isDarkMode;
  final Locale locale;
  RunJavaScript(this.pageName, this.isDarkMode, this.locale);
}
