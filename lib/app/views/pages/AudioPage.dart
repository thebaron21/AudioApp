import 'dart:math';
import 'package:flutter/material.dart';
import 'package:test_getx/app/controllers/Audio.dart';
import 'package:test_getx/app/views/widgets/AudioControl.dart';
import 'package:test_getx/app/views/widgets/AudioSlider.dart';
import 'package:test_getx/app/views/widgets/AudioTime.dart';
import 'package:test_getx/app/views/widgets/AvatarImage.dart';
class BodyScaffold  extends StatefulWidget{
  _BodyScaffold createState() => _BodyScaffold();
}
class _BodyScaffold extends State<BodyScaffold> {
AudioController? _controller;
@override
  void initState() {
    _controller = AudioController();
    super.initState();
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.teal,
    ),
    body: Column(
      children: <Widget>[
        AvatarImage(path: "assets/carbon (1).png"),
        SizedBox( height: MediaQuery.of(context).size.height / 20, ),
        AudioTimer(controller: _controller!),
        AudioSlider(controller: _controller!,),
        AudioControl(controller: _controller! ),
      ],
    ),
  );
}


}
