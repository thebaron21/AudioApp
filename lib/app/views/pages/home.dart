import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:test_getx/app/controllers/Audio.dart';
import 'package:test_getx/app/models/AppDuration.dart';
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
                        return Text(AppDuration.duration(snapshot.data!));
                      }else{
                        return Text("00:00");
                      }
                    },
                  ),
                  StreamBuilder(
                    stream: _controller.durationStream,
                    builder: (BuildContext context, AsyncSnapshot<Duration> snapshot) {
                      if( snapshot.hasData ){
                        return Text(AppDuration.duration(snapshot.data!));
                      }else{
                        return Text("00:00");
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
                    setState(() => _controller.audioState = AudioState.PLAYING);
                  },
                ),
                _circleButton(
                  icon: Icons.stop,
                  onTap: () async {
                    await _controller.stop();
                    setState(() => _controller.audioState = AudioState.STOPPED);
                  },
                ),
                _circleButton(
                  icon: Icons.pause,
                  onTap: () async {
                      if( _controller.audioState == AudioState.PLAYING || _controller.audioState == AudioState.RESUME ){
                        await _controller.pause();
                        setState( () => _controller.audioState = AudioState.PAUSE );
                      }else if( _controller.audioState == AudioState.PAUSE ){
                        await _controller.resume();
                        setState( () => _controller.audioState = AudioState.RESUME );
                      }
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