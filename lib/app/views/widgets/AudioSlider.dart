import 'package:flutter/material.dart';
import 'package:test_getx/app/controllers/Audio.dart';
import 'package:test_getx/base/services/Audio.dart';

class AudioSlider extends StatefulWidget {
  final AudioController controller;

  const AudioSlider({Key? key, required this.controller}) : super(key: key);
  @override
  _AudioSliderState createState() => _AudioSliderState();
}

class _AudioSliderState extends State<AudioSlider> {

  
  AudioController get controller => super.widget.controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width / 15,
        right: MediaQuery.of(context).size.width / 15,
      ),
      child: StreamBuilder(
        stream: controller.positionStream, 
        builder: (BuildContext context, AsyncSnapshot<Duration> snapshot) {
          if( snapshot.hasData ){
            return StreamBuilder(
              stream: controller.durationStream,
              builder: (BuildContext context, AsyncSnapshot<Duration> snap) {
                return Slider(
                  value: snapshot.data!.inSeconds.toDouble(),
                  min: 0.0,
                  max: snap.data!.inSeconds.toDouble(),
                  activeColor: Colors.teal,
                  inactiveColor: Colors.tealAccent,
                  onChanged: (double value) {
                    if( snapshot.data!.inSeconds.toDouble() == snap.data!.inSeconds.toDouble() ){
                      setState(() {
                        controller.audioState = AudioState.STOPPED;
                      });
                    }
                    controller.moveTimeLine(value.toInt());
                  },
                );
              },

            );
          }else if( snapshot.hasError ){
            return Center();
          }else{
            return Center();
          }
        },
       
      ),
    );
  }
}
