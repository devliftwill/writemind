// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:audioplayers/audioplayers.dart';

class AudioPayerExtended extends StatefulWidget {
  const AudioPayerExtended({
    Key? key,
    this.width,
    this.height,
    required this.audio,
    this.onDurationChanged,
    required this.images,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String audio;
  final Future<dynamic> Function()? onDurationChanged;
  final List<ImagesRecord> images;
  @override
  _AudioPayerExtendedState createState() => _AudioPayerExtendedState();
}

class _AudioPayerExtendedState extends State<AudioPayerExtended> {
  AudioPlayer player = AudioPlayer();
  int maxduration = 100;
  int currentpos = 0;
  String currentpostlabel = "00:00:00";
  bool isplaying = false;
  bool audioplayed = false;
  late Uint8List audiobytes;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await player.setSourceUrl(widget.audio);
      player.onDurationChanged.listen((Duration d) {
        setState(() {
          maxduration = d.inMilliseconds;
        });
      });

      format(Duration d) => d.toString().split('.').first.padLeft(8, "0");

      player.onPositionChanged.listen((Duration p) {
        setState(() {
          currentpos = p.inMilliseconds;
          currentpostlabel = format(p);
        });

        int seconds = Duration(milliseconds: currentpos).inSeconds;
        print(seconds);
        var image = widget.images.where((image) => image.seconds == seconds);
        if (image.isNotEmpty) {
          FFAppState().selectedImage = image.first.imageUrl as String;
          print(image.first.imageUrl);
          widget.onDurationChanged!.call();
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
      Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          !isplaying
              ? InkWell(
                  onTap: () {
                    player.resume();
                    setState(() {
                      isplaying = !isplaying;
                    });
                  },
                  child: Icon(
                    Icons.play_arrow,
                    color: FlutterFlowTheme.of(context).secondaryColor,
                    size: 24,
                  ))
              : InkWell(
                  onTap: () {
                    player.pause();
                    setState(() {
                      isplaying = !isplaying;
                    });
                  },
                  child: Icon(
                    Icons.pause_outlined,
                    color: FlutterFlowTheme.of(context).secondaryColor,
                    size: 24,
                  )),
          Expanded(
            child: Slider(
              activeColor: FlutterFlowTheme.of(context).primaryColor,
              inactiveColor: Color(0xFF9E9E9E),
              value: double.parse(currentpos.toString()),
              min: 0,
              max: double.parse(maxduration.toString()),
              divisions: maxduration,
              label: currentpostlabel,
              onChanged: (double value) async {
                int seekval = value.round();
                player.seek(Duration(milliseconds: seekval));
              },
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: Text(
              currentpostlabel,
              style: FlutterFlowTheme.of(context).bodyText1,
            ),
          ),
        ],
      ),
    ]));
  }
}
