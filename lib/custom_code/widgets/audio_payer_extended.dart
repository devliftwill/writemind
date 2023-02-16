// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:audioplayers/audioplayers.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class AudioPayerExtended extends StatefulWidget {
  const AudioPayerExtended({
    Key? key,
    this.width,
    this.height,
    required this.audio,
    this.onDurationChanged,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String audio;
  final Future<dynamic> Function()? onDurationChanged;

  @override
  _AudioPayerExtendedState createState() => _AudioPayerExtendedState();
}

class _AudioPayerExtendedState extends State<AudioPayerExtended> {
  AudioPlayer player = AudioPlayer();
  int maxduration = 100;
  int currentpos = 0;
  String currentpostlabel = "00:00";
  bool isplaying = false;
  bool audioplayed = false;
  late Uint8List audiobytes;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      var uri = Uri.parse(widget.audio);
      http.Response response = await http.get(uri);
      Uint8List bytes = response.bodyBytes;
      print(bytes);

      // await player.setSourceUrl(widget.audio);
      // player.onDurationChanged.listen((Duration d) {
      //   widget.onDurationChanged!.call();
      // });

      // player.onPositionChanged.listen((Duration p) {

      // });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
      children: [
        Container(
          child: Text(
            currentpostlabel,
            style: TextStyle(fontSize: 10),
          ),
        ),
        Container(
            child: Slider(
          value: double.parse(currentpos.toString()),
          min: 0,
          max: double.parse(maxduration.toString()),
          divisions: maxduration,
          label: currentpostlabel,
          onChanged: (double value) async {
            int seekval = value.round();
            player.seek(Duration(milliseconds: seekval));
          },
        )),
        Container(
          child: Wrap(
            spacing: 10,
            children: [
              ElevatedButton.icon(
                  onPressed: () async {
                    if (!isplaying && !audioplayed) {
                      player.resume();
                    } else if (audioplayed && !isplaying) {
                      player.resume();
                    } else {
                      player.pause();
                    }
                  },
                  icon: Icon(isplaying ? Icons.pause : Icons.play_arrow),
                  label: Text(isplaying ? "Pause" : "Play")),
              ElevatedButton.icon(
                  onPressed: () async {
                    await player.stop();
                  },
                  icon: Icon(Icons.stop),
                  label: Text("Stop")),
            ],
          ),
        )
      ],
    )));
  }
}
