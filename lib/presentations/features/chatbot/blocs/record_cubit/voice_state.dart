part of 'voice_cubit.dart';

class VoiceState {
  final bool isListening;
  final String text;
  final double confidence;
  final String errorMessage;
  final String selectedLocale;
  //zak
  final String? audioPath;
  final List<stt.LocaleName>? availableLocales;
    final bool hasFinalResult;

  VoiceState({
    this.isListening = false,
    this.text = '',
    this.confidence = 1.0,
    this.errorMessage = '',
    this.audioPath = '',
    this.selectedLocale = '',
    this.availableLocales,
       this.hasFinalResult = false,
  });
}
// part of 'voice_cubit.dart';

// class VoiceState {
//   final bool isRecording;
//   final String recordedText;
//   final String? audioPath;

//   const VoiceState({
//     this.isRecording = false,
//     this.recordedText="",
//     this.audioPath,
//   });
// }//zak