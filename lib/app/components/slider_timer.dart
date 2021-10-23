import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_getx/app/utils/colors.dart';
import 'package:test_getx/base/controllers/base_controller.dart';

class SliderTime extends GetView {
  Stream<Duration> slider;
  Stream<Duration> dur;
  BaseController control;
  SliderTime(this.slider, this.dur, this.control);
  double sliderValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Duration>(
      stream: dur,
      builder: (context, s) {
        if (s.hasData) {
          return StreamBuilder<Duration>(
            stream: slider,
            builder: (context, snap) {
              if (snap.hasData) {
                return Slider(
                  onChanged: (double value) {
                    control.moveTime(value.toInt());
                  },
                  activeColor: Colors.white,
                  max: s.data!.inSeconds.toDouble(),
                  inactiveColor: GetColors.mainColor.withOpacity(0.2),
                  value: snap.data!.inSeconds.toDouble(),
                );
              } else {
                return Center();
              }
            },
          );
        } else {
          return Center();
        }
      },
    );
  }
}
