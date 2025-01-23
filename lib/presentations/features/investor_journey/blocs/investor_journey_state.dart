// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class InvestorJourneyState {}

class InvestorJourneyLoading extends InvestorJourneyState {}

class InvestorJourneyLoaded extends InvestorJourneyState {}

class InvestorJourneyError extends InvestorJourneyState {
  final String message;
  InvestorJourneyError(this.message);
}
