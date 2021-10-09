import 'package:flutter/material.dart';
import 'package:test_getx/app/controllers/Audio.dart';
import 'package:test_getx/base/services/Audio.dart';

class AudioControl extends StatefulWidget {
  final AudioController controller;

  const AudioControl({Key? key, required this.controller}) : super(key: key);
  @override
  _AudioControlState createState() => _AudioControlState();
}

class _AudioControlState extends State<AudioControl> {
  Icon iconPlay = Icon(Icons.pause, size: 45, color: Colors.white);
  Icon iconPause = Icon(Icons.play_arrow, size: 45, color: Colors.white);
  Icon iconRepeat = Icon(Icons.repeat_one, size: 30,color:Colors.teal);
  Icon iconNotRepeat = Icon(Icons.repeat,size: 30 ,color:Colors.teal);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Center(
            child: Container(
              width: size.width * 0.6,
              height: 60,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.teal,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(200)),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: widget.controller.audioLoopState == AudioLoopState.LOOP ? iconRepeat : iconNotRepeat,
                    onPressed: () async {
                      if (widget.controller.audioLoopState ==
                          AudioLoopState.NOTLOOP) {
                        await widget.controller.loop();
                        setState(() => widget.controller.audioLoopState =
                            AudioLoopState.LOOP);
                      } else if (widget.controller.audioLoopState ==
                          AudioLoopState.LOOP){
                        await widget.controller.notLoop();
                        setState(() => widget.controller.audioLoopState =
                            AudioLoopState.NOTLOOP);
                      }

                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.stop, size: 30, color: Colors.teal),
                    onPressed: () async {
                      await widget.controller.stop();
                      setState(() =>
                          widget.controller.audioState = AudioState.STOPPED);
                    },
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: size.width * 0.3,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.teal,
                shape: BoxShape.circle,
              ),
              child: Tooltip(
                message: "تشغيل او إغلاق",
                child: IconButton(
                    icon: widget.controller.audioState == AudioState.PLAYING
                        ? iconPlay
                        : iconPause,
                    onPressed: changePlayAndPauseAndResume),
              ),
            ),
          ),
        ],
      ),
    );
  }

  changePlayAndPauseAndResume() async {
    if (widget.controller.audioState == AudioState.STOPPED) {
      await widget.controller.start("1.mp3");
      setState(() => widget.controller.audioState = AudioState.PLAYING);
    } else if (widget.controller.audioState == AudioState.PLAYING) {
      await widget.controller.pause();
      setState(() => widget.controller.audioState = AudioState.PAUSE);
    } else if (widget.controller.audioState == AudioState.PAUSE) {
      await widget.controller.resume();
      setState(() => widget.controller.audioState = AudioState.PLAYING);
    }
  }
}
