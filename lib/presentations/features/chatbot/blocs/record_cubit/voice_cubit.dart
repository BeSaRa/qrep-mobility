import 'package:bloc/bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

part 'voice_state.dart';

class VoiceCubit extends Cubit<VoiceState> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  List<stt.LocaleName> _availableLocales = [];
  String selectedLocale = 'en_US'; // Default locale

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
  Future<void> checkAndRequestPermissionToStart() async {
    PermissionStatus status = await Permission.microphone.status;

    if (status.isDenied || status.isPermanentlyDenied) {
      // If permission is denied, request it
      bool isGranted = await Permission.microphone.request().isGranted;

      if (isGranted) {
        initializeSpeech();
        startListening();
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
      startListening();
    }
  }
//-----------------------------START---------------------------------

  void startListening() {
    if (!_speech.isAvailable) {
      // if (isClosed) return; // Check if the Cubit is closed
      emit(VoiceState(
          isListening: false,
          text: '',
          errorMessage: "Speech recognition not available"));
      return;
    }
    //to clear the text every time i record
    emit(VoiceState(
      text: '',
    ));
    _speech.listen(
      onResult: (val) async {
        if (RegExp(r'[\u0600-\u06FF]').hasMatch(val.recognizedWords)) {
          selectedLocale = "ar_DZ";
        } else {
          selectedLocale = "en_US";
        }
        // if (isClosed) return; // Check if the Cubit is closed
        emit(VoiceState(
          isListening: !val.finalResult,
          text: val.recognizedWords,
          confidence: val.confidence,
          availableLocales: _availableLocales,
          selectedLocale: selectedLocale,
        ));
      },
      localeId: "ar_DZ",
      // localeId: selectedLocale,
      listenMode: stt.ListenMode.dictation,
    );
    // if (isClosed) return; // Check if the Cubit is closed
    emit(VoiceState(
        isListening: true,
        text: state.text,
        confidence: state.confidence,
        availableLocales: _availableLocales,
        selectedLocale: selectedLocale));
  }

//-----------------------------STOP---------------------------------
  void stopListening() {
    // if (isClosed) return; // Check if the Cubit is closed
    _speech.stop();

    emit(VoiceState(
        isListening: false,
        text: state.text,
        confidence: state.confidence,
        availableLocales: _availableLocales,
        selectedLocale: selectedLocale));
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
