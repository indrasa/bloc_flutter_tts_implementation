part of 'tts_bloc.dart';

@immutable
sealed class TtsEvent {}

class TtsInit extends TtsEvent {}

class TtsPlayEvent extends TtsEvent {}

// class TtsPauseEvent extends TtsEvent {}

// class TtsResumeEvent extends TtsEvent {}

class TtsStopEvent extends TtsEvent {}

class TtsSaveAudioEvent extends TtsEvent {}
