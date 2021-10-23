import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_getx/app/models/AppDuration.dart';

class Time extends GetView {
  Stream<Duration> time;

  Time(this.time);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Duration>(
        stream: time,
        builder: (context, duration) {
          if (duration.hasData) {
            return Text(AppDuration.duration(duration.data!));
          } else {
            return Text("0:0");
          }
        });
  }
}