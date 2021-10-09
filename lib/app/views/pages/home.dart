import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:test_getx/app/controllers/Audio.dart';
import 'package:test_getx/base/services/Audio.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  AudioController _controller = AudioController();
  @override
  void initState() {
    super.initState();
//
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StreamBuilder(
                    stream: _controller.positionStream,
                    builder: (BuildContext context, AsyncSnapshot<Duration> snapshot) {
                      if( snapshot.hasData ){
                        return Text(" ${snapshot.data!.inSeconds}:${(snapshot.data!.inSeconds/60) } ");
                      }else{
                        return Text("21");
                      }
                    },
                  ),
                  StreamBuilder(
                    stream: _controller.durationStream,
                    builder: (BuildContext context, AsyncSnapshot<Duration> snapshot) {
                      if( snapshot.hasData ){
                        return Text(" ${(snapshot.data!.inMinutes)}:${( (snapshot.data!.inSeconds/60) as double )} ");
                      }else{
                        return Text("21");
                      }
                    },
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _circleButton(
                  icon: Icons.play_arrow,
                  onTap: () async {
                    await _controller.start("1.mp3");
                    _controller.audioState = AudioState.PLAYING;
                  },
                ),
                _circleButton(
                  icon: Icons.stop,
                  onTap: () async {
                    await _controller.stop();
                    _controller.audioState = AudioState.STOPPED;
                  },
                ),
                _circleButton(
                  icon: Icons.pause,
                  onTap: () async {
                    await _controller.resume();
                  },
                ),
                _circleButton(
                  icon: Icons.loop,
                  onTap: () async {
                    await _controller.loop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _circleButton({IconData? icon, required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.teal,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}

class AudioC {
  AudioPlayer? _audioPlayer;
  AudioCache? _audioCache;
  AudioC() {
    _audioPlayer = AudioPlayer();
    _audioCache = AudioCache(fixedPlayer: _audioPlayer);
  }

  play(String file) async {
    await _audioCache!.play(file);
  }

  stop() async {
    await _audioPlayer!.stop();
  }
}
