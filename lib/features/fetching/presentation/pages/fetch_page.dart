import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio_cache/just_audio_cache.dart';
import 'dart:convert';

import 'package:youvibe/utils/utils.dart';

class FetchPage extends StatelessWidget {
  FetchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffa0e9ff),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text("Get Your Vibe"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: "Enter YT link",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(),
                    ),
                    //fillColor: Colors.green
                  ),
                  keyboardType: TextInputType.url,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        testYt();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffa0e9ff),
                        foregroundColor: Colors.black,
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      child: const Text("Get Vibe"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final myUrl = Uri.parse(
    "https://pear-attractive-adder.cyclic.app/vdo/?url=https://youtu.be/UHdf4ZUmYO4?si=BxrpXKG2HVjfMDwB",
  );
  final audioPlayer = AudioPlayer();

  List<String> playList = [];

  void testYt() async {
    if (audioPlayer.playing) {
      audioPlayer.pause();
      return;
    } else {
      if (audioPlayer.processingState == ProcessingState.ready) {
        audioPlayer.play();
        return;
      }
      final http.Response result = await http.get(myUrl);
      final dynamic parseBody = jsonDecode(result.body);
      playList.add(parseBody["url"]);
      await audioPlayer.dynamicSetAll(playList);
      await audioPlayer.play();
    }
  }
}
