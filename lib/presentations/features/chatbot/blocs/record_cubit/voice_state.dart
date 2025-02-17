part of 'voice_cubit.dart';

class VoiceState {
  final bool isListening;
  final String text;
  final double confidence;
  final String errorMessage;
  final String selectedLocale;
  final List<stt.LocaleName>? availableLocales;

  VoiceState({
    this.isListening = false,
    this.text = '',
    this.confidence = 1.0,
    this.errorMessage = '',
    this.selectedLocale = '',
    this.availableLocales,
  });
}
