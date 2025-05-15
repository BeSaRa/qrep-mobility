import 'dart:ui';

abstract class AboutTheAuthorityEvent {}

class InitializeAboutAuthWebView extends AboutTheAuthorityEvent {
  final String url;
  InitializeAboutAuthWebView(this.url);
}
// Add these to your event classes
class WebViewNavigationRequested extends AboutTheAuthorityEvent {
  final String url;
   WebViewNavigationRequested(this.url);
}

class PopWebView extends AboutTheAuthorityEvent {
   PopWebView();
}

// Update existing events to include URLs when needed
class PageStarted extends AboutTheAuthorityEvent {
  final String? url;
   PageStarted([this.url]);
}

class PageLoaded extends AboutTheAuthorityEvent {
  final String? url;
   PageLoaded([this.url]);
}
// class PageLoaded extends AboutTheAuthorityEvent {}

// class PageStarted extends AboutTheAuthorityEvent {}

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
