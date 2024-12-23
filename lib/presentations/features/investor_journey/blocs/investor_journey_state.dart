abstract class InvestorJourneyState {}

class InvestorJourneyLoading extends InvestorJourneyState {}

class InvestorJourneyLoaded extends InvestorJourneyState {}

class InvestorJourneyError extends InvestorJourneyState {
  final String message;
  InvestorJourneyError(this.message);
}
