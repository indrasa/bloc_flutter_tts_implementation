import 'package:bloc_flutter_tts_implementation/tts_bloc/tts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Appku extends StatelessWidget {
  const Appku({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coba TTS Bloc"),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  context.read<TtsBloc>().add(TtsPlayEvent());
                },
                child: Text("Speak")),
            TextButton(
                onPressed: () {
                  context.read<TtsBloc>().add(TtsStopEvent());
                },
                child: Text("Stop")),
            // TextButton(
            //     onPressed: () {
            //       context.read<TtsBloc>().add(TtsPauseEvent());
            //     },
            //     child: Text("Pause")),
            // TextButton(
            //     onPressed: () {
            //       context.read<TtsBloc>().add(TtsResumeEvent());
            //     },
            //     child: Text("Resume")),
            // TextButton(onPressed: () {}, child: Text("Save Audio")),
            BlocBuilder<TtsBloc, TtsState>(
              builder: (context, state) {
                return Text("State: $state");
              },
            ),
          ],
        ),
      ),
    );
  }
}
