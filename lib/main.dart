import 'package:bloc_flutter_tts_implementation/appku.dart';
import 'package:bloc_flutter_tts_implementation/tts_bloc/tts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterTts flutterTts = FlutterTts();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TtsBloc(flutterTts),
      child: MaterialApp(
        title: 'TTS Bloc Implementation',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Appku(),
      ),
    );
  }
}
