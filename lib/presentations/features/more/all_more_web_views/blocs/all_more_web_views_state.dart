// abstract class AboutTheAuthorityState {}

// class AboutTheAuthorityLoading extends AboutTheAuthorityState {}

// class AboutTheAuthorityLoaded extends AboutTheAuthorityState {}

// class AboutTheAuthorityError extends AboutTheAuthorityState {
//   final String message;
//   AboutTheAuthorityError(this.message);
// }
abstract class AboutTheAuthorityState {
  final List<String> urlHistory;
  
  const AboutTheAuthorityState({required this.urlHistory});

  AboutTheAuthorityState copyWith({
    List<String>? urlHistory,
  });
}

// Implement copyWith in each state class 
class AboutTheAuthorityLoading extends AboutTheAuthorityState {
  const AboutTheAuthorityLoading({required super.urlHistory});

  @override
  AboutTheAuthorityLoading copyWith({List<String>? urlHistory}) {
    return AboutTheAuthorityLoading(
      urlHistory: urlHistory ?? this.urlHistory,
    );
  }
}

class AboutTheAuthorityLoaded extends AboutTheAuthorityState {
  const AboutTheAuthorityLoaded({required super.urlHistory});

  @override
  AboutTheAuthorityLoaded copyWith({List<String>? urlHistory}) {
    return AboutTheAuthorityLoaded(
      urlHistory: urlHistory ?? this.urlHistory,
    );
  }
}

class AboutTheAuthorityError extends AboutTheAuthorityState {
  final String message;
  
  const AboutTheAuthorityError({
    required this.message,
    required super.urlHistory,
  });

  @override
  AboutTheAuthorityError copyWith({
    String? message,
    List<String>? urlHistory,
  }) {
    return AboutTheAuthorityError(
      message: message ?? this.message,
      urlHistory: urlHistory ?? this.urlHistory,
    );
  }
}