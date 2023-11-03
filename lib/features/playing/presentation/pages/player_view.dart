import 'package:flutter/material.dart';
import 'package:flutter_audio_waveforms/flutter_audio_waveforms.dart';
import 'package:youvibe/utils/utils.dart';

class PlayerView extends StatelessWidget {
  const PlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffa0e9ff),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Now Playing"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: CircleAvatar(
                    backgroundColor: MyUtils.randomColor(),
                    radius: 100,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow_outlined),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        iconSize: 40,
                      ),
                    ),
                  ),
                ),
                const Text(
                  "Song Name",
                  style: TextStyle(
                    fontSize: 35,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Text(
                  "Subtitle Here",
                  style: TextStyle(
                    color: Colors.grey,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SquigglyWaveform(
                  samples: const [],
                  height: 30,
                  width: double.infinity,
                  elapsedDuration: const Duration(seconds: 40),
                  maxDuration: const Duration(minutes: 3),
                  activeColor: Colors.redAccent,
                  inactiveColor: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.repeat),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_task_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
