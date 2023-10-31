part of 'faq_bloc.dart';

@freezed
class FaqState with _$FaqState {
  const factory FaqState.initial(
{    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    @Default('') String errorMessage,
    @Default(FaqResponse()) FaqResponse faqResponse,}
  ) = _Initial;
}
