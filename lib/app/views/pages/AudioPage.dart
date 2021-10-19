//
// import 'package:flutter/material.dart';
// import 'package:test_getx/app/controllers/Audio.dart';
// import 'package:test_getx/app/views/widgets/AudioControl.dart';
// import 'package:test_getx/app/views/widgets/AudioSlider.dart';
// import 'package:test_getx/app/views/widgets/AudioTime.dart';
// import 'package:test_getx/app/views/widgets/AvatarImage.dart';
// import 'package:test_getx/base/services/Audio.dart';
//
// class PlayerPage  extends StatefulWidget{
//   final String file;
//
//   const PlayerPage({Key? key,required this.file}) : super(key: key);
//   _PlayerPage createState() => _PlayerPage();
// }
// class _PlayerPage extends State<PlayerPage> {
// AudioController? _controller;
// @override
//   void initState() {
//     _controller = AudioController();
//     init();
//     super.initState();
//   }
//   init()async{
//     print(widget.file);
//     await _controller!.start(widget.file);
//     setState(() => _controller!.audioState = AudioState.PLAYING);
//   }
//
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       backgroundColor: Colors.teal,
//     ),
//     body: Column(
//       children: <Widget>[
//         AvatarImage(path: "assets/carbon (1).png"),
//         SizedBox( height: MediaQuery.of(context).size.height / 20, ),
//         AudioTimer(controller: _controller!),
//         AudioSlider(controller: _controller!,),
//         AudioControl(controller: _controller!,file: widget.file,),
//       ],
//     ),
//   );
// }
//
//
// }
