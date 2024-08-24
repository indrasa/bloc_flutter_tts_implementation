part of 'tts_bloc.dart';

@immutable
sealed class TtsState {}

final class TtsInitial extends TtsState {}

final class TtsLoading extends TtsState {}

final class TtsPlaying extends TtsState {}

final class TtsStopped extends TtsState {}

final class TtsPaused extends TtsState {}

final class TtsResumed extends TtsState {}

final class TtsError extends TtsState {}

final class TtsAudioSaved extends TtsState {
  final String lokasiFile;
  TtsAudioSaved({required this.lokasiFile});
}
