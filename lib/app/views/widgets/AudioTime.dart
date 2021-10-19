// import 'package:flutter/material.dart';
// import 'package:test_getx/app/controllers/Audio.dart';
// import 'package:test_getx/app/models/AppDuration.dart';
// class AudioTimer extends StatelessWidget {
//   final AudioController controller;
//
//   const AudioTimer({Key? key, required this.controller}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return  Padding(
//       padding: EdgeInsets.only( left: MediaQuery.of(context).size.width / 10 , right:  MediaQuery.of(context).size.width / 10 ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           StreamBuilder(
//             stream: controller.positionStream,
//             builder: (BuildContext context, AsyncSnapshot<Duration> snapshot) {
//               if( snapshot.hasData ){
//                 return Text(AppDuration.duration(snapshot.data!));
//               }else{
//                 return Text("00:00");
//               }
//             },
//           ),
//           StreamBuilder(
//             stream: controller.durationStream,
//             builder: (BuildContext context, AsyncSnapshot<Duration> snapshot) {
//               if( snapshot.hasData ){
//                 return Text(AppDuration.duration(snapshot.data!));
//               }else{
//                 return Text("00:00");
//               }
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
