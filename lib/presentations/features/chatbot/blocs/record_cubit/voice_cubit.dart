import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

part 'voice_state.dart';

class VoiceCubit extends Cubit<VoiceState> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  List<stt.LocaleName> _availableLocales = [];
  String selectedLocale = "ar_DZ"; // Default locale

  VoiceCubit() : super(VoiceState());

//-----------------------------INIT---------------------------------

  void initializeSpeech() async {
    bool available = await _speech.initialize(
      onError: (error) {
        emit(VoiceState(
          isListening: false,
          text: '',
          errorMessage: error.errorMsg,
        ));
      },
    );

    if (available) {
      _availableLocales = await _speech.locales(); // Fetch available locales
      emit(VoiceState(
          isListening: false, text: '', availableLocales: _availableLocales));
    } else {
      emit(VoiceState(
          isListening: false,
          text: '',
          errorMessage: "Speech recognition not available"));
    }
  }
//-----------------------------LANG---------------------------------

  // void selectLocale(String localeId) {
  //   if (_availableLocales.any((locale) => locale.localeId == localeId)) {
  //     selectedLocale = localeId;
  //     emit(VoiceState(
  //       isListening: state.isListening,
  //       text: state.text,
  //       availableLocales: _availableLocales,
  //       selectedLocale: selectedLocale,
  //     ));
  //   }
  // }
  Future<void> checkAndRequestPermissionToStart(BuildContext context) async {
    PermissionStatus status = await Permission.microphone.status;

    if (status.isDenied || status.isPermanentlyDenied) {
      // If permission is denied, request it
      bool isGranted = await Permission.microphone.request().isGranted;

      if (isGranted) {
        initializeSpeech();
        startListening(context);
      } else {
        // Handle case when permission is permanently denied or not granted
        emit(VoiceState(
            isListening: false,
            text: '',
            errorMessage:
                "Microphone permission denied. Please enable it in settings."));
      }
    } else {
      // If permission is already granted

      startListening(context);
    }
  }
//-----------------------------START---------------------------------

  void startListening(BuildContext context) {
    if (!_speech.isAvailable) {
      // if (isClosed) return; // Check if the Cubit is closed
      emit(VoiceState(
          isListening: false,
          text: '',
          errorMessage: "Speech recognition not available"));
      return;
    }
    // Clear text only when starting new recording
    emit(VoiceState(
        isListening: true,
        text: '', // Reset text when starting new recording
        availableLocales: _availableLocales,
        selectedLocale: selectedLocale));

    _speech.listen(
      onResult: (val) async {
        // For partial results, append to existing text
        // For final results, use the complete recognized words
        final newText = val.finalResult
            ? val.recognizedWords
            : state.text +
                (state.text.isNotEmpty ? ' ' : '') +
                val.recognizedWords;

        if (RegExp(r'[\u0600-\u06FF]').hasMatch(val.recognizedWords)) {
          selectedLocale = "ar_DZ";
        } else {
          selectedLocale = "en_US";
        }
        // if (isClosed) return; // Check if the Cubit is closed
        if (!val.finalResult) {
          emit(VoiceState(
              isListening: !val.finalResult,
              // text: newText,
              confidence: val.confidence,
              availableLocales: _availableLocales,
              selectedLocale: selectedLocale,
              hasFinalResult: val.finalResult));
        } else {
          emit(VoiceState(
              isListening: false,
              text: newText,
              confidence: val.confidence,
              availableLocales: _availableLocales,
              selectedLocale: selectedLocale,
              hasFinalResult: val.finalResult));
          stopListening();
        }
      },
      localeId:         Localizations.localeOf(context).languageCode == 'ar'   ? "ar_DZ" : "en_US",
      // localeId: selectedLocale,
      // localeId: selectedLocale,
      listenMode: stt.ListenMode.dictation,
      partialResults: true,
    );
    // if (isClosed) return; // Check if the Cubit is closed
    if (_speech.isListening) {
      emit(VoiceState(
          isListening: true,
          // text: state.text,
          confidence: state.confidence,
          availableLocales: _availableLocales,
          selectedLocale: selectedLocale));
    }
  }

//-----------------------------STOP---------------------------------
  Future<void> stopListening() async {
    // if (isClosed) return; // Check if the Cubit is closed
    await _speech.stop();
    print("the speech state");
    print(_speech.isListening);

    emit(VoiceState(
      isListening: false,
      text: state.text,
      confidence: state.confidence,
      availableLocales: _availableLocales,
      selectedLocale: selectedLocale,
      hasFinalResult: true,
    ));
  }
//-----------------------------CLEAR TEXT---------------------------------

  void clearText() {
    emit(VoiceState(
      isListening: false,
      text: '',
      confidence: state.confidence,
      availableLocales: _availableLocales,
      selectedLocale: selectedLocale,
    ));
  }
}
