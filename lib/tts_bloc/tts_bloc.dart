import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:meta/meta.dart';

part 'tts_event.dart';
part 'tts_state.dart';

class TtsBloc extends Bloc<TtsEvent, TtsState> {
  FlutterTts _flutterTts;

  // void _setTtsHandlers() {
  //   _flutterTts.setPauseHandler(() async {
  //     await _flutterTts.pause();
  //     add(TtsPauseEvent());
  //   });

  //   _flutterTts.setContinueHandler(() {
  //     add(TtsResumeEvent());
  //   });
  // }

  TtsBloc(this._flutterTts) : super(TtsInitial()) {
    // _setTtsHandlers();
    on<TtsPlayEvent>(_ttsPlay);
    on<TtsStopEvent>(_ttsStop);
    // on<TtsPauseEvent>(_ttsPause);
    // on<TtsResumeEvent>(_ttsResume);
    on<TtsSaveAudioEvent>(_ttsSaveAudio);
  }

  FutureOr<void> _ttsPlay(TtsPlayEvent event, Emitter<TtsState> emit) async {
    emit(TtsLoading());
    try {
      // var mesinBahasa = await _flutterTts.getEngines;
      // print(mesinBahasa);

      // var bahasaTerinstall = await _flutterTts.isLanguageInstalled("id_ID");
      // print(bahasaTerinstall);
      _flutterTts.setCompletionHandler(() {
        print("udah selesai guys");
        add(TtsStopEvent());
      });

      var setBahasaID = await _flutterTts.setLanguage("en-US");
      print(setBahasaID);

      var result = await _flutterTts.speak('''
        speak, stop, getLanguages, setLanguage, setSpeechRate, setVoice, setVolume, setPitch, isLanguageAvailable, setSharedInstance 
      ''');
      if (result == 1) {
        print("sedang playing");
        emit(TtsPlaying());
      }

      print(result);
    } catch (e) {
      print("gagal playing");
      emit(TtsError());
    }
  }

  FutureOr<void> _ttsStop(TtsStopEvent event, Emitter<TtsState> emit) async {
    emit(TtsLoading());
    try {
      var result = await _flutterTts.stop();
      if (result == 1) {
        print("tts stop");
        emit(TtsStopped());
      }
    } catch (e) {
      print("gagal stop");
      emit(TtsError());
    }
  }

  // FutureOr<void> _ttsPause(TtsPauseEvent event, Emitter<TtsState> emit) async {
  //   await _flutterTts.pause();
  //   emit(TtsPaused());
  // }

  // FutureOr<void> _ttsResume(
  //     TtsResumeEvent event, Emitter<TtsState> emit) async {
  //   // emit(TtsResumed());
  //   add(TtsPlayEvent());
  // }

  FutureOr<void> _ttsSaveAudio(
      TtsSaveAudioEvent event, Emitter<TtsState> emit) async {
    emit(TtsLoading());
    var hasil = await _flutterTts.synthesizeToFile("Hello World", "tts.wav");
    print('membuat audio');
    print(hasil.toString());
    emit(TtsAudioSaved(lokasiFile: hasil.toString()));
  }
}
