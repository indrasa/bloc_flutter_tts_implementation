import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:meta/meta.dart';

part 'tts_event.dart';
part 'tts_state.dart';

class TtsBloc extends Bloc<TtsEvent, TtsState> {
  FlutterTts _flutterTts;
  TtsBloc(this._flutterTts) : super(TtsInitial()) {
    on<TtsPlayEvent>(_ttsPlay);
    on<TtsStopEvent>(_ttsStop);
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

      var setBahasaID = await _flutterTts.setLanguage("id-ID");
      print(setBahasaID);

      var result = await _flutterTts.speak('''
        main codm
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
}
