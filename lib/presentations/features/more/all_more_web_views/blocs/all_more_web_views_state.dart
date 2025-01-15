abstract class AboutTheAuthorityState {}

class AboutTheAuthorityLoading extends AboutTheAuthorityState {}

class AboutTheAuthorityLoaded extends AboutTheAuthorityState {}

class AboutTheAuthorityError extends AboutTheAuthorityState {
  final String message;
  AboutTheAuthorityError(this.message);
}
