abstract class InvestorJourneyEvent {}

class InitializeWebView extends InvestorJourneyEvent {
  final String url;
  InitializeWebView(this.url);
}

class PageLoaded extends InvestorJourneyEvent {}

class PageStarted extends InvestorJourneyEvent {}

class PageDidnNotLoad extends InvestorJourneyEvent {
  final int errorCode;
  final String? description;

  PageDidnNotLoad(this.errorCode, this.description);
}

class RunJavaScript extends InvestorJourneyEvent {
  final String stepNumber;
  final bool isDarkMode;
  RunJavaScript(this.stepNumber, this.isDarkMode);
}

